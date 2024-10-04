<%@ LANGUAGE=VBSCRIPT %>
<%
	Response.Expires = 0

'                   If inStr(Request.ServerVariables("HTTP_HOST"), "www.aggora.com.br") = 0 Then
'                   	Response.Redirect "http://www.aggora.com.br/sabio/help.htm"
'                   	Response.End
'                   Else
	If Session("IPUserSab") = "" Or Session("mail") = "" Then
		Response.Redirect "sabio12.asp"                 'http://www.aggora.com.br/sabio/1/
		Response.End
	End If

Function Salas(Sala)
	Select Case Sala
		Case 1  nSala = "Esportes I"
		Case 2  nSala = "Enforcado"
		Case 3  nSala = "Incógnita"
		Case 4  nSala = "Temporal"
		Case 5  nSala = "Informática"
		Case 6  nSala = "Variedades"
		Case 7  nSala = "Televisão"
		Case 8  nSala = "Esportes II"
		Case 9  nSala = "Cinema"
		Case 10 nSala = "Trânsito"
		Case 11 nSala = "Atualidades"
		Case 12 nSala = "Na Escola"
		Case 13 nSala = "Dicionário"
		Case 14 nSala = "Seu Talento"
		Case 15 nSala = "De Usuários"
		Case Else nSala = "Esportes I"
	End Select
	Response.Write nSala
End Function

%><Script Language="JScript" src="scripts/Simples6.js"></Script>
<html><head><title>Sabichao</title><style>@import url(images/coUC.css);</style>
</head><body bgcolor="#FFFFFF" onLoad="Aviso2('document.somregis')">
<p style="font-size: 10pt">
	Relação Geral para: <font color="#0588C0"><b><%=Session("IPUserSab")%></font><Span ID="NCalc"> - Processando .... </Span></b>
	<span style="font-size: 8pt"><br>
	 - POSIÇÃO DE SUAS SALAS NO SABICHÃO - EM DETALHES
	</span>
</p>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#F94942" width="2%"><img src="images/cant01s.gif"></td>
		<td bgcolor="#F94942" width="64%" style="font-size: 9pt; color: #FFFFFF">
			<b><p  align="justify"><br>NO MENU SALAS-QUIZ: caso você
			ainda tenha perguntas disponíveis para hoje, os links e a seta CONTINUAR serão apresentados na tabela
			abaixo.</p></b>
		</td>
		<td bgcolor="#F94942" width="2%" align="RIGHT"><img src="images/cant02s.gif"></td>
		<td width="24%" align="CENTER" valign="TOP"><img src="images/happy3.gif" hspace=5></td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#F94942" width="2%"><img src="images/cant01ii.gif"></td>
		<td bgcolor="#F94942" width="64%"></td>
		<td bgcolor="#F94942" width="2%" align="RIGHT"><img src="images/cant02ii.gif"></td>
		<td width="24%" align="CENTER" valign="TOP"></td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#FDB4B1" width="2%" valign="BOTTOM"><img src="images/cant03i.gif"></td>
		<td bgcolor="#FDB4B1" width="64%"><br>
<table bgcolor="#FFFFFF" width="100%" cellspacing="0" cellpadding="0">
	<tr>
		<td>
		<table border="0" width="100%" cellspacing="2" cellpadding="1" style="color: #0000FF; font-size: 10pt">
			<tr align="center" bgcolor="#FFCC66">
				<td width="25%" ><b>Sala</b></td>
				<td width="7%"><b>Pf.</b></td>
				<td width="7%"><b>Rc.</b></td>
				<td width="50%"><b>Data ou Link - Status</b></td>
				<td width="11%"><b>Pts</b></td>
			</tr>
		</table>
		<table border="0" width="100%" cellspacing="2" cellpadding="1">
<%

	Set Conexao = Server.CreateObject("ADODB.Connection")
	'SQLServer =>  'Conexao.Open "Provider=SQLOLEDB.1;SERVER=187.45.196.225;DATABASE=aggora1;UID=aggora1;PWD=dade02;"
	Conexao.Open "DRIVER={MySQL ODBC 5.3 ANSI Driver};SERVER=187.45.196.225;PORT=3306;DATABASE=aggora1;USER=aggora1;PASSWORD=dade02;OPTION=3;"

	Set UsuarioDados = Server.CreateObject("ADODB.Recordset")
	UsuarioDados.Open "SELECT * FROM UserDados WHERE USR_ID = " & Session("id"), Conexao

	Sala = 1
	Public nSala
	Do While Sala < 16
		text = UsuarioDados("USD_Sala" & Sala)
		If text <> "new" Then
			pSala = Mid(text, (inStr(text, "Sala:") + 5), (inStr(text, "Data:") - 5) - inStr(text, "Sala:"))
			pPerg = Mid(text, (inStr(text, "Perg:") + 5), (inStr(text, "Sala:") - 5) - inStr(text, "Perg:")) - 1
			pCert = pSala / 20
			pData = Mid(text, (inStr(text, "Data:") + 5), (inStr(text, "Qtde:") - 5) - inStr(text, "Data:"))
			pQtde = Mid(text, (inStr(text, "Qtde:") + 5))
			If Sala = 2 Or Sala = 3 Or Sala = 4 Then
				If Sala <> 4 Then pCert = "-" End If
				pQtde = pQtde + 1
				pPerg = pPerg + 1
			End If
