<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<html>
<head>
<script src="resources/jQuery/jquery-3.2.1.min.js"></script>
<script src="resources/jQuery/jquery-ui.js"></script>
  <script type="text/javascript">
    var recognizing;
    var recognition = new webkitSpeechRecognition();
    console.log(recognition);
   	var button= $('#button');
    recognition.continuous = false;
    recognition.interimResults =true;
    reset();
    recognition.onend = reset;
	var textarea=$('#textarea');
    recognition.onresult = function (event) {
    	console.log(event);
      for (var i = 0; i < event.results.length; ++i) {
    	  console.log(event.results[0].isFinal);
        if (event.results[0].isFinal) {
        	//textarea=$('#textarea');
          textarea.value += event.results[i][0].transcript;
        }
      }
    }

    function reset() {
      recognizing = false;
      button.innerHTML = "Click to Speak";
    }

    function toggleStartStop() {
      if (recognizing) {
        recognition.stop();
        reset();
      } else {
        recognition.start();
        recognizing = true;
        button.innerHTML = "Click to Stop";
      }
    }
  </script>
            
</head>
<body>
<textarea id="textarea" rows=10 cols=80></textarea>
  <button id="button" onclick="toggleStartStop()">click</button>


</body>
</html>
