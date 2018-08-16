package br.com.cliente.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.cliente.DAO.JdbcLoginDao;
import br.com.cliente.DAO.JdbcTicketDao;
import br.com.cliente.DAO.Login;
import br.com.cliente.DAO.Ticket;

@Controller
public class LoginController {

	Ticket ticket = new Ticket();
	String nomeAux;
	String sobrenomeAux;
	String emailAux;
	JdbcTicketDao taredao = new JdbcTicketDao();
	int aux;

	@RequestMapping(value = { "/", "Login" })
	public String loginForm() {

		return "teste";
	}

	@RequestMapping("efetuaLogin")
	public String efetuaLogin(Login login, HttpSession sessao) {
		
		if (new JdbcLoginDao().verificaUser(login)) {
			sessao.setAttribute("usuarioLogado", login.getNome());
			nomeAux = login.getNome();
			sobrenomeAux = login.getSobrenome();
			emailAux = login.getEmail();
			
			return "chamado/menu";
		}
		if (new JdbcLoginDao().verificaUserAdmin(login)) {
			sessao.setAttribute("usuarioLogado", login.getNome());
			nomeAux = login.getNome();
			sobrenomeAux = login.getSobrenome();
			emailAux = login.getEmail();
			return "chamado/menu-admin";
		}
		return "errologin";
	}

	@RequestMapping("home")
	public String home(HttpSession sessao, Login login) {
		login.setNome(nomeAux);
		login.setSobrenome(sobrenomeAux);
		login.setEmail(emailAux);
		sessao.setAttribute("usuarioLogado", nomeAux);
        
		return "chamado/menu";
	}

	@RequestMapping("logout")
	public String logout(HttpSession sessao) {
		sessao.invalidate();
		return "redirect:Login";
	}
}