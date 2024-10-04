<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sabio03.aspx.cs" Inherits="Sabio._1.promo.Sabio03" %>
<%@ Import Namespace="System.Data.Odbc" %>

<!DOCTYPE html>

<Script Language="JScript" src="../scripts/SimplesU.js"></Script>
<html><head><title>Sabichao</title><style>@import url(../images/coUC.css);</style></head>
<body bgcolor="#FFFFFF" onLoad="OnCarg()">
<p style="font-size: 10pt">
	Sala de: <font color="#0588C0"><b>PROMOÇÕES - PERGUNTAS DE USUÁRIOS</font><Span ID="NCalc"> - Carregando .... </Span></b>
	<span style="font-size: 9pt"><br>
	 - AQUI VOCÊ GANHA PONTOS FAZENDO OS OUTROS QUEIMAR CEREBELOS
	</span>
</p>
<form method="GET" name="Revisar">
<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#44AA00" width="2%"><img src="../images/cant01s.gif"></td>
		<td bgcolor="#44AA00" width="64%" style="font-size: 9pt; color: #FFFFFF">
			</b><span style="font-size:12pt"><b>Dados para Adicionar Pergunta</span>
			<br>Ganhe <font color="#FFFF00">50 Pontos</font> por pergunta válida + <font color="#FFFF00">100
			Pontos</font> se sua pergunta for utilizada pelo Sabichão. É so preencher e clicar na
			seta da direita para <font color="#FFFF00">EVIAR E GANHAR</font>.</b>
		</td>
		<td bgcolor="#44AA00" width="2%" align="RIGHT"><img src="../images/cant02s.gif"></td>
		<td width="24%" align="CENTER" valign="TOP">
			<b><font style="font-size: 14pt; color: #F94942">Ganhe</font>
			<br><font style="font-size: 12pt">até<br>150 pontos</b></font>
		</td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#44AA00" width="2%"><img src="../images/cant01ii.gif"></td>
		<td bgcolor="#44AA00" width="64%">CONECTADO POR <b><font color="#FF0000"><%=Request.ServerVariables["REMOTE_HOST"]%></font></b> EM <%=DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss")%></td>
		<td bgcolor="#44AA00" width="2%" align="RIGHT"><img src="../images/cant02ii.gif"></td>
		<td width="24%" align="CENTER" valign="TOP"></td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#AAEE22" width="2%" valign="BOTTOM"><img src="../images/cant03i.gif"></td>
		<td bgcolor="#AAEE22" width="64%"><br>
			<table width="100%" cellspacing="2" cellpadding="1" style="font-family: Arial; font-size:9pt">
				<tr align="center" bgcolor="#4E5CA0" style="color: #FFFFFF; font-size: 10pt">
					<td width="5%"><b>Nº</b></td>
					<td width="95%"><b>Pergunta / Respostas (máximo 230 caracteres)</b></td>
				</tr>
				<tr bgcolor="#D7DBEC" align="center">
					<td width="5%">A<br>u<br>t<br>o</td>
					<td width="95%" nowrap align="right">Perg.: <input type="text" style="width:90%;background-color:#FFFFDF" name="perg" maxlength=230>
					<br>a <input type="radio" name="spec" value="a" onClick="respA(1)"> <input type="text" style="width:90%" name="res1" maxlength=230>
					<br>b <input type="radio" name="spec" value="b" onClick="respA(2)"> <input type="text" style="width:90%" name="res2" maxlength=230>
					<br>c <input type="radio" name="spec" value="c" onClick="respA(3)"> <input type="text" style="width:90%" name="res3" maxlength=230>
					<br>d <input type="radio" name="spec" value="d" onClick="respA(4)"> <input type="text" style="width:90%" name="res4" maxlength=230>
					<br>e <input type="radio" name="spec" value="e" onClick="respA(5)"> <input type="text" style="width:90%" name="res5" maxlength=230></td>
				</tr>
				<tr>
					<td colspan=2><br>
<%
                        if (Request["ok"] == "1" || Request["err"] != "") {
                            string Erro = "<marquee behavior=alternate title=Mensagem&nbsp;de&nbsp;Retorno&nbsp;aqui&nbsp;!!>";
                                if (Request["ok"] == "1") Erro = Erro + "<b>PERGUNTA ADICIONADA COM SUCESSO</b>";
                                else if (Request["err"] == "1") Erro = Erro + "<b>ERRO ACRESCENTANDO A PERGUNTA - ABORTADO</b>";
                                     else if (Request["err"] == "3") Erro = Erro + "<b>INSERÇÃO CANCELADA: DADOS CADASTRAIS INCOMPLETOS - ATUALIZE-OS EM: <a href='../Sabio04.aspx'>[Dados Usuários]</a></font></b>";
                            Erro = Erro + "</marquee>";
                            Response.Write(Erro); 
                        }
%>
						<br>
					</td>
				</tr>
			</table>
		</td>
		<td bgcolor="#AAEE22" width="2%" align="RIGHT" valign="BOTTOM"><img src="../images/cant04i.gif"></td>
		<td width="24%" align="CENTER" valign="MIDDLE">
			<p><input type="button" value="Seu Talento" style="cursor:pointer;border:0;background-color:rgb(255,255,255);background-image:url('../images/bt3.gif');width:115px;height:25px" onClick="location.href='Sabio06.aspx'"></p>
			<img name="botao" src="../images/botpg.gif" width="97" height="56" onClick="Verfica1()" onMouseOver="onBotao()" onMouseOut="ofBotao()">
			<p><input type="button" value="Dicas Uteis" style="cursor:pointer;border:0;background-color:rgb(255,255,255);background-image:url('../images/bt3.gif');width:115px;height:25px" onClick="parent.location.href='sabio01.htm'"></p>
		</td>
	</tr>
