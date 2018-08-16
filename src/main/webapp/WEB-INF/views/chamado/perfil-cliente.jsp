<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<div class="container">
  <h3>Editar Perfil</h3><br>
  <form class="form-horizontal" action="altera" method="post"  >

    <div class="form-group">
      <label class="control-label col-sm-2" >Nome:</label>
      <div class="col-sm-2">
        <input type="text" name="nome"class="form-control" placeholder="Nome" value="${login.getNome()}">
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" >Sobrenome:</label>
      <div class="col-sm-2">
        <input type="text" class="form-control" placeholder="Sobrenome" value="${login.getSobrenome() }">
      </div>
    </div>

      <div class="form-group">
      <label class="control-label col-sm-2" >Email:</label>
      <div class="col-sm-4">
        <input type="email" class="form-control" placeholder="Insira seu novo email" value="${login.email }">
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" >Senha Antiga:</label>
      <div class="col-sm-3">
        <input type="password" class="form-control" placeholder="Insira sua Senha antiga">
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" >Senha Nova:</label>
      <div class="col-sm-3">
        <input type="password" class="form-control" placeholder="Insira sua Senha nova">
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" >Confirmar Senha:</label>
      <div class="col-sm-3">
        <input type="password" class="form-control" placeholder="Confirmar sua Senha">
      </div>
    </div><br>
<button class="btn btn-info" type="submit">Alterar</button>
</form>
    </div>

</body>
</html>