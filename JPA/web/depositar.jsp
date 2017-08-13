<%-- 
    Document   : depositar
    Created on : 28/07/2017, 17:07:42
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
            
            form{
                text-align: left;
            }
            
            #sacar.ng-enter{
                transition:0.5s ease all;
                opacity:0;
                transform: translateX(-100%);
    
            }

            #sacar.ng-enter.ng-enter-active{
                opacity:1;
                transform: translateX(0);
            }

            #sacar.ng-leave{
                transition: 0.5s ease all;
                opacity:1;
                transform: translateX(0);
            }

            #sacar.ng-leave-active{
                opacity:0;
                transform: translateX(-100%);
            }
            
            button{
                position: absolute;
                top:50pt;
                left:280pt;
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
            
            
        </script>
        <title>Página de Depósito</title>
    </head>
    <body ng-controller="ControladorGeral as controlador">
        <h1>Depósito</h1>
        <button onclick="buscar()" ng-click="controlador.mostrar1=true" ng-show="controlador.mostrar1==false" >Buscar</button>
        <button ng-show="controlador.mostrar1==true" ng-click="controlador.mostrar1=false; dados=''">Nova Pesquisa </button>
        <form action="./depositar">
            <div id="dados">Digite o número do seu CPF:<input type="text" name="idCPF" id="idCPF" ng-model="dados" required /><br/><br/>
            <br/><br/>
            </div>
             <div id="resultado" ng-if="controlador.mostrar1==true"></div><br/>
        
            <div id="sacar" ng-if="controlador.mostrar1==true"><h2>Quanto você deseja depositar:</h2> <input type="text" name="valor" value="" required /><br/><br/>
                <input type="submit" value="Depositar">
            </div>
        </form>
    </body>
</html>