%>
			<tr bgcolor='#FFFFDF' align="center">
				<td width='25%' align="left"><%Salas(Sala)%></td> 
				<td width='7%'><%=pPerg%></td>
				<td width='7%'><%=pCert%></td>
				<td width='50%' align="left">
<%
			pDias = DateDiff("d", Date, pData)
			If cInt(pDias) = 0 And cInt(pQtde) > Session("Dia") Then
				Response.Write(pData & " - Concluída")
			Else 
				if sNext = "" Then
					sNext = Sala
					sNome = nSala
					End If
				Response.Write("<a href=http://www.aggora.com.br/sabio/1/tema" & Sala & "/sabio01.asp>Link " & nSala & "</a> - Disponível")
			End If
%>
				</td> 
				<td width='11%'><%=pSala%></td> 
			</tr>
<%		Else%>
			<tr bgcolor='#FFFFEF'>
				<td width='25%'><%Salas(Sala)%></td>
				<td width='14%' colspan=2></td>
				<td width='50%'><a href=http://www.aggora.com.br/sabio/1/tema<%=Sala%>/sabio01.asp>Link <%=nSala%></a> - Disponível</td>
				<td width='11%'></td>
			</tr>
<%
			if sNext = "" Then
				sNext = Sala
				sNome = nSala
			End If
		End If
		Sala = Sala + 1
	Loop
%>
		</table>
		</td>
	</tr>
</table>Pf. = Perguntas Feitas - Rc = Respostas Certas<br>
		</td>
		<td bgcolor="#FDB4B1" width="2%" align="RIGHT" valign="BOTTOM"><img src="images/cant04i.gif"></td>
		<td width="24%" align="CENTER" valign="MIDDLE">
<%	If sNext <> "" Then %>
<a href="http://www.aggora.com.br/sabio/1/tema<%=sNext%>/sabio01.asp"><img name="botao" alt="Vai para <%=sNome%>" width="97" height="56" src="images/cont001.gif" onMouseOver="onBotao()" onMouseOut="ofBotao()" border=0></a>
<%	Else %>
<a href="sabio07.asp">SORTEIO<br>de<br>PRÊMIOS</a>
<%	End If%>
		</td>
	</tr>
</table>
<p>
<hr>
<p>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#44AA00" width="2%"><img src="images/cant01s.gif"></td>
		<td bgcolor="#44AA00" width="64%" style="font-size: 9pt; color: #FFFFFF">
			<b><p  align="justify"><br>NO MENU PROMOÇÕES: caso você
			ainda tenha perguntas disponíveis para hoje, os links e a seta CONTINUAR serão apresentados na tabela
			abaixo.</p></b>
		</td>
		<td bgcolor="#44AA00" width="2%" align="RIGHT"><img src="images/cant02s.gif"></td>
		<td width="24%" align="CENTER" valign="TOP"><img src="images/happy3.gif" hspace=5></td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#44AA00" width="2%"><img src="images/cant01ii.gif"></td>
		<td bgcolor="#44AA00" width="64%"></td>
		<td bgcolor="#44AA00" width="2%" align="RIGHT"><img src="images/cant02ii.gif"></td>
		<td width="24%" align="CENTER" valign="TOP"></td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#AAEE22" width="2%" valign="BOTTOM"><img src="images/cant03i.gif"></td>
		<td bgcolor="#AAEE22" width="64%"><br>
<table bgcolor="#FFFFFF" width="100%" cellspacing="0" cellpadding="0">
	<tr>
		<td>
		<table border="0" width="100%" cellspacing="2" cellpadding="1" style="color: #0000FF; font-size: 10pt">
			<tr align="center" bgcolor="#FFCC66">
				<td width="25%" ><b>Sala</b></td>
				<td width="7%"><b>Pf.</b></td>
				<td width="7%"><b>Rc.</b></td>
				<td width="50%"><b>Data ou Link - Status</b></td>
				<td width="11%"><b>Pts</b></td>
			</tr>
		</table>
		<table border="0" width="100%" cellspacing="2" cellpadding="1">
