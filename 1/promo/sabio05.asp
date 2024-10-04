<%@ Language=VBScript %>
<%
	Response.Expires = 0
	
If inStr(Request.ServerVariables("HTTP_HOST"), "www.aggora.com.br") = 0 Then
	Response.Redirect "http://www.aggora.com.br/Sabichao/help.htm"
	Response.End
Else
	If Session("IPUserSab") = "" Or Session("mail") = "" Then
		Response.Redirect "http://www.aggora.com.br/sabio/1/sabio12.asp"
		Response.End
	End If

	cod = Request("cod")

' Abre conexao com banco de dados
	Set Conexao = Server.CreateObject("ADODB.Connection")
	'SQLServer =>  'Conexao.Open "Provider=SQLOLEDB.1;SERVER=187.45.196.225;DATABASE=aggora1;UID=aggora1;PWD=dade02;"
	Conexao.Open "DRIVER={MySQL ODBC 5.3 ANSI Driver};SERVER=187.45.196.225;PORT=3306;DATABASE=aggora1;USER=aggora1;PASSWORD=dade02;OPTION=3;"

	If Request.Form("codR") Then
		cod = Request.Form("codR")
		perg = Request("perg")
		resA = Request("res1")
		resB = Request("res2")
		resC = Request("res3")
		resD = Request("res4")
		resE = Request("res5")
		If perg <> "" And resA <> "" And resB <> "" And resC <> "" And resD <> "" And resE <> "" Then
			spec = Request("spec")
			Conexao.Execute "UPDATE Perg0015 SET Pergunta = '" & perg & "',a = '" & resA & "',b = '" & resB & "',c = '" & resC & "',d = '" & resD & "',e = '" & resE & "',Resposta = '" & spec & "' WHERE Codigo = " & cod
			ok = 1
		Else
			err1 = 1
		End If
	End If

%><Script Language="JScript" src="../images/SimplesU.js"></Script>
<html><head><title>Sabichao</title><style>@import url(../images/coUC.css);</style></head>
<body bgcolor="#FFFFFF" onLoad="OnCarg()">
<p style="font-size: 10pt">
	Sala de: <font color="#0588C0"><b>ADM PERGUNTAS</font><Span ID="NCalc"> - Processando Dados .... </Span></b>
	<span style="font-size: 8pt"><br>
	 - REVISÃO DE PERGUNTAS DO SABICHÃO <B>
<%
	If ok  = 1 Then Response.Write "<font color=blue>PERGUNTA REVISADA COM SUCESSO</font>" End If
	If err1 = 1 then Response.Write "<font color=red>DADOS INSUFICIENTES - REVISÃO ABORTADA</font>" End If
%>
	</B></span>
</p>
<center>
<form method="POST" action="sabio05.asp" onSubmit="return Verfica2()" name="Revisar">
<table width="90%">
	<tr>
		<td style="font-size: 12pt">
			<b>Dados para Revisar a Pergunta.</b>
		</td>
	</tr>
</table>
<%

' Grava informacoes no banco de dados
	Set Perguntas = Server.CreateObject("ADODB.Recordset")
	Perguntas.Open "SELECT * FROM Perg0015 WHERE Codigo = " & cod, Conexao
	alCet = Perguntas("Resposta")
%>
<table width="90%" cellspacing="2" cellpadding="1">
	<tr align="center" bgcolor="#4E5CA0" style="color: #FFFFFF; font-size: 10pt">
		<td width="5%"><b>Nº</b></td>
		<td width="95%"><b>Pergunta / Respostas (máximo 255 caracteres)</b></td>
	</tr>
	<tr bgcolor='#D7DBEC'>
		<td width="5%" align="center"><%=Perguntas("Codigo")%>
		<td nowrap align="right" width="95%">Perg.: <input type="text" style="width:480;background-color:#FFFFDF" name="perg" value='<%=Perguntas("Pergunta")%>'>
		<br>a <input type="radio" name="spec" value="a" onClick="respA(1)" <%If alCet = "a" Then%>checked<%End If%>> <input type="text" style="width:480" name="res1" value='<%=Perguntas("a")%>' maxlength=255>
		<br>b <input type="radio" name="spec" value="b" onClick="respA(2)" <%If alCet = "b" Then%>checked<%End If%>> <input type="text" style="width:480" name="res2" value='<%=Perguntas("b")%>' maxlength=255>
		<br>c <input type="radio" name="spec" value="c" onClick="respA(3)" <%If alCet = "c" Then%>checked<%End If%>> <input type="text" style="width:480" name="res3" value='<%=Perguntas("c")%>' maxlength=255>
		<br>d <input type="radio" name="spec" value="d" onClick="respA(4)" <%If alCet = "d" Then%>checked<%End If%>> <input type="text" style="width:480" name="res4" value='<%=Perguntas("d")%>' maxlength=255>
		<br>e <input type="radio" name="spec" value="e" onClick="respA(5)" <%If alCet = "e" Then%>checked<%End If%>> <input type="text" style="width:480" name="res5" value='<%=Perguntas("e")%>' maxlength=255></td>
	</tr>
	<tr>
		<td colspan=3><input type="hidden" name="codR" value='<%=Perguntas("Codigo")%>'><br><b>
