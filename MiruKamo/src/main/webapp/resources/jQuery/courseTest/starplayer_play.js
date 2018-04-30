
	var auto_popup = function(sno) {
	var isChrome = window.chrome && !navigator.userAgent.match(/Opera|OPR\//);
	var isEdge = navigator.appVersion.indexOf("Edge/12") != -1 ? true : false;
		if (isChrome || isEdge) {
			return starplayer_popup(sno);
		} else {
			return browser_popup(sno);
		}
	}

	var starplayer_popup = function(sno) {
		var url = "/?s=examplayer&a=examplayer&sno="+sno+"&exc=exc"; //�몄텧�� player 寃쎈줈
		var exe = StarPlayerExe; //�대떦 �뚯뒪 �좎�
			exe.install = STARPLAYER_SETUP_URL; //�대떦 �뚯뒪 �좎�
			exe.url = url; //蹂��� url�� �곸슜�� 媛� �곸슜
			exe.width = "1209";  //�щ＼, �ｌ�釉뚮씪�곗� �앹뾽 媛�濡쒖궗�댁쫰
			exe.height = "673"; //�щ＼, �ｌ�釉뚮씪�곗� �앹뾽 �몃줈�ъ씠利�
			exe.topmost = false; //��긽 �� 湲곕뒫 �덉슜
			//exe.resizing = true;
			exe.caption = "�좎씡 �뺤큹蹂� �덉텧 �꾨줈�앺듃 �쒖썝�ㅼ엥 �좎씡 - �섑뵆媛뺤쓽"; //�щ＼, �ｌ�釉뚮씪�곗� ���댄�紐�
			exe.run();//�대떦 �뚯뒪 �좎�(�щ＼, �ｌ�釉뚮씪�곗� �ㅽ뻾)
		return false;
	}

	function browser_popup(sno){
		window.open("/?s=examplayer&a=examplayer&sno="+sno,'exampleyer',"_blank","toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, copyhistory=no, resizable=no, width=1206, height=667");
		return;
	}