<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sabio06.aspx.cs" Inherits="Sabio._1.sabio06" %>
<%@ Import Namespace="System.Data.Odbc" %>

<!DOCTYPE html>

<script language="JScript" src="scripts/SimplesC.js"></script>
<html><head><title>Sabichao</title><style>@import url(images/coUC.css);</style></head>
<body onLoad="if(ieBlink){setInterval('doBlink()',450)}" bgColor="#FFFFFF" background="../mundi.gif" leftMargin="0" topMargin="0" marginwidth="0" marginheight="0">
<TABLE border="0" cellPadding="0" cellSpacing="0" width="100%">
	<tbody>
	<tr align="center" valign="top">
		<td width="130px">
			<!-- #include file = "sabio01.inc" -->
		</td>
		<td width="40px">&nbsp;</td>
		<td><br><br>
			<div width="100%" height="40px" style="background-color:#0f4baf; text-align:left; width:auto; height:40px;">
                <img height="40" src="images/supdate03.gif" width="27" style="float:left" /><span class="textvalignmiddle" style="font-size:large; font-family:Verdana, Arial, Helvetica, sans-serif; color:#ffffff"><b><i>O QUE É O SABICHÃO?</i></b></span><img height="40" src="images/supdate02.gif" width="27" style="float:right" />
            </div>
<p>
			<table border="0" cellpadding="0" cellspacing="0" width="90%" style="font-family: Arial; font-size:9pt">
				<tr>
					<td>
			<p align="justify">É um Site-Jogo interativo com característica educacional e de entretenimento. 
			O Jogo possui Salas de Perguntas tipo QUIZ sobre assuntos variados. A cada dia o Internauta 
			pode responder até 5(cinco) perguntas por Sala, e a cada Pergunta respondida corretamente é adicionado 
			20 PONTOS a Pontuação Total do Jogador. Depois os PONTOS acumulados, podem ser investidos em varios 
			prêmios disponibilizados no Site(breve). Participe e teste seus Conhecimentos -> É <b><blink>Totalmente Gratuito</blink></b> 
			e voce ainda corre o risco de ganhar varios PRÊMIOS!</p>
					</td>
				</tr>
				<tr>
					<td>
                        <form id="logonForm" runat="server" action="Sabio10.aspx" method="get" onsubmit="return verifica()">
                            <br />
			                <table cellspacing="1" cellpadding="2" width="100%" style="font-family: Arial; font-size:9pt;color:#000080">
			                	<tr>
			                		<td align="right"><b>Seu Log-in</b>:</td>
			                		<td>
                                        <asp:TextBox ID="userlogon" name="userlogon" runat="server" size="30" maxlength="30" />&nbsp;<span style="font-size:8pt"> (E-mail Completo)</span></td>
			                	</tr>
			                	<tr>
			                		<td align="right"><b>Uma Senha</b>:</td>
			                		<td>
                                        <asp:TextBox ID="userpassw" name="userpassw" runat="server" size="12" maxlength="12" TextMode="Password" />&nbsp;<span style="font-size:8pt"> (Mínimo 6 Caracteres)</span></td>
			                	</tr>
			                	<tr valign="bottom">
			                		<td colspan="2" align="right">
                                        <%--<input width="115px" height="25px" type="submit" value="Entre (é gratis)" id="lggonAgn" name="lggonAgn" style="border:0;background-color:rgb(255,255,255);background-image:url('images/bt3.gif');width:115px;height:25px" />
                                        <asp:ImageButton ID="ImageButton1" runat="server" Height="25px" ImageUrl="images/bt3-Entre.gif" OnClick="ImageButton1_Click" Width="115px" AlternateText="Entre (É Gratis)" ImageAlign="Right" />--%>
                                        <div style="width:125px; height:25px;text-align:center; background-image: url('images/bt3.gif'); background-repeat: no-repeat; vertical-align:bottom; cursor: pointer; line-height: 25px;"><asp:LinkButton ID="LinkButton1" runat="server" Text="Entre (é grátis) &nbsp;" Height="25px" Width="125px" /></div>
			                		</td>
			                	</tr>
			                </table>
                        </form>
					</td>
				</tr>
                <tr>
					<td>
					<p align="justify"><img src="images/ball3.gif" /> Esta é uma versão alternativa das páginas do Sabichão.
					Para alternar entre as versões disponíveis, clique a qualquer tempo no logotipo superior
					direito (<b>olhos</b>).</p><br />
					</td>
				</tr>
			</table>
            <div width="100%" height="40px" style="background-color:#0f4baf; text-align:left; width:auto; height:40px;">
                <img height="40" src="images/supdate03.gif" width="27" style="float:left" /><span class="textvalignmiddle" style="font-size:large; font-family:Verdana, Arial, Helvetica, sans-serif; color:#ffffff"><b><i>COMO ENTRAR NO JOGO</i></b></span><img height="40" src="images/supdate02.gif" width="27" style="float:right" />
            </div>
