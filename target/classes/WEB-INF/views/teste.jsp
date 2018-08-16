<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
   <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" media="screen">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script  src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js" type="text/javascript"></script>
      <title>Login</title>
  </head>
  

  <body>
<div class="imagemFundo"/>

<br>
<form class="form-inline" align="right" action="efetuaLogin" method="post">

  <div class="form-group " >

    <input type="text" class="form-control" name="nome" required="required" placeholder="E-mail ou Codigo">
  </div>
  <div class="form-group ">
    <input type="password" class="form-control" name="senha" required="required" placeholder="senha">
  </div>
<div class="form-group">
  <button type="submit" class="btn  btn-primary">Logar</button>
  </div>
</form>



<div class="container ">
<form class="form-horizontal" action="efetuaCadastro" method="post" >

<br><br>
    <div class="form-group">
      <label class="control-label col-sm-12" ><h1 style="color:white">Abra uma conta</h1></label>
    </div>


<br>
    <div class="form-group">
      <label class="control-label col-sm-9" ></label>
      <div class="col-sm-2">
        <input type="text" name="nome" class="form-control" required="required" placeholder="Nome">
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-9" ></label>
      <div class="col-sm-2">
        <input type="text" name="sobrenome" class="form-control" required="required" placeholder="Sobrenome">
      </div>
    </div>

      <div class="form-group">
      <label class="control-label col-sm-9" ></label>
      <div class="col-sm-3">
        <input type="email" name="email" class="form-control" required="required" placeholder="Insira seu email">
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-9" ></label>
      <div class="col-sm-3">
        <input type="password" name="senha" required="required" class="form-control" placeholder="Insira sua Senha">
      </div>
    </div>

 
<div class="form-group">
      <label class="control-label col-sm-12" style="color:white" >
        <p>Ao Clicar em Criar uma Conta,<br>
        Voce leu nossa <a href="">Politica de dados</a></p>
    </label>
    </div>

 <div class="form-group">
      <label class="control-label col-sm-11" >
       <button type="submit" class="btn btn-primary">Criar uma Conta</button>
    </label>
    
    </div>
<br><br>

  </form>
  
  
</div>
</body>
  
</html>
    