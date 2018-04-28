<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
/* html,
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
} */

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
</head>
<body>
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
    </div>
</div>
<!-- 인강 재생되는 비디오 부분 -->
<video controls preload="auto" poster="poster.jpg" id="myVideo" width="320" height="176" controls autoplay>
    <source src="./preview?name=2.mp4" type="video/mp4"/>
</video>

<script type="text/javascript">
//properties
var content, webcam, tracker, raf, eyeRect, interval, oldData, curData, cData, currentCorrelation, blinks;

// canvas and contexts
var originalCanvas, originalContext, trackerCanvas, trackerContext, eyeCanvas, eyeContext, bwCanvas, bwContext, thCanvas, thContext, oldCanvas, oldContext, curCanvas, curContext, cCanvas, cContext;

// dom elements
var correlationPercentage, blinksDetected;

var settings = {
    contrast: 3,
    brightness: 0.5,
    threshold: 80,
    minCorrelation: 0.17,
};
var d = new Date();
var n = d.getSeconds();

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
}

function start(e) {
    e.preventDefault();
    document.body.className = 'active';

    webcam.start()
    tracker.start(webcam.domElement);

    raf = requestAnimationFrame(update);
    interval = setInterval(correlation, 100);

    blinks = 0;
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
            }
        }
    }
    
    //만약에 눈을 감았다고 인식이 된다면
    
     document.addEventListener("clmtrackrConverged", function() {
    	 if (count<200) {
    			myTime();
    	 }else{
    		 myTime = function(){
    				return false;
    	 }
    	 }
     });	
   

    currentCorrelation = count / (cContext.canvas.width * cContext.canvas.height);

    correlationPercentage.innerHTML = parseFloat(currentCorrelation).toFixed(2) + '%';

    if (currentCorrelation > settings.minCorrelation) {
        blinks++;
    }

    blinksDetected.innerHTML = blinks + ' blinks detected';
}

//영상 play 그리고 일시정지하는 부분
var myvid = document.getElementById("myVideo"); 
function playVid() { 
    myvid.play(); 
}

function pauseVid() { 
    myvid.pause(); 
}

//얼굴이 없으면 영상이 멈추기
document.addEventListener("clmtrackrLost", pauseVid);

//눈을 감은지 일정 시간이 지나면 동영상을 멈춰주도록 한다.
function myTime() {
    console.log(n);
    	if(n==5){
    		
        	 pauseVid();
        	 alert("dddd");
        	  n=0;
    	}	
}	

init();
</script>

</body>
</html>