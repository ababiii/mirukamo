<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
    <head>
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

<script>
//properties
var content, webcam, tracker, raf, eyeRect;

// canvas and contexts
var originalCanvas, originalContext, trackerCanvas, trackerContext, eyeCanvas, eyeContext;

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
}

function start(e) {
    e.preventDefault();
    document.body.className = 'active';

    webcam.start()
    tracker.start(webcam.domElement);

    raf = requestAnimationFrame(update);
}

function stop(e) {
    e.preventDefault();
    document.body.className = '';

    webcam.stop();
    tracker.stop();

    cancelAnimationFrame(raf);
}

function update() {
    raf = requestAnimationFrame(update);
    originalContext.clearRect(0, 0, originalContext.canvas.width, originalContext.canvas.height);
    trackerContext.clearRect(0, 0, trackerContext.canvas.width, trackerContext.canvas.height);

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
    }
}

init();
</script>
        <title>Webcam test</title>
        <meta charset="utf-8" />
    </head>
    <body>
    	<script src="../resources/js/utils.js"></script>
		<script src="../resources/js/clmtrackr1.js"></script>
		<script src="../resources/js/libs/Stats.js"></script>
        <script src="../resources/js/webcam.js"></script>
        <script>
            var webcam = new Webcam(320, 240);
            document.body.appendChild(webcam.domElement);

            function startWebcam() {
                webcam.start();
            }

            function stopWebcam() {
                webcam.stop();
            }
        </script>
        
         <div class="holder" data-title="Eye Tracking">
    <div id="content">
        <canvas id="originalCanvas" width=320 height=240></canvas>
        <canvas id="trackerCanvas" width=320 height=240></canvas>
        <br />
        <canvas id="eyeCanvas" width=80 height=60></canvas>
    </div>
</div>

        <a href="javascript:startWebcam()">start webcam</a>
        <a href="javascript:stopWebcam()">stop webcam</a>
    </body>
</html>