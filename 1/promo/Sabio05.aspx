<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sabio05.aspx.cs" Inherits="Sabio._1.promo.Sabio05" %>

<!DOCTYPE html>

<Script Language="JScript" src="../scripts/SimplesU.js"></Script>
<html><head><title>Sabichao</title><style>@import url(../images/coUC.css);</style></head>
<body bgcolor="#FFFFFF" onLoad="OnCarg()">
<p style="font-size: 10pt">
	Sala de: <font color="#0588C0"><b>ADM PERGUNTAS</font><Span ID="NCalc"> - Processando Dados .... </Span></b>
	<span style="font-size: 9pt"><br> - REVISÃO DE PERGUNTAS DO SABICHÃO</span>
</p>
<center>
<form method="GET" action="Sabio05.aspx" onSubmit="return Verfica2()" name="Revisar">
<table width="90%">
	<tr>
		<td style="font-size: 12pt">
			<b>Dados para Revisar a Pergunta.</b>
		</td>
	</tr>
</table>
<table width="90%" cellspacing="2" cellpadding="1">
	<tr align="center" bgcolor="#4E5CA0" style="color: #FFFFFF; font-size: 10pt">
		<td width="5%"><b>Nº</b></td>
		<td width="95%"><b>Pergunta / Respostas (máximo 255 caracteres)</b></td>
	</tr>
	<tr bgcolor='#D7DBEC'>
		<td width="5%" align="center"><%=cod%>
		<td nowrap align="right" width="95%">Perg.: <input type="text" style="width:90%;background-color:#FFFFDF" name="perg" value='<%=perg%>' maxlength=512 /> &nbsp;
		<br>a) <input type="radio" name="spec" value="a" onClick="respA(1)" <%if (spec == "a") {%>checked<%}%>> <input type="text" style="width:90%" name="res1" value='<%=resA%>' maxlength=254 /> &nbsp;
		<br>b) <input type="radio" name="spec" value="b" onClick="respA(2)" <%if (spec == "b") {%>checked<%}%>> <input type="text" style="width:90%" name="res2" value='<%=resB%>' maxlength=254 /> &nbsp;
		<br>c) <input type="radio" name="spec" value="c" onClick="respA(3)" <%if (spec == "c") {%>checked<%}%>> <input type="text" style="width:90%" name="res3" value='<%=resC%>' maxlength=254 /> &nbsp;
		<br>d) <input type="radio" name="spec" value="d" onClick="respA(4)" <%if (spec == "d") {%>checked<%}%>> <input type="text" style="width:90%" name="res4" value='<%=resD%>' maxlength=254 /> &nbsp;
		<br>e) <input type="radio" name="spec" value="e" onClick="respA(5)" <%if (spec == "e") {%>checked<%}%>> <input type="text" style="width:90%" name="res5" value='<%=resE%>' maxlength=254 /> &nbsp;</td>
	</tr>
<% if (ok == 1 || err1 == 1) { %>
    <tr>
        <td colspan="2">
        <marquee behavior="alternate" title="Mensagem de Retorno aqui !!" ><B>
<%
    if (ok == 1) Response.Write("<font color=blue>PERGUNTA REVISADA COM SUCESSO</font>");
    if (err1 == 1) Response.Write("<font color=red>DADOS INSUFICIENTES - REVISÃO ABORTADA</font>");
%>
	</B>
        </marquee>
        </td>
    </tr>
<% } %>
	<tr>
		<td colspan=3><input type="hidden" name="codR" value='<%=cod%>'><br><b>
<% if (ok == 1 || err1 == 1) { %>
		<input type="button" value="ADM Perguntas" onClick="location.href='Sabio03.aspx'" style="cursor:pointer;border:0;background-color:rgb(255,255,255);background-image:url('../images/bt3.gif');width:115px;height:25px"> &nbsp; 
		<input type="submit" name="revPrem" value="Revisar Pergunta" style="cursor:pointer;border:0;background-color:rgb(255,255,255);background-image:url('../images/bt3.gif');width:115px;height:25px">
<% } else { %>
		<input type="button" value="Cancelar-Voltar" onClick="history.back()" style="cursor:pointer;border:0;background-color:rgb(255,255,255);background-image:url('../images/bt3.gif');width:115px;height:25px"> &nbsp; 
		<input type="submit" name="revPrem" value="Revisar Pergunta" style="cursor:pointer;border:0;background-color:rgb(255,255,255);background-image:url('../images/bt3.gif');width:115px;height:25px">
<% } %>
		</b></td>
	</tr>
</table>
</form>

<p align="left" style="font-size:12pt"><b>Veja como será apresentada aos Usuários.</b></p>

<table width="100%" cellspacing="0" cellpadding="0">
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#F94942" width="2%"><img src="../images/cant01s.gif"></td>
		<td bgcolor="#F94942" width="64%">
			<br /><b><Span style="font-size: 9pt; color: #FFFFFF"><%=perg%></Span></b>
		</td>
		<td bgcolor="#F94942" width="2%" align="RIGHT"><img src="../images/cant02s.gif"></td>
		<td width="24%" align="CENTER" valign="TOP">
			<b><font style="font-size: 14pt; color: #F94942">Ganhe</font>
			<br><font style="font-size: 12pt">20 pontos</b></font>
		</td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#F94942" width="2%"><img src="../images/cant01ii.gif"></td>
		<td bgcolor="#F94942" width="64%"></td>
		<td bgcolor="#F94942" width="2%" align="RIGHT"><img src="../images/cant02ii.gif"></td>
		<td width="24%" align="CENTER" valign="TOP"></td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#FDB4B1" width="2%" valign="BOTTOM"><img src="../images/cant03i.gif"></td>
		<td bgcolor="#FDB4B1" width="64%">
			<table border="0" width="100%" cellspacing="0" cellpadding="2">
				<tr>
					<td width="3%" valign="top" nowrap><img src="../images/happy3.gif" name="n1" align="center" hspace="3"><input type="radio" name="Resposta"></td>
					<td width="97%" valign="top"><Span><%=resA%></Span></td>
				</tr>
				<tr>
					<td width="3%" valign="top" nowrap><img src="../images/happy3.gif" name="n2" align="center" hspace="3"><input type="radio" name="Resposta"></td>
					<td width="97%" valign="top"><Span><%=resB%></Span></td>
				</tr>
				<tr>
					<td width="3%" valign="top" nowrap><img src="../images/happy3.gif" name="n3" align="center" hspace="3"><input type="radio" name="Resposta"></td>
					<td width="97%" valign="top"><Span><%=resC%></Span></td>
				</tr>
				<tr>
					<td width="3%" valign="top" nowrap><img src="../images/happy3.gif" name="n4" align="center" hspace="3"><input type="radio" name="Resposta"></td>
					<td width="97%" valign="top"><Span><%=resD%></Span></td>
				</tr>
				<tr>
					<td width="3%" valign="top" nowrap><img src="../images/happy3.gif" name="n5" align="center" hspace="3"><input type="radio" name="Resposta"></td>
					<td width="97%" valign="top"><Span><%=resE%></Span></td>
				</tr>
			</table>
		</td>
		<td bgcolor="#FDB4B1" width="2%" align="RIGHT" valign="BOTTOM"><img src="../images/cant04i.gif"></td>
		<td width="24%" align="CENTER" valign="MIDDLE"><img src="../images/resp01.gif"></td>
	</tr>
</table>
<p>
<hr>
* * * RG Sabichão Web - Versão 2000a * * *
<hr>

</center>
</body></html>
