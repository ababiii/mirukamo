<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<html>
<head>
<style type="text/css">
body {
    background-color: coral;
}
/* The side navigation menu */
.sidenav {
    height: 100%; /* 100% Full-height */
    width: 0; /* 0 width - change this with JavaScript */
    position: fixed; /* Stay in place */
    z-index: 1; /* Stay on top */
    top: 0; /* Stay at the top */
    left: 0;
    background-color: #111; /* Black*/
    overflow-x: hidden; /* Disable horizontal scroll */
    padding-top: 60px; /* Place content 60px from the top */
    transition: 0.5s; /* 0.5 second transition effect to slide in the sidenav */
}

/* The navigation menu links */
.sidenav a {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: #818181;
    display: block;
    transition: 0.3s;
}

/* When you mouse over the navigation links, change their color */
.sidenav a:hover {
    color: #f1f1f1;
}

/* Position and style the close button (top right corner) */
.sidenav .closebtn {
    position: absolute;
    top: 0;
    right: 25px;
    font-size: 36px;
    margin-left: 50px;
}

/* Style page content - use this if you want to push the page content to the right when you open the side navigation */
#main {
    transition: margin-left .5s;
    padding: 20px;
}

/* On smaller screens, where height is less than 450px, change the style of the sidenav (less padding and a smaller font size) */
@media screen and (max-height: 450px) {
    .sidenav {padding-top: 15px;}
    .sidenav a {font-size: 18px;}
}
</style>
	<title>Home</title>
</head>
<body>
<<<<<<< HEAD
<script type="text/javascript">

var recognition = new webkitSpeechRecognition();
//recognition.continuous=true;

recognition.onresult = function(event) {
	var txt = document.getElementById('txt');
	txt.value=event.results[0][0].transcript;
  console.log(event) 
 // alert(event.results[0][0].transcript);
  
}
recognition.lang = 'ja-JP';
recognition.onend = function() {
	recognition.start();
	}
recognition.interimResults = true;
recognition.onnomatch = function() {
	 alert("노");
	//txt.value=txt.value+"노매치";
	 }
recognition.maxAlternatives = 1;
recognition.start();
=======
>>>>>>> branch 'master' of https://github.com/ababiii/mirukamo.git


<<<<<<< HEAD
// List cameras and microphones.

navigator.mediaDevices.enumerateDevices()
.then(function(devices) {
  devices.forEach(function(device) {
    console.log(device.kind + ": " + device.label +
                " id = " + device.deviceId);
   
  });
});
/*
navigator.mediaDevices.getUserMedia({ audio: true, video: true })
.then(function(stream) {
  
  console.log(stream);
  
});
*/
/*
if (navigator.mediaDevices && navigator.mediaDevices.enumerateDevices) {
    // Firefox 38+, Microsoft Edge, and Chrome 44+ seems having support of enumerateDevices
    navigator.enumerateDevices = function(callback) {
        navigator.mediaDevices.enumerateDevices().then(callback);
    };
}


    var allMdiaDevices = [];
    var allAudioDevices = [];
    var allVideoDevices = [];

    var audioInputDevices = [];
    var audioOutputDevices = [];
    var videoInputDevices = [];
    var videoOutputDevices = [];

    navigator.enumerateDevices(function(devices) {
        devices.forEach(function(_device) {
            var device = {};
            for (var d in _device) {
                device[d] = _device[d];
            }

            // make sure that we are not fetching duplicate devics
            var skip;
            allMdiaDevices.forEach(function(d) {
                if (d.id === device.id) {
                    skip = true;
                }
            });

            if (skip) {
                return;
            }
            
            // if it is MediaStreamTrack.getSources
            if (device.kind === 'audio') {
                device.kind = 'audioinput';
            }

            if (device.kind === 'video') {
                device.kind = 'videoinput';
            }
            console.log(device.label);
            if (!device.deviceId) {
                device.deviceId = device.id;
            }

            if (!device.id) {
                device.id = device.deviceId;
            }

            if (!device.label) {
                device.label = 'Please invoke getUserMedia once.';
            }

            if (device.kind === 'audioinput' || device.kind === 'audio') {
                audioInputDevices.push(device);
            }

            if (device.kind === 'audiooutput') {
                audioOutputDevices.push(device);
            }

            if (device.kind === 'videoinput' || device.kind === 'video') {
                videoInputDevices.push(device);
            }

            if (device.kind.indexOf('audio') !== -1) {
                allAudioDevices.push(device);
            }

            if (device.kind.indexOf('video') !== -1) {
                allVideoDevices.push(device);
            }

            // there is no 'videoouput' in the spec.
            // so videoOutputDevices will always be [empty]

            allMdiaDevices.push(device);
        });

        
            
        
    });
*/
  </script>

  <form action="http://www.example.com/search">
    <textarea id="txt" style="width: auto; height: auto;">
    </textarea>
    <input type="button" value="Click to Speak" onclick="recognition.start()">
  </form>
            

