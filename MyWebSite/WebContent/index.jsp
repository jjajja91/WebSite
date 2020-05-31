<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="mywebGv.jspf" %>

<%
if(id!=null){
	// 버튼의 이름과 링크 바꾸고 세션에서 불러온 아이디를 변수에 저장
	btnLabel = "로그아웃";
	btnHref = "LogoutAction";
} else {
	id = "손님";
}
%>


<!DOCTYPE html>
<html>
<head>
<style>
#home {
  background-color: #4CAF50;
}
</style>
<%@ include file="menuCss.jspf" %>
</head>
<body>

<%@ include file="menuSource.jspf" %>

<h3><%=id%>님!! 접속을 환영합니다!!</h3>

</body>
</html>