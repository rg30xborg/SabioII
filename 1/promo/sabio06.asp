<%@ Language=VBScript %>
<%
	Response.Expires = 0
	
If inStr(Request.ServerVariables("HTTP_HOST"), "www.aggora.com.br") = 0 Then
		Response.Redirect "http://www.aggora.com.br/sabio/help.htm"
		Response.End
Else
	If Session("IPUserSab") = "" Or Session("mail") = "" Then
		Response.Redirect "http://www.aggora.com.br/sabio/1/sabio12.asp"
		Response.End
	End If

	data = Now

' Abre conexao com banco de dados. Alterar a string de conexao em global.asa
	Set Conexao = Server.CreateObject("ADODB.Connection")
	'SQLServer =>  'Conexao.Open "Provider=SQLOLEDB.1;SERVER=aggora1.mysql.dbaas.com.br;DATABASE=aggora1;UID=aggora1;PWD=dade02;"
	Conexao.Open "DRIVER={MySQL ODBC 5.3 ANSI Driver};SERVER=aggora1.mysql.dbaas.com.br;PORT=3306;DATABASE=aggora1;USER=aggora1;PASSWORD=dade02;OPTION=3;"

%><Script Language="JScript" src="../images/SimplesU.js"></Script>
<html><head><title>Sabichao</title><style>@import url(../images/coUC.css);</style></head>
<body bgcolor="#FFFFFF" onLoad="OnCarg()">
<p style="font-size: 10pt">
	Sala de: <font color="#0588C0"><b>PROMOÇÕES - MEUS TALENTOS</font><Span ID="NCalc"> - Carregando .... </Span></b>
	<span style="font-size: 9pt"><br>
	 - AQUI VOCÊ GANHA PONTOS ENVIANDO SUAS CRIAÇÕES ARTISTICAS PARA A PROMOÇÃO MEU TALENTO
	</span>
</p>
<form method="POST" name="Revisar">
<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#44AA00" width="2%"><img src="../images/cant01s.gif"></td>
		<td bgcolor="#44AA00" width="64%" style="font-size: 9pt; color: #FFFFFF">
			</b><span style="font-size:12pt"><b>Dados para Adicionar Criação Pessoal</span>
			<br>Ganhe <font color="#FFFF00">50 Pontos</font> por peça válida + <font color="#FFFF00">500
			Pontos</font> se sua Criação Pessoal for utilizada pelo Sabichão. É so preencher e clicar na
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
		<td bgcolor="#44AA00" width="64%">CONECTADO POR <b><font color="#FF0000"><%=Request.ServerVariables("REMOTE_HOST")%></font></b> EM <%=FormatDateTime(data,0)%></td>
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
					<td width="95%"><b>Detalhes da "Obra de Arte" (Seu talento poderá ser compartilhado)</b></td>
				</tr>
				<tr bgcolor="#D7DBEC" align="center">
					<td width="5%">A<br>u<br>t<br>o</td>
					<td width="95%" nowrap align="right">
					Titulo: <input type="text" style="width:80%; background-color:#FFFFDF" name="title" maxlength="256">
					<br><br>Descrição: <textarea style="width:80%; height:60" name="descr" maxlength="1024"></textarea>
					<center>
					<br>Tipo de Criação a encaminhar: <input type="file" style="visibility:hidden" name="arqUpLoad">
					<br>Poesia <input type="radio" name="spec" value="a" onClick="tipoA(1)">
					&nbsp; &nbsp; Imagem <input type="radio" name="spec" value="b" onClick="tipoA(2)"> 
					&nbsp; &nbsp; Audio <input type="radio" name="spec" value="c" onClick="tipoA(3)"> 
					&nbsp; &nbsp; Video <input type="radio" name="spec" value="d" onClick="tipoA(4)"> 
					&nbsp; &nbsp; Outros <input type="radio" name="spec" value="e" onClick="tipoA(5)">
					</center>
					</td>
				</tr>
				<tr>
					<td colspan=2><br>
<%
 	If Request("ok") = 1 Or Request("err") <> "" Then 
		Response.Write "<marquee behavior=alternate title=Mensagem&nbsp;de&nbsp;Retorno&nbsp;aqui&nbsp;!!>"
		If Request("ok")  = 1 Then Response.Write "<b>CRIAÇÃO ADICIONADA COM SUCESSO</b>" End If
		If Request("err") = 1 then Response.Write "<b>ERRO ACRESCENTANDO A CRIAÇÃO - ABORTADO</b>" End If
		If Request("err") = 3 Then Response.Write "<b>NSERÇÃO CANCELADA: DADOS CADASTRAIS INCOMPLETOS - ATUALIZE-OS EM: <a href='../sabio04.asp'>[Dados Usuários]</a></font></b>" End If
		Response.Write "</marquee>"
 	End If
