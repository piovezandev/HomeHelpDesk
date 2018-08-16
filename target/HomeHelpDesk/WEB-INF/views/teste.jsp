<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Login</title>

    <!-- Bootstrap -->
    
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" media="screen">
  </head>
  <body>
   <div class="imagemFundo"/>
 
<br>
<form class="form-inline pull-right " action="efetuaLogin" method="post">

  <div class="form-group ">

    <input type="text" class="form-control" name="nome" placeholder="E-mail ou Codigo">
  </div>
  <div class="form-group">
    <input type="password" class="form-control" name="senha" placeholder="senha">
  </div>
  <button type="submit" class="btn btn-primary">Logar</button>
</form>


 

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>
    