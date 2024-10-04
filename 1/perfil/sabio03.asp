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

	pSala = Request("ptSala")
	cTema = Request("cTema")
	gData = Request("cData")
	cData = DateAdd("d", 7, CDate(gData))
	'cData = FormatDateTime(DateAdd("d", 7, CDate(gData)),1)

%><Script Language="JScript" src="../images/Simples7.js"></Script>
<html><head><title>Sabichao</title><style>@import url(../images/coUC.css);</style>
</head><body bgcolor="#FFFFFF" onLoad="Aviso2('document.somregis',17)">
<p style="font-size: 10pt">
	Sala de: <font color="#0588C0"><b>RESULTADO do TESTE SEU PERFIL</b></font>
	<span style="font-size: 8pt"><br>
	 - Teste da Semana Completado com Sucesso
	</span>
</p>
<%
	If pSala < 8 Then
		Nivel = "Nivel1"
	Else
		If pSala > 14 Then Nivel = "Nivel3" Else Nivel = "Nivel2" End If
	End If

	Set Conexao = Server.CreateObject("ADODB.Connection")
	'SQLServer =>  'Conexao.Open "Provider=SQLOLEDB.1;SERVER=187.45.196.225;DATABASE=aggora1;UID=aggora1;PWD=dade02;"
	Conexao.Open "DRIVER={MySQL ODBC 5.3 ANSI Driver};SERVER=187.45.196.225;PORT=3306;DATABASE=aggora1;USER=aggora1;PASSWORD=dade02;OPTION=3;"

	Set Perguntas = Server.CreateObject("ADODB.Recordset")
	Perguntas.Open "SELECT Codigo, Tema," & Nivel & " FROM Perfil P, PerfilTema T WHERE T.TPR_Cod = P.TPR_Cod And P.Codigo = " & cTema, Conexao

	tema1 = Perguntas("Tema")
	resl1 = Perguntas(Nivel)

	Perguntas.Close
	Conexao.Close
	Set Perguntas = Nothing
	Set Conexao = Nothing
End If
%>
<table width="100%" cellspacing="0" cellpadding="0">
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#44AA00" width="2%"><img src="../images/cant01s.gif"></td>
		<td bgcolor="#44AA00" width="64%" style="font-size: 9pt; color: #FFFFFF"><b><p align="justify">
			<br>Congratulações <%=Session("IPUserSab")%>:
			<br>Suas Perguntas do SEU ANALISTA desta semana estão concluídas e seus 200 PONTOS EXTRAS já estão computados. 
			Seu próximo Teste estará disponivel a partir da próxima <%=WeekDayName(WeekDay(gData))%> - <%=cData%>.</p></b></td>
		<td bgcolor="#44AA00" width="2%" align="RIGHT"><img src="../images/cant02s.gif"></td>
		<td width="24%" align="CENTER" valign="TOP"><b><font style="font-size: 14pt; color: #F94942">No Teste</font>
			<br><font style="font-size: 12pt">200 pontos</font></b></td>
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
			<table width="100%" cellspacing="0" cellpadding="10">
				<tr>
					<td width="100%" valign="middle" colspan=2><p align="justify">Seu último TESTE - <b>TEMA</b>: <%=tema1%>
						<p align="justify"><i>Analize do Sabichão.</i> <b><%=resl1%></b></p></td>
				</tr>
				<tr>
					<td width="90%" valign="middle"><p align="justify"><b>Sabichão. </b><i>Adj. e Sub. Masculino:</i> Grande sábio;
						aquele que alardeia sabedoria; presunçoso. <i>Feminino:</i> Sabichã ou Sabichona.
						Detone em seu assunto preferido, ou conheça mais sobre temas de interesse ou diversos.
						Em cada Sala tem perguntas sobre um mesmo tema que, podem mudam a qualquer hora. Se
						tiver alguma sujestão para outros temas preferidos, envie-nos sua
						<a href="mailto:rg30@bol.com.br?Subject=Sugestão para Tema de Sala">Sugestão</a></p></td>
					<td width="10%" align="center" valign="middle"><img src="../images/happy3.gif"
						align="center" hspace="3"><p><input type="button"
						onClick="location.href='../sabio22.asp'" value="Detalhar Salas"
						style="border:0;background-color:#AAEE22;background-image:url('../images/bt3.gif');width:115;height:25"></td>
				</tr>
			</table>
		</td>
		<td bgcolor="#AAEE22" width="2%" align="RIGHT" valign="BOTTOM"><img src="../images/cant04i.gif"></td>
		<td width="24%" align="CENTER" valign="MIDDLE"><a href="../sabio07.asp">SORTEIO<br>de<br>PRÊMIOS</a></td>
	</tr>
</table>
<p>Sala [Seu Analista] Concluida! - :)</p>
</body></html>