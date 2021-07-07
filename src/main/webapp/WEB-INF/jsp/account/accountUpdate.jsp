<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script>

/* function setSelectBox(o){
	var selectVal = o.value;
	var code =o.value;
	var upper = $(o).parent().parent(); //셀렉트 박스의 상위 객체

										// 위 코드에서 <div class="col-sm-12>가 해당된다
	var cnt = $('select', upper).size(); //셀렉트 박스 갯수
	var idx = $('select',upper).index(o); //현재 셀렉트 박스의 순서
	var dept = idx +1; //선택한 selectbox가 몇 depth인지.
	var level = 5+ idx; //db에 저장되어 있는 level이 3 level이라
					//다음 레벨을 구하기 위해 기본값 4level로 잡았다.
	var selectBox = $('select', upper).eq(depth); //선택한 하위값 selectbox
	var text = '<option value="">선택 </option>'; //기본으로 설정할 값.
	var selectVal02 = selectVal.substring(2,4); //선택한 코드값으로 하위 코드값을 찾기

	if(selectVal ==''){//전체를 선택했을 경우
		$('select:gt('+idx+')',upper).html(text); //선택한 하위값들의 값 전체로  변경
		$('select:gt('+idx+')',div).attr("disable",true); //선택한 하위값들 disable
		return
}
//ajax 통신해 해당 값을 가져온다.
	$.ajax({
		type:'POST',
		url:'/account/selectCombo.do',
		dataType:'json',
		data:{'level':level,'selectVal':selectVal,'selectVal02':selectVal02},
		success:function(res){
			console.log(res);
			var dirList = eval(res.jsonView); //jsonArray의 값을 list로
			var loop = res.resultCnt; //반복할 횟수(뿌려줄 리스트의 size)

			$('select:gt('+idx+')',upper).html(text); //select한 하위값들을 모두 전체로
			for(var i=0; i<loop; i++){
				var list = jsonView[i];
				//객체를 가져와 append시킨다.
				selectBox.append('<option value="'+list.selectVal+'">'+list.valName+'</option>');

				}
		}

	}); */
	$(function() {
	   $("#profitCost").change(function(){
      var param = $(this).val();

      $.ajax({
         type: 'POST',
         dataType: 'json',
         url: '/account/selectCombo.do',
         data: {category : param},
         success: function(data){
            console.log(data);
            //SELECT BOX 초기화
            $("#bigGroup").find("option").remove().end().append("<option value=''>전체</option>");
            $("#middleGroup").find("option").remove().end().append("<option value=''>해당없음</option>");
            $("#smallGroup").find("option").remove().end().append("<option value=''>해당없음</option>");
            $("#detailGroup").find("option").remove().end().append("<option value=''>해당없음</option>");

            //배열 개수 만큼 option 추가
             $.each(data.resultMap, function(i){
                $("#bigGroup").append("<option value='"+data.resultMap[i].code+"'>"+data.resultMap[i].comKor+"</option>");


             });
         },
         error:function(request,status,error){
             console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
          }//ERROR
      });
   });

	   $("#bigGroup").change(function(){
		      var param = $(this).val();

		      $.ajax({
		         type: 'POST',
		         dataType: 'json',
		         url: '/account/selectCombo.do',
		         data: {category : param},
		         success: function(data){
		            console.log(data);
		            //SELECT BOX 초기화
		            $("#middleGroup").find("option").remove().end().append("<option value=''>전체</option>");
		            $("#smallGroup").find("option").remove().end().append("<option value=''>해당없음</option>");
		            $("#detailGroup").find("option").remove().end().append("<option value=''>해당없음</option>");

		            //배열 개수 만큼 option 추가
		             $.each(data.resultMap, function(i){
		                $("#middleGroup").append("<option value='"+data.resultMap[i].code+"'>"+data.resultMap[i].comKor+"</option>");


		             });
		         },
		         error:function(request,status,error){
		             console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		          }//ERROR
		      });
		   });

   		$("#middleGroup").change(function(){
		var param = $(this).val();

		$.ajax({
			type:'POST',
			dataType:'json',
			url:'/account/selectCombo.do',
			data:{category:param},
			success:function(data){
				console.log(data);
				$("#smallGroup").find("option").remove().end().append("<option value=''>전체</option>");
	            $("#detailGroup").find("option").remove().end().append("<option value=''>해당없음</option>");
	            //배열 갯수 만큼 option 추가
	            $.each(data.resultMap,function(i){
	            	$("#smallGroup").append("<option value='"+data.resultMap[i].code+"'>"+data.resultMap[i].comKor+"</option>")
	            });
			},
			error:function(request,status,error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		})
   })

   		$("#smallGroup").change(function(){
		var param = $(this).val();
		$.ajax({
			type:'POST',
			dataType:'json',
			url:'/account/selectCombo.do',
			data:{category:param},
			success:function(data){
				console.log(data.resultMap);
	            $("#detailGroup").find("option").remove().end().append("<option value=''>전체</option>");
	            //배열 갯수 만큼 option 추가
	            $.each(data.resultMap,function(i){
	            	$("#detailGroup").append("<option value='"+data.resultMap[i].code+"'>"+data.resultMap[i].comKor+"</option>")
	            });
			},
			error:function(request,status,error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		})
   })



	});//end funciton()
	//숫자만 입력하는 로직
	function checkNum(e) {
        var keyVal = event.keyCode;

        if(((keyVal >= 48) && (keyVal <= 57))){
            return true;
        }
        else{
            alert("숫자만 입력가능합니다");
            return false;
        }
    }
	/* $.post("/account/selectCombo.do" //controller mapping주소
			,{"level":level, "selectVal":selectVal, "selectVal02":selectVal02}
			, function(res){


		}); */


/*	$.ajax({
		url: '${pageContext.request.contextPath}/member/searchMemberById',
		type: 'post',
		data: {'id' : id},
		dataType:"html",
		success:function(data){
			console.log(data);
			if(data=='success'){
				// 회원아이디가 있었을 경우
				id_list.push(id);
				$('.id-list').append($('<li class="list-group-item " style="border: 1px solid #19375e;" ><span class="member-id">'+ id +'</span><span class="float-right" onclick="return deleteId(this);" style="cursor: pointer;">X</span></li>'))
			}else{
				// 회원아읻가 없었을 경우
				alert('회원아이디가 없습니다.');
			}
		}
	});
}*/


</script>

<!-- 비용 START -->
<div class="container" style="margin-top: 50px">
	<div class="col-sm-12"><label for="disabledInput" class="col-sm-12 control-label"></label></div>
	<div class="col-sm-12"><label for="disabledInput" class="col-sm-12 control-label"></label></div>
	<div class="col-sm-12"><label for="disabledInput" class="col-sm-12 control-label"></label></div>
	<div class="col-sm-12"><label for="disabledInput" class="col-sm-12 control-label"></label></div>


	<form id="writeForm" name="writeForm" method="post">
	<div class="col-sm-11" id="costDiv">
		<div>
			<div class="col-sm-11">
			 		<div class="col-sm-12">
				      <div class="col-sm-3">
				      <div>
				      <input type="hidden" value="${inOutMap.accountSeq}" name="account_seq">
				      </div>
						<select class="form-control" id="profitCost" name="profitCost" title="비용" >
				        	<c:forEach var="list" items="${list1}" varStatus="cnt">
				        	  <option value="${list.code}" ${list.code eq inOutMap.profitCost ? "selected" : "" } >${list.comKor}</option>
				        	</c:forEach>
				        </select>
				      </div>

				      <div class="col-sm-3">
						<select class="form-control" id="bigGroup"  name="bigGroup" title="관">
				        	<c:forEach var="list" items="${list2}" varStatus="cnt">
				        	  <option value="${list.code}" ${list.code eq inOutMap.bigGroup ? "selected" : "" } >${list.comKor}</option>
				        	</c:forEach>
				        </select>
				      </div>

				      <div class="col-sm-3">
						<select class="form-control " id="middleGroup" name="middleGroup"  title="항">
				        	<c:forEach var="list" items="${list3}" varStatus="cnt">
				        	  <option value="${list.code}" ${list.code eq inOutMap.middleGroup ? "selected" : "" } >${list.comKor}</option>
				        	</c:forEach>
				        </select>
				      </div>

				      <div class="col-sm-3">
						<select class="form-control " id="smallGroup" name="smallGroup" title="목">
				        	<c:forEach var="list" items="${list4}" varStatus="cnt">
				        	  <option value="${list.code}" ${list.code eq inOutMap.smallGroup ? "selected" : "" } >${list.comKor}</option>
				        	</c:forEach>
				        </select>
				      </div>
			 		</div>

			 		<div class="col-sm-12">  <label for="disabledInput" class="col-sm-12 control-label"> </label></div>
			 		<div class="col-sm-12">
			 			  <div class="col-sm-3">
								<select class="form-control " id="detailGroup" name="detailGroup" title="과">
							        	<c:forEach var="list" items="${list5}" varStatus="cnt">
				        	  <option value="${list.code}" ${list.code eq inOutMap.detailGroup ? "selected" : "" } >${list.comKor}</option>
				        	</c:forEach>
						        </select>
					      </div>
				      <div class="col-sm-9">
				      		<input class="form-control " name="comment" type="text" value="${re}" placeholder="비용 상세 입력" title="비용 상세">
				      </div>
			 		</div>

				<div class="col-sm-12">  <label for="disabledInput" class="col-sm-12 control-label"> </label></div>
			 		<div class="col-sm-12">
			 		  <label for="disabledInput" class="col-sm-1 control-label"><font size="1px">금액</font></label>
				      <div class="col-sm-3">
				        	<input class="form-control"  name="transactionMoney" type="text" value="${resu}" title="금액"
				        	onKeyPress="return checkNum(event)">

				      </div>
			 		  <label for="disabledInput" class="col-sm-1 control-label"><font size="1px">거래일자</font></label>
				      <div class="col-sm-3">
				       	 <input class="form-contro col-sm-2 datepicker"   id="transactionDate" name="transactionDate"
				       	  type="text" value="${res}" style="width: 80%" title="거래일자">
				      </div>
			 		</div>
					<div class="col-md-offset-4">
					<div class="col-sm-12"><label for="disabledInput" class="col-sm-12 control-label"></label></div>
					<button class="btn btn-primary" onClick='fn_updatetoBoard()'>수정</button>
					<div class="col-sm-12"><label for="disabledInput" class="col-sm-12 control-label"></label></div>
					<button class="btn btn-warning" onClick='fn_cancel()'>취소</button>
					</div>
			 </div>
		</div>
	</div>
	</form>
</div>
<script>
//글쓰기
function fn_updatetoBoard(){

    var form = document.getElementById("writeForm");

    form.action = "<c:url value='/account/accountUpdatePro.do'/>";
    form.submit();

}

//목록
function fn_cancel(){

    var form = document.getElementById("writeForm");

    form.action = "<c:url value='/account/accountList.do'/>";
    form.submit();

}
</script>
<!-- 비용 END -->