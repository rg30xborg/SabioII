<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Sabio.Default" %>
<% if (Request.Browser.IsMobileDevice) Response.Redirect("1/Sabichao1.html"); %>
<!DOCTYPE html>

<html><head><title>(º_º) S A B I C H Ã O - Um desafio aos seus Conhecimetos</title>
<style>@import url(1/images/coUC.css);</style></head><body onLoad="if(ieBlink){setInterval('doBlink()',450)}">
<center>
<p>&nbsp;</p>
<p>Se o <b>Site Sabichão (º_º)</b> não inicializar automáticamente<br>desative o bloqueador de pop-up para o nosso Site ou<br>clique no link abaixo:<p>&nbsp;</p>
<p><a href="1/sabichao2.html" target="_top" onclick="if(WinSab != null) WinSab.close(); WinSab=window.open(this.href, '', 'fullscreen'); return false;">Clique Aqui para ENTRAR no <b>Site Sabichão (º_º)</b></a></p>
<p>&nbsp;</p>
<p>&nbsp;</p>
    <TABLE border="0" cellPadding="0" cellSpacing="0" height="100px" width="auto">
	<TBODY>
		<TR height="100px">
			<TD align=right valign=middle background=1/images/f02a.gif width="170" style="background-repeat:no-repeat">
				<TABLE border="0" cellPadding="0" cellSpacing="0" width="170">
					<TBODY>
					<TR><TD align=left><FONT color=#FFFFFF face=verdana>&nbsp; &nbsp;Ola, <b><Span ID="USerID">Bem-Vindo</Span></b></FONT></TD></TR>
					<TR><TD align=left><FONT color=#FFFFFF face=verdana>&nbsp; &nbsp;Pontos: <b><Span ID="Ponto">-» Prêmios</Span></b></FONT></TD></TR>
					</TBODY>
				</TABLE>
			</TD>
			<TD background="1/images/f01a.gif" style="background-repeat:no-repeat">&nbsp;</TD>
			<TD align="center" background="1/images/f01a.gif" width="420" style="background-repeat:repeat-x">
				<TABLE border=0 cellPadding=0 cellSpacing=0 height=59 width=420>
					<TBODY>
					<TR align="center">
						<TD><IMG height="27" src="1/images/setab.gif" width=30 onClick="history.back()" style="cursor:pointer"></TD>
                        <TD align="justify" style="color:white; font-size: 8pt">
                            <b>O QUE É O SABICHÃO?</b> É um Site-Jogo tipo QUIZ com assuntos variados em um ambiente interativo, 
                            com muita informação e humor. É <b>Totalmente Gratúito</b> e você corre o risco de ganhar »
                        </TD>
						<TD><IMG height="27" src="1/images/setaf.gif" width="30" onClick="history.forward()" style="cursor:pointer"></TD>
					</TR>
					</TBODY>
				</TABLE>
				<TABLE border="0" cellPadding="0" cellSpacing="0" height="41" width="420">
					<TBODY>
                        <TR align="center" valign="middle" style="font-family: 'Arial Black'; vertical-align: middle; font-weight: bold; color: #444444; font-size: 11pt; line-height: 10px;">
                            <TD background="1/images/bt2a.gif" width="60" height="41"><b><blink>P</blink></b><br>&nbsp;</TD>
                            <TD background="1/images/bt2a.gif" width="60" height="41"><b><blink>R</blink></b><br>&nbsp;</TD>
                            <TD background="1/images/bt2a.gif" width="60" height="41"><b><blink>Ê</blink></b><br>&nbsp;</TD>
                            <TD background="1/images/bt2a.gif" width="60" height="41"><b><blink>M</blink></b><br>&nbsp;</TD>
                            <TD background="1/images/bt2a.gif" width="60" height="41"><b><blink>I</blink></b><br>&nbsp;</TD>
                            <TD background="1/images/bt2a.gif" width="60" height="41"><b><blink>O</blink></b><br>&nbsp;</TD>
                            <TD background="1/images/bt2a.gif" width="60" height="41"><b><blink>S</blink></b><br>&nbsp;</TD>
                        </TR>
                    </TBODY>
				</TABLE>
			</TD>
			<TD background="1/images/f01a.gif" style="background-repeat:no-repeat">&nbsp;</TD>
			<TD align="left" valign="top" background="1/images/f01a.gif" width="135" style="background-repeat:no-repeat"><a href="1/sabichao2.html" target="_top" onclick="if(WinSab != null) WinSab.close(); WinSab=window.open(this.href,'','fullscreen');return false;"><IMG height=100 src="1/images/logo3a.gif" title="Clique para Entrar!" width=120 border=0 alt="Alternar Visual do Site"></a></TD>
		</TR>
        <tr>
            <td colspan="5" align="right">Muito Obrigado por sua visita!! &nbsp; &nbsp; </td>
        </tr>
	</TBODY>
</TABLE>

</center>
<p><b>Fase Implantação - Nosso Compromisso:</b>
<br />Através de nosso Site você receberá somente os e-mails de:
<br /> (1) Confirmação/Alteração de Cadastro;
<br /> (2) Os eventuais para Lembrar Senha; e 
<br /> (3) Os que serão marcados por você mesmo em sua Agenda-Boletins.
<p><div align="right">
	<TABLE cellPadding="2" cellSpacing="0" width="120" style="cursor:pointer;color:silver;">
        <TR><TD align="center" onmouseout="mOut(this,'#FFFFDF');" onmouseover="mOvr(this,'#FFEDA7');" onclick='AbreJan("01.mp4",650,400)' style="color:black;">Video Tutorial</TD></TR>
		<TR><TD align="center" onmouseout="mOut(this,'#FFFFDF');" onmouseover="mOvr(this,'#FFEDA7');" onclick='AbreJan("00.htm",650,480)'>Mágica Cartas</TD></TR>
		<TR><TD align="center" onmouseout="mOut(this,'#FFFFDF');" onmouseover="mOvr(this,'#FFEDA7');" onclick='AbreJan("01.htm",540,500)'>Pac-Man</TD></TR>
		<TR><TD align="center" onmouseout="mOut(this,'#FFFFDF');" onmouseover="mOvr(this,'#FFEDA7');" onclick='AbreJan("02.htm",610,500)'>Batalha Naval</TD></TR>
	</TABLE>
</div></p>
<!-- Go to www.addthis.com/dashboard to customize your tools -->
<%--<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-607ee834d94f8d0c"></script>--%>
<script type="text/javascript" src="default01.js"></script>
</body></html>