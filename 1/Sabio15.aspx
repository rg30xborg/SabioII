<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sabio15.aspx.cs" Inherits="Sabio._1.Sabio15" %>

<!DOCTYPE html>

<Script Language="JScript" src="scripts/SimplesF.js"></Script>
<html><head><title>Sabichão</title><style>@import url(images/coUC.css);</style>
<STYLE>
BODY 		{font-family:"Arial"; font-size:12; font-weight:normal}
.intro 	{font-family:"Arial"; font-size:14; font-weight:bold; color:#FF0000}
</STYLE>
</HEAD><BODY bgColor=#ffffff leftMargin=0 rightMargin=0 topMargin=3 marginheight="0" marginwidth="0"><center>...
<table cellpadding="0" cellspacing="0" width="600" style="font-family: Arial; font-size:9pt">
	<tr>
		<td>
            <SPAN CLASS=intro>Processando sua mensagem E-Mail</SPAN>
            <br />Enviando email para: <font color=blue><b>(º_º) RG 3.0 - Site Sabichão Web</b></font><HR>
		</td>
	</tr>
</table>
<table cellpadding="0" cellspacing="0" width="600" style="font-family: Arial; font-size:9pt">
	<tr>
		<td>
<%
    //Caso ocorra problemas no envio, descreve os detalhes do mesmo.
    if (Erro != "")
        Response.Write(Erro);
    else 
    {
        Response.Write("<font color='blue'><b>Mensagem enviada com sucesso:</b></font> " + emailDestinatario);
        Response.Write("<p>" + txtweb + "</p><HR><p align=center>Recebemos sua Mensagem  sobre: <b>" + assunto + "</b><br>A <font color=blue><b>RG 3.0</b></font> agradece sua Remessa e informa que entraremos em contato em até 24h.</p><HR>");
    }
%>
		</td>
	</tr>
</table>
<p><input type="button" value="Continuar..." style="cursor:pointer;border:0;background-color:rgb(255,255,255);background-image:url('images/bt3.gif');width:115px;height:25px" onClick="location.href='Sabio05.htm'"></p>
</center></BODY></HTML>