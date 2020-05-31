package com.codechobo;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginAction")
public class LoginAction extends HttpServlet {

	// 유저 비밀번호 확인 메서드
	boolean checkPwd(String id, String pwd) {
//		Dao dao = Dao.getInstance();
//		User user = dao.readOne(id);
//		if (user != null) {
//			return pwd.equals(user.getPassword());
//		}
//		return false;
		return id.equals("asdf") && pwd.equals("1234");
	}

	// 비어있는지 확인하는 메서드
	boolean isEmpty(String check) {
		return check == null;
	}

	// 쿠키 삭제하는 메서드
	void removeCookie(Cookie[] cookies, String key, String value, HttpServletResponse response) {
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals(key)) {
					Cookie cookie = new Cookie(key, value);
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
			}
		}
	}

	// 쿠키 생성하는 메서드
	void createCookie(String key, String value, HttpServletResponse response) {
		Cookie cookie = new Cookie(key, value);
		response.addCookie(cookie);
	}

	// 세션에 정보를 저장하는 메서드
	void saveSession(String key, String value, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute(key, value);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String check = request.getParameter("rememberId");
		String url = request.getParameter("url");
		if (checkPwd(id, pwd)) {
			if (!isEmpty(check)) {
				createCookie("id", id, response);
			} else {
				removeCookie(request.getCookies(), "id", id, response);
			}
			// 세션을 만들거나 얻어서 id를 저장하여 넘겨줌
			saveSession("id", id, request);
			// url에 맞는 곳으로 보내줌
			response.sendRedirect(url);
		} else {
			removeCookie(request.getCookies(), "id", id, response);
			response.sendRedirect("LoginForm.jsp?status=fail");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
