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


$(document).ready(function() {
	
	$("#remark").keyup(function(e){ //날짜에 숫자만 입력
		if (!(e.keyCode >=37 && e.keyCode<=40)) {
			var v = $(this).val();
			$(this).val(v.replace(/[^0-9]/gi,''));
		}
	});
	
	$(".allDate").keyup(function(e){ //날짜에 숫자만 입력
		if (!(e.keyCode >=37 && e.keyCode<=40)) {
			var v = $(this).val();
			$(this).val(v.replace(/[^0-9]/gi,''));
		}
	});

	
	$("#checkall").click(function(){  // 체크박스 전체 선택
        if($("#checkall").prop("checked")){
            $("input[name='companyName']").prop("checked",true);
        }else{
            $("input[name='companyName']").prop("checked",false);
        }
    })

	
	$("#goSearch").on("click",function() {
		
		if ($("#startDate").val() == '') {
			alert("시작 일자 를 입력하세요");
			return;
		}
		if ($("#endDate").val() == '') {
			alert("종료 일자 를 입력하세요");
			return;
		}
		if ($('[name="remark"]').val() == '') {
			alert("비고 란을 입력하세요")
			return;
		}

		var company = $("[name='companyName']");
		var companyChk = false;
		for (var i = 0; i < company.length; i++) {
			if (company[i].checked == true) {
				companyChk = true;
				break;
			}
		}

		if (!companyChk) {
			alert("회사를 한개 이상 선택해주세요.");
			return false;
		}

		
		
		
		
		
		var companyList = new Array();  // 회사 배열 담을려고 만든거
		$('input[name="companyName"]:checked').each(function() {
			companyList.push($(this).val());
		});
		var stdate = $("#startDate").val();
 		var endate = $("#endDate").val();
 		var delyn = $(':radio[name="deleteYn"]:checked').val();
 		var rmrk = $.trim($('input[name="remark"]').val());
 		$.ajax({
 	        type : 'POST',
 	        url : "/product/productSearchList.do",
 	        dataType : 'json',
 	       traditional : true,
 	        data : { startDate : stdate,
 	        	 	endDate : endate,
 	        	 	deleteYn : delyn,
 	        	 	remark : rmrk, 
 	        	 	companys : companyList
 	        		},
 	        success : function (data) {
 	        	console.log(data);
 	        	$('#ajaxTable').empty();
 	        	for(var i =0; i < data.length; i++) {
 	        		var innerHtml = '';
 	        	    innerHtml += 
 	        	    "<tr>"+ 
 						"<td>" + data[i].COLUMNUM + "</td>" + 
 	 					"<td>" + data[i].COMPANYNAME + "</td>" +
 	 					"<td>" + data[i].PRODUCTCOUNT + "</td>" +
 	 					"<td>" + data[i].REMARK + "</td>" +
 	 					"<td>" + data[i].DELETEYN + "</td>" +
 	 					"<td>" + data[i].SELECTCOUNT + "</td>" + 
 					"</tr>";
 	        	   $('#ajaxTable').append(innerHtml);
 	        	}
 	        	
 	            
 	        } ,error: function(){
 	        	alert("error");
 	        }
 	        
 	    }); // ajax close
	});
	
	
});



</script>
</head>
<body>
	<jsp:include page="menuList.jsp"></jsp:include>

	<div>
		<form id="searchInfo" action="/product/productList.do" method="post">
			
			검색시작일자<input type="text" id="startDate" class="allDate" placeholder="yyyymmdd 숫자로입력" maxlength="8"> ~ 
			<input type="text" id="endDate" class="allDate" placeholder="yyyymmdd 숫자로입력" maxlength="8">검색종료일자<br>
					 회사명:<input type="checkbox" id="checkall">전체선택
						<c:forEach items="${companyList}" var="cp">
							<input type="checkbox" name="companyName" value="${cp.PRODUCT_COMPANY_NAME}"> ${cp.PRODUCT_COMPANY_NAME}
				  		</c:forEach>
			<br> 비고:	<input type="text" name="remark"> 
			           삭제여부:	<input type="radio" name="deleteYn" value="Y" />삭제 
				 	   	<input type="radio" name="deleteYn" value="N" />미삭제
						<input id="goSearch" type="button" value="검색">
		</form>
		
	</div>

	<table border="1">
		<thead>
			<tr>
				<th>순번</th>
				<th>회사명</th>
				<th>등록된 상품수</th>
				<th>비고</th>
				<th>삭제여부</th>
				<th>전체 건수</th>
			</tr>
		</thead>
		<tbody id="ajaxTable">

		</tbody>

	</table>


</body>
</html>


