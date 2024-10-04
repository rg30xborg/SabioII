<%@ LANGUAGE=VBSCRIPT %>
<%
	Response.Expires = 0

'               If inStr(Request.ServerVariables("HTTP_HOST"), "www.aggora.com.br") = 0 Then
'               	Response.Redirect "http://www.aggora.com.br/sabio/help.htm"
'               	Response.End
'               Else
	If Session("IPUserSab") = "" Or Session("mail") = "" Then
		Response.Redirect "sabio12.asp"             'http://www.aggora.com.br/sabio/1/
		Response.End
	End If

	Set Conexao = Server.CreateObject("ADODB.Connection")
	'SQLServer =>  'Conexao.Open "Provider=SQLOLEDB.1;SERVER=187.45.196.225;DATABASE=aggora1;UID=aggora1;PWD=dade02;"
	Conexao.Open "DRIVER={MySQL ODBC 5.3 ANSI Driver};SERVER=187.45.196.225;PORT=3306;DATABASE=aggora1;USER=aggora1;PASSWORD=dade02;OPTION=3;"

	Set UsuarioDados = Server.CreateObject("ADODB.Recordset")
	'UsuarioDados.CursorType = adOpenKeyset
	'UsuarioDados.LockType = adLockOptimistic
	UsuarioDados.Open "SELECT USD_Total, USD_Apts FROM UserDados WHERE USR_ID = " & Session("id"), Conexao
		pTotal = UsuarioDados("USD_Total")
		pSala = UsuarioDados("USD_Apts")
	UsuarioDados.Close
	Set UsuarioDados = Nothing

%><Script Language="JScript"> var pTotal = <%=pTotal%>, pNome = "<%=Session("IPUserSab")%>" </Script>
<Script Language="JScript" src="images/SimplesB.js"></Script><html><head>
<title>Sabichao</title><style>@import url(images/coUC.css);</style></head>
<body bgcolor="#FFFFFF" onLoad="OnCarg()">
<p style="font-size: 10pt">
	Sala de : <font color="#0588C0"><b>PRÊMIOS</font><Span ID="NCalc"> - Carregando .... </Span></b>
	<span style="font-size: 8pt"><br>
	 - ARRISQUE SEUS PONTOS NOS PRÊMIOS DO SABICHÃO - <font color="#0000FF"><b>Disponíveis para aposta: <span ID="Total"><%=pTotal%></span> Pontos</b></font>
	</span>
</p>
<center><table border="0" width="90%" cellspacing="0" cellpadding="0">
	<tr valign="TOP"> 
		<td width="2%"></td>
		<td bgcolor="#ffcc00" width="2%"><img src="images/cant01s.gif"></td>
		<td bgcolor="#ffcc00" width="94%">VOCÊ JA INVESTIU (<%=pSala%>) PONTOS NOS SORTEIOS DO SITE
			<span style="font-size: 9pt; align:justify;">
				<br><b>Aqui apresentamos os Prêmios (*) que serão sorteados nos próximos dias. Coloque 
				livremente seus pontos no(s) Prêmio(s) que lhe agradar, depois, é só aguardar e acompanhar as
				datas dos sorteios que estiver concorrendo. (Página em Desenvolvimento).</b>
			</span>
		</td>
		<td bgcolor="#ffcc00" width="2%" align="RIGHT"><img src="images/cant02s.gif"></td>
		<!-- <td width="24%" align="CENTER" valign="middle"></td> -->
	</tr>
	<tr valign="TOP"> 
		<td width="2%"></td>
		<td bgcolor="#ffcc00" width="2%"><img src="images/cant01ii.gif"></td>
		<td bgcolor="#ffcc00" width="70%"></td>
		<td bgcolor="#ffcc00" width="2%" align="RIGHT"><img src="images/cant02ii.gif"></td>
		<!-- <td width="24%" align="CENTER" valign="TOP"></td> -->
	</tr>
	<tr valign="TOP"> 
		<td width="2%"></td>
		<td bgcolor="#ffff99" width="2%" valign="BOTTOM"><img src="images/cant03i.gif"></td>
		<td bgcolor="#ffff99" width="70%">
			<form name="Aposta">
			<table border="0" width="100%" cellspacing="0" cellpadding="5">
				<tr>
					<td><b>Pr&ecirc;mio / Apoio</b></td>
					<td><b>Data do Sorteio</b></td>
					<td><b>Apostas / Total</b></td>
					<td><b>Apostar</b></td>
				</tr>
