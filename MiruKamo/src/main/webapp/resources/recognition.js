
var result  = new Array(); 
var search  = new Array("こんにちは","山田"); 
var resultsize=3;

var recognition = new webkitSpeechRecognition();
recognition.lang = 'ja-JP';




var grammar = '#JSGF V1.0; grammar colors; public <color> = 배상벽 ;'
	var speechRecognitionList = new webkitSpeechGrammarList();
	speechRecognitionList.addFromString(grammar, 1);
	recognition.grammars = speechRecognitionList;



	console.log(speechRecognitionList[0].src); // should return the same as the contents of the grammar variable
	console.log(speechRecognitionList[0].weight); // should return 1 - the same as the weight set in line 4.

//recognition.continuous=true;
var video=new Array();
var playing;
var txt;
recognition.onresult = function(event) {
	txt = document.getElementById('result');
	//txt.value=event.results[0][0].transcript;
  console.log(event) 
 // alert(event.results[0][0].transcript);
  checking(event.results[0][0].transcript);
  if(event.results[0].isFinal){
	  result.push(event.results[0][0].transcript);
	  txt.value=event.results[0][0].transcript;
	 
  }

  
 // $( "#dialog-form" ).dialog( "close" );
 //  $( "#result" ).trigger( "change");

  if(result.length>resultsize){
	  
	  result.shift();
	 
  } 
  
 
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
recognition.interimResults = true;
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

function checking(str){
	 
	if(repeat(str)){
		return true;
	}
	else if(false){
	
		for(var j in search){
			if(result[result.length-1].indexOf(search[j])>-1){
				videostop();
				$( "#create-user" ).button().trigger("click");
				
				}	
		}	
		
	
	//result.pop();
	}

	return false;
}
function repeat(str){
	for(var i in result){
		//console.log(i);
		
			if(str==result[i]){
				//alert(str+"a"+result[i]);

				$( "#content" ).val(str);
				txt.value="";
				$( "#create-user" ).trigger("click");
				/*
				videostop();
				$( "#content" ).val(result[i]);
				$( "#create-user" ).button().trigger("click");*/	
				return true;
			}
		
	}
	
	return false;
}

function videostop(){
	
	video=document.getElementsByTagName('video');
	for(var i in video){
		  
		  if(i!=0&&i<video.length){
			  var isPaused = video[i].paused;
			  if(!isPaused){
				  video[i].pause();
				  playing=video[i];
		  		}
		  }
	}
	
}

function videostart(){
if(playing != null)
	playing.play();

	
}