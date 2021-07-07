<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>


<script type="text/javascript">
$(function() {
	$("#aa").on("click",function(e){
		e.preventDefault();
		e.href("/")

		alert(1);
	});
});

function gfn_isNull(str) {
	if (str == null)
		return true;

	if (str == "NaN")
		return true;

	if (new String(str).valueOf() == "undefined")
		return true;

	var chkStr = new String(str);

	if( chkStr.valueOf() == "undefined" )
		return true;

	if (chkStr == null)
		return true;

	if (chkStr.toString().length == 0 )
		return true;

	return false;
}

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

function fn_search(pageNo){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/account/accountList.do' />");
	comSubmit.addParam("currentPageNo", pageNo);
	comSubmit.submit();
}


</script>

<form name="sendForm" id="sendForm" method="post" onsubmit="return false;">

<input type="hidden" id="situSeq" name="situSeq" value="">
<input type="hidden" id="mode" name="mode" value="Cre">

<div id="wrap"  class="col-md-offset-1 col-sm-10" >
      <div align="center"><h2>회계정보리스트</h2></div>
      <div class="form_box2 col-md-offset-7" align="right" >
         <div class="right" >
            <button class="btn btn-primary" onclick="location.href='/account/accountInsert.do'" >등록</button>
            <button class="btn btn-primary" onclick="location.href='/account/excelDown.do'">엑셀 다운</button>
         </div>
      </div>
       <br/>
      <table class="table table-hover">
         <thead>
               <tr align="center">
                 <th style="text-align: center;" >수익/비용</th>
                 <th style="text-align: center;" >관</th>
                 <th style="text-align: center;" >항</th>
                 <th style="text-align: center;" >목</th>
                 <th style="text-align: center;" >과</th>
                 <th style="text-align: center;" >금액</th>
                 <th style="text-align: center;" >등록일</th>
                 <th style="text-align: center;" >작성자</th>
               </tr>
<<<<<<< .mine
             </thead>
             <tbody>
         <c:forEach items="${accountList }" var="list" >
      <%--    <c:forEach items="${accountSeq }" var="accountSeq"> --%>
         <tr>
 		 <th style="text-align: center"><a href="/account/accountUpdate.do?accountSeq=${list.accountSeq}">${list.profitCost }</th>
 		 <th style="text-align: center">${list.bigGroup }</th>
         <th style="text-align: center">${list.middleGroup }</th>
         <th style="text-align: center">${list.smallGroup }</th>
         <th style="text-align: center">${list.detailGroup }</th>
         <th style="text-align: center">${list.transactionMoney }</th>
         <th style="text-align: center">${list.transactionDate }</th>
         <th style="text-align: center">${list.writer }</th>
         <tr>
         </c:forEach>
<%--          </c:forEach>
 --%>             </tbody>
         </table>
=======
         </thead>
         <tbody>
         	<c:forEach items="${accountList }" var="list" >
        	 <tr>
 				 <th style="text-align: center"><a href="/account/accountUpdate?accountSeq=${list.accountSeq  }">${list.profitCost }</th>
 		 		 <th style="text-align: center">${list.bigGroup }</th>
         		 <th style="text-align: center">${list.middleGroup }</th>
        		 <th style="text-align: center">${list.smallGroup }</th>
        		 <th style="text-align: center">${list.detailGroup }</th>
        		 <th style="text-align: center">${list.transactionMoney }</th>
        		 <th style="text-align: center">${list.transactionDate }</th>
       		     <th style="text-align: center">${list.writer }</th>
         	 <tr>
         	</c:forEach>
         </tbody>
        </table>
         <c:if test="${not empty paginationInfo}">
         	<ui:pagination paginationInfo = "${paginationInfo}" type="text" jsFunction="fn_search"/>
         </c:if>
         <input type="hidden" id="currentPageNo" name="currentPageNo"/>

>>>>>>> .r36

</div>
</form>
         <form id="commonForm" name="commonForm"></form>

