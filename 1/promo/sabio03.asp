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

%><Script Language="JScript" src="../images/SimplesU.js"></Script>
<html><head><title>Sabichao</title><style>@import url(../images/coUC.css);</style></head>
<body bgcolor="#FFFFFF" onLoad="OnCarg()">
<p style="font-size: 10pt">
	Sala de: <font color="#0588C0"><b>PROMOÇÕES - PERGUNTAS DE USUÁRIOS</font><Span ID="NCalc"> - Carregando .... </Span></b>
	<span style="font-size: 8pt"><br>
	 - AQUI VOCÊ GANHA PONTOS FAZENDO OS OUTROS QUEIMAR CEREBELOS
	</span>
</p>
<form method="POST" name="Revisar">
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
 	If Request("ok") = 1 Or Request("err") <> "" Then 
		Response.Write "<marquee behavior=alternate title=Mensagem&nbsp;de&nbsp;Retorno&nbsp;aqui&nbsp;!!>"
		If Request("ok")  = 1 Then Response.Write "<b>PERGUNTA ADICIONADA COM SUCESSO</b>" End If
		If Request("err") = 1 then Response.Write "<b>ERRO ACRESCENTANDO A PERGUNTA - ABORTADO</b>" End If
		If Request("err") = 3 Then Response.Write "<b>INSERÇÃO CANCELADA: DADOS CADASTRAIS INCOMPLETOS - ATUALIZE-OS EM: <a href='../sabio04.asp'>[Dados Usuários]</a></font></b>" End If
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
			<p><input type="button" value="Outras Promos" style="border:0;background-color:rgb(255,255,255);background-image:url('../images/bt3.gif');width:115;height:25" onClick="location.href='sabio06.asp'"></p>
			<img name="botao" src="../images/cont000.gif" width="97" height="56" onClick="Verfica1()" onMouseOver="onBotao()" onMouseOut="ofBotao()">
			<p><input type="button" value="Dicas Uteis" style="border:0;background-color:rgb(255,255,255);background-image:url('../images/bt3.gif');width:115;height:25" onClick="parent.location.href='sabio01.htm'"></p>
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
			<b>Perguntas Já Enviadas por Você.</b>
		</td>
	</tr>
</table>
<%
'	Session.timeout = 30

' Abre conexao com banco de dados. Alterar a string de conexao em global.asa
	Set Conexao = Server.CreateObject("ADODB.Connection")
	'SQLServer =>  'Conexao.Open "Provider=SQLOLEDB.1;SERVER=187.45.196.225;DATABASE=aggora1;UID=aggora1;PWD=dade02;"
	Conexao.Open "DRIVER={MySQL ODBC 5.3 ANSI Driver};SERVER=187.45.196.225;PORT=3306;DATABASE=aggora1;USER=aggora1;PASSWORD=dade02;OPTION=3;"

	Set Perguntas = Server.CreateObject("ADODB.Recordset")
	Perguntas.Open "SELECT * FROM Perg0015 WHERE USR_ID = " & Session("id") & " ORDER BY Codigo DESC", Conexao

' Checa se existem Usuários no banco de dados
	If Perguntas.Eof Then
%>
<table width="90%">
	<tr>
		<td bgcolor='#FFFFDF'>Você ainda não adicionou perguntas para a Sala [De Usuários]. Aproveite agora e fature Pontos Extras...</td>
	</tr>
</table>
<%
	Else
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
		first10 = 1
		Perguntas.MoveFirst
		While Not Perguntas.EOF And first10 < 6
			rCert = Perguntas("Resposta")
%>
<table width="90%" cellspacing="2" cellpadding="1">
	<tr bgcolor='#FFFFDF'>
		<td align="center" width='7%'><a href='sabio05.asp?cod=<%=Perguntas("Codigo")%>'><%=Perguntas("Codigo")%></a></td>
		<td width='79%'><%=Perguntas("Pergunta")%>
				<br> - <%if rCert = "a" Then%><b><% End If%>a) <%=Perguntas("a")%><%if rCert = "a" Then%></b><% End If%>;
				<br> - <%if rCert = "b" Then%><b><% End If%>b) <%=Perguntas("b")%><%if rCert = "b" Then%></b><% End If%>;
				<br> - <%if rCert = "c" Then%><b><% End If%>c) <%=Perguntas("c")%><%if rCert = "c" Then%></b><% End If%>;
				<br> - <%if rCert = "d" Then%><b><% End If%>d) <%=Perguntas("d")%><%if rCert = "d" Then%></b><% End If%>;
				<br> - <%if rCert = "e" Then%><b><% End If%>e) <%=Perguntas("e")%><%if rCert = "e" Then%></b><% End If%></td>
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
		<td align="center" width='7%'><a href='sabio05.asp?cod=<%=Perguntas("Codigo")%>'><%=Perguntas("Codigo")%></a></td>
		<td width='79%'><%=left(Perguntas("Pergunta"), 40)%>... Resp.:- <%=Perguntas("Resposta")%>) <%=left(Perguntas("" & Perguntas("Resposta")), 20)%>...</td>
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