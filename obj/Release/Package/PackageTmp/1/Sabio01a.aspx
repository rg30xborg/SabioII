<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sabio01a.aspx.cs" Inherits="Sabio._1.Sabio01a" %>
<%@ Import Namespace="System.Data.Odbc" %>

<!DOCTYPE html>
<style>
    
</style>
<Script Language="JScript" src="scripts/SimplesC.js"></Script>
<html xmlns="http://www.w3.org/1999/xhtml"><head runat="server">
    <%--<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>--%>
    <title>Sabichao</title><style>@import url(images/coUC.css);</style>
</head>
<body onLoad="if(ieBlink){setInterval('doBlink()',450)}" bgColor="#FFFFFF" leftMargin="0" topMargin="0" marginwidth="0" marginheight="0">
<center>
<table width="96%" cellppading="0" cellspacing="0" border="0">
    <tr>
        <td>
            <center>
            <br /><img src="images/ClaudiaAoNote650x150.png" title="RG 3.0 Sabichão Web" width="100%" />
            <br /><img src="http://www1.locaweb.com.br/scripts/count.exe?df=aggora_2.dat&ft=0&frgb=00FF00&srgb=00FF00&prgb=3300FF&tr=T&md=6&pad=T&comma=F&dd=D"><br />
            <div height="40px" style="background-color:#0f4baf; text-align:left; width:auto; height:40px;">
                <img height="40" src="images/supdate03.gif" width="27" style="float:left" /><span class="textvalignmiddle" style="font-size:large; font-family:Verdana, Arial, Helvetica, sans-serif; color:#ffffff"><b><i>O QUE É O SABICHÃO?</i></b></span><img height="40" src="images/supdate02.gif" width="27" style="float:right" />
            </div>

			<table width="90%" border="0" cellpadding="0" cellspacing="0" style="font-family: Arial; font-size:9pt">
				<tr>
					<td>
			<p align="justify">É um Site-Jogo interativo com característica educacional e de entretenimento. 
			O Jogo possui Salas de Perguntas tipo QUIZ sobre assuntos variados. A cada dia o Internauta 
			pode responder a até 5(cinco) perguntas por Sala, e a cada Pergunta respondida corretamente é adicionado 
			20 PONTOS a Pontuação do Jogador. Depois os PONTOS acumulados, podem ser investidos em  
			prêmios disponibilizados no Site. Participe e teste seus Conhecimentos -> É 
            <b><blink>Totalmente Gratuito</blink></b> e voce corre o risco de ganhar PRÊMIOS!</p>
					</td>
				</tr>
<% 	if (usr == "1" || pas == "1" || lgg == "1") { %>
				<tr>
		            <td style="color: red">
<% 		if (lgg == "1") { %>
			<br /><b>E-mail do usuário inválido. Prencha novamente seus dados !</b>
<%
        }
        if (pas == "1") { %>
			<br /><b>Senha de Acesso inválida ou menor que 6 digitos! Prencha novamente sua senha !</b>
<%
        }
        if (usr == "1") { %>
			<br /><b>Não é possível cadastrar Novo Usuario com e-mail de Usuario Existente!</b>
<%
        }
        if (usr == "1" || pas == "1") { %>
			<br />Clique <a href="Sabio05.aspx?email=<%=Session["logmail"]%>" style="hover:none">Lembrar: Senha de Acesso</a>
<% 		} %>
		            </td>
				</tr>
<%
    }
