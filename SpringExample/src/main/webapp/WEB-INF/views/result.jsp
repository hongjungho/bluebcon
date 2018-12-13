<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/css/menu.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<table>
		<tr>
			<td>이름+길이 :</td>
			<td>${requstMap.name},${nameLength}글자</td>
		</tr>

		<tr>
			<td>이름의 바이트 값:</td>
			<td>${nameByte} Bytes</td>
		</tr>


		<tr>
			<td>성별 :</td>
			<td>${requstMap.gender},${genderK}</td>
		</tr>

		<tr>
			<td>취미</td>
			<td><c:forEach items="${hobbys}" var="hobby">
${hobby} 
</c:forEach></td>
		</tr>

		<tr>
			<td>전화번호 :</td>
			<td>${requstMap.firstNb}${requstMap.midNb}${requstMap.lastNb}</td>
		</tr>

		<tr>
			<td>전화번호 하나씩 제거 :</td>

			<td><c:forEach items="${arr}" var="arr">
${arr}
<br>
				</c:forEach></td>
			<!-- </tr> -->


		</tr>

		<tr>
			<td>전화번호의 합 :</td>
			<td>${sum}</td>
		</tr>

		<tr>
			<td>textarea의 빈칸수 :</td>
			<td>${contentLength}</td>
		</tr>



	</table>


</body>
</html>
