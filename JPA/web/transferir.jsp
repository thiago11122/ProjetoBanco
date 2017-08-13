<%-- 
    Document   : transferir
    Created on : 28/07/2017, 17:07:49
    Author     : Thiago
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="Aplicacao">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="estilo.css"/>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"> </script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.5/angular.min.js"></script>
        <script src="controlador.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.6.5/angular-animate.js"></script>
        <style>
            #dados{
                text-align: left;
            }
            #resultado{
                text-align:left;
                font-size: 16pt;
                border:double;
                border-right-width: 5pt;
                border-left-width: 5pt;
                border-top-width:5pt;
                border-bottom-width: 5pt;
                background-image: url("textura.jpg");
                width:500pt;
            }
            
            #resultado2{
                text-align:left;
                font-size: 16pt;
                border:double;
                border-right-width: 5pt;
                border-left-width: 5pt;
                border-top-width:5pt;
                border-bottom-width: 5pt;
                background-image: url("textura.jpg");
                width:500pt;
                position:absolute;
                top:134pt;
                left:550pt;
            }
            
            form{
                text-align: left;
            }
            
            #transferir.ng-enter{
                transition:0.5s ease all;
                opacity:0;
                transform: translateX(-100%);
    
            }

            #transferir.ng-enter.ng-enter-active{
                opacity:1;
                transform: translateX(0);
            }

            #transferir.ng-leave{
                transition: 0.5s ease all;
                opacity:1;
                transform: translateX(0);
            }

            #transferir.ng-leave-active{
                opacity:0;
                transform: translateX(-100%);
            }
            
            button{
                position: absolute;
                top:50pt;
                left:280pt;
            }
            
            .botaoT{
                position:absolute;
                top:79pt;
                left:440pt;
            }


        @keyframes fadeIn{
            from{
                opacity:0;
            }
            to{
                opacity:1;
            }
        }
            
        </style>
        <script type="text/javascript">
            function buscar(){
            
            var palavra= $("#idCPF").val();
            
            var pagina= "./retornarDados"
            $.ajax({
                type: 'POST',
                dataType: 'html',
                url: pagina,
                beforeSend: function(){
                    $("#resultado").html("<img src='carregando.gif' height='300' width='450'>");
                },
                data:{palavra:palavra},//A variável palavra (depois do ponto e vírgula),
                                       //será enviada à página Controle com o nome de palavra
                success: function (msg) //O parâmetro desta função deve ser sempre msg!!!
                {
                  $("#resultado").html(msg); //O parâmetro neste html deve ser sempre msg!!!
                }
            });
        }
        
        function buscar2(){
            
            var palavra2= $("#idCPF2").val();
            
            var pagina2= "./retornarDados"
            $.ajax({
                type: 'POST',
                dataType: 'html',
                url: pagina2,
                beforeSend: function(){
                    $("#resultado2").html("<img src='carregando.gif' height='300' width='450'>");
                },
                data:{palavra:palavra2},//A variável palavra (depois do ponto e vírgula),
                                       //será enviada à página Controle com o nome de palavra
                success: function (msg) //O parâmetro desta função deve ser sempre msg!!!
                {
                  $("#resultado2").html(msg); //O parâmetro neste html deve ser sempre msg!!!
                }
            });
        }
            
            
        </script>
        <title>Página de Transferência</title>
    </head>
    <body ng-controller="ControladorGeral as controlador">
        <h1>Transferência</h1>
        
        <!--Botões do CPF da pessoa que fará a transferência -->
        <button onclick="buscar()" ng-click="controlador.mostrar1=true" ng-show="controlador.mostrar1==false" >Buscar</button>
        <button ng-show="controlador.mostrar1==true" ng-click="controlador.mostrar1=false; dados=''">Nova Pesquisa </button>
        
        <!--Botões do CPF da pessoa para a qual será feita a transferência -->
        <button class="botaoT" onclick="buscar2()" ng-click="controlador.mostrar2=true">Buscar</button>
        <button class="botaoT" ng-show="controlador.mostrar2==true" ng-click="controlador.mostrar2=false; dados2=''">Nova Pesquisa </button>
        
        <form action="./transferir">
            <div id="dados">Digite o número do seu CPF:<input type="text" name="idCPF" id="idCPF" ng-model="dados" required /><br/><br/>
            Digite o número do CPF para o qual será feita a transferência:<input type="text" name="idCPF2" id="idCPF2" ng-model="dados2" required /> <br/><br/>
            <br/><br/>
            </div>
            <!--Divisória que mostra dados da pessoa que fará a transferência -->
             <div id="resultado" ng-if="controlador.mostrar1==true"></div><br/>
            
             <!--Divisória que mostra dados da pessoa para a qual a transferência será feita--> 
             <div id="resultado2" ng-if="controlador.mostrar2==true"></div>
            
             <div id="transferir" ng-if="controlador.mostrar2==true"><h2>Quanto você deseja transferir:</h2> <input type="text" name="valor" value="" required /><br/><br/>
                <input type="submit" value="Transferir">
            </div>
        </form>
    </body>
</html>


