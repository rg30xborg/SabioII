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
	RS_Max.Open "SELECT MAX(Codigo) AS max_Codigo FROM Perfil", Conexao
		Session("Dados") = RS_Max("max_Codigo")
	RS_Max.Close
	Set RS_Max = Nothing
	Session("Hoje") = FormatDateTime(Date,2)

	Set UsuarioDados = Server.CreateObject("ADODB.Recordset")
	'UsuarioDados.CursorType = adOpenKeyset
	'UsuarioDados.LockType = adLockOptimistic
	UsuarioDados.Open "SELECT USD_Consec, USD_1pf FROM UserDados WHERE USR_ID = " & Session("id"), Conexao
	pCosc = UsuarioDados("USD_Consec")
	text = UsuarioDados("USD_1pf")

	If text <> "new" Then
		pValr = Left(text, 3)
		pPerg = Mid(text, (inStr(text, "Perg:") + 5), (inStr(text, "Sala:") - 5) - inStr(text, "Perg:"))
		pData = Mid(text, (inStr(text, "Data:") + 5), (inStr(text, "Qtde:") - 5) - inStr(text, "Data:"))
		pQtde = Mid(text, (inStr(text, "Qtde:") + 5), (inStr(text, "Clik:") - 5) - inStr(text, "Qtde:"))
		pDias = DateDiff("d", Date, pData)
		If cInt(pDias) < -6 Then
			If cInt(pQtde) > Session("DiaP") Then
				text = pValr & "Perg:" & pPerg & "Sala:0Data:" & Date & "Qtde:1Clik:" & pPerg
			End If
		Else
			If cInt(pQtde) > Session("DiaP") Or cInt(pPerg) > Session("Dados") Then
				pSala = Mid(text, (inStr(text, "Sala:") + 5), inStr(text, "Data:") - (inStr(text, "Sala:") + 5))
				pClik = Mid(text, (inStr(text, "Clik:") + 5), inStr(text, "#R:") - (inStr(text, "Clik:") + 5))
				Response.Redirect "http://www.aggora.com.br/sabio/1/perfil/sabio03.asp?ptSala=" & pSala & "&cTema=" & pClik & "&cData=" & pData
				Response.End
			End If
		End If
		Set Perguntas = Server.CreateObject("ADODB.Recordset")
		Perguntas.Open "SELECT * FROM Perfil P, PerfilTema T WHERE T.TPR_Cod = P.TPR_Cod And P.Codigo = " & pPerg, Conexao
			perg1 = Perguntas("Pergunta")
			resp1 = Perguntas("a")
			resp2 = Perguntas("b")
			resp3 = Perguntas("c")
			tema1 = Perguntas("Tema")
	Else
		Set Perguntas = Server.CreateObject("ADODB.Recordset")
		Perguntas.Open "SELECT * FROM Perfil P, PerfilTema T WHERE T.TPR_Cod = P.TPR_Cod And P.Codigo = 1", Conexao
			perg1 = Perguntas("Pergunta")
			resp1 = Perguntas("a")
			resp2 = Perguntas("b")
			resp3 = Perguntas("c")
			tema1 = Perguntas("Tema")
			valr1 = Perguntas("aa") & Perguntas("bb") & Perguntas("cc")
			text = valr1 & "Perg:1Sala:0Data:" & Date & "Qtde:1Clik:1"
	End If
		Perguntas.Close
		Set Perguntas = Nothing
		Conexao.Execute "UPDATE UserDados SET USD_1pf = '" & text & "' WHERE USR_ID = " & Session("id")
	UsuarioDados.Close
	Set UsuarioDados = Nothing

%><Script Language="JScript" src="../images/SimplesP.js"></Script>
<html><head><title>Sabichao</title><style>@import url(../images/coUC.css);</style></head>
<body bgcolor="#FFFFFF" onLoad="OnCarg()">
<p style="font-size: 10pt">
	Sala de: <font color="#0588C0"><b>TESTE SEU PERFIL</font><Span ID="NCalc"> - Carregando .... </Span></b>
	<span style="font-size: 8pt"><br>
	 - AQUI VOCÊ GANHA PONTOS MOSTRANDO SEUS CEREBELOS
	</span>
</p>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#44AA00" width="2%"><img src="../images/cant01s.gif"></td>
		<td bgcolor="#44AA00" width="64%" style="font-size: 9pt; color: #FFFFFF">
			<b><span style="font-size:12pt">Verifique seu Perfil junto com o Sabichão</span>
			<br>TEMA: <Span ID="NTema" style="color: #FFFF00"><%=tema1%></Span>
			<br><br><Span ID="NPerg"><%=perg1%></Span></b>
		</td>
		<td bgcolor="#44AA00" width="2%" align="RIGHT"><img src="../images/cant02s.gif"></td>
		<td width="24%" align="CENTER" valign="TOP">
			<b><font style="font-size: 14pt; color: #F94942">Ganhe</font>
			<br><font style="font-size: 12pt">200 pontos</b></font><br>(ao completar)
		</td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#44AA00" width="2%"><img src="../images/cant01ii.gif"></td>
		<td bgcolor="#44AA00" width="64%"></td>
		<td bgcolor="#44AA00" width="2%" align="RIGHT"><img src="../images/cant02ii.gif"></td>
		<td width="24%" align="CENTER" valign="TOP"></td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#AAEE22" width="2%" valign="BOTTOM"><img src="../images/cant03i.gif"></td>
		<td bgcolor="#AAEE22" width="64%">
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
			</table>
		</td>
		<td bgcolor="#AAEE22" width="2%" align="RIGHT" valign="BOTTOM"><img src="../images/cant04i.gif"></td>
		<td width="24%" align="CENTER" valign="MIDDLE"><input type="image" width="97" height="56" id="botao" name="botao" src="../images/bot0pg.gif" onClick="StartRGQuizWeb()" onMouseOver="onBotao()" onMouseOut="ofBotao()"></td>
	</tr>
</table>
<%
	Set Perguntas = Nothing
	Set Conexao = Nothing
End If
%>

<p>
<table cellspacing="0" cellpadding="0" width="100%" style="font-family: Arial; font-size:9pt">
	<tr>
		<td>DICA: Aqui não tem resposta certa ou errada, é só completar as 10 Perguntas da semana para faturar
		200 PONTOS EXTRAS no <b>Teste&nbsp;seu&nbsp;Perfil.</b>
		<p align="justify"><span style="font-family: Verdana; font-size:12pt"> <b>SEU PERFIL no Sabichão</b>
		</span> - Vamos ver qual o seu perfil e sua personalidade atravez destas perguntas. Com elas o Sabichão
			pode definir qual a melhor interação e conteúdo que o Site pode oferecer a você. Os pontos serão
			adicionados ao seu total pela Promoção assim que você completar o teste.
			- Sete dias após concluir este TESTE você tera um diferente de esperando.</p>
		</td>
	</TR>
</TABLE>
<p>
</body></html>