<%

	Set Premios = Server.CreateObject("ADODB.Recordset")
	Premios.Open "SELECT *, HEX(UUID) as pUUID FROM Premios P, Patrocinio DE WHERE P.PAT_Cod = DE.PAT_Cod ORDER BY P.PRE_Data", Conexao

' Checa se existem produtos no banco de dados
	If Premios.Eof Then 
%>
				<tr bgcolor="#FFD699"> 
					<td colspan=4><b>Nenhum Premios programado para o momento. Aguarde para Breve.</td>
				</tr>
<%
	Else
		Public Pontos

		Sub PtPrem(MApts)
			If MApts <> "0" Then
				Response.Write "Tô nessa: " & Pontos
			Else
				Response.Write "Não apostei aki!"
			End If
		End Sub

		Sub PgPrem(TPonts)
			If Pontos = "0" Then			
				Response.Write "S:" & TPonts
			Else
				'Response.Write "1:" & Round(CDbl(TPonts) / CDbl(Pontos))
				Response.Write "T:" & TPonts
			End If
			
		End Sub

		bgcolor = "#FFFFDF"
		ultMdia = 1
		Set ApostaPremio = Server.CreateObject("ADODB.Recordset")
		'Premios.MoveFirst
		While Not Premios.EOF
			pDias = DateDiff("d", Date, Premios("PRE_Data"))
			pUuid = Premios("pUUID")
			If (pDias >= 0 And pDias < 7) Or (Premios("PRE_Special") <> "0" And pDias >= 0) Then
				codigo = Premios("PRE_Cod")
				If bgcolor = "#FFFFDF" Then 
					bgcolor = "#FFEDA7"
				Else
					bgcolor = "#FFFFDF"
				End If

				ApostaPremio.Open "SELECT SUM(USA_Apts) MyTOT FROM Premios_Apostas WHERE USR_ID = " & Session("id") & " And PRE_Cod = " & Premios("PRE_Cod"), Conexao
				If ApostaPremio.EOF Then Pontos = "0" Else Pontos = ApostaPremio("MyTOT") End If
%>
				<tr bgcolor="<%=bgcolor%>"> 
					<td><b><%=codigo%>) <%=Premios("PRE_Desc")%></b><br><%=Premios("PAT_Nome")%></td>
					<td><%=Premios("PRE_Data")%><br><%=WeekdayName(WeekDay(Premios("PRE_Data")))%></td>
					<td><span id="Pts<%=codigo%>"><%Call PtPrem(Pontos)%></span>
					<br><span id="Pgs<%=codigo%>"><%Call PgPrem(Premios("PRE_Apts"))%></span></td>
					<td>
<% If pTotal >= 900 or Request("Err") <> "" Then %>
						<input type="BUTTON" id="Butt<%=codigo%>" name="Butt<%=codigo%>" value="Apostar" onclick="self.location='sorte/tema0/sabio01.asp?premio=<%=Premios("pUUID")%>'">
<% Else %>
						<input type="BUTTON"  value="Apostas?" onclick="alert('RG 3.0 INFORMAÇÂO (º_º):\n\nPara concorrer aos Prêmios e estar com as apostas liberadas\n - São necessários um mínimo de 900 Pontos adquiridos.\n - No momento você tem: <%=pTotal%> Pontos')">
<% End If %>
					</td>
				</tr>
