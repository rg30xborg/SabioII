<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sabio18.aspx.cs" Inherits="Sabio._1.Sabio18" %>
<%@ Import Namespace="System.Data.Odbc" %>

<!DOCTYPE html>

<script Language="JScript" src="scripts/SimplesC.js"></script>
<html xmlns="http://www.w3.org/1999/xhtml"><head runat="server">
    <%--<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>--%>
    <title>Sabichao</title><style>@import url(images/coUC.css);</style>
</head>
<body bgColor="#FFFFFF" background="../mundi.gif" leftMargin="0" topMargin="0" marginwidth="0" marginheight="0">
<table border="0" cellPadding="0" cellSpacing="0" width="100%" style="border-collapse:collapse; border-spacing:0">
	<TBODY>
	<tr align="center" valign="top">
		<td width="130px">
			<!-- #include file = "sabio01.inc" -->
		</td>
		<td width="40px">&nbsp;</td>
		<td>
<p align="left" style="font-size: 10pt">
	Exemplo de Sala: <font color="#0588C0"><b><%=perg0%></b></font>
	<span style="font-size: 9pt"><br />
	 - Pontos: <font color="#0000FF"><%=cod%>00</font>
	 - Consec: <font color="#0000FF"><%=cod%></font>
	 - Tempo: <font color="#0000FF">00min:00seg.</font>
	</span>
</p>
<%
    string connString = System.Configuration.ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
    using (OdbcConnection Conexao1 = new OdbcConnection(connString))
    {
        int refC = 0;
        string queryString = "SELECT MAX(Codigo) AS max_Cod FROM Perg" + orig;
        OdbcCommand command = new OdbcCommand(queryString, Conexao1);
        // Open the connection in a try/catch block.
        try
        {
            Conexao1.Open();
            OdbcDataReader reader = command.ExecuteReader();
            reader.Read();
            refC = Convert.ToInt16(reader["max_Cod"].ToString());
            Random rnd = new Random();
            refC = rnd.Next(0, refC);
            reader.Close();
            Conexao1.Close();
        }
        catch (Exception ex)
        {
            var perg1 = ex.Message;
        }

        queryString = "SELECT * FROM Perg" + orig + " WHERE Codigo = " + refC;
        command = new OdbcCommand(queryString, Conexao1);
        // Open the connection in a try/catch block.
        try
        {
            Conexao1.Open();
            OdbcDataReader Perguntas = command.ExecuteReader();
            Perguntas.Read();
                if (fig != "") fig = "tema" + fig + "/images/" + Perguntas["Figura"];
%>
<table width="100%" cellspacing="0" cellpadding="0">
	<tr valign="TOP"> 
		<td width="5%"></td>
		<td bgcolor="#F94942" width="2%"><img src="images/cant01s.gif" /></td>
		<td bgcolor="#F94942" width="67%">TIPO DE PERGUNTAS NA SALA<br />
			<b><span style="font-size: 9pt; color: #FFFFFF"><%=Perguntas["Pergunta"]%></span></b>
		</td>
		<td bgcolor="#F94942" width="2%" align="RIGHT"><img src="images/cant02s.gif" /></td>
		<td width="24%" align="CENTER" valign="TOP">
			<b><font style="font-size: 14pt; color: #F94942">Ganhe</font>
			<br /><font style="font-size: 12pt">20 pontos</b></font>
		</td>
	</tr>
	<tr valign="TOP"> 
		<td width="5%"></td>
		<td bgcolor="#F94942" width="2%"><img src="images/cant01ii.gif" /></td>
		<td bgcolor="#F94942" width="67%"></td>
		<td bgcolor="#F94942" width="2%" align="RIGHT"><img src="images/cant02ii.gif" /></td>
		<td width="24%" align="CENTER" valign="TOP"></td>
	</tr>
	<tr valign="TOP"> 
		<td width="5%"></td>
		<td bgcolor="#FDB4B1" width="2%" valign="BOTTOM"><img src="images/cant03i.gif" width="9" height="18" /></td>
		<td bgcolor="#FDB4B1" width="67%">
<% if (fig != "") { %>
			<table width="100%" cellspacing="0" cellpadding="2">
				<tr>
					<td width="100"><img src="<%=fig%>" name="NFigr" width="100" height="180" /></td>
					<td>
<% } %>
			<table border="0" width="100%" cellspacing="0" cellpadding="2">
				<tr>
					<td width="3%" valign="top" nowrap><img src="images/happy3.gif" name="n1" align="center" hspace="3"><input type="radio" name="Resposta"></td>
					<td width="97%" valign="top"><span><%=Perguntas["a"]%></span></td>
				</tr>
				<tr>
					<td width="3%" valign="top" nowrap><img src="images/happy3.gif" name="n2" align="center" hspace="3"><input type="radio" name="Resposta"></td>
					<td width="97%" valign="top"><span><%=Perguntas["b"]%></span></td>
				</tr>
				<tr>
					<td width="3%" valign="top" nowrap><img src="images/happy3.gif" name="n3" align="center" hspace="3"><input type="radio" name="Resposta"></td>
					<td width="97%" valign="top"><span><%=Perguntas["c"]%></span></td>
				</tr>
				<tr>
					<td width="3%" valign="top" nowrap><img src="images/happy3.gif" name="n4" align="center" hspace="3"><input type="radio" name="Resposta"></td>
					<td width="97%" valign="top"><span><%=Perguntas["d"]%></span></td>
				</tr>
				<tr>
					<td width="3%" valign="top" nowrap><img src="images/happy3.gif" name="n5" align="center" hspace="3"><input type="radio" name="Resposta"></td>
					<td width="97%" valign="top"><span><%=Perguntas["e"]%></span></td>
				</tr>
			</table>
<% if (fig != "") { %>
					</td>
				</tr>
			</table>
<% } %>
		</td>
		<td bgcolor="#FDB4B1" width="2%" align="RIGHT" valign="BOTTOM"><img src="images/cant04i.gif" width="9" height="18" /></td>
		<td width="24%" align="CENTER" valign="MIDDLE"><img src="images/resp01.gif" /><p>(botão responder<br />desabilitado no preview)</p></td>
	</tr>
</table>
<p>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr> 
		<td>
			<p align="justify"><b>OLHO VIVO - </b> Fique ligado e bem informado neste ítem. Em cada Sala de
			Perguntas tem também o parágrafo OLHO VIVO, com muita informação e curiosidades sobre os mais variados
			temas, apresentados na tradicional forma do <i>Você Sabia Que...?</i>, alem de inumeras <i>Piadas...</i>
			que trazem muito bom humor ao Site.</p>
		</td>
	</tr>
</table>
<%
            Perguntas.Close();
            Conexao1.Close();
        }
        catch (Exception ex)
        {
            var perg1 = ex.Message;
        }

        Conexao1.Dispose();
    }

