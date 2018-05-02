$(document).ready(function(){

	// �щ씪�대뜑(援먯옱)
	if( $('.prod_best_comm .sl li').length>1 ){
		$('.prod_best_comm .sl ul').bxSlider({
			auto: true,
			controls: false,
			autoHover: true
		});
	}
	
	$(".tradego_class").on("click",function(){
		$("#pay_Layer #lecture_add , #pay_Layer #book_add , #pay_Layer .bubble").remove();
		$("#pay_Layer .group_bt").css("margin-top","12px");

		$("#pay_Layer .fr").removeClass("fr").addClass("tc");
		$("#pay_Layer #payment_go").css("width","240px");

	});

	$(".tab_menu_comm3 li a").click(function(){
		scroll_to_anchor('anchor_single');
	});

	$(document).on('click','.ck_list label.radio_ck',function(){
		
		if(!$(this).hasClass("checked")){
			var input = $(this).prev("input");
			var name = input.attr("name");
			$("input[name="+name+"]").not(input).prop("checked",false);
			$("li."+name+" label").not($(this)).removeClass("checked");
		}
	});


	
	$("div.main_paybox input:checkbox").click(function(){
		var total = 0;
		$("div.main_paybox input:checkbox").each(function(){
			if($(this).prop("checked")){
			total += parseInt($(this).attr('price'));
			}
		});
		$(".cost_total span").text(addcomma(total));
	});
	
	/* BEST5 hover */
	$('.best li a').hover(function(){
		var $best_li = $(this).parent();
		$('.best li').removeClass('on');
		$best_li.addClass('on');
	},function(){
		$('.best li').removeClass('on');
		$('.best li:first-child').addClass('on');
	});
	$('.regi_area .bt_th').hover(function(){
		$(this).children('.layer_book').toggle();
		$(this).parents('.wrap_japan').toggleClass('zindex');
		if( navigator.appVersion.indexOf('MSIE 7.') != -1 ){
			$(this).parents('tr').toggleClass('zindex');
		}
	});

	$(document).on('click','.tradego',function(){
		var area_seq = $(this).attr("area_seq");

		if(area_seq == '00001843') {
			if($('input[name=smart_is_over]').val()) {
				alert("");
				return false;
			}
		}

		$("input[name=area_seq]").val(area_seq);

/*		if(!$('#prod'+area_seq).hasClass('checked')) {
			$("label[for=prod"+area_seq+"]").addClass("checked");
		}*/

		trade_layer(area_seq,'Y');
	});

	$(document).on('click','.tradego_class',function(){
		var area_seq = $(this).attr("area_seq");

		if(area_seq == '00001843') {
			if($('input[name=smart_is_over]').val()) {
				alert("");
				return false;
			}
		}
		$("input[name=area_seq]").val(area_seq);
		trade_layer(area_seq,'C');
	});

	$(".img_over").on("click",function(){

		var bookno = $(this).attr("bookno");

		$.ajax({url:"/?s=products&a=bookdetail",
					type:"POST",
					dataType: "json",
					data:{bookno:bookno},
					async:false,
					error : function(request,status,error){
						//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						//$("#dev_text").val(request.responseText);
					},
					success : function(data){
						$("#bookdetail").html(data.result);
					}
		});

		/* set size of popup box */
		var winHeight = $(window).height();
		var popHeight = $('.pop_book').height();

		/* top position of popup box */
		if ( winHeight > popHeight ){
			//而⑦뀗痢� height媛� window蹂대떎 �묒� 寃쎌슦
			var positionTop =  (winHeight-popHeight)/2 + $(window).scrollTop() +'px';

		} else {
			//而⑦뀗痢� height媛� window蹂대떎 �� 寃쎌슦
			var positionTop = $(window).scrollTop()  +'px';
		}
		/* left position of popup box */
		var popWidth = $('.pop_book').width();
		var positionLeft = -popWidth/2+'px';
		$('.pop_book').css('top',positionTop).css('margin-left',positionLeft);

		/* �앹뾽李� �꾩슦湲� */

		$('.pop_book').fadeIn(function(){
			$('.pop_book').css('display','block');
		});
		
	});


	/* �덉씠�� �앹뾽李� �リ린 */
	$('.layer_popup_close').on("click",function(){
		trade_layer_close();
	});

	$("#lecture_add").on("click",function(){
		trade_layer_close();
		scroll_to_anchor('anchor_simple');
	});

	$("#book_add").on("click",function(){
		trade_layer_close();
		scroll_to_anchor('anchor_book');
	});

	$("#payment_go").on("click",function(){
		if( $("input[name='product[]']").val() == '' ){
			alert('�곗씠��瑜� 濡쒕뱶以묒엯�덈떎. �좎떆�� �ㅼ떆 寃곗젣吏꾪뻾�� 二쇱꽭��.');
			return false;
		}
		$("#paymentform").submit();
	});

	$("select[name='amount[]']").live("change",function(){
		var tm = $(this).attr("data").split("|");
		var product = tm[0];
		var price = tm[1];
		var amount = $(this).val();
		
		var t_price = price*amount;
		
		$("#pay_list_"+product).html(addcomma(t_price)+"��");
		
		var sel_amount = $("[name='amount[]']");
		var sel_amount_len = sel_amount.length;
		var tot_price = 0;
		for( i = 0 ; i < sel_amount_len ; i++ ){
			var t_tm = sel_amount.eq(i).attr("data").split("|");
			var t_price = t_tm[1];
			var t_amount = sel_amount.eq(i).val();
			
			tot_price += t_price*t_amount;
			
		}
		$("#order_price").html(addcomma(tot_price));
		
		var delivery_price = $("#delivery_price").html().replace(",","");
		var f_price = tot_price+parseInt(delivery_price);
		
		$("#final_price").html(addcomma(f_price));

	});

	$('.bt_pay_smart').click(function () {
		var goods = new Array();
		var add_snos = new Array();
		var add_sno = 0;
		var is_over_smart = $('input[name=is_over_smart]').val();
		$('input[name="product[]"][class=book]').val('');
		$('input[name="product[]"][class=lecture]').val('');

		if($('input[name=00002320]').next().hasClass('checked')) {
			$('input[name="product[]"][class=book]').val($('input[name=00002320]').val());
		}

		if(!$('label.smart_pkg_label').hasClass('checked')) {
			alert('�곹뭹�� �좏깮�댁＜�몄슂.');
			return false;
		}

		if($('input[name=pay_smart_prod]:checked').val() == '00002255' && is_over_smart == '1') {
			alert('�ш퀬媛� 紐⑤몢 �뚯쭊�섏뼱 援щℓ媛� 遺덇��⑸땲��. "3媛쒖썡 �섍컯 �곗옣" �곹뭹�� �댁슜�� 二쇱꽭��.');
			return false;
		}

		$('input[name="product[]"][class=lecture]').val($('input[name=pay_smart_prod]:checked').val());

		$("#smart_paymentform").submit();
	});

});

