<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/css/menu.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<body>
<h1>menu 화면입니다</h1>
<div id="mainList" style="border: solid 1px;">
<ol>
<c:forEach items="${menuList}" var="thead">
<li><a href="${thead.MENU_URL}">${thead.MENU_NAME}</a></li> 
</c:forEach>
</ol>
</div>



</body>
</html>


