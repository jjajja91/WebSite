<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="mywebGv.jspf" %>

<%
btnLabel = "로그아웃";
btnHref = "LogoutAction";
%>
    
    
<!DOCTYPE html>
<html>
<head>
<%@ include file="menuCss.jspf" %>
<style>
#lecture {
  background-color: #4CAF50;
}
</style>
</head>
<body>
<%@ include file="menuSource.jspf" %>

<h3><%=id%>님!! 강의실에 오신 것을 환영합니다!!</h3>
<div id="lecture"></div>

</body>
<script type="text/javascript">
	var board = document.querySelector("#lecture");
	var boardList = new ArrayList();
</script>
</html>