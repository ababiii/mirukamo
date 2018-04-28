<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!doctype html>
<html lang="en">
	<head>
	<style type="text/css">
<<<<<<< HEAD
	html,
=======
 html,
>>>>>>> branch 'master' of https://github.com/ababiii/mirukamo.git
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
	
		<title>Face tracker</title>
		<meta charset="utf-8">
	</head>
	<body>
		<script src="../resources/js/no_face.js"></script>
		<script src="../resources/js/utils.js"></script>
		<script src="../resources/js/clmtrackr1.js"></script>
		<script src="../resources/js/model_pca_20_svm_emotionDetection.js"></script>
		<script src="../resources/js/Stats.js"></script>
		<script src="../resources/js/d3.min.js"></script>
		<script src="../resources/js/eye_blink_check.js"></script>
		<script src="../resources/js/webcam.js"></script>
		<script src="../resources/js/canvasfilters.js"></script>

	
	 <div class="holder" data-title="Correlation"> 
     <div id="content">
        <canvas id="originalCanvas" width=320 height=240></canvas>
        <canvas id="trackerCanvas" width=320 height=240></canvas>
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
        <p id="notBlinksDetected">
            0
        </p>

    </div> 
 </div> 
<%-- <video controls preload="auto" poster="poster.jpg" id="myVideo" width="320" height="176" controls autoplay>
    <source src="./preview?name=${filename}" type="video/mp4"/>
		</video> --%>

<script>
//properties
var content, webcam, tracker, raf, eyeRect, interval, oldData, curData, cData, currentCorrelation, blinks;
var seconds;
// canvas and contexts
var originalCanvas, originalContext, trackerCanvas, trackerContext, eyeCanvas, eyeContext, bwCanvas, bwContext, thCanvas, thContext, oldCanvas, oldContext, curCanvas, curContext, cCanvas, cContext;

// dom elements
var correlationPercentage, blinksDetected, notBlinksDetected;

var settings = {
  contrast: 3,
  brightness: 0.5,
  threshold: 80,
  minCorrelation: 0.17,
};


function init() {
  content = document.getElementById('content');

  // adds listeners to activate and deactivate on iframe focus
  window.addEventListener('focus', start, false);
  window.addEventListener('blur', stop, false);

  // instanciate our Webcam class
  webcam = new Webcam();

  // tracker
  tracker = new clm.tracker();
  tracker.init(window.pModel);

  // eye rect
  eyeRect = {
    x: 0,
    y: 0,
    w: 0,
    h: 0,
  };

  // original canvas and context
  originalCanvas = document.getElementById('originalCanvas');
  originalContext = originalCanvas.getContext('2d');

  // tracker canvas and context
  trackerCanvas = document.getElementById('trackerCanvas');
  trackerContext = trackerCanvas.getContext('2d');

  // eye canvas and context
  eyeCanvas = document.getElementById('eyeCanvas');
  eyeContext = eyeCanvas.getContext('2d');

  // black & white canvas and context
  bwCanvas = document.getElementById('bwCanvas');
  bwContext = bwCanvas.getContext('2d');

  // threshold canvas and context
  thCanvas = document.getElementById('thCanvas');
  thContext = thCanvas.getContext('2d');

  // old canvas and context
  oldCanvas = document.getElementById('oldCanvas');
  oldContext = oldCanvas.getContext('2d');

  // cur canvas and context
  curCanvas = document.getElementById('curCanvas');
  curContext = curCanvas.getContext('2d');

  // correlation canvas and context
  cCanvas = document.getElementById('cCanvas');
  cContext = cCanvas.getContext('2d');

  // correlation percentage dom
  correlationPercentage = document.getElementById('correlationPercentage');

  // blinks detected dom
  blinksDetected = document.getElementById('blinksDetected');
  
  notBlinksDetected = document.getElementById('notBlinksDetected');
}

function start(e) {
  e.preventDefault();
  document.body.className = 'active';

  webcam.start();
  tracker.start(webcam.domElement);

  raf = requestAnimationFrame(update);
  interval = setInterval(correlation, 100);

  blinks = 0;
  //얼마나 눈을 감고 있는지 알 수 있게끔 초를 카운트한다.
  seconds=0;
}


 function stop(e) {
  e.preventDefault();
  document.body.className = '';

  webcam.stop();
  tracker.stop();

  cancelAnimationFrame(raf);
  clearInterval(interval);

  blinks = 0;

} 


function emitEvent(eventName) {
	var evt = new CustomEvent(eventName, {'bubbles': true, 'cancelable': true});
	document.dispatchEvent(evt);
}