%>
<p>
            <div width="100%" height="40px" style="background-color:#0f4baf; text-align:left; width:auto; height:40px;">
                <img height="40" src="images/supdate03.gif" width="27" style="float:left" /><span class="textvalignmiddle" style="font-size:large; font-family:Verdana, Arial, Helvetica, sans-serif; color:#ffffff"><b><i>DESCRIÇÃO</i></b></span><img height="40" src="images/supdate02.gif" width="27" style="float:right" />
            </div>
<p>
 			<table border="0" cellpadding="0" cellspacing="0" width="90%" style="font-family: Arial; font-size:9pt">
				<tr>
					<td>
			<p  align="justify"><b>Sabichão. </b><i>Adj. e Sub. Masculino:</i> Grande sábio; aquele que alardeia 
			sabedoria; presunçoso. <i>Feminino:</i> Sabichã ou Sabichona. Detone em seu assunto preferido, ou 
			conheça mais sobre temas de interesse ou diversos. Em cada Sala tem perguntas sobre um mesmo tema que, 
			mudam a qualquer hora. Se o seu assunto preferido ainda não apareceu, mande sua sugestão para o:
			<a href="mailto:contato@aggora.com.br?subject=Sujestão: Tema de Salas">RG Sabichão Web</a></p>
					</td>
				</tr>
			</table>
