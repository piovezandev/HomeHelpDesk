<%@page import="br.com.cliente.DAO.Ticket"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" media="screen">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script  src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js" type="text/javascript"></script>

<script type="text/javascript">

var websocket = new WebSocket("ws://localhost:8085/HomeHelpDesk/Chat");
websocket.onmessage = function processMessage(message){
	var jsonData = JSON.parse(message.data);
	if(jsonData.message != null)
		messagesTextArea.value +=jsonData.message+"\n";	
}
function sendMessage(){
	websocket.send(messageText.value);
	messageText.value = "";
}
	
</script>
<script type="text/javascript">

$(document).ready(function(){
	$("section").toggle();
    $("button").click(function(){
        $("section").toggle();
    });
});

</script>


<title>Home Help Desk</title>



</head>


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

  <body >


  <nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">

 <button type="button" class="navbar-toggle collapsed" id="teste" data-toggle="collapse" data-target="#nav-colapse" >
   <span class="icon-bar"></span>
   <span class="icon-bar"></span>
   <span class="icon-bar"></span>
 </button>
      <a class="navbar-brand" href="home">Home Help Desk</a>
    </div>
    <div class="collapse navbar-collapse" id="nav-colapse">
      <ul class="nav navbar-nav">

      </ul>
          	
      <ul class="nav navbar-nav navbar-right">
      <li><a>Bem Vindo,${login.getNome()} &nbsp;&nbsp;</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown"> 
          <span class="glyphicon glyphicon-cog "></span></a>

          <ul class="dropdown-menu">
            <li ><a data-toggle="tab" href="#perfil">Perfil<span class="glyphicon glyphicon-user pull-right">
            </span></a></li>
            <li><a href="#">Tickets&nbsp;&nbsp;<span class="badge">3</span><span class="glyphicon glyphicon-list-alt pull-right"></span></a></li>
            <li><a href="logout">Sair<span class="glyphicon glyphicon-log-out pull-right"></span></a></li>
          </ul>
        </li>
      </ul> 
    </div>
  </div>
</nav>

   <div class="row col-sm-3">
<ul class="nav nav-pills nav-stacked">

   <li class="active"><a><h4>Painel de Ações<span class="glyphicon glyphicon-home pull-right"></span></h4></a>
   </li>
   
   <li> <a data-toggle="collapse"  href="#link1"><h5>Como Começar<span class="glyphicon glyphicon-facetime-video pull-right ">
   </span></h5></a>
        <div id="link1" class="collapse">
       <ul class="nav nav-list">
          <li><a href="#">Tutorial</a></li>
       </ul>
        </div>
   </li>
 
          
   <li > <a data-toggle="collapse"  href="#link2"><h5>Solicitações<span class="glyphicon glyphicon-briefcase pull-right"></span></h5></a>
        <div id="link2" class="collapse">
       <ul class="nav nav-list">
         <li><a href="listaTickets">Chamados para atender</a></li>
       </ul>
        </div>
   </li>

   <li > <a data-toggle="collapse"  href="#link3"><h5>Graficos<span class="glyphicon glyphicon glyphicon-dashboard pull-right"></span></h5></a>
        <div id="link3" class="collapse">
       <ul class="nav nav-list">
        
          <li><a href="3">Problemas Solucionados</a></li>
          <li><a href="3">Problemas não Solucionados</a></li>
       </ul>
        </div>
   </li>
</ul>
</div>

<div class="container">
 <br>
<br>
<br>
<button class="btn btn-info" style="position:absolute;left:80%;bottom:5%;width:18%;">Chat</button>


    <br/>
<div  style="position:absolute;left:78%;bottom:10%;">
        <div class="col-lg-4 text-center fixed" >

         <div class="panel panel-primary">
            <div class="panel-heading">
                <h4>Chat-HelpDesk</h4>
            </div>
           <div class="panel-body  text-left ">



           </div>
            <textarea id="messagesTextArea" readonly="readonly" name="descricao" class="form-control " rows="5" ></textarea>
              
          <div class="panel-footer">
            <input type="text" id="messageText" size="20"/><br> 
<br><button class="btn btn-sm btn-success pull-right" onclick="sendMessage();">Enviar</button>
 <br><br>
          </div>
         </div>
</div></div>

<div class="row"> 
<div class="col-md-7" >

<div class="container-fluid">
  
  <div class="navbar">
  <ul class="nav nav-tabs ">
    <li class="active"><a data-toggle="tab" href="#home">Menu</a></li>
  </ul>

  <div class="tab-content">

    <div id="home" class="tab-pane fade in active">
      <hr>
      <div class="well">Grafico Simples</div>
              
              
              <div class="panel panel-default">
                  <div class="panel-heading"><h4>Status das Soliciações</h4></div>
                  <div class="panel-body">
                    
                    <div class="progress">
                      <div class="progress-bar progress-bar-success" style="width: 100%">
                        
                      </div>
                    </div>
                    <small>Abertura de Chamados</small>
                    <div class="progress">
                      <div class="progress-bar progress-bar-info"  style="width: 20%">
                        
                      </div>
                    </div>
                    <small>Chamados fora do prazo</small>
                    <div class="progress">
                      <div class="progress-bar progress-bar-danger" style="width: 80%">
                       
                      </div>
                    </div>

                  </div><!--/panel-body-->
              </div><!--/panel-->               
    </div>

 <div id="perfil" class="tab-pane fade">
     <jsp:include page="perfil-cliente.jsp"></jsp:include>
    </div>
  </div>
</div>
</div>
</div>
  </div>  





 
<!--
  <h2>Abrir Chamado</h2>
 
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">+ Abrir</button>/*
-->
  <!-- Modal -->
  <div class="modal fade" id="myModal" >
    <div class="modal-dialog ">
    
      <!-- Modal content-->
      <div class="modal-content">

        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h3 class="modal-title">Abrir Chamado</h3>
        </div>

        <div class="modal-body">

<form action="novoTicket" method="post" >

  <div class="form-group modal-sm" >
    <label for="titulo">Titulo</label>
    <input name="titulo" type="text" class="form-control" id="titulo">
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
  <textarea name="descricao" class="form-control " rows="8" ></textarea>
  </div>

<br>
  <div class="form-group modal-sm" >
    <label for="titulo">Anexar Arquivo</label>
    <input type="file" class="form-control" id="anexo">
  </div>
  
   <div class="modal-footer">
         <button  type="submit" class="btn btn-primary">Abrir</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
  
</form>
        </div>
      </div>  
    </div>
  </div>
</div>
</body>
  

</body>
</html>