<% If ok = 1 Or err1 = 1 Then %>
		<input type="button" value="ADM Perguntas" onClick="location.href='sabio03.asp'" style="border:0;background-color:rgb(255,255,255);background-image:url('../images/bt3.gif');width:115;height:25"> &nbsp; 
		<input type="submit" name="revPrem" value="Revisar Pergunta" style="border:0;background-color:rgb(255,255,255);background-image:url('../images/bt3.gif');width:115;height:25">
<% Else %>
		<input type="button" value="Cancelar-Voltar" onClick="history.back()" style="border:0;background-color:rgb(255,255,255);background-image:url('../images/bt3.gif');width:115;height:25"> &nbsp; 
		<input type="submit" name="revPrem" value="Revisar Pergunta" style="border:0;background-color:rgb(255,255,255);background-image:url('../images/bt3.gif');width:115;height:25">
<% End If %>
		</b></td>
	</tr>
</table>
</form>

<p align="left" style="font-size:12pt"><b>Veja como será apresentada aos Usuários.</b></p>

<table width="100%" cellspacing="0" cellpadding="0">
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#F94942" width="2%"><img src="../images/cant01s.gif"></td>
		<td bgcolor="#F94942" width="64%">
			<b><Span style="font-size: 9pt; color: #FFFFFF"><%=Perguntas("Pergunta")%></Span></b>
		</td>
		<td bgcolor="#F94942" width="2%" align="RIGHT"><img src="../images/cant02s.gif"></td>
		<td width="24%" align="CENTER" valign="TOP">
			<b><font style="font-size: 14pt; color: #F94942">Ganhe</font>
			<br><font style="font-size: 12pt">20 pontos</b></font>
		</td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#F94942" width="2%"><img src="../images/cant01ii.gif"></td>
		<td bgcolor="#F94942" width="64%"></td>
		<td bgcolor="#F94942" width="2%" align="RIGHT"><img src="../images/cant02ii.gif"></td>
		<td width="24%" align="CENTER" valign="TOP"></td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#FDB4B1" width="2%" valign="BOTTOM"><img src="../images/cant03i.gif"></td>
		<td bgcolor="#FDB4B1" width="64%">
			<table border="0" width="100%" cellspacing="0" cellpadding="2">
				<tr>
					<td width="3%" valign="top" nowrap><img src="../images/happy3.gif" name="n1" align="center" hspace="3"><input type="radio" name="Resposta"></td>
					<td width="97%" valign="top"><Span><%=Perguntas("a")%></Span></td>
				</tr>
				<tr>
					<td width="3%" valign="top" nowrap><img src="../images/happy3.gif" name="n2" align="center" hspace="3"><input type="radio" name="Resposta"></td>
					<td width="97%" valign="top"><Span><%=Perguntas("b")%></Span></td>
				</tr>
				<tr>
					<td width="3%" valign="top" nowrap><img src="../images/happy3.gif" name="n3" align="center" hspace="3"><input type="radio" name="Resposta"></td>
					<td width="97%" valign="top"><Span><%=Perguntas("c")%></Span></td>
				</tr>
				<tr>
					<td width="3%" valign="top" nowrap><img src="../images/happy3.gif" name="n4" align="center" hspace="3"><input type="radio" name="Resposta"></td>
					<td width="97%" valign="top"><Span><%=Perguntas("d")%></Span></td>
				</tr>
				<tr>
					<td width="3%" valign="top" nowrap><img src="../images/happy3.gif" name="n5" align="center" hspace="3"><input type="radio" name="Resposta"></td>
					<td width="97%" valign="top"><Span><%=Perguntas("e")%></Span></td>
				</tr>
			</table>
		</td>
		<td bgcolor="#FDB4B1" width="2%" align="RIGHT" valign="BOTTOM"><img src="../images/cant04i.gif"></td>
		<td width="24%" align="CENTER" valign="MIDDLE"><img src="../images/resp01.gif"></td>
	</tr>
</table>
<%
	Perguntas.Close
	Conexao.Close

	Set Perguntas = Nothing
	Set Conexao = Nothing
End If
%>
<p>
<hr>
* * * RG Sabichão Web - Versão 2000a * * *
<hr>

</center>
</body></html>