<p>
 			<table border="0" cellpadding="0" cellspacing="0" width="90%" style="font-family: Arial; font-size:9pt">
				<tr>
					<td>
			<b><i>COMO ENTRAR NO JOGO</i></b>
			<p align="justify">Nos campos do formulário à direita, digite seu Log-in (<b><font color=red>E-MAIL completo</font></b>) e uma
			SENHA exclusiva para este Site-Jogo. Pronto você automaticamente já estará registrado no Sabichão, e entrara
			no ambiente do jogo. Mas lembre-se, para concorrer aos prêmios quando estes estiverem disponíveis você deverá completar seus dados
			cadastrais, ou atualiza-los. Eles podem ser alterados (exceto e-mail) a qualquer momento a partir
			da página interna [Menu] com um clique simples em [Alterar Cadastro].</p>
                        <p align="right">Quero uma amostra <a href="sabio23.aspx">Full-Demo</a> antes de Cadastrar-me.</p>
					</td>
				</tr>
			</table>
<p>
			<table border="0" cellpadding="0" cellspacing="0" width="90%" style="font-family: Arial; font-size:9pt">
				<tr>
					<td>
			<b><i>TURMA DO FUNDÃO</i></b>
			<p  align="justify">Se enturme com sua Turma! (<b><font color=red>Bate papo com os Sabios-Amigos</font></b>). Nas salas do Sabichão, estará
			disponível chat para compartilhamento de idéias e assuntos diversos, podendo o usuário selecionar para este entrosamento até 5 
			usuarios que podem ser Locais (da sua cidade ou bairro), Regional (do seu estado) ou Nacional em função dos seus dados cadastrais. Será 
			possível também a seleção de amigos por outros critérios de escolha, tais como idade ou interesses comuns, a serem implementados.</p>
					</td>
				</tr>
			</table>
		</td>
		<td width="40px">&nbsp;</td>
		<td width="130px">
			<table border="0" cellPadding="0" cellSpacing="0" width="120px" style="border-collapse:collapse; border-spacing:0">
				<TBODY>
				<tr><td background="images/menu11.gif" height="70" width="120" /></tr>
				<tr><td background="images/menu13.gif" height="10" width="120" /></tr>
				<tr><td background="images/menu12.gif" height="10" width="120" /></tr>
				<tr><td background="images/menu14.gif">
        <form id="logonForm" runat="server" method="get" onsubmit="return verifica()">
            <br />
			<table cellspacing="1" cellpadding="2" width="120px" style="font-family: Arial; font-size:9pt;color:#000080">
				<tr>
					<td align="right"><b>Seu Log-in</b>:&nbsp;<br />
                        <asp:TextBox ID="userlogon" name="userlogon" runat="server" style="width:100px" maxlength="30" />
					    <br /><span style="font-size:8pt"> (E-mail completo)</span></td>
				</tr>
				<tr>
					<td align="right"><b>Uma Senha</b>:&nbsp;<br />
                        <asp:TextBox ID="userpassw" name="userpassw" runat="server" style="width:100px" maxlength="12" TextMode="Password" />
					    <br /><span style="font-size:8pt"> (Mínimo 6 Caracteres)</span></td>
				</tr>
				<tr>
					<td align="center">
                        <%--<br /><input type="submit" value="Entre (é gratis)" name="lggonAgn" style="cursor:pointer; border:0;background-color:rgb(204,204,204);background-image:url('images/bt3.gif');width:115px;height:25px" />
                        <br /><asp:ImageButton ID="ImageButton1" runat="server" Height="25px" ImageAlign="Right" ImageUrl="images/bt3-Entre.gif" OnClick="ImageButton1_Click" Width="115px" AlternateText="Entre (É Gratis)" />--%>
                        <div style="width:115px; height:25px;text-align:center; background-image: url('images/bt3.gif'); background-repeat: no-repeat; vertical-align:bottom; cursor: pointer; line-height: 25px;"><asp:LinkButton ID="LinkButton1" runat="server" Text="Entre (é grátis)" Height="25px" Width="115px" OnClick="LinkButton1_Click" /></div>
					</td>
				</tr>
			</table>
        </form>
				</td></tr>
				<tr><td background="images/menu16.gif" height="36" width="120" /></tr>
				<tr align="center"><td><br /><span style="font-size:7pt">Copyright &copy;2000<br />by Borg.</span></td></tr>
				</TBODY>
			</table>
		</td>
	</tr>
	</TBODY>
</table>
<p> </p>
</body></html>
