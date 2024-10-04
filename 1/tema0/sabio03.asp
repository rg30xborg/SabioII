<%@ LANGUAGE=VBSCRIPT %>
<%
	Response.Expires = 0
	
	If inStr(Request.ServerVariables("HTTP_HOST"), "www.aggora.com.br") = 0 Then
		Response.Redirect "http://www.aggora.com.br/sabio/help.htm"
		Response.End
	End If

	If Session("IPUserSab") = "" Or Session("mail") = "" Then
		Response.Redirect "http://www.aggora.com.br/sabio/1/sabio12.asp"
		Response.End
	End If

' Numero de perguntas no banco de dados na Sala e o ("hoje") é para computar o dia na Sala
	Set Conexao = Server.CreateObject("ADODB.Connection")
	'SQLServer =>  'Conexao.Open "Provider=SQLOLEDB.1;SERVER=187.45.196.225;DATABASE=aggora1;UID=aggora1;PWD=dade02;"
	Conexao.Open "DRIVER={MySQL ODBC 5.3 ANSI Driver};SERVER=187.45.196.225;PORT=3306;DATABASE=aggora1;USER=aggora1;PASSWORD=dade02;OPTION=3;"

		Set Apostas = Server.CreateObject("ADODB.Recordset")
		Apostas.Open "SELECT USA_Cod, USA_Dez, PRE_Desc, PRE_Data, PAT_Nome, USA_Apts, USA_Data FROM Premios_Apostas PA, Premios PP, Patrocinio PT WHERE PA.PRE_Cod = PP.PRE_Cod and PP.PAT_Cod = PT.PAT_Cod and PA.USR_ID = " & Session("id") & " ORDER BY USA_Cod DESC", Conexao

		If Request.Form.Count > 0 Then
			libAps = CInt(Request.Form("salax"))
			libHx = Request.Form("salay")
			libTx = Request.Form("salaz")

			Set UsuarioDados = Server.CreateObject("ADODB.Recordset")
			UsuarioDados.Open "SELECT USD_Total, USD_Apts FROM UserDados WHERE USR_ID = " & Session("id"), Conexao
				libok = CInt(UsuarioDados("USD_Total"))
				libSl = CInt(UsuarioDados("USD_Apts"))
			UsuarioDados.Close
			Set UsuarioDados = Nothing

			If libok < libAps Or Session("xdemo") <> "demo01" Then
				Response.Redirect "http://www.aggora.com.br/sabio/1/sabio07.asp?Err=1"
				Response.End
			Else
				Session("xdemo") = ""  	'para garantia de que não reproduza apostas por repeticao de comando...
				Set Premio = Server.CreateObject("ADODB.Recordset")
				Premio.Open "SELECT PRE_Cod, PRE_Desc, PRE_Data, PRE_Apts FROM Premios WHERE HEX(uuid) = '" & libHx & "'", Conexao
					libPr = Premio("PRE_Desc")
					libDt = Premio("PRE_Data")
					libCd = Premio("PRE_Cod")
					ApPre = CInt(Premio("PRE_Apts"))
				Premio.Close
				Set Premio = Nothing

			'Adiciono a quantia apostada às apostas no Prêmio
				Conexao.Execute "UPDATE Premios SET PRE_Apts = " & CInt(ApPre+libAps) & " WHERE HEX(uuid) = '" & libHx & "'"

			'Subtraio a quantia apostada do total do usuário
				Conexao.Execute "UPDATE UserDados SET USD_Total = " & CInt(libok-libAps) & ", USD_Apts = " & CInt(libSl+libAps) & " WHERE USR_ID = " & Session("id")

			'Adiciono a aposta ao Prêmio pelo usuário
				Conexao.Execute "INSERT INTO Premios_Apostas (USR_ID, PRE_Cod, USA_Dez, USA_Apts) VALUES ('" & Session("id") & "','" & libCd & "','" & libTx & "','" & libAps & "')"

			End If

		End If
