<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<script type="text/javascript">
	$(document).ready(function(){
		const getIdCheck = ReqExp(/^{6,}/);
		const getPwCheck = RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
		let chk1 = false, chk2 =false, ch3=false;
	//ID 입력값 검증
	$('#memId').on('keyup',function(){
		if(!getIdCheck.test($("#memId").val())){
			$('#memId').css("background-color","pink");
			$('#idChk').html('<b style="font-size:14px; color:red;">[아이디 입력은 6자이상입니다.]</b>');
		}
		//ID 중복확인 비동기 처리
		else{
			//ID 중복확인 비동기 통신
			const id = $(this).val();
			console.log()
			
		}
	})

	});

</script>

<div class="container" style="margin-top: 50px">
	<form class="form-horizontal" id="sendForm">
	    <div class="form-group">
	      <label class="col-sm-2 control-label">
	      <p>
	      <strong>ID</strong>&nbsp;&nbsp;&nbsp;<span id="idChk"></span>
	      </p>
	      </label>
	      <div class="col-sm-4">
	        <input class="form-control" id="memId" name="memId" type="text" value="" title="ID">
	      </div>

	      <div class="container">
	      	<button type="button" id="idcked" class="btn btn-default" style="display: block;">ID 중복 체크</button>
	      </div>

	    </div>

	    <div class="form-group">
	      <label for="disabledInput " class="col-sm-2 control-label">패스워드</label>
	      <div class="col-sm-4">
	        <input class="form-control" id="pwd" name="" type="password" title="패스워드" >
	      </div>
	      <label for="disabledInput " class="col-sm-2 control-label">패스워드 확인</label>
	      <div class="col-sm-4">
	        <input class="form-control" id="pwdck" name="" type="password" title="패스워드 확인">
	      </div>
	    </div>

	    <div class="form-group">
	      <label for="disabledInput" class="col-sm-2 control-label">이름</label>
	      <div class="col-sm-4">
	        <input class="form-control" id="memName" name="memName" type="text" value="" title="이름" >
	      </div>
	    </div>


	    <div class="col-md-offset-4">
			<button type="button" id="saveBtn"class="btn btn-primary">저장</button>
			<button type="button" id="#"class="btn btn-danger">취소</button>
	    </div>
	</form>
</div>