<%
	sNext = ""
	text = UsuarioDados("USD_1em")
	If text <> "new" Then
		pSala = Mid(text, (inStr(text, "Sala:") + 5), (inStr(text, "Data:") - 5) - inStr(text, "Sala:"))
		pPerg = Mid(text, (inStr(text, "Perg:") + 5), (inStr(text, "Sala:") - 5) - inStr(text, "Perg:")) - 1
		pCert = pSala / 20
		pData = Mid(text, (inStr(text, "Data:") + 5), (inStr(text, "Qtde:") - 5) - inStr(text, "Data:"))
		pQtde = Mid(text, (inStr(text, "Qtde:") + 5), (inStr(text, "Clik:") - 5) - inStr(text, "Qtde:"))
%>
			<tr bgcolor='#FFFFDF' align="center">
				<td width='25%' align="left">Sua Empresa</td> 
				<td width='7%'><%=pPerg%></td>
				<td width='7%'><%=pCert%></td>
				<td width='50%' align="left">
<%
		pDias = DateDiff("d", Date, pData)
		If cInt(pDias) = 0 And cInt(pQtde) > Session("DiaE") Then
			Response.Write(pData & " - Concluída")
		Else 
			if sNext = "" Then
				sNext = "empre"
				sNome = "Sua Empresa"
			End If
			Response.Write("<a href=http://www.aggora.com.br/sabio/1/empre/sabio01.asp>Link Sua Empresa</a> - Disponível")
		End If
%>
				</td> 
				<td width='11%'><%=pSala%></td> 
			</tr>
<%
	Else
		if sNext = "" Then
			sNext = "empre"
			sNome = "Sua Empresa"
		End If
%>
			<tr bgcolor='#FFFFEF'>
				<td width='25%'>Sua Empresa</td> 
				<td width='14%' colspan=2></td>
				<td width='50%'><a href=http://www.aggora.com.br/sabio/1/empre/sabio01.asp>Link Sua Empresa</a> - Disponível</td>
				<td width='11%'></td>
			</tr>
<%
	End If
	text = UsuarioDados("USD_1pf")
	If text <> "new" Then
		pSala = 0
		pPerg = Mid(text, (inStr(text, "Perg:") + 5), (inStr(text, "Sala:") - 5) - inStr(text, "Perg:")) - 1
		pData = Mid(text, (inStr(text, "Data:") + 5), (inStr(text, "Qtde:") - 5) - inStr(text, "Data:"))
		pQtde = Mid(text, (inStr(text, "Qtde:") + 5), (inStr(text, "Clik:") - 5) - inStr(text, "Qtde:"))
%>
			<tr bgcolor='#FFFFDF' align="center">
				<td width='25%' align="left">Seu Analista</td> 
				<td width='7%'><%=pPerg%></td>
				<td width='7%'>-</td>
				<td width='50%' align="left">
<%
		pDias = DateDiff("d", Date, pData)

		If cInt(pDias) < -6 Or cInt(pQtde) <= Session("DiaP") Then
				if sNext = "" Then
					sNext = "perfil"
					sNome = "Seu Analista"
				End If
				Response.Write("<a href=http://www.aggora.com.br/sabio/1/perfil/sabio01.asp>Link Seu Analista</a> - Disponível")
		Else
				pSala = 200
				Response.Write(pData & " - Concluída")
		End If
%>
				</td> 
				<td width='11%'><%=pSala%></td> 
			</tr>
<%
	Else
		if sNext = "" Then
			sNext = "perfil"
			sNome = "Seu Analista"
		End If
%>
			<tr bgcolor='#FFFFEF'>
				<td width='25%'>Seu Analista</td> 
				<td width='14%' colspan=2></td>
				<td width='50%'><a href=http://www.aggora.com.br/sabio/1/perfil/sabio01.asp>Link Seu Analista</a> - Disponível</td>
				<td width='11%'></td>
			</tr>
<%	End If%>
		</table>
		</td>
	</tr>
</table>Pf. = Perguntas Feitas - Rc = Respostas Certas<br>
		</td>
		<td bgcolor="#AAEE22" width="2%" align="RIGHT" valign="BOTTOM"><img src="images/cant04i.gif"></td>
		<td width="24%" align="CENTER" valign="MIDDLE">
