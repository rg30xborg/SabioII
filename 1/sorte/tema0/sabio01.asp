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

		Set UsuarioDados = Server.CreateObject("ADODB.Recordset")
		UsuarioDados.Open "SELECT USD_Total, USD_Apts FROM UserDados WHERE USR_ID = " & Session("id"), Conexao
			pTotl = UsuarioDados("USD_Total")
			pSala = UsuarioDados("USD_Apts")
			pPrem = Left(CStr(Request("premio")), 38)
		UsuarioDados.Close
		Set UsuarioDados = Nothing

		If pTotl <= 900 Then
			Response.Redirect "http://www.aggora.com.br/sabio/1/sabio07.asp?Err=1"
			Response.End
		Else
			Session("xdemo") = "demo01"
		End If

	Conexao.Close
	Set Conexao = Nothing

%>
<Script LANGUAGE="JScript" src="../../images/Simpl3a.js"></Script>
<HTML><HEAD><TITLE>RG 3.0 - Sabichão Web</TITLE>
<style>@import url(../../images/coUC.css);</style>
</head><body bgcolor=#FFFFFF scroll="auto" onLoad="mudaB()">
<p style="font-size: 10pt">
	Sala de Apostas: <font color="#0588C0"><b>CONCORRER AO PRÊMIO SELECIONADO</font> - Carregando ...</b><br>
	<span style="font-size: 8pt">
	 - Sons e Imagens ...
	</span>
</p>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#585858" width="2%" align="LEFT"><img src="../../images/cant01s.gif"></td>
		<td bgcolor="#585858" width="80%" align=center><br>
		<table width="590" height="50" cellspacing="0" cellpadding="0" style="font-size: 9pt; color: yellow">
			<tr align="center" valign="middle">
				<td><b>Acesso ao Jogo. Na 1º vez aguarde alguns segundos...</b><form id="dadosc" name="dadosc" method="POST"></form></td>
			</tr>
		</table>
		</td>
		<td bgcolor="#585858" width="2%" align="RIGHT"><img src="../../images/cant02s.gif"></td>
		<td width="8%"></td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#585858" width="2%" align="LEFT"><img src="../../images/cant01ii.gif"></td>
		<td bgcolor="#585858" width="80%" align=center>
		<span style="color:white;font-weight:bold"><b>RG Giga Senna Web</b> - Enquanto Carrega ...</Span>
		</td>
		<td bgcolor="#585858" width="2%" align="RIGHT"><img src="../../images/cant02ii.gif"></td>
		<td width="8%"></td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#C0C0C0" width="2%" valign="BOTTOM" align="LEFT"><img src="../../images/cant03i.gif"></td>
		<td bgcolor="#C0C0C0" width="80%" align=center><br>
		<table width="590" height="195" cellspacing="0" cellpadding="0">
			<tr>
				<td>
				<iframe src="../sabio03a.htm" width="590" height="195" frameborder="no" scrolling="no"></iframe>
				</td>
			</tr>
		</table><br>
		</td>
		<td bgcolor="#C0C0C0" width="2%" align="RIGHT" valign="BOTTOM"><img src="../../images/cant04i.gif"></td>
		<td width="8%" align="CENTER"><td>
	</tr>
</table>
<script type="text/javascript">
	var datz = document.createElement("input");
	datz.type = "hidden";
	datz.value = "<%=pTotl%>";
	datz.name = "dataz";
	dadosc.appendChild(datz);		//document.getElementById("dadosc").appendChild(datz);

	var salx = document.createElement("input");
	salx.type = "hidden";
	salx.value = "<%=pSala%>";
	salx.name = "salax";
	dadosc.appendChild(salx);		//document.getElementById("dadosc").appendChild(salx);

	var saly = document.createElement("input");
	saly.type = "hidden";
	saly.value = "<%=pPrem%>";
	saly.name = "salay";
	dadosc.appendChild(saly);		//document.getElementById("dadosc").appendChild(saly);
</script>  
</body></html>