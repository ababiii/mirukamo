var result  = new Array(); 
var search  = new Array("こんにちは","山田"); 


var recognition = new webkitSpeechRecognition();
//recognition.lang = 'ja-JP';




var grammar = '#JSGF V1.0; grammar colors; public <color> = 배상벽 ;'
	var speechRecognitionList = new webkitSpeechGrammarList();
	speechRecognitionList.addFromString(grammar, 1);
	recognition.grammars = speechRecognitionList;



	console.log(speechRecognitionList[0].src); // should return the same as the contents of the grammar variable
	console.log(speechRecognitionList[0].weight); // should return 1 - the same as the weight set in line 4.

//recognition.continuous=true;
var video=new Array();
recognition.onresult = function(event) {
	var txt = document.getElementById('txt');
	//txt.value=event.results[0][0].transcript;
  console.log(event) 
 // alert(event.results[0][0].transcript);
  result.push(event.results[0][0].transcript);
  
  
  
  
  if(result.length>3){
	  
	  result.shift();
	 
  } 
  checking();
 
  if(true){
	  
	  txt.value="";
	  for(var i in result) {
		  txt.value+=result[i]+"\n";
		}
	 
  }

}
recognition.onend = function() {
	recognition.start();
	}
//recognition.interimResults = true;
recognition.onnomatch = function() {
	 alert("노");
	//txt.value=txt.value+"노매치";
	 }
recognition.maxAlternatives = 1;

function recstart(){
	recognition.start();
	//video=document.getElementsByTagName('video')[1];
}
function recstop(){
	recognition.stop();
}

function checking(){
	
	
	for(var i in result){
	//	console.log(result[i]);
		for(var j in search){
			if(result[i].indexOf(search[j])>-1){
				videostop()
				}	
		}	
	}
	
	
	
}
function videostop(){
	
	video=document.getElementsByTagName('video');
	for(var i in video){
		  
		  if(i!=0&&i<video.length){
			  video[i].pause();
		  }
	}
	
}

