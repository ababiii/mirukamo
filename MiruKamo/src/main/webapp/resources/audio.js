/*
*  Copyright (c) 2015 The WebRTC project authors. All Rights Reserved.
*
*  Use of this source code is governed by a BSD-style license
*  that can be found in the LICENSE file in the root of the source
*  tree.
*/

'use strict';

//var video= '<video id="video" autoplay></video>';
//document.body.innerHTML=document.body.innerHTML+video;

var videoElement;

$(document).ready(function(){
	videoElement = document.getElementById('video2');
	console.log(videoElement);
	videoElement.width=0;
	videoElement.volume=0.15;
	videoElement.setSinkId('default');
	
	
 });




navigator.mediaDevices.enumerateDevices().catch(handleError);


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
  var audioSource ='default';
  var constraints = {
    audio: {deviceId: audioSource ? {exact: audioSource} : undefined},
    video: false
  };
  navigator.mediaDevices.getUserMedia(constraints).
      then(gotStream).catch(handleError);
}
function end() {
	  if (window.stream) {
	    window.stream.getTracks().forEach(function(track) {
	      track.stop();
	    });
	  }
	}

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
