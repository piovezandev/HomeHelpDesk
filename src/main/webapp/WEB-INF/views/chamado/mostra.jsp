<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" media="screen">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js" type="text/javascript"></script>

<title>Alterar Ticket</title>
<!-- js para abrir modal ao iniciar a pagina -->
<script type="text/javascript">
$(document).ready(function() {
	   $('#myModal').modal('show');
	});
</script>

<style>
 .modal-header{
background-color: #006699;
      color:white;
 }
 .nav-stacked {
	padding-top: 50px;
	background-color: #222222;
}

  </style>

<style>
 .modal-header{
background-color: #006699;
      color:white;
 }
 .nav-stacked {
	padding-top: 50px;
	background-color: #222222;
}
  </style>
</head>
<body>



  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog ">
    
      <!-- Modal content-->
      <div class="modal-content">

        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h3 class="modal-title">Alterar Ticket</h3>
        </div>

        <div class="modal-body">

<form action="alterarTicket" method="post" >

<input type="hidden" name="id" value="${ticket.id}" />
  <div class="form-group modal-sm" >
    <label for="titulo">Titulo</label>
    <input name="titulo" type="text" class="form-control" value="${ticket.titulo}"/>
  </div>

     <div class="form-group">
    <label >Prioridade</label><br>
    <select name="prioridade">
    <option>Baixa</option>
    <option>Normal</option>
    <option>Alta</option>
    </select>
  </div>
 
   <div class="form-group">
    <label for="desc">Descrição:</label>
  <textarea name="descricao" class="form-control " rows="8" >
  ${ticket.descricao}
  </textarea>
  </div>

<br>
  
   <div class="modal-footer">
    <button  type="submit" class="btn btn-info">Alterar</button>
   <a href="listaTickets"><button  type="submit" class="btn btn-default">Cancelar</button></a>   
    </div>
  
</form>
        </div>
      </div>  
    </div>
  </div>
</body>
</html>