function update() {
  raf = requestAnimationFrame(update);
  originalContext.clearRect(0, 0, originalContext.canvas.width, originalContext.canvas.height);
  trackerContext.clearRect(0, 0, trackerContext.canvas.width, trackerContext.canvas.height);
  bwContext.clearRect(0, 0, bwContext.canvas.width, bwContext.canvas.height);
  thContext.clearRect(0, 0, thContext.canvas.width, thContext.canvas.height);
  oldContext.clearRect(0, 0, oldContext.canvas.width, oldContext.canvas.height);
  curContext.clearRect(0, 0, curContext.canvas.width, curContext.canvas.height);
  cContext.clearRect(0, 0, cContext.canvas.width, cContext.canvas.height);

  // draw video element to canvas
  originalContext.drawImage(webcam.domElement, 0, 0, originalContext.canvas.width, originalContext.canvas.height);

  // draw tracker to canvas
  trackerContext.drawImage(webcam.domElement, 0, 0, trackerContext.canvas.width, trackerContext.canvas.height);
  tracker.draw(trackerCanvas);

  // extract right eye data
  var pos = tracker.getCurrentPosition();
  var angleRadians = Math.atan2(pos[25][1] - pos[23][1], pos[25][0] - pos[23][0]);
  if (pos) {
    eyeRect.x = pos[23][0];
    eyeRect.y = pos[24][1];
    eyeRect.w = pos[25][0] - pos[23][0];
    eyeRect.h = pos[26][1] - pos[24][1];

    // draw eye
    eyeContext.drawImage(originalCanvas, eyeRect.x, eyeRect.y, eyeRect.w, eyeRect.h, 0, 0, eyeContext.canvas.width, eyeContext.canvas.height);

    // black and white
    var data = CanvasFilters.getPixels(eyeCanvas);
    var grayscale = CanvasFilters.grayscale(data, settings.contrast, settings.brightness);

    bwContext.putImageData(grayscale, 0, 0);

    // threshold
    var data = CanvasFilters.getPixels(eyeCanvas);
    var grayscale = CanvasFilters.grayscale(data, settings.contrast, settings.brightness);
    var threshold = CanvasFilters.threshold(grayscale, settings.threshold);

    thContext.putImageData(threshold, 0, 0);

    // draw old data set
    if (oldData) {
      oldContext.putImageData(oldData, 0, 0);
    }

    // draw cur data set
    if (curData) {
      curContext.putImageData(curData, 0, 0);
    }

    // draw correlation
    if (cData) {
      cContext.putImageData(cData, 0, 0);
    }
  }
}

function correlation() {
  if (curData) {
    oldData = curData;
  }

  curData = thContext.getImageData(0, 0, thContext.canvas.width, thContext.canvas.height);

  // correlation data
  cData = cContext.createImageData(cContext.canvas.width, cContext.canvas.height);

  var count = 0;
  if (oldData && curData) {
    var total = curData.data.length;
    for (var i = 0; i < total; i += 4) {
      cData.data[i + 3] = 255;
      if (curData.data[i] !== oldData.data[i]) {
        cData.data[i] = 255;
        count++;
        notBlinksDetected.innerHTML = count + ' not blinks detected';
      }
    }
  }

  currentCorrelation = count / (cContext.canvas.width * cContext.canvas.height);

  correlationPercentage.innerHTML = parseFloat(currentCorrelation).toFixed(2) + '%';
	
  var oldBlinks;
  console.log(oldBlinks+"올드블링크 들어감");
  console.log(blinks+"블링크들어감");
  console.log(seconds+"들어감");
  if (oldBlinks==blinks) {
	  	seconds++;

	  	console.log(seconds+"들어감2");
	  if(seconds==50){
		  alert("자냐?,,개빠졌네??");

	  if(seconds==100){
		  //일정 시간 눈을 감고 있으면 잠을 자는 것으로 인식해서 비디오가 멈춤

		  seconds=0;
	  }  
	  
	}


   //얼굴이 다시 확인되면 영상을 재생시킨다. 
		document.addEventListener("clmtrackrConverged", function() {
			 playVid();
			 
			 document.addEventListener("userIsSleeping", function() {
				 alert("자냐 개빠졌네");
				 seconds=0;				 
				 pauseVid();
				 this.close();
			});
		});

  
if (currentCorrelation > settings.minCorrelation) {
    blinks++;
    oldBlinks = blinks;
    console.log(oldBlinks+"222들어감");
    seconds=0;
}

blinksDetected.innerHTML = blinks + ' blinks detected';
}

init();
</script>
	</body>
</html>

