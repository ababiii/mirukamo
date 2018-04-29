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
		<script src="../resources/jQuery/jquery-3.2.1.min.js"></script>
		<script src="../resources/jQuery/jquery-ui.js"></script>
			
		<style>
			@import url(https://fonts.googleapis.com/css?family=Lato:300italic,700italic,300,700);
			
			
			#overlay {
				position: absolute;
				top: 0px;
				left: 0px;
				-o-transform : scaleX(-1);
				-webkit-transform : scaleX(-1);
				transform : scaleX(-1);
				-ms-filter : fliph; /*IE*/
				filter : fliph; /*IE*/
				/* width : 0px;
				height : 0px; */
				 /* width : 600px;
				height : 450px; */
				width : 300px;
				height : 225px;  
			}

			#videoel {
				-o-transform : scaleX(-1);
				-webkit-transform : scaleX(-1);
				transform : scaleX(-1);
				-ms-filter : fliph; /*IE*/
				filter : fliph; /*IE*/
				/* width : 0px;
				height : 0px; */
				/* width : 600px;
				height : 450px; */
				width : 300px;
				height : 225px;  
			}
			
			#container {
				position : relative;
				width : 370px;
				/*margin : 0px auto;*/
			}
			
			#content {
				margin-top : 50px;
				margin-left : auto;
				margin-right : auto;
				max-width: 600px;
			}
			
			#sketch, #filter {
				display: none;
			}
			
			h2 {
				font-weight : 400;
			}
			
			.btn {
				font-family: 'Lato';
				font-size: 16px;
			}

			#controls {
				text-align : center;
			}

			#emotion_container {
				width: 600px;
			}

			#emotion_icons {
				height: 50px;
				padding-left: 40px;
			}

			.emotion_icon {
				width : 40px;
				height : 40px;
				margin-top: 5px;
				/*margin-left : 13px;*/
				margin-left : 35px;
			}

			#emotion_chart, #emotion_icons {
				margin: 0 auto;
				width : 400px;
			}

			#icon1, #icon2, #icon3, #icon4, #icon5, #icon6 {
				visibility : hidden;
			}

			/* d3 */
			.bar {
				fill : steelblue;
				fill-opacity : .9;
			}

		</style>
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
		<script src="../resources/js/no_face.js"></script>
		<script src="../resources/js/utils.js"></script>
		<script src="../resources/js/clmtrackr1.js"></script>
		<script src="../resources/js/model_pca_20_svm_emotionDetection.js"></script>
		<script src="../resources/js/Stats.js"></script>
		<script src="../resources/js/d3.min.js"></script>
		<script src="../resources/js/emotion_classifier.js"></script>
		<script src="../resources/js/emotionmodel.js"></script>
	
		
	
	<div id="content">
			<h2>얼굴일까?</h2>
			<!-- 사용자의 얼굴을 인식해 주는 부분 -->
			 <div id="container">
				<video id="videoel" width="400" height="300" preload="auto" loop>
				</video>
				<canvas id="overlay" width="400" height="300"></canvas>
			</div> 
			<canvas id="sketch" width="400" height="300"></canvas>
			
			
        
  			<!-- 감정 다이어그램 -->
			<div id="emotion_container">
				<div id="emotion_icons">
					<img class="emotion_icon" id="icon1" src="../resources/media/icon_angry.png">
					<img class="emotion_icon" id="icon2" src="../resources/media/icon_sad.png">
					<img class="emotion_icon" id="icon3" src="../resources/media/icon_surprised.png">
					<img class="emotion_icon" id="icon4" src="../resources/media/icon_happy.png">
				</div>
				<div id='emotion_chart'></div>
			</div>
			
			<!-- 사용자 얼굴 인식 플레이 일시정지 버튼 -->
			<div id="controls">
				<input class="btn" type="button" value="wait, loading video" disabled="disabled" onclick="startVideo()" id="startbutton"></input>
				<input class="btn" type="button" value="Stop" onclick="stopVideo()" id="startbutton"></input>
			</div>
			
			<!-- 일본어 강의가 플레이 되는 부분,,사용자가 페이지에 입장하면 저절로 플레이 됨 -->
			
			<video controls preload="none" poster="poster.jpg" id="myVideo" width="400" height="200">
    <source src="./preview?name=${file_name}" type="video/mp4"/>
		</video>
	
		<!-- 인터넷 강의의 플레이 일시정지 버튼,,딱히 사용할 필요없음 -->
	<button onclick="playVid()" type="button">Play Video</button>
	<button onclick="pauseVid()" type="button">Pause Video</button><br>
			
			<script>
			
			
			
			
				var vid = document.getElementById('videoel');
				var overlay = document.getElementById('overlay');
				var overlayCC = overlay.getContext('2d');
				console.log(overlay+"오버레이 값 들어감");
				/********** check and set up video/webcam **********/

				function enablestart() {
					var startbutton = document.getElementById('startbutton');
					startbutton.value = "start";
					startbutton.disabled = null;
				}
				
				/*var insertAltVideo = function(video) {
					if (supports_video()) {
						if (supports_ogg_theora_video()) {
							video.src = "../media/cap12_edit.ogv";
						} else if (supports_h264_baseline_video()) {
							video.src = "../media/cap12_edit.mp4";
						} else {
							return false;
						}
						//video.play();
						return true;
					} else return false;
				}*/
				navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia;
				window.URL = window.URL || window.webkitURL || window.msURL || window.mozURL;

				// check for camerasupport
				if (navigator.getUserMedia) {
					// set up stream
					
					var videoSelector = {video : true};
					if (window.navigator.appVersion.match(/Chrome\/(.*?) /)) {
						var chromeVersion = parseInt(window.navigator.appVersion.match(/Chrome\/(\d+)\./)[1], 10);
						if (chromeVersion < 20) {
							videoSelector = "video";
						}
					};
				
					navigator.getUserMedia(videoSelector, function( stream ) {
						if (vid.mozCaptureStream) {
							vid.mozSrcObject = stream;
						} else {
							vid.src = (window.URL && window.URL.createObjectURL(stream)) || stream;
						}
						vid.play();
					}, function() {
						//insertAltVideo(vid);
						alert("There was some problem trying to fetch video from your webcam. If you have a webcam, please make sure to accept when the browser asks for access to your webcam.");
					});
				} else {
					//insertAltVideo(vid);
					alert("This demo depends on getUserMedia, which your browser does not seem to support. :(");
				}

				vid.addEventListener('canplay', enablestart, false);
				
				/*********** setup of emotion detection *************/

				var ctrack = new clm.tracker({useWebGL : true});
				ctrack.init(pModel);
				
				
				function startVideo() {
					// start video
					vid.play();
					// start tracking
					ctrack.start(vid);
					console.log(vid+"값이 들어감");
					// start loop to draw face
					drawLoop();
					console.log(drawLoop()+"값이 들어감");
				}
				
				//얼굴이 없는 경우 확인해서 alert를 보여준다.
				/* document.addEventListener("clmtrackrLost", function() {
						alert("no face");
				}); */
				
			
				
				function stopVideo() {
					// start video
					
					//일단 없에도 되는 명령문이라 주석 처리 해줌
					//vid.pause();
					
					// start tracking
					//ctrack.start(vid);
					// start loop to draw face
					//drawLoop();
					//var audio = new Audio('resource/thankyou.wav');
					//audio.play();
				}
				
				function drawLoop() {
					requestAnimFrame(drawLoop);
					overlayCC.clearRect(0, 0, 400, 300);
					//psrElement.innerHTML = "score :" + ctrack.getScore().toFixed(4);
					if (ctrack.getCurrentPosition()) {
						
				        ctrack.draw(overlay);
						
					}
					var cp = ctrack.getCurrentParameters();
					
					var er = ec.meanPredict(cp);
					if (er) {
						updateData(er);
						for (var i = 0;i < er.length;i++) {
							if (er[i].value > 0.4) {
								document.getElementById('icon'+(i+1)).style.visibility = 'visible';
							} else {
								
								document.getElementById('icon'+(i+1)).style.visibility = 'hidden';
							}
						}
					}
				}
				
				var ec = new emotionClassifier();
				ec.init(emotionModel);
				var emotionData = ec.getBlank();	
				
				/************ d3 code for barchart *****************/

				var margin = {top : 20, right : 20, bottom : 10, left : 40},
					width = 400 - margin.left - margin.right,
					height = 100 - margin.top - margin.bottom;

				var barWidth = 30;

				var formatPercent = d3.format(".0%");
				
				var x = d3.scale.linear()
					.domain([0, ec.getEmotions().length]).range([margin.left, width+margin.left]);

				var y = d3.scale.linear()
					.domain([0,1]).range([0, height]);

				var svg = d3.select("#emotion_chart").append("svg")
					.attr("width", width + margin.left + margin.right)
					.attr("height", height + margin.top + margin.bottom)
				
				svg.selectAll("rect").
				  data(emotionData).
				  enter().
				  append("svg:rect").
				  attr("x", function(datum, index) { return x(index); }).
				  attr("y", function(datum) { return height - y(datum.value); }).
				  attr("height", function(datum) { return y(datum.value); }).
				  attr("width", barWidth).
				  attr("fill", "#2d578b");

				svg.selectAll("text.labels").
				  data(emotionData).
				  enter().
				  append("svg:text").
				  attr("x", function(datum, index) { return x(index) + barWidth; }).
				  attr("y", function(datum) { return height - y(datum.value); }).
				  attr("dx", -barWidth/2).
				  attr("dy", "1.2em").
				  attr("text-anchor", "middle").
				  text(function(datum) { return datum.value;}).
				  attr("fill", "white").
				  attr("class", "labels");
				
				svg.selectAll("text.yAxis").
				  data(emotionData).
				  enter().append("svg:text").
				  attr("x", function(datum, index) { return x(index) + barWidth; }).
				  attr("y", height).
				  attr("dx", -barWidth/2).
				  attr("text-anchor", "middle").
				  attr("style", "font-size: 12").
				  text(function(datum) { return datum.emotion;}).
				  attr("transform", "translate(0, 18)").
				  attr("class", "yAxis");

				function updateData(data) {
					// update
					var rects = svg.selectAll("rect")
						.data(data)
						.attr("y", function(datum) { return height - y(datum.value); })
						.attr("height", function(datum) { return y(datum.value); });
					var texts = svg.selectAll("text.labels")
						.data(data)
						.attr("y", function(datum) { return height - y(datum.value); })
						.text(function(datum) { return datum.value.toFixed(1);});

					// enter 
					rects.enter().append("svg:rect");
					texts.enter().append("svg:text");

					// exit
					rects.exit().remove();
					texts.exit().remove();
				}

				/******** stats ********/

				stats = new Stats();
				stats.domElement.style.position = 'absolute';
				stats.domElement.style.top = '0px';
				document.getElementById('container').appendChild( stats.domElement );

				// update stats on every iteration
				document.addEventListener('clmtrackrIteration', function(event) {
					stats.update();
				}, false);
				
				//emitEvent를 통해서 다른 js파일에서도 영향을 줌
				function emitEvent(eventName) {
					var evt = new CustomEvent(eventName, {'bubbles': true, 'cancelable': true});
					document.dispatchEvent(evt);
				}
				
				
			</script>
			
			<script> 
var myvid = document.getElementById("myVideo"); 

function playVid() { 
    vid.play(); 
}

function pauseVid() { 
    myvid.pause(); 
} 
</script> 
		</div>
	
	

	</body>
</html>