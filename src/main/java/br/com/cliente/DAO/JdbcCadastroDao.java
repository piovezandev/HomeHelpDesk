package br.com.cliente.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import br.com.cliente.conexoes.ConnectionFactory;

public class JdbcCadastroDao {
	private final Connection connection;
	public boolean result = false;
	Login login = new Login();

public JdbcCadastroDao(){
	try {
		this.connection = new ConnectionFactory().getConnection();
	} catch (SQLException e) {
		throw new RuntimeException(e);
	}
}

	public void cadastra(Login login){
		String sql = "insert into login (nome,sobrenome,email,senha,conta) "
				+ "values(?,?,?,?,?)";
		PreparedStatement stmt;
		try {
			stmt =connection.prepareStatement(sql);
			stmt.setString(1, login.getNome());
			stmt.setString(2, login.getSobrenome());
			stmt.setString(3, login.getEmail());
			stmt.setString(4, login.getSenha());
			stmt.setString(5, "user");
			stmt.execute();
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void altera(Login login){
		achaConta(login);
		
		String sql = "update login set nome=?,sobrenome=?,email=?,senha=? where idcliente =? ";
		PreparedStatement stmt;
		try {
			stmt =connection.prepareStatement(sql);
			stmt.setString(1, login.getNome());
			stmt.setString(2, login.getSobrenome());
			stmt.setString(3, login.getEmail());
			stmt.setString(4, login.getSenha());
			stmt.setInt(5, login.getIdCliente());
			
			stmt.execute();
			System.out.println("alterado"+login.getIdCliente());
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void achaConta(Login login) {
		// int id=0;
		String sql = "select * from login ";
		try {
			Statement st = connection.createStatement();
			ResultSet res = st.executeQuery(sql);
			if (res.next()) {
				result = true;
                login.setIdCliente(res.getInt("idcliente"));
			}
		} catch (Exception e) {
			System.out.println("usuario ou senha incorretos");

		}
		
		
	}
}