%>
<Script Language="JScript"> var cred = <%=libok%>, pSala = <%=libSl%>; pPremio = "<%=libPr%>" </Script>
<Script Language="JScript" src="../../images/Simpl3a.js"></Script>
<HTML><HEAD><TITLE>RG 3.0 - Sabichão Web</TITLE>
<style>@import url(../../images/coUC.css);</style>
</HEAD><body bgcolor=#FFFFFF scroll="auto" onLoad="Aviso3()">
<p style="font-size: 10pt">
	Sala de: <font color="#0588C0"><b>MINHAS APOSTAS</font><Span ID="NCalc"> - Criando Ambiente II ...</Span></b>
	<span style="font-size: 8pt"><br>
	 - CONFIRA AQUI SUAS APOSTAS NOS PRÊMIOS DO SABICHÃO
	 - Prêmio: <font color="#0000FF"><span ID="Reg15"><%=libPr%></span> (em: <%=libDt%>)</font>
	 - Pontos da Apostas: <font color="#0000FF"><span ID="Reg18"><%=libAps%></span> pontos</font>
	</span>
</p>
<%  	If libTx <> "" Then  %>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#585858" width="2%" align="LEFT"><img src="../../images/cant01s.gif"></td>
		<td bgcolor="#585858" width="80%" align=center>
			<font color="#FFFFFF">
				<br><b><span ID="Reg17a">DADOS DO PRÊMIO...</span></b><br><br>
				Codigo: <b><%=libCd%></b> - Codhex: <b><%=libHx%></b>
				<br>- Premio: <b><%=libPr%></b>
				<br>- Data Sorteio: <b><%=libDt%></b>
			</font>
		</td>
		<td bgcolor="#585858" width="2%" align="RIGHT"><img src="../../images/cant02s.gif"></td>
		<td width="8%"></td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#585858" width="2%" align="LEFT"><img src="../../images/cant01ii.gif"></td>
		<td bgcolor="#585858" width="80%" align=center><span ID="Reg16" style="color:white;font-weight:bold">Aguarde...</Span></td>
		<td bgcolor="#585858" width="2%" align="RIGHT"><img src="../../images/cant02ii.gif"></td>
		<td width="8%"></td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#C0C0C0" width="2%" valign="BOTTOM" align="LEFT"><img src="../../images/cant03i.gif"></td>
		<td bgcolor="#C0C0C0" width="80%" align=center>
			<font color="#000000">
				<br><b><span ID="Reg17b">DADOS DA APOSTA...</span></b><br><br>
				Credito: <b><%=libok%></b> - Codhex: <b><%=libHx%></b>
				<br>- Aposta: <b><%=libAps%></b>
				<br>- Dezenas: <b><%=libTx%></b>
			</font>
		</td>
		<td bgcolor="#C0C0C0" width="2%" align="RIGHT" valign="BOTTOM"><img src="../../images/cant04i.gif"></td>
		<td width="8%" align="CENTER"><td>
	</tr>
