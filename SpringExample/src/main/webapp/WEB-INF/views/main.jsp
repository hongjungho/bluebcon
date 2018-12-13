<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/css/menu.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.js"></script>

<script type="text/javascript">
	
	function validate() { // 숫자만 쓸수 있게하는 메서드
	    if (event.keyCode >=48 && event.keyCode <= 57 ) {
	        return true;
	    } else {
	        event.returnValue = false;
	    }
	}



	function search() {
		if($("[name='productName']").val() == ''){
            alert("상풍명을 입력하세요!");
            return; 
        }
		
		var company = $("[name='companyName']");
		var companyChk = false;
		for(var i=0;i<company.length;i++){
            if(company[i].checked == true) {
                companyChk = true;
                break;
            }
        }
    
        if(!companyChk){
            alert("회사를 한개 이상 선택해주세요.");
            return false;
        }
        
        if($.trim($("[name='createDate']").val()) == ''){
        	alert("등록일을 입력하세요")
        	return;
        }



		$("#searchInfo").submit();
	}
	
	$(document).ready(function() {
		$("#goSearch").click(function(){
			$.ajax({
			url:'/product/productSearchList.do',	
			type: 'POST',
			dataType: 'json',
			data: {
					
					},
			success:function(data){
				var innnerHtml ='';
				innnerHtml =+ <
			},
			error:function(jqXHR, textStatus, errorThrown) {
				alert("에러발생" +textStatus+":"+ errorThrown);
				self.close();
			}
			});
		});
		
	});
	

</script>
</head>
<body>
	<jsp:include page="menuList.jsp"></jsp:include>

	<div>
		<form id="searchInfo" action="/product/productList.do" method="post">
			<input type="text" name="productName" value="${searchResult.productName}">
			
			 회사명:<c:forEach items="${companyList}" var="cp">
						<input type="checkbox" name="companyName" value="${cp.PRODUCT_COMPANY_NAME}"> ${cp.PRODUCT_COMPANY_NAME}
				  </c:forEach>
			<br> 등록일:<input type="text"  name="createDate" value="${searchResult.createDate}"
				 			placeholder="yyyymmdd 숫자로입력" onkeypress="validate(event)" maxlength="8"> 
			           삭제여부:<input type="radio" name="deleteYn" value="Y" />삭제 
				 	   <input type="radio" name="deleteYn" value="N" />미삭제
		</form>
		<input id="goSearch" type="button" value="검색">
	</div>

	<table border="1">
		<thead>
			<tr>
				<th>순번</th>
				<th>상품명</th>
				<th>회사명</th>
				<th>등록일자</th>
				<th>삭제여부</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${productList}" var="p">
				<tr>
					<td>${p.ROWNUMB}</td>
					<td>${p.PRODUCT_NAME}</td>
					<td>${p.PRODUCT_COMPANY_NAME}</td>
					<td>${p.PRODUCT_REG_DATE}</td>
					<td>${p.PRODUCT_DEL_YN_KR}</td>
				</tr>
			</c:forEach>

		</tbody>

	</table>

<!-- 	<div class="beforeArea">
		<button id="beforeClick">선택</button>
	</div>
	
	<div class="afterArea">
		<input type="text" id="kkk" value="zzzz" />
	</div> -->


</body>
</html>


