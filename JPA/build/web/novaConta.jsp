<%-- 
    Document   : novaConta
    Created on : 28/07/2017, 17:06:55
    Author     : Thiago
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"> </script>
         
        <link rel="stylesheet" type="text/css" href="estilo.css"/>
        <style>
            body{
                text-align: left;
            }
            button{
                position:relative;
                top:15pt;
                right:-170pt;
            }
            #resultado{
                font-size:10pt;
            }
           
        </style>
        <script type="text/javascript">
            function buscar(){
            
            var palavra= $("#idCPF").val();
            
            var pagina= "./pesquisarCPF"
            $.ajax({
                type: 'POST',
                dataType: 'html',
                url: pagina,
                beforeSend: function(){
                    $("#resultado").html("<img src='carregando.gif' height='50' width='100'>");
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
        <title>Criar Conta</title>
    </head>
    <body>
        <h1>Insira seus dados:</h1>
        
        <button onclick="buscar()">Buscar CPF</button>
        <form action="./cadastrarPessoa">
            CPF:<input type="text" name="idCPF" id="idCPF" required /><br/><br/>
            <div id="resultado"></div><br/>
            Nome: <input type="text" name="idNome" value="" required /><br/><br/>
            Data de Nascimento: <br/> 
            Dia:<input type="text" name="idDia" size="2" required /> Mês:<input type="text" name="idMes" size="2" required/> Ano:<input type="text" name="idAno" size="2" required/><br/><br/>
            Sexo (M/F): <input type="text" name="idSexo" value="" size="2" required />
            </select><br/><br/>
            Rua:<input type="text" name="idRua" value="" required /><br/><br/>
            Bairro:<input type="text" name="idBairro" value="" required /> Número:<input type="text" name="idNumero" value="" required /> <br/><br/>
            
            Estado: <input type="text" name="idEstado" value="" required /> <br/><br/>
            Cidade:<input type="text" name="idCidade" value="" required /><br/><br/>
            Quantidade inicial de dinheiro na conta: <input type="text" name="idDinheiro" value="" required /> <br/><br/>
            <input type="submit" value="Cadastrar">
            
        </form>
    </body>
</html>
