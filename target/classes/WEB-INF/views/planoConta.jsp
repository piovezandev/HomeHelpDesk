<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" media="screen">
  <script  src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js" type="text/javascript"></script>
   
<title>Plano Conta</title>
</head>
<body>
<div class="imagemFundo"/>
<div class="container ">
    <h1 style="color:white;">Escolha um de nossos Planos!</h1>
    <br/><br/><br/>
    
    <!-- Plans -->
    <section class="plans">
        <div class="container">
            <div class="row">
              
              <form action="escolherPlano" method="POST">
                <!-- plano 1 -->
                <div class="col-md-4 text-center plano1">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3>R$0</h3>
                            <h5>2 Tickets</h5>
                        </div>
                        <div class="panel-body text-center">
                            <p><strong>Plano Basico </strong></p>
                        </div>
                        <ul class="list-group text-center">
                            <li class="list-group-item">2 Chamados</li>
                           <li class="list-group-item">Chat Online</li>
                            <li class="list-group-item">Graficos</li>
                             <li class="list-group-item">Controle de Chamados</li>

                        </ul>
                        <div class="panel-footer">
                            <button type="submit "class="btn btn-lg btn-primary">Contratar</button>
                        </div>
                    </div>
                </div>
                <!-- /plano1 -->
                </form>

              <form action="efetuaLogin" method="POST">
                <!-- plano2 -->
                <div class="col-md-4 text-center">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <h3>R$100</h3><br>
                            <h5>50 Tickets</h5>
                        </div>
                        <div class="panel-body text-center">
                            <p><strong>Plano Avançado</strong></p>
                        </div>
                        <ul class="list-group text-center">
                            <li class="list-group-item">50 Chamados</li>
                            <li class="list-group-item">Chat Online</li>
                            <li class="list-group-item">Graficos</li>
                             <li class="list-group-item">Controle de Chamados</li>

                        </ul>
                        <div class="panel-footer">
                          <button type="submit "class="btn btn-lg btn-success">Contratar</button>
                        </div>
                    </div>
                </div>
                <!-- /plano2 -->
               </form>

               <form action="efetuaLogin" method="POST">
                <!-- plano3 -->
                <div class="col-md-4 text-center plano3">
                    <div class="panel panel-danger">
                        <div class="panel-heading">

                            <h3>R$50</h3>
                            <h5>25 Tickets</h5>
                        </div>
                        <div class="panel-body text-center">
                            <p><strong>Plano Medio</strong></p>
                        </div>
                        <ul class="list-group text-center">
                            <li class="list-group-item">25 Chamados</li>
                          <li class="list-group-item">Chat Online</li>
                            <li class="list-group-item">Graficos</li>
                             <li class="list-group-item">Controle de Chamados</li>
                          
                        </ul>
                        <div class="panel-footer">
                           <button type="submit "class="btn btn-lg btn-danger">Contratar</button>
                        </div>
                    </div>
                </div>
                <!-- /plano3 -->
               </form>
            </div>
        </div>
    </section>
    <!-- /Plans -->
</div>


</body>
</html>