var cart_layer = function(){
	var goods = new Array();
	var is_over_smart = $('input[name=is_over_smart]').val();

	$(".prod_sec input[type=checkbox]:checked").each(function(i){
		//var tmp = $(this).attr("id").replace("ck_","");
		//goods[i] = $(this).attr("id").replace("ck_","");
		if($.inArray($(this).val(),goods)<0){
			goods[i] = $(this).val();
		}
	});

	if(!goods[0]){
		alert("媛뺤쥖 諛� 援먯옱瑜� �좎껌�댁＜�몄슂.");
	}
	else if($.inArray('00002255', goods) != -1 && is_over_smart == 1) {
		alert($('input[name=over_text]').val());
	}else if($.inArray('00002585', goods) != -1 && is_over_smart == 1) {
		alert($('input[name=over_text]').val());
	}else
	{
		$.ajax({url:"/?s=cart&a=cart",
			type:"POST",
			dataType: "json",
			data:{goods:goods,mode:"cart_add"},
			error : function(request,status,error){
				//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				//$("#dev_text").val(request.responseText);
			},
			success : function(data){
				$("#cart_Layer .msg").text(data.msg);
				//$("#pop_cart").trigger("click");
				layerPopOpen('cart');
			}
		});
	}
}

var trade_layer = function(area_seq,basic){

	var goods = new Array();
	var add_snos = new Array();	
	var add_sno = 0;
	var is_over_smart = $('input[name=is_over_smart]').val();
	var area = $("#area"+area_seq);	

	if(basic=='Y' && !$("input:checked",area).length){
		console.log($("input:checked",area).length);
		$("label.basic",area).addClass("checked");
		$("input.basic_ck",area).prop("checked",true);
		goods[0] = $("input.basic_ck",area).val();
	}

	if(basic=="C" && $("input:checked",area).length > 0){
		goods[0] = $("input:checked",area).val();
		add_sno = $("input:checked",area).attr("add_sno");
		add_snos[0] = '"'+goods[0]+'":"'+add_sno+'"';
	}

	if($("#rebuy_temp input:checked").length){
	var area_products = $("#rebuy_temp");
	}else{
	var area_products = $("#products_list_tpl");
	}
	$("input:checked",area_products).each(function(i){
		goods[i] = $(this).val();
		if($(this).attr("add_sno")){
			add_sno = $(this).attr("add_sno");
		}else{
			add_sno = 0;
		}
		add_snos[i] = '"'+$(this).val()+'":"'+add_sno+'"';
	});
	

	console.log(add_snos);
	if(!goods[0]){
		if(basic!="N"){
			alert("媛뺤쥖 諛� 援먯옱瑜� �좎껌�댁＜�몄슂.");
		}
		trade_layer_close();
		return false;
	}

	if($.inArray('00002255', goods) != -1 && is_over_smart == 1) {
		alert($('input[name=over_text]').val());
		return false;
	}
	if($.inArray('00002585', goods) != -1 && is_over_smart == 1) {
		alert($('input[name=over_text]').val());
		return false;
	}

	$.ajax({url:"/?s=products&a=pay_step1",
		type:"POST",
		dataType: "json",
		data:{goods:goods,add_snos:add_snos},
		error : function(request,status,error){
			//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			//$("#dev_text").val(request.responseText);
		},
		success : function(data){
			
			if(data.result == 1){
				$("#goods_list").html(data.tbl);
				$("#goods_desc_comm").html(data.desc);
				$("#order_price").html(data.ord);
				$("#delivery_price").html(data.drv);
				$("#discount_price").html(data.dis);
				$("#add_discount").html(data.add_dis);
				$("#final_price").html(data.fin);
			}
		}
	});

	layerPopId('pay_Layer');
}