<%	If sNext <> "" Then %>
<a href="http://www.aggora.com.br/sabio/1/<%=sNext%>/sabio01.asp"><img name="botau" alt="Vai para <%=sNome%>" width="97" height="56" src="images/cont001.gif" onMouseOver="onBotau()" onMouseOut="ofBotau()" border=0></a>
<%	Else%>
<a href="sabio08.asp">CONFIRA<br>sua<br>POSIÇÃO</a>
<%	End If%>
		</td>
	</tr>
</table>
<p>
<hr>
<p>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#4444FF" width="2%"><img src="images/cant01s.gif"></td>
		<td bgcolor="#4444FF" width="64%" style="font-size: 9pt; color: #FFFFFF">
			<b><p  align="justify"><br>NO MENU PROMOÇÕES: Salas com acesso livre e permanente.</p></b>
		</td>
		<td bgcolor="#4444FF" width="2%" align="RIGHT"><img src="images/cant02s.gif"></td>
		<td width="24%" align="CENTER" valign="TOP"><img src="images/happy3.gif" hspace=5></td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#4444FF" width="2%"><img src="images/cant01ii.gif"></td>
		<td bgcolor="#4444FF" width="64%"></td>
		<td bgcolor="#4444FF" width="2%" align="RIGHT"><img src="images/cant02ii.gif"></td>
		<td width="24%" align="CENTER" valign="TOP"></td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#7FCCFF" width="2%" valign="BOTTOM"><img src="images/cant03i.gif"></td>
		<td bgcolor="#7FCCFF" width="64%"><br>
<table bgcolor="#FFFFFF" width="100%" cellspacing="0" cellpadding="0">
	<tr>
		<td>
		<table border="0" width="100%" cellspacing="2" cellpadding="1" style="color: #0000FF; font-size: 10pt">
			<tr align="center" bgcolor="#FFCC66">
				<td width="39%" ><b>Sala - Acesso</b></td>
				<td width="50%"><b>Link - Status</b></td>
				<td width="11%"><b>Pts</b></td>
			</tr>
		</table>
<%
	pSala = UsuarioDados("USD_1gm")
	If pSala <> 0 Then
		pPerg = UsuarioDados("USD_Acesso")
	Else
		pPerg = "Nenhum acesso"
	End If
%>
		<table border="0" width="100%" cellspacing="2" cellpadding="1">
			<tr bgcolor='#FFFFDF'>
				<td width='39%'>Menu Jogos - <%=pPerg%></td> 
				<td width='50%'><a href=http://www.aggora.com.br/sabio/1/sorte/sabio01.asp>Link Menu de Jogos</a> - Disponível</td>
				<td width='11%' align="center"><%=pSala%></td> 
			</tr>
<%
	pSala = UsuarioDados("USD_Amigo")
	If pSala <> 0 Then
		pPerg = UsuarioDados("USD_Acesso")
	Else
		pPerg = "Sem Registros"
	End If
%>
			<tr bgcolor='#FFFFDF'>
				<td width='39%'>Promoção I - <%=pPerg%></td> 
				<td width='50%'><a href=http://www.aggora.com.br/sabio/1/promo/sabio01.asp>Link Indique Amigos</a> - Disponível</td>
				<td width='11%' align="center"><%=pSala%></td> 
			</tr>
<%
	pSala = UsuarioDados("USD_Pergunta")
	If pSala <> 0 Then
		pPerg = UsuarioDados("USD_Acesso")
	Else
		pPerg = "Sem Registros"
	End If
	
	Set Temas = Nothing
	UsuarioDados.Close
	Conexao.Close
	Set UsuarioDados = Nothing
	Set Conexao = Nothing
'                   End If
%>
			<tr bgcolor='#FFFFDF'>
				<td width='39%'>Promoção II - <%=pPerg%></td> 
				<td width='50%'><a href=http://www.aggora.com.br/sabio/1/promo/sabio03.asp>Link De Usuários</a> - Disponível</td>
				<td width='11%' align="center"><%=pSala%></td> 
			</tr>
		</table>
		</td>
	</tr>
</table><br>
		</td>
		<td bgcolor="#7FCCFF" width="2%" align="RIGHT" valign="BOTTOM"><img src="images/cant04i.gif"></td>
		<td width="24%" align="CENTER" valign="MIDDLE"><a href="http://www.aggora.com.br/sabio/1/sorte/sabio01.asp"><img
		name="botaa" alt="Vai para Menu Jogos" width="97" height="56" src="images/cont001.gif"
		onMouseOver="onBotaa()" onMouseOut="ofBotaa()" border=0></a>
		</td>
	</tr>
</table><br>
<center>
<hr>
* * * RG Sabichão Web - Versão 2000a * * *
<hr>
</center>
</body></html>