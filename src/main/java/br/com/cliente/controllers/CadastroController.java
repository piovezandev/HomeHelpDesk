package br.com.cliente.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import br.com.cliente.DAO.JdbcCadastroDao;
import br.com.cliente.DAO.JdbcLoginDao;
import br.com.cliente.DAO.Login;

@Controller
public class CadastroController {

	@RequestMapping("escolherPlano")
	public String planoCadastro(Login login,HttpSession sessao) {
			
			if (new JdbcLoginDao().verificaUser(login)) {
				sessao.setAttribute("usuarioLogado", login.getNome());
			}
			
		return "chamado/menu";
	}
	
	@RequestMapping(value = "efetuaCadastro", method = RequestMethod.POST)
	public String cadastra(Login login) {
		JdbcCadastroDao dao = new JdbcCadastroDao();
		dao.cadastra(login);
		return "planoConta";
	}
	
	

	@RequestMapping(value = "altera", method = RequestMethod.POST)
	public String alterar(Login login) {
		
		JdbcCadastroDao dao = new JdbcCadastroDao();
		dao.altera(login);

		return "chamado/menu";
	}

}
