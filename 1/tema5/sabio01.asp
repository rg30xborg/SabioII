<%@ LANGUAGE=VBSCRIPT %>
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

' Numero de perguntas no banco de dados na Sala e o ("hoje") é para computar o dia na Sala
	Set Conexao = Server.CreateObject("ADODB.Connection")
	'SQLServer =>  'Conexao.Open "Provider=SQLOLEDB.1;SERVER=187.45.196.225;DATABASE=aggora1;UID=aggora1;PWD=dade02;"
	Conexao.Open "DRIVER={MySQL ODBC 5.3 ANSI Driver};SERVER=187.45.196.225;PORT=3306;DATABASE=aggora1;USER=aggora1;PASSWORD=dade02;OPTION=3;"

	Set RS_Max = Server.CreateObject("ADODB.Recordset")
	RS_Max.Open "SELECT MAX(Codigo) AS max_Codigo FROM Perg0005", Conexao

	Session("Dados") = RS_Max("max_Codigo")
	RS_Max.Close
	Set RS_Max = Nothing
	Session("Hoje") = FormatDateTime(Date,2)

	Set UsuarioDados = Server.CreateObject("ADODB.Recordset")
	'UsuarioDados.CursorType = adOpenKeyset
	'UsuarioDados.LockType = adLockOptimistic
	UsuarioDados.Open "SELECT USD_Consec, USD_Sala5 FROM UserDados WHERE USR_ID = " & Session("id"), Conexao
	pCosc = UsuarioDados("USD_Consec")

	text = UsuarioDados("USD_Sala5")
	If text <> "new" Then
		pResp = Left(text, 1)
		pPerg = Mid(text, 7, inStr(text,"Sala:") - 7)
		pSala = Mid(text, (inStr(text, "Sala:") + 5), (inStr(text, "Data:") - 5) - inStr(text, "Sala:"))
		pData = Mid(text, (inStr(text, "Data:") + 5), (inStr(text, "Qtde:") - 5) - inStr(text, "Data:"))
		pQtde = Mid(text, (inStr(text, "Qtde:") + 5))
		pDias = DateDiff("d", Date, pData)
		If cInt(pDias) < 0 Then
			text = pResp & "Perg:" & pPerg & "Sala:" & pSala & "Data:" & Date & "Qtde:1"
		Else
			If cInt(pQtde) > Session("Dia") Or cInt(pPerg) > Session("Dados") Then
				Response.Redirect "http://www.aggora.com.br/sabio/1/tema5/sabio03.asp?ptSala=" & pSala
				Response.End
			End If
		End If
		Set Perguntas = Server.CreateObject("ADODB.Recordset")
		Perguntas.Open "SELECT * FROM Perg0005 WHERE Codigo = " & pPerg, Conexao
			perg1 = Perguntas("Pergunta")
			resp1 = Perguntas("a")
			resp2 = Perguntas("b")
			resp3 = Perguntas("c")
			resp4 = Perguntas("d")
			resp5 = Perguntas("e")
	Else
		pSala = 0
		Set Perguntas = Server.CreateObject("ADODB.Recordset")
		Perguntas.Open "SELECT * FROM Perg0005 WHERE Codigo = 1", Conexao
			perg1 = Perguntas("Pergunta")
			resp1 = Perguntas("a")
			resp2 = Perguntas("b")
			resp3 = Perguntas("c")
			resp4 = Perguntas("d")
			resp5 = Perguntas("e")
			text = Perguntas("Resposta") & "Perg:1Sala:0Data:" & Date & "Qtde:1"
	End If
		Perguntas.Close
		Set Perguntas = Nothing
	Conexao.Execute "UPDATE UserDados SET USD_Sala5 = '" & text & "' WHERE USR_ID = " & Session("id")
	UsuarioDados.Close
	Set UsuarioDados = Nothing