<script type="text/javascript">



/*
navigator.getUserMedia = navigator.getUserMedia ||
navigator.webkitGetUserMedia ||
navigator.mozGetUserMedia;

if (navigator.getUserMedia) {
navigator.getUserMedia({ audio: true, video: false },
function(stream) {
var video = document.querySelector('video');
video.srcObject = stream;
video.onloadedmetadata = function(e) {
video.play();
};
},
function(err) {
console.log("The following error occurred: " + err.name);
}
);
} else {
console.log("getUserMedia not supported");
}
*/
</script>
<div class="select">
      <label for="audioSource">Audio input source: </label><select id="audioSource"></select>
    </div>

    <div class="select">
      <label for="audioOutput">Audio output destination: </label><select id="audioOutput"></select>
    </div>

    <div class="select">
      <label for="videoSource">Video source: </label><select id="videoSource"></select>
    </div>

    <video id="video" autoplay></video>
</div>
<script>
/*
*  Copyright (c) 2015 The WebRTC project authors. All Rights Reserved.
*
*  Use of this source code is governed by a BSD-style license
*  that can be found in the LICENSE file in the root of the source
*  tree.
*/

'use strict';

var videoElement = document.querySelector('video');
var audioInputSelect = document.querySelector('select#audioSource');
var audioOutputSelect = document.querySelector('select#audioOutput');
var videoSelect = document.querySelector('select#videoSource');
var selectors = [audioInputSelect, audioOutputSelect, videoSelect];

audioOutputSelect.disabled = !('sinkId' in HTMLMediaElement.prototype);

function gotDevices(deviceInfos) {
  // Handles being called several times to update labels. Preserve values.
  var values = selectors.map(function(select) {
    return select.value;
  });
  selectors.forEach(function(select) {
    while (select.firstChild) {
      select.removeChild(select.firstChild);
    }
  });
  for (var i = 0; i !== deviceInfos.length; ++i) {
    var deviceInfo = deviceInfos[i];
    var option = document.createElement('option');
    option.value = deviceInfo.deviceId;
    if (deviceInfo.kind === 'audioinput') {
      option.text = deviceInfo.label ||
          'microphone ' + (audioInputSelect.length + 1);
      audioInputSelect.appendChild(option);
    } else if (deviceInfo.kind === 'audiooutput') {
      option.text = deviceInfo.label || 'speaker ' +
          (audioOutputSelect.length + 1);
      audioOutputSelect.appendChild(option);
    } else if (deviceInfo.kind === 'videoinput') {
      option.text = deviceInfo.label || 'camera ' + (videoSelect.length + 1);
      videoSelect.appendChild(option);
    } else {
      console.log('Some other kind of source/device: ', deviceInfo);
    }
  }
  selectors.forEach(function(select, selectorIndex) {
    if (Array.prototype.slice.call(select.childNodes).some(function(n) {
      return n.value === values[selectorIndex];
    })) {
      select.value = values[selectorIndex];
    }
  });
}

navigator.mediaDevices.enumerateDevices().then(gotDevices).catch(handleError);

