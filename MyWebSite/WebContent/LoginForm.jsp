<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.codechobo.Dao"%>
<%@ page import="com.codechobo.User"%>

<%
String idTmp = "";
String checked = "";
String url = request.getParameter("url");
String status = request.getParameter("status");
boolean failed = false;
if(status!=null)
	failed = true;
// url을 넘겨주지 않았으면 기본화면, 넘겼으면 그 페이지로 넘어가게
url = url != null ? url : "index.jsp";
// idTmp에 쿠키값을 저장
idTmp = getCookieValue(request.getCookies(), "id");
// 저장된 쿠키값이 빈 문자열이 아니라면 체크박스 체크
if (idTmp != null)
	checked = "checked";
else
	idTmp = "";
%>


<%!//쿠키를 얻는 메서드
	String getCookieValue(Cookie[] cookies, String key) {
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				if ((cookies[i].getName().equals(key)))
					return cookies[i].getValue();
			}
		}
		return null;
	}
%>


<%
	if (checkReferer(request, "sign"))
		signUser(request);
%>


<%!// referer 확인 메서드
	boolean checkReferer(HttpServletRequest request, String location) {
		return request.getHeader("referer") != null
				&& request.getHeader("referer").equals("http://localhost/" + location + ".jsp");
	}

	// 유저 가입 메서드
	void signUser(HttpServletRequest request) {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String birth = request.getParameter("birth");
		String phone = request.getParameter("phone");
		boolean isMan = request.getParameter("gender").equals("man");
		Dao dao = Dao.getInstance();
		User user = new User(id, pwd, email, name, birth, phone, isMan);
		dao.create(user);
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

form {
	border: 3px solid #f1f1f1;
}

input[type=text], input[type=password] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

button {
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
}

button:hover {
	opacity: 0.8;
}

#cancelBtn, #signBtn {
	width: auto;
	padding: 10px 18px;
	background-color: #f44336;
}

.container {
	padding: 16px;
}

span.psw {
	float: right;
	padding-top: 16px;
}

#url {
/*	display: none;*/
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
	span.psw {
		display: block;
		float: none;
	}
	#cancelBtn {
		width: 100%;
	}
}
</style>
</head>
<body>

	<h2>로그인 페이지</h2>

	<form action="LoginAction" method="post" id="submitForm">
		<div class="container">
			<label for="id"><b>아이디</b></label> <input type="text"
				placeholder="아이디를 입력해주세요" name="id" id="inputId" value="<%=idTmp%>">
			<label for="pwd"><b>비밀번호</b></label> <input type="password"
				placeholder="비밀번호를 입력해주세요" name="pwd" id="inputPwd">
			<button type="submit">로그인</button>
			<label> <input type="checkbox" <%=checked%> name="rememberId"
				id="rememberId"> ID 기억
			</label> <input type="hidden" value="<%=url%>" name="url" id="url">
		</div>
		<div class="container" style="background-color: #f1f1f1">
			<button type="button" id="cancelBtn">홈으로</button>
			<button type="button" id="signBtn">회원가입</button>
		</div>
	</form>
	<script>
		var cancelBtn = document.querySelector("#cancelBtn");
		var signBtn = document.querySelector("#signBtn");
		
		if(<%=failed%>){
			alert("id 또는 비밀번호가 틀렸습니다");
		}

		cancelBtn.addEventListener('click', function() {
			location.href = 'index.jsp';
		});

		signBtn.addEventListener('click', function() {
			location.href = 'sign.jsp';
		});
	</script>
</body>
</html>