</table><br>
<%  	End If  %>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr> 
		<td>
		<p align="justify">No final desta Sala você Acompanha e Confere suas apostas registradas nos Prêmios do Site.
		IMPORTANTE: para concorrer efetivamente nos sorteios de Prêmios oferecidos, confira detalhes em: <a href="../../extra02.htm">Regras</a>,
		sendo que três itens merecem destaque: (1)Estar cadastrado no Site, com <b>dados verdadeiros</b> e uma única vez; (2)
		<font color=blue>Compartilhar o link <b>www.aggora.com.br/sabio</b></font> em ao menos uma de suas redes sociais, antes do sorteio do
		Prêmio e; (3)Realizar a aposta nos Prêmios de seu interesse, quantas vezes quiser e seu pontos acumulados o permitirem. Os resultados
		serão os anunciado pela Mega-Sena da Caixa (CEF) no Dia do Sorteio do Prêmio. Boa Sorte!</p>
	<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr valign="MIDDLE"> 
		<td nowrap>
			Como e o quê você ganha ->
			<br> - Acertando a SENNA 6 dezenas: <b>O Prêmio(*)</b>;
			<br> - Acertando a QUINNA 5 dezenas: Devolução de 50% dos Pontos da aposta;
			<br> - Acertando a QUADRRA 4 dezenas: Devolução de 20% dos Pontos da aposta;
			<br> - Acertando a BIT-SENNA Somente 1 dezena: Devolução de 10% dos Pontos da aposta;
			<br> - Prêmio não cumulativo: Vale apenas o maior.
		</td>
		<td align="center">Importante:<br>
			<img src="../../images/luminoso.gif" width=40 height=40>
			<br>Compartilhe o link <font color=blue><b>www.aggora.com.br/sabio</b></font> em suas redes sociais!!!
		</td>
	</tr>
	</table>
		<p>(*) havendo mais de um ganhador o valor do Prêmio será dividido entre os vencedores e neste caso Devolução INTEGRAL dos Pontos da 
		aposta. - Se tiver alguma sugestão ou crítica sobre o Giga-Senna, envie e-mail para: <a href="mailto:contato@aggora.com.br">Contate-nos</a></p>
		</td>
	</tr>
</table>
<center><hr>
<table width="90%">
	<tr>
		<td style="font-size: 12pt">
			<b>Confira aqui suas Apostas Registradas no Site.</b>
		</td>
	</tr>
</table>
<%
' Checa se existem Apostas dste Usuários no Premio selecionado
	If Apostas.Eof Then
%>
<table width="90%">
	<tr>
		<td bgcolor='#FFFFDF'>Você ainda não investiu Pontos em Prêmios. Confira ofertas em: <a href="../../sabio07.asp">Prêmios...</a></td>
	</tr>
</table>
<%
	Else
%>
<table width="90%" cellspacing="2" cellpadding="1">
	<tr align="center" bgcolor="#FFCC66" style="color: #0000FF; font-size: 10pt">
		<td><b>Nº</b></td>
		<td><b>Dezenas da Aposta / Prêmio / Apoio</b></td>
		<td><b>Aposta</b></td>
		<td><b>Data&nbsp;da&nbsp;Aposta</b></td>
		<td><b>Data&nbsp;do&nbsp;Sorteio</b></td>
	</tr>
<%

		bgcl = "bgcolor=#FFFFEE"
		Apostas.MoveFirst
		While Not Apostas.EOF
			If bgcl = "bgcolor=#FFFFEE" Then bgcl = "bgcolor=#FFFFDF" Else  bgcl = "bgcolor=#FFFFEE" End If
%>
	<tr <%=bgcl%>>
		<td align="center"><%=Apostas("USA_Cod")%></td>
		<td>Dezenas: <b><%=Apostas("USA_Dez")%></b>
			<br>Prêmio: <b><%=Apostas("PRE_Desc")%></b>
			<br>Patrocínio: <b><%=Apostas("PAT_Nome")%></b></td>
 		<td align="center" nowrap><%=Apostas("USA_Apts")%></td>
		<td align="center" nowrap><%=FormatDateTime(Apostas("USA_Data"), 0)%></td>
		<td align="center" nowrap><%=FormatDateTime(Apostas("PRE_Data"), 2)%></td>
	</tr>

<%
			Apostas.MoveNext
		Wend
%>
</table>
<%
	End If

	Apostas.Close
	Set Apostas = Nothing

	Conexao.Close
	Set Conexao = Nothing
'End If
%>
<br>
<hr>
* * * RG Sabichão Web - Versão 2000a * * *
<hr>
</center>
<embed name="somregis" src="/_Library/rgcaixa.wav" loop="false" autostart="false" hidden="true" width="0" height="0"></embed>
</BODY></HTML>
