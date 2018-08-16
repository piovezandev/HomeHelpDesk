<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index.css">
<title>Login</title>
</head>
<body>

    <div class="imagemFundo"/>

<nav id="titulo">

<p><h1>Cadastre-se Agora e não</h1></p>
<p><h1>tera mais problemas com</h1></p>
<p><h1>sua Maquina</h1></p>

</nav>

<nav>
<br><br><br>
<p><h3>Calma, ajudaremos voce, apos cadastro voce recebera</h3></p>
<p><h3>em seu email um codigo de ativação.Com esse codigo</h3></p>
<p><h3>voce desfrutara de todos os recursos necessarios </h3></p>
<p><h3>para que não tenha mais problemas no seu dia-a-dia</h3></p>
<p><h3>Cadastre-se</h3></p>

</nav>


<form class="form-inline  " action="efetuaLogin" method="post">

  <div class="form-group ">

    <input type="text" class="form-control" name="nome" placeholder="E-mail ou Codigo">
  </div>
  <div class="form-group">
    <input type="password" class="form-control" name="senha" placeholder="senha">
  </div>
  <button type="submit" class="btn btn-primary">Logar</button>
</form>

<h2>Abra uma Conta</h2>
<section>

<form class="form-horizontal pull-right"  method="post">

  <div class="form-group ">
    <input type="text" class="form-control" id="nome" name="nome" placeholder="Nome">
  </div>
  <div class="form-group">
    <input type="text" class="form-control" name="email" placeholder="Email">
  </div>
  <div class="form-group">
    <input type="password" class="form-control" name="senha" placeholder="senha">
  </div>
    <div class="form-group">
    <input type="password" class="form-control" name="senha" placeholder="Confirmar senha">
  </div>
  <div>

<p class="form-group">Ao clicar em Abrir uma conta,</p>
<p class="form-group">você leu nossa <a href="">Política de Dados</a> </p>
  </div>

  <button type="submit" class="btn btn-primary">Criar uma Conta</button>
</form>
</section>


  <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="js/bootstrap.min.js"></script>
      
    
</body>
</html>