%><Script Language="JScript" src="../images/Simples1.js"></Script>
<html><head><title>Sabichao</title><style>@import url(../images/coUC.css);</style></head>
<body bgcolor="#FFFFFF" onLoad="OnCarg()">
<p style="font-size: 10pt">
	Assunto da Sala: <font color="#0588C0"><b>INFORMÁTICA</font><Span ID="NCalc"> - Carregando .... </Span></b>
	<span style="font-size: 8pt"><br>
	 - Pontos na Sala: <font color="#0000FF"><span ID="Salas"><%=pSala%></span> pontos</font>
	 - Consecutivas: <font color="#0000FF"><span ID="Consc"><%=pCosc%></span></font>
	 - Tempo: <font color="#0000FF"><span ID="Tempos">00min:00seg.</span></font>
	</span>
</p>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#F94942" width="2%"><img src="../images/cant01s.gif"></td>
		<td bgcolor="#F94942" width="64%">
			<b><Span style="font-size: 9pt; color: #FFFFFF" ID="NPerg"><%=perg1%></Span></b>
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
					<td width="3%" valign="top" nowrap><img src="../images/happy3.gif" name="n1" align="center" hspace="3"><input type="radio" name="Resposta" onClick="onImage(1)"></td>
					<td width="97%" valign="top"><Span ID="NResp1"><%=resp1%></Span></td>
				</tr>
				<tr>
					<td width="3%" valign="top" nowrap><img src="../images/happy3.gif" name="n2" align="center" hspace="3"><input type="radio" name="Resposta" onClick="onImage(2)"></td>
					<td width="97%" valign="top"><Span ID="NResp2"><%=resp2%></Span></td>
				</tr>
				<tr>
					<td width="3%" valign="top" nowrap><img src="../images/happy3.gif" name="n3" align="center" hspace="3"><input type="radio" name="Resposta" onClick="onImage(3)"></td>
					<td width="97%" valign="top"><Span ID="NResp3"><%=resp3%></Span></td>
				</tr>
				<tr>
					<td width="3%" valign="top" nowrap><img src="../images/happy3.gif" name="n4" align="center" hspace="3"><input type="radio" name="Resposta" onClick="onImage(4)"></td>
					<td width="97%" valign="top"><Span ID="NResp4"><%=resp4%></Span></td>
				</tr>
				<tr>
					<td width="3%" valign="top" nowrap><img src="../images/happy3.gif" name="n5" align="center" hspace="3"><input type="radio" name="Resposta" onClick="onImage(5)"></td>
					<td width="97%" valign="top"><Span ID="NResp5"><%=resp5%></Span></td>
				</tr>
			</table>
		</td>
		<td bgcolor="#FDB4B1" width="2%" align="RIGHT" valign="BOTTOM"><img src="../images/cant04i.gif"></td>
		<td width="24%" align="CENTER" valign="MIDDLE"><input type="image" width="97" height="56" id="botao" src="../images/bot0pg.gif" onClick="StartRGQuizWeb()" onMouseOver="onBotao()" onMouseOut="ofBotao()"></td>
	</tr>
</table>
<Script Language="JScript" SRC="/_Library/Defaull.js"></Script>
<%
	Set RS_Max = Server.CreateObject("ADODB.Recordset")
	RS_Max.Open "SELECT MAX(Codigo) AS max_Codigo FROM Dicas", Conexao
		CdDic = RS_Max("max_Codigo")
		Randomize Timer / RND
		CdDic = Int(CdDic * Rnd + 1)
	RS_Max.Close
	Set RS_Max = Nothing

	Set Perguntas = Server.CreateObject("ADODB.Recordset")
	Perguntas.Open "SELECT Dica,Cod FROM Dicas WHERE Codigo = " & CdDic, Conexao
		OlhoVivo = Perguntas("Dica")
		Cod = Perguntas("Cod")
		If Cod = 1 Then Cod = "VOCÊ SABIA QUE..." Else Cod = "PIADINHA..." End If
	Perguntas.Close
	Conexao.Close
	Set Perguntas = Nothing
	Set Conexao = Nothing
End If
%>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr> 
		<td>
			<br><p align="justify"><b>OLHO VIVO - </b><i><%=Cod%></i> <%=OlhoVivo%> - Se o seu assunto preferido ainda não
			apareceu, mande sua sugestão para <a href="mailto:contato@aggora.com.br">contato@aggora.com.br</a></p>
		</td>
	</tr>
</table>
</body></html>