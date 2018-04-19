<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!doctype html>
<html lang="en">
	<head>
		<title>Face tracker</title>
		<meta charset="utf-8">
		<link href="../resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
		<style>
			@import url(https://fonts.googleapis.com/css?family=Lato:300italic,700italic,300,700);

			body {
				font-family: 'Lato';
				background-color: #f0f0f0;
				margin: 0px auto;
				max-width: 1150px;
			}

			#overlay {
				position: absolute;
				top: 0px;
				left: 0px;
				-o-transform : scaleX(-1);
				-webkit-transform : scaleX(-1);
				transform : scaleX(-1);
				-ms-filter : fliph; /*IE*/
				filter : fliph; /*IE*/
			}

			#videoel {
				-o-transform : scaleX(-1);
				-webkit-transform : scaleX(-1);
				transform : scaleX(-1);
				-ms-filter : fliph; /*IE*/
				filter : fliph; /*IE*/
			}

			#container {
				position : relative;
				width : 370px;
				/*margin : 0px auto;*/
			}

			#content {
				margin-top : 70px;
				margin-left : 100px;
				margin-right : 100px;
				max-width: 950px;
			}

			h2 {
				font-weight : 400;
			}

			.nogum {
				display : none;
			}

			.btn {
				font-family: 'Lato';
				font-size: 16px;
			}

			.hide {
				display : none;
			}

			.nohide {
				display : block;
			}
		</style>
		<script>
			// getUserMedia only works over https in Chrome 47+, so we redirect to https. Also notify user if running from file.
			if (window.location.protocol == "file:") {
				alert("You seem to be running this example directly from a file. Note that these examples only work when served from a server or localhost due to canvas cross-domain restrictions.");
			} else if (window.location.hostname !== "localhost" && window.location.protocol !== "https:"){
				window.location.protocol = "https";
			}
		</script>
		<script type="text/javascript">

			var _gaq = _gaq || [];
			_gaq.push(['_setAccount', 'UA-32642923-1']);
			_gaq.push(['_trackPageview']);

			(function() {
				var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
				ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
				var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
			})();

		</script>
	</head>
	<body>
		<script src="../resources/js/utils.js"></script>
		<script src="../resources/js/clmtrackr1.js"></script>
		<script src="../resources/js/libs/Stats.js"></script>
		<div id="content">
			<h2>Facetracking example</h2>
			<div id="container">
				<video id="videoel" width="400" height="300" preload="auto" loop playsinline autoplay>
				</video>
				<canvas id="overlay" width="400" height="300"></canvas>
			</div>
			<br/>
			<input class="btn" type="button" value="wait, loading video" disabled="disabled" onclick="startVideo()" id="startbutton"></input>
			<div id="text">
				<p>This is an example of face tracking using the javascript library <a href="https://github.com/auduno/clmtrackr"><em>clmtrackr</em></a>. The fitting method is generally called "Non-rigid/deformable face tracking/alignment using constrained local models".</p>
				<p>Note that this example works best in Google Chrome, with a computer that supports WebGL and floating point textures. It should however work in any modern browser.</p>
				<div id="gum" class="gum">
					<p>To try it out:
						<ol>
							<li>allow the page to use your webcamera</li>
							<li>make sure that your face is clearly visible in the video, and click start</li>
							<li>see the model fitted to your face</li>
						<ol>
					</p>
				</div>
				<div id="nogum" class="nogum">
					<p>
						There was some problem trying to capture your webcamera, please check that your browser supports WebRTC. Using a fallback video instead. To try it out:
						<ol>
							<li>click start</li>
							<li>see the model fitted to the face</li>
						</ol>
					</p>
				</div>
			</div>
			<a href="https://github.com/auduno/clmtrackr"><img style="position: absolute; top: 0; left: 0; border: 0;" src="https://s3.amazonaws.com/github/ribbons/forkme_left_green_007200.png" alt="Fork me on GitHub"></a>
			<script>
				var vid = document.getElementById('videoel');
				var vid_width = vid.width;
				var vid_height = vid.height;
				var overlay = document.getElementById('overlay');
				var overlayCC = overlay.getContext('2d');

				/*********** Setup of video/webcam and checking for webGL support *********/

				function enablestart() {
					var startbutton = document.getElementById('startbutton');
					startbutton.value = "start";
					startbutton.disabled = null;
				}

				var insertAltVideo = function(video) {
					// insert alternate video if getUserMedia not available
					if (supports_video()) {
						if (supports_webm_video()) {
							video.src = "./media/cap12_edit.webm";
						} else if (supports_h264_baseline_video()) {
							video.src = "./media/cap12_edit.mp4";
						} else {
							return false;
						}
						return true;
					} else return false;
				}

				function adjustVideoProportions() {
					// resize overlay and video if proportions of video are not 4:3
					// keep same height, just change width
					var proportion = vid.videoWidth/vid.videoHeight;
					vid_width = Math.round(vid_height * proportion);
					vid.width = vid_width;
					overlay.width = vid_width;
				}

				function gumSuccess( stream ) {
					// add camera stream if getUserMedia succeeded
					if ("srcObject" in vid) {
						vid.srcObject = stream;
					} else {
						vid.src = (window.URL && window.URL.createObjectURL(stream));
					}
					vid.onloadedmetadata = function() {
						adjustVideoProportions();
						vid.play();
					}
					vid.onresize = function() {
						adjustVideoProportions();
						if (trackingStarted) {
							ctrack.stop();
							ctrack.reset();
							ctrack.start(vid);
						}
					}
				}

				function gumFail() {
					// fall back to video if getUserMedia failed
					insertAltVideo(vid);
					document.getElementById('gum').className = "hide";
					document.getElementById('nogum').className = "nohide";
					alert("There was some problem trying to fetch video from your webcam, using a fallback video instead.");
				}

				navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia;
				window.URL = window.URL || window.webkitURL || window.msURL || window.mozURL;

				// set up video
				if (navigator.mediaDevices) {
					navigator.mediaDevices.getUserMedia({video : true}).then(gumSuccess).catch(gumFail);
				} else if (navigator.getUserMedia) {
					navigator.getUserMedia({video : true}, gumSuccess, gumFail);
				} else {
					insertAltVideo(vid);
					document.getElementById('gum').className = "hide";
					document.getElementById('nogum').className = "nohide";
					alert("Your browser does not seem to support getUserMedia, using a fallback video instead.");
				}

				vid.addEventListener('canplay', enablestart, false);

				/*********** Code for face tracking *********/

				var ctrack = new clm.tracker();
				ctrack.init();
				var trackingStarted = false;

				function startVideo() {
					// start video
					vid.play();
					// start tracking
					ctrack.start(vid);
					trackingStarted = true;
					// start loop to draw face
					drawLoop();
				}

				function drawLoop() {
					requestAnimFrame(drawLoop);
					overlayCC.clearRect(0, 0, vid_width, vid_height);
					//psrElement.innerHTML = "score :" + ctrack.getScore().toFixed(4);
					if (ctrack.getCurrentPosition()) {
						ctrack.draw(overlay);
					}
				}

				/*********** Code for stats **********/

				stats = new Stats();
				stats.domElement.style.position = 'absolute';
				stats.domElement.style.top = '0px';
				document.getElementById('container').appendChild( stats.domElement );

				// update stats on every iteration
				document.addEventListener('clmtrackrIteration', function(event) {
					stats.update();
				}, false);

			</script>
		</div>
	</body>
</html>

 