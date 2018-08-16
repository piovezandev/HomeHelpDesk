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
	   $('#modalResposta').modal('show');
	});
</script>


</head>
<body>
   <!--modal reposta chamado-->

  <div class="modal fade " id="modalResposta" role="dialog">
    <div class="modal-dialog ">
    
      <!-- Modal content-->
      <div class="modal-content">

        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h3 class="modal-title">Fechar Ticket</h3>
        </div>

        <div class="modal-body">

<form action="testeRes"  method="POST" >

  
  <div class="form-group">
    <label for="desc">Descrição Resposta:</label>
  <textarea name="resposta" class="form-control " rows="8"></textarea>
  </div>

<br>

   <div class="modal-footer">
   <button  type="submit" class="btn btn-primary">Abrir</button>
    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
         
         </div>
  
</form>
        </div>
      </div>  
    </div>
  </div>

</body>
</html>