%>
						<br>
					</td>
				</tr>
			</table>
		</td>
		<td bgcolor="#AAEE22" width="2%" align="RIGHT" valign="BOTTOM"><img src="../images/cant04i.gif"></td>
		<td width="24%" align="CENTER" valign="MIDDLE">
			<p><input type="button" value="Outras Promos" style="border:0;background-color:rgb(255,255,255);background-image:url('../images/bt3.gif');width:115;height:25" onClick="location.href='sabio01.asp'"></p>
			<img name="botao" src="../images/cont000.gif" width="97" height="56" onClick="VerficaARQ()" onMouseOver="onBotao()" onMouseOut="ofBotao()">
			<p><input type="button" value="Dicas Uteis" style="border:0;background-color:rgb(255,255,255);background-image:url('../images/bt3.gif');width:115;height:25" onClick="parent.location.href='sabio01.htm'"></p>
		</td>
	</tr>
</table>
</form>
<table cellspacing="0" cellpadding="0" width="100%" style="font-family: Arial; font-size:9pt">
	<tr>
		<td><p align="justify">Para preencher: Primeiro anote o Titulo, depois preencha uma Descrição que represente sua
			Criação Pessoal, finalmente escolha o Tipo que a represente. Clique em Dicas Uteis para det.
			Caso sua Criação Pessoal seja válida voce ganha 50 pontos e, + 500 pontos se utilizarmos ela
			em nossas Salas. Envie quantas Criações Pessoal desejar. Veja abaixo as que você já enviou.</p></td>
	</tr>
</TABLE>
<center><hr>
<table width="90%">
	<tr>
		<td style="font-size: 12pt">
			<b>Suas Criações Pessoais Já Enviadas para o Site.</b>
		</td>
	</tr>
</table>
<%
'	Session.timeout = 30

	Set Perguntas = Server.CreateObject("ADODB.Recordset")
	Perguntas.Open "SELECT * FROM Perg0014 WHERE USR_ID = " & Session("id") & " ORDER BY Codigo DESC", Conexao

' Checa se existem Usuários no banco de dados
	If Perguntas.Eof Then
%>
<table width="90%">
	<tr>
		<td bgcolor='#FFFFDF'>Você ainda não adicionou criações para a Sala [Meus Talentos]. Aproveite agora e fature Pontos Extras...</td>
	</tr>
</table>
<%
	Else
%>
<table width="90%" cellspacing="2" cellpadding="1" style="color: #0000FF; font-size: 10pt">
	<tr align="center" bgcolor="#FFCC66">
		<td width="7%"><b>Nº</b></td>
		<td width="79%"><b>Titulo / Descrição (para revisar clique no nº)</b></td>
		<td width="7%"><b>Val.</b></td>
		<td width="7%"><b>Apv.</b></td>
	</tr>
</table>
<%
		first10 = 1
		Perguntas.MoveFirst
		While Not Perguntas.EOF And first10 < 6
			'rCert = Perguntas("Resposta")
%>
<table width="90%" cellspacing="2" cellpadding="1">
	<tr bgcolor='#FFFFDF'>
		<td align="center" width='7%'><a href='sabio08.asp?cod=<%=Perguntas("Codigo")%>'><%=Perguntas("Codigo")%></a></td>
		<td width='79%'>Tipo: <%=Perguntas("Tipo")%> - Titulo: <%=Perguntas("Titulo")%>
				<br> - Descrição: <%=Perguntas("Descricao")%>
				<br> - Arquivo: <%=Perguntas("Arquivo")%></td>
 		<td width="7%" align="center">
<%
	If Perguntas("valido") = 1 Then
		Response.Write "Sim"
	Else 
		If isDate(Perguntas("data_extra")) Then Response.Write "Não" Else Response.Write "(?)" End If
	End If
%>		</td>
		<td width="7%" align="center"><% If Perguntas("confirmado") = 1 Then Response.Write "Sim" Else Response.Write "Não" End If%></td>
	</tr>
</table>
<%
			first10 = first10 + 1
			Perguntas.MoveNext
		Wend

		if first10 > 5 And Not Perguntas.EOF Then
			While Not Perguntas.EOF
%>
<table width="90%" cellspacing="2" cellpadding="1">
	<tr bgcolor='#FFFFDF'>
		<td align="center" width='7%'><a href='sabio08.asp?cod=<%=Perguntas("Codigo")%>'><%=Perguntas("Codigo")%></a></td>
		<td width='79%'>Tipo: <%=Perguntas("Tipo")%> - Titulo:- <%=Perguntas("Titulo")%> - Descrição: <% If Perguntas("Descricao") <> "" Then Response.Write(left(Perguntas("Descricao"), 20)) End If %>...</td>
 		<td width="7%" align="center">
<%
	If Perguntas("valido") = 1 Then
		Response.Write "Sim"
	Else 
		If isDate(Perguntas("data_extra")) Then Response.Write "Não" Else Response.Write "(?)" End If
	End If
%>		</td>
		<td width="7%" align="center"><% If Perguntas("confirmado") = 1 Then Response.Write "Sim" Else Response.Write "Não" End If%></td>
	</tr>
</table>
<%
			Perguntas.MoveNext
			Wend
		End If

	End If

	Perguntas.Close
	Conexao.Close

	Set Perguntas = Nothing
	Set Conexao = Nothing
End If
%>
<br>
<hr>
* * * RG Sabichão Web - Versão 2000a * * *
<hr>

</center>
</body></html>