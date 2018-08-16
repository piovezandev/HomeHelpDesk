package br.com.cliente.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.junit.runner.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.SessionAttributes;

import br.com.cliente.conexoes.ConnectionFactory;
import br.com.cliente.controllers.LoginController;

@Repository
public class JdbcTicketDao {
	JdbcLoginDao loginDao = new JdbcLoginDao();
	Login login = new Login();
	private final Connection connection;
	HttpServletRequest request;
	public boolean result = false;
	int idAuxLista;

	@Autowired
	public JdbcTicketDao() {
		try {
			this.connection = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void achaCod(String nome) {
		// int id=0;
		String sql = "select * from login where nome ='" + nome + "'";
		try {
			Statement st = connection.createStatement();
			ResultSet res = st.executeQuery(sql);
			if (res.next()) {
				result = true;
				login.setIdCliente(res.getInt("idcliente"));
				login.setNome(nome);
                login.setConta(res.getString("conta"));
			}
		} catch (Exception e) {
			System.out.println("usuario ou senha incorretos");

		}
		
	}
	
	
	public void achaConta(String nome,Login login) {
		// int id=0;
		String sql = "select * from login where nome ='" + nome + "'";
		try {
			Statement st = connection.createStatement();
			ResultSet res = st.executeQuery(sql);
			if (res.next()) {
				result = true;
                login.setConta(res.getString("conta"));
			}
		} catch (Exception e) {
			System.out.println("usuario ou senha incorretos");

		}
		
		
	}

	public void adiciona(HttpSession sessao, Ticket ticket) {
		String nome = (String) sessao.getAttribute("usuarioLogado");
		achaCod(nome);
	
		idAuxLista = login.getIdCliente();

		String sql = "insert into tickets (titulo, descricao, prioridade, finalizado,idusuario) values (?,?,?,?,?)";
		PreparedStatement stmt;
		try {
			stmt = connection.prepareStatement(sql);
			stmt.setString(1, ticket.getTitulo());
			stmt.setString(2, ticket.getDescricao());
			stmt.setString(3, ticket.getPrioridade());
			stmt.setBoolean(4, ticket.isFinalizado());
			stmt.setInt(5, idAuxLista);
			stmt.execute();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void remove(Ticket ticket) {
		String sql = "delete from tickets where id=?";
		PreparedStatement stmt;
		try {
			stmt = connection.prepareStatement(sql);
			stmt.setLong(1, ticket.getId());
			stmt.execute();
		} catch (SQLException e) {

		}
	}

	public List<Ticket> lista(HttpSession sessao) {
		String nome = (String) sessao.getAttribute("usuarioLogado");
		achaCod(nome);
		try {
			List<Ticket> tickets = new ArrayList<Ticket>();
			PreparedStatement stmt = this.connection
					.prepareStatement("select * from tickets where idusuario="
							+ login.getIdCliente());

			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				// adiciona a ticket na lista
				tickets.add(populaTarefa(rs));
			}
			rs.close();
			stmt.close();

			return tickets;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}


	public List<Ticket> listaAdmin(HttpSession sessao) {
		String nome = (String) sessao.getAttribute("usuarioLogado");
		achaCod(nome);
		try {
			List<Ticket> tickets = new ArrayList<Ticket>();
			PreparedStatement stmt = this.connection
					.prepareStatement("select * from tickets");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				// adiciona a ticket na lista
				tickets.add(populaTarefa(rs));
			}
			rs.close();
			stmt.close();

			return tickets;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}


	private Ticket populaTarefa(ResultSet rs) throws SQLException {
		Ticket ticket = new Ticket();

		// popula o objeto ticket
		ticket.setId(rs.getLong("id"));
		ticket.setTitulo(rs.getString("titulo"));
		ticket.setDescricao(rs.getString("descricao"));
		ticket.setFinalizado(rs.getBoolean("finalizado"));
		ticket.setPrioridade(rs.getString("prioridade"));

		// popula a data de finalizacao da ticket, fazendo a conversao
		Date data = rs.getDate("dataFinalizacao");
		if (data != null) {
			Calendar dataFinalizacao = Calendar.getInstance();
			dataFinalizacao.setTime(data);
			ticket.setDataFinalizacao(dataFinalizacao);
		}
		return ticket;
	}

	public void altera(Ticket ticket) {
		String sql = "update tickets set titulo = ?, descricao = ?, prioridade= ? where id = ?";
		PreparedStatement stmt;
		try {
			stmt = connection.prepareStatement(sql);
			stmt.setString(1, ticket.getTitulo());
			stmt.setString(2, ticket.getDescricao());
			stmt.setString(3, ticket.getPrioridade());
			stmt.setLong(4, ticket.getId());
			stmt.execute();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public Object buscaPorId(Long id) {
		String sql = ("select * from tickets where id = ?");
		PreparedStatement stmt;
		try {
			stmt = connection.prepareStatement(sql);
			stmt.setLong(1, id);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				return populaTarefa(rs);
			}
			rs.close();
			stmt.close();

			return null;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void finaliza(Long id) {

		if (id == null) {
			throw new IllegalStateException("Id da tarefa não deve ser nula.");
		}

		String sql = "update tickets set finalizado = ? where id = ?";
		PreparedStatement stmt;
		try {
			stmt = connection.prepareStatement(sql);
			stmt.setBoolean(1, true);
			//stmt.setDate(2, new Date(Calendar.getInstance().getTimeInMillis()));
			stmt.setLong(2, id);
			stmt.execute();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
