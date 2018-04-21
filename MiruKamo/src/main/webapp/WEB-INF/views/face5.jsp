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
	html,
body {
    width: 100%;
    height: 100%;
    margin: 0;
    overflow: hidden;
    font-family: sans-serif;
    font-size: 20px;
    color: #000;
    text-align: center;
    -webkit-font-smoothing: subpixel-antialiased;
}

p {
    margin: 0;
    font-size: 12px;
}

canvas {
    border: 1px solid black;
}

.holder {
    position: relative;
    width: 100%;
    height: 100%;
    background-color: #f9f9f9;
}

.holder:before {
    content: attr(data-title);
    position: absolute;
    top: 45%;
    left: 0;
    width: 100%;
    visibility: visible;
}

.holder:after {
    content: 'click to activate';
    position: absolute;
    top: 55%;
    left: 0;
    width: 100%;
    visibility: visible;
}

#content {
    text-align: center;
    visibility: hidden;
}

body.active .holder:before,
body.active .holder:after {
    visibility: hidden;
}

body.active #content {
    visibility: visible;
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
		<script src="../resources/js/eye_blink_check.js"></script>
		
		
		 <div id="controls">
				<input class="btn" type="button" value="wait, loading video" disabled="disabled" onclick="startVideo()" id="startbutton"></input>
				<input class="btn" type="button" value="Stop" onclick="stopVideo()" id="startbutton"></input>
			</div>
				<!-- <input class="btn" type="button" onclick="start()" id="startbutton"></input>
				<input class="btn" type="button" value="Stop" onclick="stop()" id="startbutton"></input> -->
		<div id="content">
			<h2>얼굴일까?</h2>
			 <div id="container">
				<video id="videoel" width="400" height="300" preload="auto" loop>
				</video>
				<canvas id="overlay" width="400" height="300"></canvas>
			</div> 
			<canvas id="sketch" width="400" height="300"></canvas>
			
			
			<div class="holder" data-title="Correlation">
    <div id="content">
        <canvas id="overlay" width=320 height=240></canvas>
        <canvas id="sketch" width=320 height=240></canvas>
        <br />
        <canvas id="eyeCanvas" width=80 height=60></canvas>
        <canvas id="bwCanvas" width=80 height=60></canvas>
        <canvas id="thCanvas" width=80 height=60></canvas>
        <br />
        <canvas id="oldCanvas" width=80 height=60></canvas>
        <canvas id="curCanvas" width=80 height=60></canvas>
        <canvas id="cCanvas" width=80 height=60></canvas>
        <br />
        <p id="correlationPercentage">
            0%
        </p>
        <p id="blinksDetected">
            0
        </p>
    </div>
</div>
        
			<script>
				var vid = document.getElementById('videoel');
				var overlay = document.getElementById('overlay');
				var overlayCC = overlay.getContext('2d');
				/********** check and set up video/webcam **********/

				function enablestart() {
					var startbutton = document.getElementById('startbutton');
					startbutton.value = "start";
					startbutton.disabled = null;
				}
				
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
					
					// start loop to draw face
					drawLoop();
				}
				
				//얼굴이 없는 경우 확인해서 alert를 보여준다.
				/* document.addEventListener("clmtrackrLost", function() {
						alert("no face");
				}); */
				
			
				
				function stopVideo() {
					// start video
					vid.pause();
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
				
			</script>
		</div>
	</body>
</html>