<p>
 			<table border="0" cellpadding="0" cellspacing="0" width="90%" style="font-family: Arial; font-size:9pt">
				<tr>
					<td>
			<p align="justify">Nos campos do formulário acima, digite seu Log-in (<b><font color=red>E-MAIL completo</font></b>) e uma
			SENHA exclusiva para este Site-Jogo. Pronto você automaticamente já estará registrado no Sabichão, e entrara
			no ambiente do jogo. Mas lembre-se, para concorrer aos prêmios quando estes estiverem disponíveis você deverá completar seus dados
			cadastrais, ou atualiza-los. Eles podem ser alterados (exceto e-mail) a qualquer momento a partir
			da página interna [Menu] com um clique simples em [Alterar Cadastro].</p>
					</td>
				</tr>
			</table>
<p>
            <div width="100%" height="40px" style="background-color:#0f4baf; text-align:left; width:auto; height:40px;">
                <img height="40" src="images/supdate03.gif" width="27" style="float:left" /><span class="textvalignmiddle" style="font-size:large; font-family:Verdana, Arial, Helvetica, sans-serif; color:#ffffff"><b><i>TURMA DO FUNDÃO</i></b></span><img height="40" src="images/supdate02.gif" width="27" style="float:right" />
            </div>
<p>
			<table border="0" cellpadding="0" cellspacing="0" width="90%" style="font-family: Arial; font-size:9pt">
				<tr>
					<td>
			<p  align="justify">Enturme-se com sua Turma! (<b><font color=red>Bate papo com os Sabios-Amigos</font></b>). Nas salas do Sabichão, estará
			disponível chat para compartilhamento de idéias e assuntos diversos, podendo o usuário selecionar para este entrosamento até 5 
			usuarios que podem ser Locais (da sua cidade ou bairro), Regional (do seu estado) ou Nacional em função dos seus dados cadastrais. Será 
			possível também a seleção de amigos por outros critérios de escolha, tais como idade ou interesses comuns, a serem implementados.</p>
					</td>
				</tr>
			</table>
<p>
			<table border="0" cellpadding="0" cellspacing="0" width="90%" style="font-family: Arial; font-size: 9pt; color:#770000">
				<tr>
					<td>
			<p align="justify">
			<b><blink>Nosso Compromisso</blink></b>: Através de nosso sistema você receberá somente os e-mails de: (1)Confirmação/Alteração
			de Cadastro; (2)Os eventuais para Lembrar Senha; e (3)Os que serão marcados por você mesmo em sua
			Agenda-Boletins.</p>
					</td>
				</tr>
			</table>
		</td>
		<td width="40px">&nbsp;</td>
		<td width="130px">
			<TABLE border="0" cellPadding="0" cellSpacing="0" width="120px">
				<tbody>
				<tr><td background="images/menu11.gif" height="70" width="120" /></tr>
				<tr><td background="images/menu13.gif" height="10" width="120" /></tr>
				<tr><td background="images/menu12.gif" height="10" width="120" /></tr>
				<tr><td background="images/menu14.gif">
					<TABLE border="0" cellPadding="5" cellSpacing="0" width="120px">
						<tbody>
							<tr><td>
							<P align="left">
							<b><font face="Verdana" size="1"><font color="#ff3333">NOSSAS ENQUETES.</font></b>
							<font color="#000080"><br>-Fornece subsídios<br>-Interação total</font>
							<b><font color="#ff3333"><br><br>VEJA ESTA:</font></font></b>
							</td></tr>
						</tbody>
					</TABLE>
