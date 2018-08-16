package br.com.cliente.controllers;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.cliente.DAO.JdbcLoginDao;
import br.com.cliente.DAO.JdbcTicketDao;
import br.com.cliente.DAO.Login;
import br.com.cliente.DAO.Ticket;

@Controller
public class TicketController {
	JdbcLoginDao teste = new JdbcLoginDao();
	Login login = new Login();

	@RequestMapping(value = "novoTicket", method = RequestMethod.POST)
	public String adiciona(Login login, HttpSession sessao, Ticket ticket) {

		if (ticket.getDescricao() == null || ticket.getDescricao().equals("")) {
			return "chamado/menu";
		}

		JdbcTicketDao dao = new JdbcTicketDao();
		dao.adiciona(sessao, ticket);

		return "chamado/chamado-adicionado";
	}

	@RequestMapping("listaTickets")
	public String lista(Model model, HttpSession sessao,Login login) {
		JdbcTicketDao dao = new JdbcTicketDao();
	     dao.achaConta((String)sessao.getAttribute("usuarioLogado"),login);
	    
	     if(login.getConta().equals("user")){
			model.addAttribute("tickets", dao.lista(sessao));
			return "chamado/lista";
	     }
	     if(login.getConta().equals("admin")){
				model.addAttribute("tickets", dao.listaAdmin(sessao));
				return "chamado/listaAdmin";
		     }
	     return null;
	     }

	@RequestMapping("removeTicket")
	public String remove(Ticket ticket) {
		JdbcTicketDao dao = new JdbcTicketDao();
		dao.remove(ticket);
		return "redirect:listaTickets";
	}

	@RequestMapping("mostraTicket")
	public String mostra(Long id, Model model) {
		JdbcTicketDao dao = new JdbcTicketDao();
		model.addAttribute("ticket", dao.buscaPorId(id));
		return "chamado/mostra";
	}

	@RequestMapping("alterarTicket")
	public String altera(Ticket ticket) {
		JdbcTicketDao dao = new JdbcTicketDao();
		dao.altera(ticket);
		return "redirect:listaTickets";
	}
	
	@RequestMapping("finalizaTicket")
	public void finaliza(Long id, HttpServletResponse response) {
		JdbcTicketDao dao = new JdbcTicketDao();
		dao.finaliza(id);
		response.setStatus(200);
	}

}
