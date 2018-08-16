<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" media="screen">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script  src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(window).load(function() {
      $('#myModal').modal('show');
    });
 </script>
 
 <style>
 .modal-header{
 background-color: #F00000;
 color:white;
 }
 </style>
 
</head>
<body>

 
 
<div id="myModal" class="modal fade">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
       <div class="modal-header">
        <a href="Login"><button type="button" class="close" data-dismiss="modal" ><span aria-hidden="true">&times;</span></button></a>
        <h4 class="modal-title">Erro!</h4>
      </div>
      <div class="modal-body">
        <p>Usuario ou senha Inválidos</p>
      </div>
      <div class="modal-footer">
       <a href="Login"><button type="button"  class="btn btn-info">Tentar Novamente</button></a> 
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->


</body>
</html>