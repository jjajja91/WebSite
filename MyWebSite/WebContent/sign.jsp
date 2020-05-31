<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

* {
	box-sizing: border-box
}

/* Full-width input fields */
input[type=text], input[type=password], input[type=date] {
	width: 100%;
	padding: 15px;
	margin: 5px 0 22px 0;
	display: inline-block;
	border: none;
	background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
	background-color: #ddd;
	outline: none;
}

hr {
	border: 1px solid #f1f1f1;
	margin-bottom: 25px;
}

/* Set a style for all buttons */
button {
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
	opacity: 0.9;
}

button:hover {
	opacity: 1;
}

/* Extra styles for the cancel button */
.cancelBtn {
	padding: 14px 20px;
	background-color: #f44336;
}

/* Float cancel and signup buttons and add an equal width */
.cancelBtn, .signupBtn {
	float: left;
	width: 50%;
}

/* Add padding to container elements */
.container {
	padding: 16px;
}

/* Clear floats */
.clearfix::after {
	content: "";
	clear: both;
	display: table;
}

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
	.cancelBtn, .signupBtn {
		width: 100%;
	}
}
</style>
<body>

	<form action="LoginForm.jsp" style="border: 1px solid #ccc"
		id="signForm" method="post">
		<div class="container">
			<h1>회원가입 페이지</h1>
			<p>회원가입에 필요한 정보를 기입해주세요</p>
			<hr>

			<label for="id"><b>아이디(영문자로 시작하는 6~20자 영문자 또는 숫자)</b></label> <input
				type="text" placeholder="아이디를 입력해주세요" name="id" id="id"> <label
				for="pwd"><b>비밀번호(특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호)</b></label> <input
				type="password" placeholder="비밀번호를 입력해주세요" name="pwd" id="pwd">
			<label for="pwd-repeat"><b>비밀번호 재확인</b></label> <input
				type="password" placeholder="위와 동일한 비밀번호를 입력해주세요" name="pwd-repeat"
				id="pwd-repeat"> <label for="email"><b>이메일</b></label> <input
				type="text" placeholder="이메일을 입력해주세요" name="email" id="email">
			<label for="name"><b>이름</b></label> <input type="text"
				placeholder="이름을 입력해주세요(2~4글자의 한글)" name="name" id="name"> <label
				for="birth"><b>생년월일</b></label> <input type="date" name="birth"
				id="birth"> <label for="phone"><b>휴대전화</b></label> <input
				type="text" placeholder="휴대전화를 입력해주세요" name="phone" id="phone">

			<label for="gender"><b>성별</b></label> <input name="gender" type=radio
				id="man" value="man" checked>남 <input name="gender"
				type=radio id="woman" value="woman">여

			<p>
				By creating an account you agree to our <a href="#"
					style="color: dodgerblue">Terms & Privacy</a>.
			</p>

			<div class="clearfix">
				<button type="button" class="cancelBtn">취소</button>
				<button type="submit" class="signupBtn">가입</button>
			</div>
		</div>
	</form>
	<script type="text/javascript">
		window.onload = function() {

			var cancelBtn = document.querySelector(".cancelBtn");
			var signForm = document.querySelector("#signForm");

			signForm.addEventListener('submit', check);

			function check(e) {
				e.preventDefault();
				var id = document.querySelector("#id");
				var pwd = document.querySelector("#pwd");
				var pwdRepeat = document.querySelector("#pwd-repeat");
				var email = document.querySelector("#email");
				var name = document.querySelector("#name");
				var birth = document.querySelector("#birth");
				var phone = document.querySelector("#phone");
				var man = document.querySelector("#man");
				var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
				var pwdReg = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
				var nameReg = /^[가-힣]{2,4}$/;
				var birthReg = /^\d{4}-\d{1,2}-\d{1,2}$/;
				var emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
				var phoneReg = /^\d{3}-\d{3,4}-\d{4}$/;
				if (id.value == null || id.value == '' || id.value == undefined) {
					alert("아이디가 비어있습니다.");
					id.focus();
					return false;
				} else if (pwd.value == null || pwd.value == ''
						|| pwd.value == undefined) {
					alert("비밀번호가 비어있습니다.");
					pwd.focus();
					return false;
				} else if (pwdRepeat.value == null || pwdRepeat.value == ''
						|| pwdRepeat.value == undefined) {
					alert("비밀번호 확인이 비어있습니다.");
					pwdRepeat.focus();
					return false;
				} else if (email.value == null || email.value == ''
						|| email.value == undefined) {
					alert("이메일이 비어있습니다.");
					email.focus();
					return false;
				} else if (name.value == null || name.value == ''
						|| name.value == undefined) {
					alert("이름이 비어있습니다.");
					name.focus();
					return false;
				} else if (birth.value == null || birth.value == ''
						|| birth.value == undefined) {
					alert("생년월일이 비어있습니다.");
					birth.focus();
					return false;
				} else if (phone.value == null || phone.value == ''
						|| phone.value == undefined) {
					alert("전화번호가 비어있습니다.");
					phone.focus();
					return false;
				} else if (!(idReg.test(id.value))) {
					alert("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자입니다.");
					id.focus();
					return false;
				} else if (!(pwdReg.test(pwd.value))) {
					alert("비밀번호는 특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호입니다.");
					pwd.focus();
					return false;
				} else if (pwd.value != pwdRepeat.value) {
					alert("비밀번호와 확인은 같아야 합니다.");
					pwdRepeat.focus();
					return false;
				} else if (!(emailReg.test(email.value))) {
					alert("이메일의 형식을 지켜서 입력해주세요.");
					email.focus();
					return false;
				} else if (!(nameReg.test(name.value))) {
					alert("이름은 2~4글자의 한글입니다.");
					name.focus();
					return false;
				} else if (!(birthReg.test(birth.value))) {
					alert("생년월일은 YYYY-MM-DD의 형식입니다.");
					birth.focus();
					return false;
				} else if (!(phoneReg.test(phone.value))) {
					alert("전화번호는 000-000(0)-0000의 형식입니다.");
					phone.focus();
					return false;
				} else {
					e.target.submit();
				}
			}
			;
		}
	</script>
</body>
</html>
