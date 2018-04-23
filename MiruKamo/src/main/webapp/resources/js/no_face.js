// before track event
/*document.addEventListener("clmtrackrBeforeTrack", function() {
	clmtracker.start()
});*/



//얼굴이 없는 경우 확인해서 alert를 보여준다.
				document.addEventListener("clmtrackrLost", function() {
					 pauseVid();
				});
				
				//얼굴이 다시 확인되면 영상을 재생시킨다. 
				document.addEventListener("clmtrackrConverged", function() {
					 playVid();
					 
					 document.addEventListener("userIsSleeping", function() {
						 alert("자냐 개빠졌네");
						 pauseVid();
						 
						
					});
				});
				
				document.addEventListener("userIsSleeping", function() {
					 alert("자냐 개빠졌네");
					 pauseVid();
					 
					
				});
		
