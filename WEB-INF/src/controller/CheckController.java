package controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.Customer;
import lombok.Data;

@Data
@WebServlet("/check")
public class CheckController extends HttpServlet{

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Customer customer = new Customer();
		customer.setEmail(request.getParameter("email"));
		customer.setPassword(request.getParameter("password"));
		customer.setName(request.getParameter("name"));
		customer.setGender(request.getParameter("gender"));
		customer.setBlood(request.getParameter("blood"));
		customer.setOld(Integer.parseInt(request.getParameter("old")));
		customer.setMemo(request.getParameter("memo"));

		request.setAttribute("customer", customer);

		ServletContext sc = getServletContext();
		sc.getRequestDispatcher("/" + "confilm.jsp").forward(request, response);

	}
}
