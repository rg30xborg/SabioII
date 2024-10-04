<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sabio01.aspx.cs" Inherits="Sabio._1.sorte.Sabio01" %>

<!DOCTYPE html>

<Script Language="JScript" src="../scripts/SimplesH.js"></Script>
<HTML><HEAD><TITLE>RG 3.0 - Sabichão Web</TITLE><style>@import url(../images/coUC.css);</style>
</HEAD><body bgcolor="#FFFFFF" scroll="auto" onLoad="Aviso2()">
<p style="font-size: 10pt">
	<%=Server.ScriptTimeout %> Menu de: <font color="#0588C0"><b>JOGOS ONLINE</font><Span ID="NCalc"> - Carregando ....</Span></b>
	<span style="font-size: 9pt"><br>
	 - DIVIRTA-SE E AUMENTE AINDA MAIS OS SEUS PONTOS
<%
    if (Request["Err"] == "1") Response.Write("<br>SEUS PONTOS ACUMULADOS NÃO PERMITEM ENTRAR NAS SALAS DE JOGOS!!");
%>
	</span>
</p>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#4444FF" width="2%" align="LEFT"><img src="../images/cant01s.gif" /></td>
		<td bgcolor="#4444FF" width="80%" align="center" style="color:white;font-weight:bold"><span onClick="addFavor1()" style="cursor:pointer">
		<span ID="Reg16">Aguarde .... </Span><br>- Clique aqui para adicionar este Site aos seus Favoritos -</span></td>
		<td bgcolor="#4444FF" width="2%" align="RIGHT"><img src="../images/cant02s.gif" /></td>
		<td width="8%"></td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#7FCCFF" width="2%" valign="BOTTOM" align="LEFT"><img src="../images/cant03i.gif" /></td>
		<td bgcolor="#7FCCFF" width="80%" align="center"><br>
			<table width="590" cellpadding="0" cellspacing="0" height="362">
				<tr align="center">
					<td width=120 valign="top">
	<TABLE bgColor="#FFFFFF" cellPadding="0" cellSpacing="0" width="120" height="352" style="color: #0000FF">
		<tr height="20"><td bgcolor="#0588C0" style="color: #FFFFFF; font-size: 10pt"><b>&nbsp;MENU 1:</b></td></tr>
		<TR height="23"><TD align="center" onmouseout="mOut(this,'#FFFFDF');" onmouseover="mOvr(this,'#FFEDA7');" onclick="linkar(1);">Jokey Club</TD></TR>
		<TR height="23"><TD align="center" onmouseout="mOut(this,'#FFFFDF');" onmouseover="mOvr(this,'#FFEDA7');" onclick="linkar(2);">Video Poker</TD></TR>
		<TR height="23"><TD align="center" onmouseout="mOut(this,'#FFFFDF');" onmouseover="mOvr(this,'#FFEDA7');" onclick="linkar(3);">Giga Senna</TD></TR>
		<TR height="23"><TD align="center" onmouseout="mOut(this,'#FFFFDF');" onmouseover="mOvr(this,'#FFEDA7');" onclick="linkar(4);">Três Dados</TD></TR>
		<TR height="23"><TD align="center" onmouseout="mOut(this,'#FFFFDF');" onmouseover="mOvr(this,'#FFEDA7');" onclick="linkar(5);">Roleta Web</TD></TR>
		<TR height="23"><TD align="center" onmouseout="mOut(this,'#FFFFDF');" onmouseover="mOvr(this,'#FFEDA7');" onclick="linkar(6);">Zoo.eira</TD></TR>
		<TR height="23"><TD align="center" onmouseout="mOut(this,'#FFFFDF');" onmouseover="mOvr(this,'#FFEDA7');" onclick="linkar(7);"><img align="absmiddle" src="../images/novo.gif"> Lotogol V1</TD></TR>
		<TR height="23"><TD align="center" onmouseout="mOut(this,'#FFFFDF');" onmouseover="mOvr(this,'#FFEDA7');" onclick="linkar(8);"><img align="absmiddle" src="../images/novo.gif"> Podium F1</TD></TR>
		<TR><TD align="center"><p><input type="radio" name="opcao" id="opcao" value="a" checked>:Sem Som</p><p><input type="radio" name="opcao" id="opcao" value="b">:Com Som</p></TD></TR>
		<TR height="30"><TD align="center" style="color:#777777">Indicado para<br>maiores de 14</TD></TR>
		<tr height="20"><td bgcolor="#0588C0" style="color: #FFFFFF; font-size: 10pt"><b>&nbsp;COM APOSTAS.</b></td></tr>
	</TABLE>
					</td>
					<td width="10"> </td>
					<td width="330" valign="top">
	<TABLE border="1" bgColor="#FFFFFF" cellPadding="10" cellSpacing="0" width="330" height="352">
		<tr><td align="center" style="font-size: 8pt">
			<p align="justify"><img src="bl1.gif" width=8 height="8"> Após os estudos um momento para o Lazer.</p>
			<p><img src="images/Flag2.gif" /> <img src="images/bola2.gif" /> <img src="images/Flag1.gif" /></p>
			<p align="justify">- Perg.: Quem pode desfrutar dos <b>Jogos MENU 1</b>?  
			<br>- Resp.: Maiores de 14 anos que possuem pontos disponíveis, acumulados nas Salas de Perguntas. - Aqui você
			arrisca quantos pontos desejar em cada Jogo, e pode com isto, aumentar ainda mais seus pontos acumulados.
			Mas cuidado, os pontos arriscados serão descontados do seu total...</p>
			<p align="justify">- Perg.: Quem pode desfrutar dos <b>Jogos MENU 2</b>?  
			<br>- Resp.: Todos. - Aqui você se diverte e testa seus reflexos nos mais variados Jogos de
			passatempo e seus pontos não serão alterados.</p>
			<p align="justify">Se tiver alguma sugestão ou crítica sobre os Jogos, é só clicar em <b>Contato</b>,
			acima nesta página.</p>
		</td></tr>
	</TABLE>
					</td>
					<td width="10"> </td>
					<td width="120" valign="top">
	<TABLE bgColor="#FFFFFF" cellPadding="2" cellSpacing="0" width="120" height="352" style="color: #0000FF">
		<tr height="20"><td bgcolor="#0588C0" style="color: #FFFFFF; font-size: 10pt"><b>&nbsp;MENU 2:</b></td></tr>
		<TR height="23"><TD align="center" onmouseout="mOut(this,'#FFFFDF');" onmouseover="mOvr(this,'#FFEDA7');" onclick='AbreJan("01.htm",540,500)'>Pac-Man</TD></TR>
		<TR height="23"><TD align="center" onmouseout="mOut(this,'#FFFFDF');" onmouseover="mOvr(this,'#FFEDA7');" onclick='AbreJan("02.htm",610,500)'>Batalha Naval</TD></TR>
		<TR height="23"><TD align="center" onmouseout="mOut(this,'#FFFFDF');" onmouseover="mOvr(this,'#FFEDA7');" onclick='AbreJan("00.htm",650,480)'>Premonição ?!</TD></TR>
		<TR><TD align="center"> </TD></TR>
		<TR height="30"><TD align="center" style="color:#777777">Indicado para<br>qualquer idade</TD></TR>
		<tr height="20"><td bgcolor="#0588C0" style="color: #FFFFFF; font-size: 10pt"><b>&nbsp;PASSATEMPO.</b></td></tr>
	</TABLE>
					</td>
				</tr>
			</table>
		</td>
		<td bgcolor="#7FCCFF" width="2%" align="RIGHT" valign="BOTTOM"><img src="../images/cant04i.gif" /></td>
		<td width="8%" align="CENTER"><td>
	</tr>
</table>
<p>
<table cellspacing="0" cellpadding="0" width="100%" style="font-family: Arial; font-size:9pt">
	<tr>
		<td>	<b>NOTAS e UPDATES:</b>
			<p align="justify">1&nbsp;O acesso aos jogos com som (efeitos sonoros), requer suporte mplayer.
			2&nbsp;Todos os jogos foram aprovados em testes com o IE5.+ - Caso você acessa com versões
			anteriores e deseja relatar eventuais problemas, é só clicar em <b>Contato</b>, acima nesta página.
			3&nbsp;Quando perceber lentidão excessiva no carregamento de páginas, pode-se atualizar a janela
			ativa dando um refresh no navegador, tecla de função [F5].</p>
		</td>
	</tr>
</TABLE>
</p>
<embed name="somsorte" src="/_Library/rgficha.wav" loop="false" autostart="false" hidden="true" width="0" height="0"></embed>
</BODY></HTML>