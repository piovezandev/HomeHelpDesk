<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" media="screen">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script  src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js" type="text/javascript"></script>

<title>Lista de Chamados</title>
</head>
	<body>
		<a href="home">Voltar</a>
		<br />
		<br />
		
  <div class="row col-md-10  col-md-offset-1 ">

    <table class="table table-hover">
      <thead>
       
       <th>Id </th>
                <th>Titulo</th>
                <th> Descrição        </th>
                <th> Finalizado? </th>
                <th> Prioridade</th>
                <th>Resposta</th>
            <th >Opção</th>
      </thead>
      <tbody>
         <c:forEach items="${tickets}" var="ticket">

        <tr>
                <td>${ticket.id} </td>
          <td>${ticket.titulo} </td>
          <td>${ticket.descricao} </td>
          <c:if test="${ticket.finalizado eq false }">
           <td>Pendente</td>  
          </c:if>
          <c:if test="${ticket.finalizado eq true }">
           <td>Finalizado</td>
          </c:if>
       <td>${ticket.prioridade} </td>
          <td>${ticket.resposta} </td>
               <td>
              <a href="mostraTicket?id=${ticket.id}"><span class="glyphicon glyphicon-pencil"></span></a>
             &nbsp;&nbsp; <a href="removeTicket?id=${ticket.id}"role="button" data-toggle="modal"><span class="glyphicon glyphicon-remove"></span></a>
          </td>
            </tr>
           </c:forEach>

      </tbody>
    </table>


</div>
 <div id="teste" class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
       <div class="modal-header">
        <a href="Login"><button type="button" class="close" data-dismiss="modal" ><span aria-hidden="true">&times;</span></button></a>
        <h4 class="modal-title">Remover Chamado</h4>
      </div>
      <div class="modal-body">
        <p>Deseja realmente remover esse chamado?</p>
      </div>
      <div class="modal-footer">
        <button onclick="location.href='removeTicket?id=${ticket.id}';" class="btn btn-danger" data-dismiss="modal">Remover</button>
        <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
 
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->


	</body>
</html>