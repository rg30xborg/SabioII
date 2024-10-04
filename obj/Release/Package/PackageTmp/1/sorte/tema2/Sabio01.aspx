<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sabio01.aspx.cs" Inherits="Sabio._1.sorte.tema2.Sabio01" %>

<!DOCTYPE html>

<Script LANGUAGE="JScript">
<!--
	dados = <%=pTotl%>
	salas = <%=pSala%>
//-->
</Script>
<Script LANGUAGE="JScript" src="../../scripts/Simpl2.js"></Script>
<HTML><HEAD><TITLE>RG 3.0 - Sabichão Web</TITLE>
<style>@import url(../../images/coUC.css);</style>
</head><body bgcolor=#FFFFFF scroll="auto" onLoad="muda()">
<p style="font-size: 10pt">
	Sala de Apostas: <font color="#0588C0"><b>VIDEO POKER I</font> - Carregando ...</b><br>
	<span style="font-size: 8pt">
	 - Sons e Imagens ...
	</span>
</p>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#4444FF" width="2%" align="LEFT"><img src="../../images/cant01s.gif"></td>
		<td bgcolor="#4444FF" width="80%" align=center><br>
		<table width="590" height="75" cellspacing="0" cellpadding="0" style="font-size: 9pt; color: yellow">
			<tr align="center" valign="middle">
				<td><b>Acesso ao Jogo. Na 1º vez aguarde alguns segundos...</b><form name="dadosb" method="GET"><input TYPE="hidden" name="dataz"><input TYPE="hidden" name="salax"></form></td>
			</tr>
		</table>
		</td>
		<td bgcolor="#4444FF" width="2%" align="RIGHT"><img src="../../images/cant02s.gif"></td>
		<td width="8%"></td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#4444FF" width="2%" align="LEFT"><img src="../../images/cant01ii.gif"></td>
		<td bgcolor="#4444FF" width="80%" align=center>
		<span style="color:white;font-weight:bold"><b>RG Poker Web</b> - Enquanto Carrega ...</Span>
		</td>
		<td bgcolor="#4444FF" width="2%" align="RIGHT"><img src="../../images/cant02ii.gif"></td>
		<td width="8%"></td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#7FCCFF" width="2%" valign="BOTTOM" align="LEFT"><img src="../../images/cant03i.gif"></td>
		<td bgcolor="#7FCCFF" width="80%" align=center><br>
		<table width="590" height="170" cellspacing="0" cellpadding="0">
			<tr>
				<td>
				<iframe src="sabio01.htm" width="590" height="170" frameborder="no" scrolling="no"></iframe>
				</td>
			</tr>
		</table><br>
		</td>
		<td bgcolor="#7FCCFF" width="2%" align="RIGHT" valign="BOTTOM"><img src="../../images/cant04i.gif"></td>
		<td width="8%" align="CENTER"><td>
	</tr>
</table>

<audio id="sominici" name="somerro"><source src="/_Library/rgcerto.wav"></audio>
<audio id="somcapit" name="somsorte"><source src="/_Library/rgerror.wav"></audio>
<audio id="somsorte" name="somregis"><source src="/_Library/rgrodar.wav"></audio>
<audio id="somregis" name="somclick"><source src="/_Library/rgcaixa.wav"></audio>

</body></html>