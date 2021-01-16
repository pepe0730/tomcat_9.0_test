package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.Customer;

public class SearchService {

	public List<Customer> searchCustomer (String gender, String blood) {
		String dbName = "system_user";
		String dbPropaties = "?characterEncoding=UTF-8&serverTimezone=JST";
		String dbUrl = "jdbc:mySQL://localhost:3308/" + dbName + dbPropaties;
		String dbUser = "root";
		String dbPassword = "";
		String sql = "select * from customer where gender =? and blood =?;";

		List <Customer> customerList = new ArrayList<Customer>();
		try {
			//MySQLに接続する
			Class.forName("com.mysql.cj.jdbc.Driver");
			//DB接続
			Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, gender);
			ps.setString(2, blood);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Customer customer = new Customer();
				customer.setId(rs.getInt("id"));
				customer.setEmail(rs.getString("email"));
				customer.setName(rs.getString("name"));
				customer.setGender(rs.getString("gender"));
				customer.setBlood(rs.getString("blood"));
				customer.setOld(rs.getInt("old"));
				customerList.add(customer);
			}
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return customerList;
	}

}
