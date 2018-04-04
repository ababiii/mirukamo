var result  = new Array(); 
var recognition = new webkitSpeechRecognition();
//recognition.continuous=true;

recognition.onresult = function(event) {
	var txt = document.getElementById('txt');
	//txt.value=event.results[0][0].transcript;
  console.log(event) 
 // alert(event.results[0][0].transcript);
  result.push(event.results[0][0].transcript);
  
  
  if(result.length>3){
	  result.shift();
  }
  if(true){
	  
	  txt.value="";
	  for(var i in result) {
		  txt.value+=result[i]+"\n";
		}
	 
  }
  
  
  
}
recognition.lang = 'ja-JP';
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
}

// List cameras and microphones.
/*
navigator.mediaDevices.enumerateDevices()
.then(function(devices) {
  devices.forEach(function(device) {
    console.log(device.kind + ": " + device.label +
                " id = " + device.deviceId);
   
  });
});
*/