<%@ LANGUAGE=VBSCRIPT %>
<%
	Response.Expires = 0

	If Session("IPUserSab") = "" Or Session("mail") = "" Then
		Response.Redirect "http://www.aggora.com.br/sabio/1/sabio12.asp"
		Response.End
	End If

	pSala = Request("ptSala")
	nEmpr = Request("nEmpr")

%><Script Language="JScript" src="../images/Simples7.js"></Script>
<html><head><title>Sabichao</title><style>@import url(../images/coUC.css);</style>
</head><body bgcolor="#FFFFFF" onLoad="Aviso2('document.somregis',16)">
<p style="font-size: 10pt">
	Assunto da Sala: <font color="#0588C0"><b>SUA EMPRESA (<%=nEmpr%>)</b></font>
	<span style="font-size: 8pt"><br>
	 - Etapa do Dia na Empresa Completada
	</span>
</p>
<table width="100%" cellspacing="0" cellpadding="0">
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#585858" width="2%"><img src="../images/cant01s.gif"></td>
		<td bgcolor="#585858" width="64%" style="font-size:9pt;color:#FFFFFF"><b><p align="justify">
			<br>Congratulações <%=Session("IPUserSab")%>:
			<br>Suas Perguntas para o ASSUNTO desta SALA estão concluídas por hoje. Você pode prosseguir com
			as perguntas em outro assunto e acumular muitos pontos para arrisca-los em um de nossos prêmios (breve).
			- LEMBRE-SE: Os pontos acumulados nesta etapa de implantação valerão para os sorteios dos prêmios
			quando estiverem disponíveis.</p></b></td>
		<td bgcolor="#585858" width="2%" align="RIGHT"><img src="../images/cant02s.gif"></td>
		<td width="24%" align="CENTER" valign="TOP"><b><font style="font-size: 14pt; color: #F94942">Na Sala</font>
			<br><font style="font-size: 12pt"><%=pSala%> pontos</font></b></td>
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
			<table width="100%" cellspacing="0" cellpadding="10">
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
						style="border:0;background-color:#C0C0C0;background-image:url('../images/bt3.gif');width:115;height:25"></td>
				</tr>
			</table>
		</td>
		<td bgcolor="#C0C0C0" width="2%" align="RIGHT" valign="BOTTOM"><img src="../images/cant04i.gif"></td>
		<td width="24%" align="CENTER" valign="MIDDLE"><a href="../sabio07.asp">SORTEIO<br>de<br>PRÊMIOS</a></td>
	</tr>
</table>
<p>Sala [Sua Empresa] Concluida! - :)</p>
</body></html>