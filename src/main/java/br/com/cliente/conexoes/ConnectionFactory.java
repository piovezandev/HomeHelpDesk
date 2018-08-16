package br.com.cliente.conexoes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
	Connection con = null;
	public Connection getConnection() throws SQLException {
		System.out.println("conectando ...");

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/help",
					"root", "tricking19");
		} catch (ClassNotFoundException e) {
			throw new SQLException(e);
		}
		return con;
		
		
	}

}
