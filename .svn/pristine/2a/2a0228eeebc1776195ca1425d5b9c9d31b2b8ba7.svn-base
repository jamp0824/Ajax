
jQuery(function() {

	jQuery.each(jQuery(".datepicker"), function(i) {
		jQuery(this).datepicker({
					monthNamesShort : ['1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월'],
					dayNamesMin : ['일', '월', '화', '수', '목', '금', '토'],
					dateFormat : 'yy-mm-dd',
					showOn : 'both',
					changeMonth : true,
					changeYear : true,
					buttonImage : '/images/egovframework/common/calendar.png',
					buttonImageOnly : true,
					buttonText : "달력",
					yearRange : 'c-50:c+1',
					showButtonPanel : false
				}).css("background-color", "#e1eaf3").attr("readonly", "readonly");
	});

}); // END jQuery(function()



//폼 서브밋
function formSubmit(url, formId) {
	var form = jQuery("form#" + formId);
	form.attr("action", url);
	form.attr("target", "_self");
	form.attr("method", "post");
	form[0].submit();
}

//컴 서브밋
function ComSubmit(opt_formId) {
	this.formId = gfn_isNull(opt_formId) == true ? "commonForm" : opt_formId;
	this.url = "";

	if(this.formId == "commonForm"){
		$("#commonForm")[0].reset();
	}

	this.setUrl = function setUrl(url){
		this.url = url;
	};

	this.addParam = function addParam(key, value){
		$("#"+this.formId).append($("<input type='hidden' name='"+key+"' id='"+key+"' value='"+value+"' >"));
	};

	this.submit = function submit(){
		var frm = $("#"+this.formId)[0];
		frm.action = this.url;
		frm.method = "post";
		frm.submit();
	};
}