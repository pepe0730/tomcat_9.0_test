package controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.LoginUser;
import service.LoginService;


@WebServlet("/login")
public class LoginController extends HttpServlet {

	protected void  doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String nextPage = "";
		LoginService loginService = new LoginService();
		String name = loginService.login(email, password);
		LoginUser loginUser = new LoginUser();
		if ("".equals(name)) {
			//取得なし
			nextPage = "error.jsp";
		} else {
			//取得できた時の処理
			loginUser.setEmail(email);
			loginUser.setName(name);
			nextPage = "mypage.jsp";
		}

		request.setAttribute("LoginUser", loginUser);
		ServletContext sc = getServletContext();
		sc.getRequestDispatcher("/" + nextPage).forward(request, response);
	}


}