%>
				<tr>
					<td>
                        <form id="logonForm" runat="server" method="GET" onsubmit="return verifica()">   <%--action="Sabio10.aspx"--%>
			                <table cellspacing="1" cellpadding="2" width="100%" style="font-size:12pt">
                                <tr>
                                    <td rowspan="6">
                                        <img src="images/video512x512.png" width="90" height="90" onclick='AbreJan("01.mp4",650,400)' title="Video Tutorial" style="cursor:pointer; vertical-align:middle" />
                                    </td>
                                </tr>
			                	<tr>
			                		<td align="right"><img src="images/mao.gif" /><b>Seu Log-in</b>:</td>
			                		<td>
                                        <asp:TextBox ID="userlogon" name="userlogon" runat="server" size="30" maxlength="30" />&nbsp; (email completo)</td>
			                	</tr>
			                	<tr>
			                		<td align="right"><b>Uma Senha</b>:</td>
			                		<td>
                                        <asp:TextBox ID="userpassw" name="userpassw" runat="server" size="12" maxlength="12" TextMode="Password" />&nbsp; (mínimo 6 caracteres)</td>
			                	</tr>
			                	<tr valign="bottom">
			                		<td colspan="2" align="right">
                                        <div style="width:125px; height:25px;text-align:center; background-image: url('images/bt3.gif'); background-repeat: no-repeat; vertical-align:bottom; cursor: pointer; line-height: 25px;"><asp:LinkButton ID="LinkButton1" runat="server" Text="Entre (é grátis) &nbsp;" Height="25px" Width="125px" OnClick="LinkButton1_Click" /></div>
			                		</td>
			                	</tr>
			                </table>
                        </form>
					</td>
				</tr>
				<tr>
					<td>
					<p align="justify"><img src="images/ball3.gif" /> Estão disponíveis Premios iniciais para que voce
                        possa apostar e correr o risco de ganhar. Confira uma amostra dos disponibilizados durante a 
                        fase de Implantação do Site Sabichão Web clicando em: <a href="Sabio20a.aspx">PRÊMIOS DO SABICHAO</a></p><br />
					</td>
				</tr>
			</table>
            <div height="40px" style="background-color:#0f4baf; text-align:left; width:auto; height:40px;">
                <img height="40" src="images/supdate03.gif" width="27" style="float:left" /><span class="textvalignmiddle" style="font-size:large; font-family:Verdana, Arial, Helvetica, sans-serif; color:#ffffff"><b><i>COMO ENTRAR NO JOGO</i></b></span><img height="40" src="images/supdate02.gif" width="27" style="float:right" />
            </div>

 			<table width="90%" border="0" cellpadding="0" cellspacing="0" style="font-family: Arial; font-size:9pt">
				<tr>
					<td>
			<p align="justify">Nos campos do formulário acima, digite seu Log-in (<b><font color=red>E-MAIL completo</font></b>) e uma
			SENHA exclusiva para este Site-Jogo. Pronto você automaticamente já estará registrado no Sabichão, e entrara
			no ambiente do jogo. Mas lembre-se, para concorrer aos prêmios quando estes estiverem disponíveis você deverá completar seus dados
			cadastrais, ou atualiza-los. Eles podem ser alterados (exceto e-mail) a qualquer momento a partir
			da página interna [Home] com um clique simples em [Alterar Cadastro].</p>
            <p align="right">Quero uma amostra <a href="sabio23.aspx">Full-Demo</a> antes de Cadastrar-me.</p>
					</td>
				</tr>
			</table>

            <div height="40px" style="background-color:#0f4baf; text-align:left; width:auto; height:40px;">
                <img height="40" src="images/supdate03.gif" width="27" style="float:left" /><span class="textvalignmiddle" style="font-size:large; font-family:Verdana, Arial, Helvetica, sans-serif; color:#ffffff"><b><i>TURMA DO FUNDÃO</i></b></span><img height="40" src="images/supdate02.gif" width="27" style="float:right" />
            </div>

			<table width="90%" border="0" cellpadding="0" cellspacing="0" style="font-family: Arial; font-size:9pt">
				<tr>
					<td>
			<p  align="justify">Enturme-se com sua Turma! (<b><font color=red>Bate papo com os Sabios-Amigos</font></b>). Nas salas do Sabichão, estará
			disponível chat para compartilhamento de idéias e assuntos diversos, podendo o usuário selecionar para este entrosamento até 5 
			usuarios que podem ser Locais (da sua cidade ou bairro), Regional (do seu estado) ou Nacional em função dos seus dados cadastrais. Será 
			possível também a seleção de amigos por outros critérios de escolha, tais como idade ou interesses comuns, a serem implementados.</p>
					</td>
				</tr>
			</table>

			<table width="90%" border="0" cellpadding="0" cellspacing="0" style="font-family: Arial; font-size:9pt">
				<tr>
					<td>
			            <p align="justify" style="color:#770000">
			            <b><blink>Nosso Compromisso</blink></b>: Através de nosso sistema você receberá somente os e-mails de: (1)Confirmação/Alteração
			            de Cadastro; (2)Os eventuais para Lembrar Senha; e (3)Os que serão marcados por você mesmo em sua
			            Agenda-Boletins.</p>
                        <br />
                        <p align="center"><small>VERSÃO CELULAR EM DESENVOLVIMENTO - Experimente a VERSÃO DESKTOP para uma melhor experiência no Site.</small></p>
                        <br />
                    </td>
				</tr>
			</table>
            </center>
		</td>
	</tr>
</table>
</center>
<div ID=LogOK style="visibility:hidden; position:absolute;top:20px;left:25px;color:darkgreen;cursor:pointer; font-family: Arial; font-size:20pt" 
    onClick='javascript:alert("RG 3.0 Informação (º_º) - Está valendo:\n\nPrimeiros mil cadastrados no site, " + 
    "que frequentem as Salas por mais de um dia, e estão com seus dados cadastrais atualizados no sistema, " +
    "concorrem a Mil Reais em cache.\n\nComo vai ser isto: você se cadastra e tem um numero [ver seu número em " +
    "Hanking Internamente no Site [numero ao final do seu nome]] esse número será sua centena do 1o Prêmio da " +
    "Extração da Loteria Federal de 18/12/2021 - Simples assim: cadastre-se; participe; e concorra.");'><span align="justify"><b>Está valendo:</b><br />Primeiros mil usuários cadastrados no site,<br />que frequentem as Salas por mais de um dia,<br />concorrem a R$ 1.000,00 em cache em 18/12/2021.</span></div>
</body></html>