// Attach audio output device to video element using device/sink ID.
function attachSinkId(element, sinkId) {
  if (typeof element.sinkId !== 'undefined') {
    element.setSinkId(sinkId)
    .then(function() {
      console.log('Success, audio output device attached: ' + sinkId);
    })
    .catch(function(error) {
      var errorMessage = error;
      if (error.name === 'SecurityError') {
        errorMessage = 'You need to use HTTPS for selecting audio output ' +
            'device: ' + error;
      }
      console.error(errorMessage);
      // Jump back to first output device in the list as it's the default.
      audioOutputSelect.selectedIndex = 0;
    });
  } else {
    console.warn('Browser does not support output device selection.');
  }
}

function changeAudioDestination() {
  var audioDestination = audioOutputSelect.value;
  attachSinkId(videoElement, audioDestination);
}

function gotStream(stream) {
  window.stream = stream; // make stream available to console
  videoElement.srcObject = stream;
  // Refresh button list in case labels have become available
  return navigator.mediaDevices.enumerateDevices();
}

function start() {
  if (window.stream) {
    window.stream.getTracks().forEach(function(track) {
      track.stop();
    });
  }
  var audioSource = audioInputSelect.value;
  var videoSource = videoSelect.value;
  audioSource ='default';
  var constraints = {
    audio: {deviceId: audioSource ? {exact: audioSource} : undefined},
    video: false
  };
  navigator.mediaDevices.getUserMedia(constraints).
      then(gotStream).then(gotDevices).catch(handleError);
}
function end() {
	  if (window.stream) {
	    window.stream.getTracks().forEach(function(track) {
	      track.stop();
	    });
	  }
	}
audioInputSelect.onchange = start;
audioOutputSelect.onchange = changeAudioDestination;
videoSelect.onchange = start;

//start();

function handleError(error) {
  console.log('navigator.getUserMedia error: ', error);
}
function audiostart(){
	start();
}
function audioend(){
	end();
}
</script>


 <input type="button" value="Click to Speak" onclick="audiostart()">
    <input type="button" value="Click to Speak" onclick="audioend()">
=======
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="join/join">회원가입</a>
  <a href="login/login">로그인</a>
<<<<<<< HEAD
  <a href="login/logout">로그아웃11</a>
  <a href="myPage/myPage">마이페이지11112</a>
=======
  <a href="login/logout">로그아웃2222</a>
  <a href="myPage/myPage">마이페이지</a>
    <a href="servicecenter">고객센터</a>
>>>>>>> branch 'master' of https://github.com/ababiii/mirukamo.git
</div>

<!-- Use any element to open the sidenav -->
<span onclick="openNav()">open</span>

<!-- Add all page content inside this div if you want the side nav to push page content to the right (not used if you only want the sidenav to sit on top of the page -->
<div id="main">
 <div>

${sessionScope.userId}
${sessionScope.userName}

</div>
</div>
<script>
function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}
</script>
<div id="cp_widget_29a33252-b29d-45e1-87a8-dbe932ba97d8">...</div><script type="text/javascript">
var cpo = []; cpo["_object"] ="cp_widget_29a33252-b29d-45e1-87a8-dbe932ba97d8"; cpo["_fid"] = "AsDAtN-uutay";
var _cpmp = _cpmp || []; _cpmp.push(cpo);
(function() { var cp = document.createElement("script"); cp.type = "text/javascript";
cp.async = true; cp.src = "//www.cincopa.com/media-platform/runtime/libasync.js";
var c = document.getElementsByTagName("script")[0];
c.parentNode.insertBefore(cp, c); })(); </script><noscript><span>New Gallery 2018/4/2</span><span>bitrate</span><span> 637 kb/s</span><span>height</span><span> 720</span><span>duration</span><span> 00:16:10.27</span><span>fps</span><span> 29.97</span><span>width</span><span> 1280</span><span>originaldate</span><span> 2017-07-01T17:08:19.000000Z</span><span>bitrate</span><span> 400 kb/s</span><span>height</span><span> 360</span><span>duration</span><span> 00:39:59.04</span><span>fps</span><span> 30</span><span>width</span><span> 640</span><span>originaldate</span><span> 2014-11-21T19:13:23.000000Z</span></noscript>
>>>>>>> branch 'master' of https://github.com/ababiii/mirukamo.git
</body>
</html>
