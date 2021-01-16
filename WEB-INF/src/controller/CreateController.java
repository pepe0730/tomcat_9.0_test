package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.Data;

@Data
@WebServlet("/create")
public class CreateController extends HttpServlet{


	protected void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String blood = request.getParameter("blood");
		int old = Integer.parseInt(request.getParameter("old"));
		String memo = request.getParameter("memo");

		String dbName = "system_user";
		String dbPropaties = "?characterEncoding=UTF-8&serverTimezone=JST";
		String dbUrl = "jdbc:mySQL://localhost:3308/" + dbName + dbPropaties;
		String dbUser = "root";
		String dbPassword = "";
		String sql = "insert into customer (email,password,name,gender,blood,old,memo) value(?,?,?,?,?,?,?);";

		try {
			//MySQLに接続する
			Class.forName("com.mysql.cj.jdbc.Driver");
			//DB接続
			Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			ps.setString(3, name);
			ps.setString(4, gender);
			ps.setString(5, blood);
			ps.setInt(6, old);
			ps.setString(7, memo);
			ps.executeUpdate();
			ServletContext sc = getServletContext();
			sc.getRequestDispatcher("/" + "complete.jsp").forward(request, response);

		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();

		}
	}
}
