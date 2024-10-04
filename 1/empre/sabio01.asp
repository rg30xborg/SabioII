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
	RS_Max.Open "SELECT MAX(Codigo) AS max_Codigo FROM Empresas", Conexao

	Session("Dados") = RS_Max("max_Codigo")
	RS_Max.Close
	Set RS_Max = Nothing
	Session("Hoje") = FormatDateTime(Date,2)

	Set UsuarioDados = Server.CreateObject("ADODB.Recordset")
	'UsuarioDados.CursorType = adOpenKeyset
	'UsuarioDados.LockType = adLockOptimistic
	UsuarioDados.Open "SELECT USD_Consec, USD_1em FROM UserDados WHERE USR_ID = " & Session("id"), Conexao
	pCosc = UsuarioDados("USD_Consec")

	text = UsuarioDados("USD_1em")
	If text <> "new" Then
		pResp = Left(text, 1)
		pPerg = Mid(text, 7, inStr(text,"Sala:") - 7)
		pSala = Mid(text, (inStr(text, "Sala:") + 5), (inStr(text, "Data:") - 5) - inStr(text, "Sala:"))
		pData = Mid(text, (inStr(text, "Data:") + 5), (inStr(text, "Qtde:") - 5) - inStr(text, "Data:"))
		pQtde = Mid(text, (inStr(text, "Qtde:") + 5), (inStr(text, "Clik:") - 5) - inStr(text, "Qtde:"))
		pClik = Mid(text, (inStr(text, "Clik:") + 5))
		pDias = DateDiff("d", Date, pData)
		If cInt(pDias) < 0 Then
			text = pResp & "Perg:" & pPerg & "Sala:" & pSala & "Data:" & Date & "Qtde:1Clik:no"
		Else
			If cInt(pQtde) > Session("DiaE") Or cInt(pPerg) > Session("Dados") Then
				Response.Redirect "http://www.aggora.com.br/sabio/1/empre/sabio03.asp?ptSala=" & pSala
				Response.End
			End If
		End If
		Set Perguntas = Server.CreateObject("ADODB.Recordset")
		Perguntas.Open "SELECT * FROM Empresas E, Patrocinio P WHERE P.PAT_Cod = E.PAT_Cod And E.Codigo = " & pPerg, Conexao
			perg1 = Perguntas("Pergunta")
			resp1 = Perguntas("a")
			resp2 = Perguntas("b")
			resp3 = Perguntas("c")
			resp4 = Perguntas("d")
			resp5 = Perguntas("e")
			eEmpr = Perguntas("PAT_Nome")
			lEmpr = Perguntas("PAT_Cod")
			iEmpr = Perguntas("Imagem")
	Else
		pSala = 0
		Set Perguntas = Server.CreateObject("ADODB.Recordset")
		Perguntas.Open "SELECT * FROM Empresas E, Patrocinio P WHERE P.PAT_Cod = E.PAT_Cod And E.Codigo = 1", Conexao
			perg1 = Perguntas("Pergunta")
			resp1 = Perguntas("a")
			resp2 = Perguntas("b")
			resp3 = Perguntas("c")
			resp4 = Perguntas("d")
			resp5 = Perguntas("e")
			eEmpr = Perguntas("PAT_Nome")
			lEmpr = Perguntas("PAT_Cod")
			iEmpr = Perguntas("Imagem")
			text = Perguntas("Resposta") & "Perg:1Sala:0Data:" & Date & "Qtde:1Clik:no"
	End If
		Perguntas.Close
		Set Perguntas = Nothing
	Conexao.Execute "UPDATE UserDados SET USD_1em = '" & text & "' WHERE USR_ID = " & Session("id")
	UsuarioDados.Close
	Set UsuarioDados = Nothing

%><Script Language="JScript" src="../images/SimplesE.js"></Script>
<Script Language="JScript">empresa = "<%=eEmpr%>"</Script>
<html><head><title>Sabichao</title><style>@import url(../images/coUC.css);</style></head>
<body bgcolor="#FFFFFF" onLoad="OnCarg()">
<p style="font-size: 10pt">
	Assunto da Sala: <font color="#0588C0"><b>SUA EMPRESA</font><Span ID="NCalc"> - Carregando .... </Span></b>
	<span style="font-size: 8pt"><br>
	 - Pontos na Sala: <font color="#0000FF"><span ID="Salas"><%=pSala%></span> pontos</font>
	 - Consecutivas: <font color="#0000FF"><span ID="Consc"><%=pCosc%></span></font>
	 - Tempo: <font color="#0000FF"><span ID="Tempos">00min:00seg.</span></font>
	</span>
</p>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#585858" width="2%"><img src="../images/cant01s.gif"></td>
		<td bgcolor="#585858" width="64%" style="font-size: 9pt; color: #FFFFFF">
			<b><span style="font-size:12pt">Coloque sua Empresa neste Espaço.</span>
			<br><Span ID="NPerg"><%=perg1%></Span></b>
		</td>
		<td bgcolor="#585858" width="2%" align="RIGHT"><img src="../images/cant02s.gif"></td>
		<td width="24%" align="CENTER" valign="TOP">
			<b><font style="font-size: 14pt; color: #F94942">Ganhe</font>
			<br><font style="font-size: 12pt">20 pontos</b></font>
		</td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#585858" width="2%"><img src="../images/cant01ii.gif"></td>
		<td bgcolor="#585858" width="64%"></td>
		<td bgcolor="#585858" width="2%" align="RIGHT"><img src="../images/cant02ii.gif"></td>
		<td width="24%" align="CENTER" valign="TOP"></td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#C0C0C0" width="2%" valign="BOTTOM"><img src="../images/cant03i.gif"></td>
		<td bgcolor="#C0C0C0" width="64%">
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
		<td bgcolor="#C0C0C0" width="2%" align="RIGHT" valign="BOTTOM"><img src="../images/cant04i.gif"></td>
		<td width="24%" align="CENTER" valign="MIDDLE"><input type="image" width="97" height="56" id="botao" name="botao" src="../images/bot0pg.gif" onClick="StartRGQuizWeb()" onMouseOver="onBotao()" onMouseOut="ofBotao()"><p><Span ID="nEmpr"><a href='sabio04.asp?ref=<%=lEmpr%>' target='_parent'><img src='/sabio/banner/<%=iEmpr%>' width=97 height=56 border=0 alt='Home Page da <%=eEmpr%>'></a></Span></p></td>
	</tr>
</table>
<%
	Set Perguntas = Nothing
	Set Conexao = Nothing
End If
%>
<Script Language="JScript" SRC="/_Library/Defaull.js"></Script>
<p>
<table cellspacing="0" cellpadding="0" width="100%" style="font-family: Arial; font-size:9pt">
	<tr>
		<td>DICA: Clique no <b>Banner</b> abaixo do botão [Responder] para tirar dúvidas e ainda faturar
		100 PONTOS EXTRAS no <b>Clique&nbsp;Premiado.</b>
		<p align="justify"><span style="font-family: Verdana; font-size:12pt"> <b>Sua Empresa no Sabichão</b>
		</span> - Esta é uma área com Perguntas, Curiosidades e Dicas sobre as Empresas que apoiam e investem
		no Site Sabichão. Caso sua Empresa tenha interesse em apoiar este projeto, preencha o formulário
		<b>Anuncie</b> acima nesta página ou contate-nos via e-mail em:
		<a href="mailto:rg30@bol.com.br">Sua Empresa</a> que entraremos em contato com você.</p>
		</td>
	</TR>
</TABLE>
<p>
</body></html>