<%
				ApostaPremio.Close
				ultMdia = ultMdia + 1
			End If
		Premios.MoveNext
		Wend
		Set ApostaPremio = Nothing
		If ultMdia = 1 Then
%>
				<tr bgcolor="#FFD699"> 
					<td colspan=4><b>Nenhum Premios programado para o momento. Aguarde para Breve.</td>
				</tr>
<%
		End If
	End If
	Premios.Close
	Conexao.Close
	Set Premios = Nothing
	Set Conexao = Nothing

	If bgcolor = "#FFFFDF" Then 
		bgcolor = "#FFEDA7"
	Else
		bgcolor = "#FFFFDF"
	End If

'               End If

%>
				<tr bgcolor="<%=bgcolor%>">
					<td colspan=4>
				<img src="images/luminoso.gif" width=25 height=25  style="vertical-align: middle;" align="left">
				(*) Eventuais prêmios só serão entregues, se seus <font color="blue"><b>Dados Cadastrais</b></font> forem
				Verdadeiros, e o link <font color="blue"><b>www.aggora.com.br/sabio</b></font> ter sido compartilhado em uma de suas 
				<font color="blue"><b>redes sociais</b></font> antes do sorteio do Prêmio.
				<center><a href="extra02.htm">regras</a> | <a href="sorte/tema0/sabio03.asp">minhas apostas</a> | <a href="sabio21.asp">já sorteados</a> | <a href="#" onClick="Help1()">Ajuda</a></center>
					</td>
					<!-- <td></td>
					<td></td>
					<td></td> -->
				</tr>
			</table>
			</form>
		</td>
		<td bgcolor="#ffff99" width="2%" align="RIGHT" valign="BOTTOM"><img src="images/cant04i.gif"></td>
		<!-- <td width="24%" align="CENTER" valign="MIDDLE"></td> -->
	</tr>
</table></center>
<Script Language="JScript" SRC="/_Library/Defaull.js"></Script>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr> 
		<td>
			<p>&nbsp;</p>
			<p  align="justify">Se seus pontos acumulados estiverem acima de 900 Pontos, as apostas nos Prêmios estarão disponíveis até 
			um dia antes da Data do Sorteio.
			<br><b>COMO APOSTAR:</b> (1)Escolha o PRÊMIO que desejar clicando no Botão [ Apostar ] correspondente a este.
			(2)Após o clique em [Apostar], voce será direcionado para a Sala de Aposta neste PRÊMIO. (3a)Na Sala de Aposta você
			primeiramente escolhe a quantidade de dezenas (de 10 a 15 dezenas) que pretende apostar, conferindo a respectiva quantia
			de Pontos que esta aposta representa. (3b)A partir de uma aposta validada você preencherá a Cartela do 
			<b>RG Giga-Senna Web</b> com as dezenas de sua posta. (3c)Concluída as fases anterioras você poderá: [Simular&nbsp;Aposta]
			quantas vezes quizer em um sorteio local, somente para consulta, ou; [Remeter&nbsp;Aposta] para enviar a aposta e efetivar 
			seu Registro. - Isto é tudo. Boa Sorte!. Se tiver alguma sugestão ou crítica sobre o Site, envie-nos um e-mail para: 
			<a href="mailto:contato@aggora.com.br">contato@aggora.com.br</a></p>
		</td>
	</tr>
</table>
<br>
<center>
<hr>
* * * RG Sabichão Web - Versão 2000a * * *
<hr>
</center>
<div id="INV002" style="position:absolute; width: 100%; height: 60px; left:0px; top:20px; z-index: 8; visibility: inherit"><marquee behavior="scroll" direction="right" scrollamount="5"><img src="images/coelho2R.gif" width="60" height="60"></marquee></div>
<embed name="somcerto" src="/_Library/rgchico.wav" loop="false" autostart="false" hidden="true" width="0" height="0"></embed>
</body></html>