</table>
</form>
<table cellspacing="0" cellpadding="0" width="100%" style="font-family: Arial; font-size:9pt">
	<tr>
		<td><p align="justify">Para preencher: Primeiro anote a pergunta, depois escolha qual alternativa terá a
			resposta certa e escreva esta resposta, depois complete com as respostas erradas. Clique em Dicas
			Uteis para det. Caso sua pergunta seja válida voce ganha 50 pontos e, + 500 pontos se utilizarmos ela
			também em outras Salas. Envie quantas perguntas desejar. Veja abaixo as que você já enviou.</p></td>
	</tr>
</TABLE>
<center><hr>
<table width="90%">
	<tr>
		<td style="font-size: 12pt">
			<b>Perguntas já Enviadas por Você.</b>
		</td>
	</tr>
</table>
<%
    //Checa se existem Apostas dste Usuários no Premio selecionado
    string connString = System.Configuration.ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
    OdbcConnection Conexao = new OdbcConnection(connString);

    using (Conexao)
    {
        string queryString = "SELECT * FROM Perg0015 WHERE USR_ID = " + Session["id"] + " ORDER BY Codigo DESC";
        OdbcCommand command = new OdbcCommand(queryString, Conexao);
        // Open the connection in a try/catch block.
        try
        {
            Conexao.Open();
            OdbcDataReader Perguntas = command.ExecuteReader();
            if (!Perguntas.HasRows)
            {
%>
<table width="90%">
	<tr>
		<td bgcolor='#FFFFDF'>Você ainda não adicionou perguntas para a Sala [De Usuários]. Aproveite agora e fature Pontos Extras...</td>
	</tr>
</table>
<%
            }
            else
            {
%>
<table width="90%" cellspacing="2" cellpadding="1" style="color: #0000FF; font-size: 10pt">
	<tr align="center" bgcolor="#FFCC66">
		<td width="7%"><b>Nº</b></td>
		<td width="79%"><b>Pergunta / Respostas (para revisar clique no nº)</b></td>
		<td width="7%"><b>Val.</b></td>
		<td width="7%"><b>Apv.</b></td>
	</tr>
</table>
<%
                int first10 = 1;
                while (Perguntas.Read())
                {
                    if(first10 < 6) { 
                    string rCert = Perguntas["Resposta"].ToString();
%>
<table width="90%" cellspacing="2" cellpadding="1">
	<tr bgcolor='#FFFFDF'>
		<td align="center" width='7%'><a href='Sabio05.aspx?cod=<%=Perguntas["Codigo"]%>'><%=Perguntas["Codigo"]%></a></td>
		<td width='79%'><%=Perguntas["Pergunta"]%>
				<br> - <%if (rCert == "a") { %><b><% } %>a) <%=Perguntas["a"]%><%if (rCert == "a") { %></b><% } %>;
				<br> - <%if (rCert == "b") { %><b><% } %>b) <%=Perguntas["b"]%><%if (rCert == "b") { %></b><% } %>;
				<br> - <%if (rCert == "c") { %><b><% } %>c) <%=Perguntas["c"]%><%if (rCert == "c") { %></b><% } %>;
				<br> - <%if (rCert == "d") { %><b><% } %>d) <%=Perguntas["d"]%><%if (rCert == "d") { %></b><% } %>;
				<br> - <%if (rCert == "e") { %><b><% } %>e) <%=Perguntas["e"]%><%if (rCert == "e") { %></b><% } %></td>
 		<td width="7%" align="center">
<%
                    if (Perguntas["valido"].ToString() == "1")
                        Response.Write("Sim");
                    else
                        if (Perguntas["data_extra"] != null) Response.Write("Não"); else Response.Write("(?)");
%>		</td>
		<td width="7%" align="center"><% if (Perguntas["confirmado"].ToString() == "1") Response.Write("Sim"); else Response.Write("Não"); %></td>
	</tr>
</table>
<%
    }
    else
    {
        string xP = Perguntas["Pergunta"].ToString();
        int x = xP.Length; if (x >= 50) x = 40;
        string yP = Perguntas[Perguntas["Resposta"].ToString()].ToString();
        int y = yP.Length; if (y >= 30) y = 20;
%>
<table width="90%" cellspacing="2" cellpadding="1">
	<tr bgcolor='#FFFFDF'>
		<td align="center" width='7%'><a href='Sabio05.aspx?cod=<%=Perguntas["Codigo"]%>'><%=Perguntas["Codigo"].ToString()%></a></td>
		<td width='79%'><%=xP.Substring(0,x)%>... Resp.:- <%=Perguntas["Resposta"].ToString()%>) <%=yP.Substring(0,y)%>...</td>
 		<td width="7%" align="center">
<%
                        if (Perguntas["valido"].ToString() == "1")
                            Response.Write("Sim");
                        else
                            if (Perguntas["data_extra"] != null) Response.Write("Não"); else Response.Write("(?)");
%>		</td>
		<td width="7%" align="center"><% if (Perguntas["confirmado"].ToString() == "1") Response.Write("Sim"); else Response.Write("Não"); %></td>
	</tr>
</table>
<%

                    }
                    first10 = first10 + 1;
                }
            }
            Conexao.Close();
            Conexao.Dispose();
        }
        catch (Exception ex)
        {
            var perg1 = ex.Message;
        }
    }
%>
<br>
<hr>
* * * RG Sabichão Web - Versão 2000a * * *
<hr>

</center>
</body></html>