<%
    string connString = System.Configuration.ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
    using (OdbcConnection Conexao = new OdbcConnection(connString))
    {
        int tot = 0;
        int refC = 0;
        string queryString = "SELECT MAX(ENQ_Cod) AS max_Cod FROM Enquetes";
        OdbcCommand command = new OdbcCommand(queryString, Conexao);
        // Open the connection in a try/catch block.
        try
        {
            Conexao.Open();
            OdbcDataReader reader = command.ExecuteReader();
            reader.Read();
                refC = Convert.ToInt16(reader["max_Cod"].ToString());
                Random rnd = new Random();
                refC = rnd.Next(0, refC);
            reader.Close();
%>
					<script language="JavaScript">
<!--//
					function Vote(obj){
						var URL = 'sabio02.aspx?ID=<%=refC%>&Voto=' + obj
						location.href = URL
					}
//-->
					</script>
<%
            queryString = "SELECT * FROM Enquetes WHERE ENQ_Cod = " + refC;
            command = new OdbcCommand(queryString, Conexao);
            OdbcDataReader Clicks = command.ExecuteReader();
            Clicks.Read();
%>
					<table border="0" cellPadding="3" cellSpacing="1" width="120px" style="font-size:7pt">
						<tbody>
							<tr>
                                <td colspan="2" style="font-size:8pt"><%=Clicks["ENQ_Cod"]%>. <b><%=Clicks["ENQ_Desc"]%></b></td>
							</tr>
							<tr>
                                <td><%tot = Convert.ToInt16(Math.Round((Convert.ToDecimal(Clicks["ENQ_Aa"].ToString()) / Convert.ToDecimal(Clicks["ENQ_Total"].ToString())) * 100));%><input type="radio" onClick="Vote('ENQ_Aa')" /></td>
								<td><%=tot%>% <%=Clicks["ENQ_A"]%></td>
							</tr>
							<tr>
                                <td><%tot = Convert.ToInt16(Math.Round((Convert.ToDecimal(Clicks["ENQ_Bb"].ToString()) / Convert.ToDecimal(Clicks["ENQ_Total"].ToString())) * 100));%><input type="radio" onClick="Vote('ENQ_Bb')" /></td>
								<td><%=tot%>% <%=Clicks["ENQ_B"]%></td>
							</tr>
							<tr>
                                <td><%tot = Convert.ToInt16(Math.Round((Convert.ToDecimal(Clicks["ENQ_Cc"].ToString()) / Convert.ToDecimal(Clicks["ENQ_Total"].ToString())) * 100));%><input type="radio" onClick="Vote('ENQ_Cc')" /></td>
								<td><%=tot%>% <%=Clicks["ENQ_C"]%></td>
							</tr>
							<tr>
                                <td><%tot = Convert.ToInt16(Math.Round((Convert.ToDecimal(Clicks["ENQ_Dd"].ToString()) / Convert.ToDecimal(Clicks["ENQ_Total"].ToString())) * 100));%><input type="radio" onClick="Vote('ENQ_Dd')" /></td>
								<td><%=tot%>% <%=Clicks["ENQ_D"]%></td>
							</tr>
							<tr>
                                <td colspan="2" style="font-size:8pt" align="center"><br /><a href="Sabio16.aspx"><b>Ver Todas</b></a></td>
							</tr>
						</tbody>
					</table>
<%
            Clicks.Close();
            Conexao.Close();
        }
        catch (Exception ex)
        {
            var perg1 = ex.Message;
        }
        Conexao.Dispose();
    }
%>
				</td></tr>
				<tr><td background="images/menu16.gif" height="36" width="120" /></tr>
				<tr align="center"><td><br><span style="font-size:7pt">Copyright &copy;2000<br>by Borg.</span></td></tr>
				</tbody>
			</TABLE>
		</td>
	</tr>
	</tbody>
</TABLE>
<p><script language="JavaScript">
<!--
	top.frames.super1.USerID.innerText = "Bem-Vindo :)"
	top.frames.super1.Ponto.innerText = "PRÊMIOS"
	top.frames.super1.LogOK.style="visibility:hidden"
//-->
</script></p>
</body></html>