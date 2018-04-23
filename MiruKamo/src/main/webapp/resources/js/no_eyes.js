// before track event
/*document.addEventListener("clmtrackrBeforeTrack", function() {
	clmtracker.start()
});*/



//얼굴이 없는 경우 확인해서 alert를 보여준다.
				document.addEventListener("clmtrackrLost", function() {
					alert("no face");
					 pauseVid();
				});
				
				// after succesful track event (face found)
				document.addEventListener("clmtrackrIteration", function() {
					var faceData = ctracker.getCurrentPosition();
					var score = ctracker.getScore();
					
					// do something
					alert("얼굴 다시 확인");
				});
				
		
