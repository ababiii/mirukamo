// before track event
/*document.addEventListener("clmtrackrBeforeTrack", function() {
	clmtracker.start()
});*/



//얼굴이 없는 경우 확인해서 alert를 보여준다.
				document.addEventListener("clmtrackrLost", function() {
					alert("no face");
					 pauseVid();
				});
				
