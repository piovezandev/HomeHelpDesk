package br.com.cliente.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import br.com.cliente.conexoes.ConnectionFactory;

public class JdbcLoginDao extends Ticket {

	public boolean result = false;
	private final Connection connection;
	String teste;

	@Autowired
	public JdbcLoginDao() {
		try {
			this.connection = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public boolean verificaUser(Login login) {

String sql = "select * from login where nome like '%"+ login.getNome()+"%'" 
+ "and senha='" + login.getSenha()+"' and conta = 'user'";
		try {
			Statement st = connection.createStatement();
			ResultSet res = st.executeQuery(sql);
		if (res.next()) 	{
				result = true;
				login.setSobrenome(res.getString("sobrenome"));
				login.setEmail(res.getString("email"));
				
			}	
		} catch (Exception e) {
			System.out.println("usuario ou senha incorretos");
			
		}
		return result;
	}

	
	
	public boolean verificaUserAdmin(Login login) {

		String sql = "select * from login where nome like '%"+ login.getNome()+"%'" 
		+ "and senha='" + login.getSenha()+"' and conta = 'admin'";
				try {
					Statement st = connection.createStatement();
					ResultSet res = st.executeQuery(sql);
				if (res.next()) 	{
						result = true;	
						login.setSobrenome(res.getString("sobrenome"));
						login.setEmail(res.getString("email"));
					}	
				} catch (Exception e) {
					System.out.println("usuario ou senha incorretos");
					}
				return result;
			}}
