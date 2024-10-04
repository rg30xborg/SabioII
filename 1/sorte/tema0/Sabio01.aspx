<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sabio01.aspx.cs" Inherits="Sabio._1.sorte.tema0.Sabio01" %>

<!DOCTYPE html>

<Script LANGUAGE="JScript" src="../../scripts/Simpl3a.js"></Script>
<HTML><HEAD><TITLE>RG 3.0 - Sabichão Web</TITLE>
<style>@import url(../../images/coUC.css);</style>
</head><body bgcolor="#FFFFFF" scroll="auto" onLoad="mudaB()">
<p style="font-size: 10pt">
	Sala de Apostas: <b><font color="#0588C0">CONCORRER AO PRÊMIO SELECIONADO</font> - Carregando ...</b><br>
	<span style="font-size: 9pt">
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
				<td><b>Acesso ao Jogo. Na 1º vez aguarde alguns segundos...</b><form id="dadosc" name="dadosc" method="GET"></form></td>
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