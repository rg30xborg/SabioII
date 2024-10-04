<%@ Language=VBScript %>
<%
	Response.Expires = 0
	
'                   If inStr(Request.ServerVariables("HTTP_HOST"), "www.aggora.com.br") = 0 Then
'                   	Response.Redirect "http://www.aggora.com.br/sabio/help.htm"
'                   	Response.End
'                   Else
	If Session("IPUserSab") = "" Or Session("mail") = "" Then
		Response.Redirect "sabio12.asp"             'http://www.aggora.com.br/sabio/1/
		Response.End
	End If

%><Script Language="JScript" src="scripts/SimplesF.js"></Script>
<html><head><title>Sabichao</title><style>@import url(images/coUC.css);</style></head>
<body bgcolor="#FFFFFF" onLoad="OnCarg()">
<p style="font-size: 10pt">
	Sala de : <font color="#0588C0"><b>HANKING</font><Span ID="NCalc"> - Carregando .... </Span></b>
	<span style="font-size: 8pt"><br>
	 - CLASSIFICAÇÃO GERAL POR PONTOS NO SABICHÃO
	</span>
</p>
<center>
<%
' Abre conexao com banco de dados. Alterar a string de conexao em global.asa
	Set Conexao = Server.CreateObject("ADODB.Connection")
	'SQLServer =>  'Conexao.Open "Provider=SQLOLEDB.1;SERVER=187.45.196.225;DATABASE=aggora1;UID=aggora1;PWD=dade02;"
	Conexao.Open "DRIVER={MySQL ODBC 5.3 ANSI Driver};SERVER=187.45.196.225;PORT=3306;DATABASE=aggora1;USER=aggora1;PASSWORD=dade02;OPTION=3;"

' Abre tabela de produtos usando a conexao aberta acima.
	Set Usuarios = Server.CreateObject("ADODB.Recordset")
	Usuarios.CursorLocation = 3 '2: Modo servidor 0 3: Modo cliente (o mais rapido)
	Usuarios.CursorType = 0     '0 : Somente leitura (o mais rápido entre todos)
	Usuarios.Open "SELECT U.USR_ID, U.USR_Nome, UD.USD_Total FROM Users U, UserDados UD WHERE U.USR_ID = UD.USR_ID ORDER BY UD.USD_Total Desc, U.USR_Nome Asc", Conexao
	'Usuarios.Open "SELECT USR_ID, USR_Nome, USD_Total FROM Users ORDER BY USD_Total Desc, USR_Nome Asc", Conexao

	Usuarios.MoveLast
		ultimo    = Usuarios("USR_ID")
		pUltimo   = Usuarios("USD_Total")
		nUltimo   = Usuarios("USR_Nome")
	Usuarios.Movefirst
		primeiro  = Usuarios("USR_ID")
		pPrimeiro = Usuarios("USD_Total")
		nPrimeiro = Usuarios("USR_Nome")
	'Users = Usuarios.RecordCount
	fatGraf = 160 / pPrimeiro

	pos = 0
	WHILE ((Usuarios("USR_ID") <> Session("id")) And (Not Usuarios.EOF))
		pos = pos + 1 
   		Usuarios.MoveNext
	WEND
	volta = 5
 	WHILE ((volta > 0) And (pos > 0))
		volta = volta - 1
		pos = pos - 1
		Usuarios.MovePrevious
	WEND

	bgcl = "bgcolor=#FFFFEE"
%>
<table width="90%" cellspacing="2" cellpadding="1" style="color: #0000FF; font-size: 10pt">
	<tr align="center" bgcolor="#FFCC66">
		<td width="25"><b>P.</b></td>
		<td><b>Nome do Sabichão</b></td>
		<td width="60"><b>PTs</b></td>
		<td width="210"><b>Pontuação Gráfica</b></td>
		<td width="60"><b>Dif</b></td>
	</tr>
</table>
<%
	on error resume next
	avanca = 0
	WHILE ((avanca < 10) And (Not Usuarios.EOF))
		nome = Usuarios("USR_Nome")
		codg = Usuarios("USR_ID")
		tot  = Usuarios("USD_Total")

		barA = 10 + Round((tot * fatGraf),0)
		barV = 10 + (160 - barA)
		If bgcl = "bgcolor=#FFFFEE" Then bgcl = "bgcolor=#FFFFDF" Else  bgcl = "bgcolor=#FFFFEE" End If

		If (codg <> Session("id")) Then
