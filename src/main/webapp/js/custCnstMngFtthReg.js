function fnfiledownload(filenum, filename, divnm, gubun,filetype, systc,constnum, subseq,msg){
	if(filenum ==""){
		alert("파일정보가 없습니다.");
		return false;
	}
	if(!confirm(filename+"파일을 다운받으시겠습니까?")){
		return false;
	}
	
	var $form= $('<form></form>');
	$form.attr('action', '/DownloadFile');
	$form.attr('method', 'post');
	$form.attr('enctype', 'multipart/form-data');
	$form.appendTo('body');

	var idx = $('<input type = "hidden" id="idx" 	name="idx" 	value="'+filenum+'"></input>');
	var systc = $('<input type = "hidden" id="idx" 	name="systc" 	value="'+systc+'"></input>');
	var boardtype = $('<input type = "hidden" id="idx" 	name="boardtype" 	value="'+boardtype+'"></input>');
	var boardsubtype = $('<input type = "hidden"  id="boardsubtype"	name="idx" 	value="'+boardsubtype+'"></input>');
	var file_origin = $('<input type = "hidden" 	name="idx" 	value="'+filename+'"></input>');
	var file_save= $('<input type = "hidden"  	name="idx" 	value="'+filepath+','+filename+'"></input>');
	
	$form.append(idx).append(systc).append(boardtype).append(boardsubtype).append(file_origin).append(file_save);
	$form.submit();
	
}