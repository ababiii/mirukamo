
var result  = new Array(); 
var search  = new Array("こんにちは","山田"); 
var resultsize=3;
var voiceflag=false;
var nextturn=false;
var recognition = new webkitSpeechRecognition();
recognition.lang = 'ja-JP';

//알람 추가
var dialoghtml= '<div id="dialog-form" title="따라해 봅시다" style="z-index: 2222222222222">'	 
	 + '<form>'
	 +   '<fieldset>'
	 +     '<label for="content2">내용</label>'
	 +     '<input type="text" name="content2" id="content2" value="" readonly="readonly" class="text ui-widget-content ui-corner-all">'
	 +     '<label for="result">결과</label>'
	 +     '<input type="text" name="result" id="result" value="" readonly="readonly" class="text ui-widget-content ui-corner-all">'
	 +   '</fieldset>'
	 + '</form>'
	 +'</div>';
document.body.innerHTML=document.body.innerHTML+dialoghtml;
 

document.body.innerHTML=document.body.innerHTML+'<button id="create-user">시작</button>';
var dialog;
$( function() {
    var form,
 
      // From http://www.whatwg.org/specs/web-apps/current-work/multipage/states-of-the-type-attribute.html#e-mail-state-%28type=email%29
      content = $( "#content2" ),
      result = $( "#result" ),
      allFields = $( [] ).add( content ).add( result );
    dialog = $( "#dialog-form" ).dialog({
      dialogClass: "innerPopup" , 
      autoOpen: false,
      height: 330,
      width: 350,
      modal: true,
      buttons: {
    	  "넘어가기": function() {
              $( this ).dialog( "close" );
            }
      },
      close: function() {
    	  audioend();
    	  videostart();
      }
    });
 
   
    $( "#create-user" ).button().on( "click", function() {
    audiostart();
    $( "#result" ).val("");
      dialog.dialog( "open" );
    });
    

    
    
    $( "#result" ).on("change", function() {
    	//$( "#dialog-form" ).dialog( "close" );
      });
  } );
function opendialog() {
    audiostart();
    $( "#result" ).val("");
      dialog.dialog( "open" );
      //recognition.abort();
 };  
//////////////////////////////////////////////////////
var grammar = '#JSGF V1.0; grammar colors; public <color> = 배상벽 ;'
	var speechRecognitionList = new webkitSpeechGrammarList();
	speechRecognitionList.addFromString(grammar, 1);
	recognition.grammars = speechRecognitionList;



	console.log(speechRecognitionList[0].src); // should return the same as the contents of the grammar variable
	console.log(speechRecognitionList[0].weight); // should return 1 - the same as the weight set in line 4.

recognition.continuous=true;
var video=new Array();
var playing;
var txt;
recognition.onresult = function(event) {
	
	txt = document.getElementById('result');
	//txt.value=event.results[0][0].transcript;
  console.log(event.results[event.resultIndex][0].transcript+" : "+event.results[event.resultIndex].isFinal+" :" +voiceflag+" :" +nextturn);
 // alert(event.results[0][0].transcript);
  txt.value=event.results[event.resultIndex][0].transcript;
  if($( "#dialog-form" ).dialog('isOpen')){
	 
		  if(event.results[event.resultIndex].isFinal&&voiceflag){
			  console.log($( "#content2" ).val());
			  console.log($( "#result" ).val());
			  
			  savedrill($( "#content2" ).val(),$( "#result" ).val());
			  //if($( "#content2" ).val() ==$( "#result" ).val())
			  $( "#dialog-form" ).dialog('close');
			  console.log("창닫힘");
			  voiceflag=false;
		  }
  		
  }
  else{
	  
  checking(event.results[event.resultIndex][0].transcript);
  if(event.results[event.resultIndex].isFinal){
	  result.push(event.results[event.resultIndex][0].transcript);
	  //txt.value=event.results[0][0].transcript;
	  console.log($( "#dialog-form" ).dialog('isOpen'));
	  
  }
  
  }
 // $( "#dialog-form" ).dialog( "close" );
 //  $( "#result" ).trigger( "change");

  if(result.length>resultsize){
	  
	  result.shift();
	 
  } 
  
 
  if(true){
	  
	  txt.value="";
	  for(var i in result) {
		  //txt.value+=result[i]+"\n";
		}
	 
  }

  
	if(event.results[event.resultIndex].isFinal&&nextturn){
		
		voiceflag=true;
		nextturn=false;
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
					//$( "#create-user" ).button().trigger("click");
					
					//recognition.start();
					opendialog();
					
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

				$( "#content2" ).val(str);
				txt.value="";
				//$( "#create-user" ).trigger("click");
				opendialog();
				
				
				videostop();
				nextturn=true;
				console.log("창열림");
				/*
				$( "#content" ).val(result[i]);
				$( "#create-user" ).button().trigger("click");*/	
				return true;
			}
		
	}
	
	return false;
}

function videostop(){
	/*
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
	*/
	video=document.getElementById('myVideo');
	playing=video;
	console.log(video);
	var isPaused = video.paused;
	  if(!isPaused){
		  video.pause();
		}
	
}

function videostart(){
if(playing != null)
	playing.play();

	
}


function savedrill(word1 , word2){
	$.ajax({
		type: 'POST',
		url: './updrill',
		data: {
			"original_word" : word1
			,"word" : word2
		},
		success: function(){
			console.log('드릴저장댐');
		}
	});


}