%>
<table width="90%" cellspacing="2" cellpadding="1" cellpadding="1">
	<tr <%=bgcl%>>
		<td width="25">&nbsp;<%=pos+1%></td>
		<td><%=nome%>&nbsp;(<%=codg%>)</td>
		<td width="60" align="right"><%=tot%>&nbsp;</td>
		<td width="210">&nbsp;<img src="images/barra01.gif" width="15" height="19"><img src="images/barra02.gif" width="<%=barA%>" height="19"><img src="images/barra03.gif" width="<%=barV%>" height="19"><img src="images/barra04.gif" width="15" height="19"></td>
		<td width="60" style="color: red">&nbsp;<%=(tot - pPrimeiro)%></td>
	</tr>
</table>
<%
		Else
%>
<table width="90%" cellspacing="2" cellpadding="1" cellpadding="1">
	<tr bgcolor=#FFEDA7>
		<td width="25">&nbsp;<b><%=pos+1%></b></td>
		<td><b><marquee behavior="alternate" title="Veja você aqui !!" ><%=nome%>&nbsp;(<%=codg%>)</marquee></b></td>
		<td width="60" align="right"><b><%=tot%>&nbsp;</b></td>
		<td width="210">&nbsp;<img src="images/barra01.gif" width="15" height="19"><img src="images/barra02.gif" width="<%=barA%>" height="19"><img src="images/barra03.gif" width="<%=barV%>" height="19"><img src="images/barra04.gif" width="15" height="19"></td>
		<td width="60" style="color: red"><b>&nbsp;<%=(tot - pPrimeiro)%></b></td>
	</tr>
</table>
<%
		End If
		avanca = avanca + 1
		pos = pos + 1 
   		Usuarios.MoveNext
	WEND
	Usuarios.close
	Conexao.Close
	Set Usuarios = Nothing
	Set Conexao = Nothing
%>
<p>
<hr>
<table cellpadding="1" cellspacing="2" width="90%" style="font-family: Arial; font-size:9pt">
	<tr>
		<td colspan=6 style="font-family: Verdana; font-size:12pt"><b>Destaques do Mês</b>:<p> </p></td>
	</tr>
</table>
<%
	barA = 10 + Round((pPrimeiro * fatGraf),0)
	barV = 10 + (160 - barA)
%>
<table cellpadding="1" cellspacing="2" width="90%" style="font-family: Arial; font-size:9pt">
	<tr bgcolor=#FFFFEE style="color: blue">
		<td width="25">&nbsp;1º</td>
		<td width="50">&nbsp; <img src="images/happy3.gif"> &nbsp;</td>
		<td><%=nPrimeiro%>&nbsp;(<%=primeiro%>)</td>
		<td width="60" align="right"><%=pPrimeiro%>&nbsp;</td>
		<td width="210">&nbsp;<img src="images/barra01.gif" width="15" height="19"><img src="images/barra02.gif" width="<%=barA%>" height="19"><img src="images/barra03.gif" width="<%=barV%>" height="19"><img src="images/barra04.gif" width="15" height="19"></td>
		<td width="60">&nbsp;zero</td>
	</tr>
</table>
<%
	barA = 10 + Round((pUltimo * fatGraf),0)
	barV = 10 + (160 - barA)
%>
<table cellpadding="1" cellspacing="2" width="90%" style="font-family: Arial; font-size:9pt">
	<tr bgcolor=#FFFFDF style="color: red">
		<td width="25">&nbsp;Xº</td>
		<td width="50">&nbsp; <img src="images/happy2.gif"> &nbsp;</td>
		<td valign="middle"><%=nUltimo%>&nbsp;(<%=ultimo%>)</td>
		<td width="60" align="right"><%=pUltimo%>&nbsp;</td>
		<td width="210">&nbsp;<img src="images/barra01.gif" width="15" height="19"><img src="images/barra02.gif" width="<%=barA%>" height="19"><img src="images/barra03.gif" width="<%=barV%>" height="19"><img src="images/barra04.gif" width="15" height="19"></td>
		<td width="60">&nbsp;<%=pUltimo - pPrimmeiro%></td>
	</tr>
</table>
<br>
<hr>
<%
'                   End If
%>
<p>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr> 
		<td>
			<p  align="justify"><b>Sabichão. </b><i>Adj. e Sub. Masculino:</i> Grande sábio; aquele que alardeia 
			sabedoria; presunçoso. <i>Feminino:</i> Sabichã ou Sabichona. Detone em seu assunto preferido, ou 
			conheça mais sobre temas de interesse ou diversos. Em cada Sala tem perguntas sobre um mesmo tema que, 
			mudam a a qualquer hora. Se o seu assunto preferido ainda não apareceu, mande sua sugestão para 
			<a href="mailto:contato@aggora.com.br">contato@aggora.com.br</a></p>
		</td>
	</tr>
</table>
</center>
<embed name="somcerto" src="/_Library/rgchico.wav" loop="false" autostart="false" hidden="true" width="0" height="0"></embed>
</BODY></HTML>