var trade_layer_close = function(){
	var wrap_layer_popup = $(".pop_apply");
	wrap_layer_popup.fadeOut(function(){
		wrap_layer_popup.css('display','none');
	});
	$('.layer_popup_bg ').fadeOut(function(){
		$('.layer_popup_bg').remove();
	});
	$('.pop_book').fadeOut(function(){
		$('.pop_book').css('display','none');
	});
}

var choice_cancel = function(tcode){
	//var area_seq = $("input[name=area_seq]").val();

	var input = $("#area"+tcode+" [id^=prod"+tcode+"]");
	if(input.length){
		input.prop("checked",false);
		
		$("label[for^=prod"+tcode+"]").removeClass("checked");
		input = $("#products_list_tpl input:checkbox[id^=bk"+tcode+"]");
		input.prop("checked",false);

		$("label[for="+input.attr("id")+"]").removeClass("checked");
	}else{
		$("#rebuy_temp").empty();
	}

		trade_layer(tcode,'N');
}



var addcomma = function(str){
	str = String(str);
	return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

var prod_type = function(val){
	selectFitOption('prod_type', val);
}

var less_type = function(val){
	selectFitOption('less_type', val);
}

var select_teacher = function(val){
	selectFitOption('teacher', val);
}

var selectFitOption = function(type, val) {
	var save_val = $("input[name='"+type+"']").val();
	$("input[name='"+type+"']").val(val);
	if (getLectureList()) {
		save_val = val;
	}
	$(".fit_"+type+" dd a").removeClass("on");
	$(".fit_"+type+" a[data-type='"+save_val+"']").addClass("on");
	
	if (type == 'less_type') {
		$(".sec_uni .tab_menu_comm3 li").removeClass("on");
		$(".sec_uni .tab_menu_comm3 a[data-type='"+save_val+"']").parent("li").addClass("on");
	}
	
	$("input[name='"+type+"']").val(save_val);
}

var getLectureList = function(){
	var prod_type = $("input[name='prod_type']").val();
	var less_type = $("input[name='less_type']").val();
	var teacher = $("input[name='teacher']").val();

	var result = true;
	$.ajax({url:"/?s=products&a=productsdetail",
		type:"POST",
		dataType: "json",
		data:{prod_type:prod_type,less_type:less_type,teacher:teacher},
		async:false,
		error : function(request,status,error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			//$("#dev_text").val(request.responseText);
		},
		success : function(data){
			if (data.empty_flag == true) {
				alert('�대떦�섎뒗 �곹뭹�� �놁뒿�덈떎.');
				result = false;
				return;
			}
			$("#tpl_pkg").html(data.tpl_pkg);
			if($("#tpl_pkg").html()==""){
				$("#tpl_pkg_title").css("display","none");
			}else{
				$("#tpl_pkg_title").css("display","block");
			}
			$("#tpl_tab").html(data.tpl_tab);
			if($("#tpl_tab").html()==""){
				$("#tpl_tab_title").css("display","none");
			}else{
				$("#tpl_tab_title").css("display","block");
			}
			$("#tpl_free").html(data.tpl_free);
			if($("#tpl_free").html()==""){
				$("#tpl_free_title").css("display","none");
			}else{
				$("#tpl_free_title").css("display","block");
			}

			$("#tpl_refund").html(data.tpl_refund);
			if($("#tpl_refund").html()==""){
				$("#tpl_refund_title").css("display","none");
			}else{
				$("#tpl_refund_title").css("display","block");
			}

			if (prod_type != '0' && prod_type != '4') {
				$("#anchor_single").css("display","none");
			} else {
				$("#anchor_single").css("display","block");
				$("#anchor_single div").css("display","none");
				if(data.tpl_cyr != null){
					$("#single_cyr_title").css("display","block");
					$("#single_cyr").html(data.tpl_cyr);
				}
	
				if(data.tpl_kks != null){
					$("#single_kks_title").css("display","block");
					$("#single_kks").html(data.tpl_kks);
				}
				
				if(data.tpl_ksk != null){
					$("#single_ksk_title").css("display","block");
					$("#single_ksk").html(data.tpl_ksk);
				}
				
				if(data.tpl_khj != null){
					$("#single_khj_title").css("display","block");
					$("#single_khj").html(data.tpl_khj);
				}
				
				if(data.tpl_ayk != null){
					$("#single_ayk_title").css("display","block");
					$("#single_ayk").html(data.tpl_ayk);
				}
				
				if(data.tpl_skw != null){
					$("#single_skw_title").css("display","block");
					$("#single_skw").html(data.tpl_skw);
				}
				
				if(data.tpl_nrm != null){
					$("#single_nrm_title").css("display","block");
					$("#single_nrm").html(data.tpl_nrm);
				}
				
				if(data.tpl_hsa != null){
					$("#single_hsa_title").css("display","block");
					$("#single_hsa").html(data.tpl_hsa);
				}
				
				if(data.tpl_ksm != null){
					$("#single_ksm_title").css("display","block");
					$("#single_ksm").html(data.tpl_ksm);
				}
			}

			$("input.id_check").customizeCRInput();

			//�섍컯�좎껌�섏씠吏� 泥댄겕諛뺤뒪 泥댄겕�� �ㅻⅨ 珥앹븸 蹂���
			$(".ck_list input:checkbox").click(function(){
				var total = 0;
				var area = $(this).parents(".apply_area_comm1").attr("id");
				$("#"+area +" input:checked").each(function(){
					if($(this).prop("checked")){
						total += parseInt($(this).attr("data-price"));
					}
				});

				if(total<=0){//泥댄겕�� ��ぉ�� �녿뒗寃쎌슦, 湲곕낯�곹뭹(.basic_ck)�� 媛�寃⑹쑝濡� �쒓린
					total = $("#"+area+" input.basic_ck").attr("data-price");
				}
				
				$("#"+area +" #sum_price").text(addcomma(total));
			});
			
			// �곹뭹諛뺤뒪 �믪씠 �ㅼ젙
			$('.prod_list> li').each(function(){
				applyAreaH = $('.apply_area_comm1 .inner', this).outerHeight();
				titAreaH = $('.tit_area', this).height();
				if( applyAreaH > titAreaH ){
					$(this).height( applyAreaH );
				}else{
					$(this).height( titAreaH );
					$('.apply_area_comm1 .inner', this).outerHeight( titAreaH );
				}
			});

			gotoAnchor();
			
		}
	});
	
	return result;
}

function gotoAnchor(){
	if(window.location.hash){
		var anchor = location.hash;
		//�대떦 �듭빱媛믪쓣 媛�吏� �ㅻ툕�앺듃媛� 議댁옱�좊븣留�
		if($(anchor).length){
			$('html, body').animate({
				scrollTop: $(anchor).offset().top-$('.wrap_fixarea').height()
			}, "fast");
		}
	}
}

var products_detail = function(val){

	if(val!=""){
		location.href= val;
	}

}



var book_detail = function(bookno){
	$.ajax({url:"/?s=products&a=bookdetail",
		type:"POST",
		dataType: "json",
		data:{bookno:bookno},
		async:false,
		error : function(request,status,error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			//$("#dev_text").val(request.responseText);
		},
		success : function(data){
			$("#bookdetail").html(data.info);
			$("#bookdesc").html(data.desc);
		}
	});

	layerPopOpen('book');
}