<%@ Language=VBScript %>
<%
	Response.Expires = 0
	
'       If inStr(Request.ServerVariables("HTTP_HOST"), "www.aggora.com.br") = 0 Then
'       	Response.Redirect "http://www.aggora.com.br/sabio/help.htm"
'       	Response.End
'       Else
	If Session("IPUserSab") = "" Or Session("mail") = "" Then
		Response.Redirect "sabio12.asp"         'http://www.aggora.com.br/sabio/1/
		Response.End
	End If

' Numero maximo de perguntas no dia ("Dia") por Sala
	Session("Dia") = 3
	Session("DiaE") = 5
	Session("DiaP") = 10
	On Error Resume Next

' Abre conexao com banco de dados.
	Set Conexao = Server.CreateObject("ADODB.Connection")
	'SQLServer =>  'Conexao.Open "Provider=SQLOLEDB.1;SERVER=187.45.196.225;DATABASE=aggora1;UID=aggora1;PWD=dade02;"
	Conexao.Open "DRIVER={MySQL ODBC 5.3 ANSI Driver};SERVER=187.45.196.225;PORT=3306;DATABASE=aggora1;USER=aggora1;PASSWORD=dade02;OPTION=3;"

%><Script Language="JScript" src="images/SimplesF.js"></Script>
<html><head><title>Sabichao</title><style>@import url(images/coUC.css);</style></head>
<body bgcolor="#FFFFFF" onLoad="OnCarg()">
<p style="font-size: 10pt">
	Sala de : <font color="#0588C0"><b>MENU DE CONTROLE</font><Span ID="NCalc"> - Carregando ....</Span></b>
	<span style="font-size: 8pt"><br>
	 - MENSAGENS, CADASTRO, RESUMO e LEGENDAS DO SABICHÃO (<%=Application("visita")%>) - (<%=Session("id")%>)
	</span>
</p>
<center>
<form method="post" name="formDelete" action="sabio13.asp" onsubmit="return limpaMens()">
<table width="90%" style="font-size: 12pt">
	<tr>
		<td>
			<b>Mensagens ou Premiações: <%=Session("IPUserSab")%></b>
		</td>
	</tr>
</table>
<%
' Abre tabela de mensagens usando a conexao aberta acima.
	Set Eventos = Server.CreateObject("ADODB.Recordset")
	Eventos.Open "SELECT * FROM Eventos WHERE EVN_Email = '" & Session("mail") & "' ORDER BY EVN_Cod Desc", Conexao, adOpenKeyset

' Checa se existem mensagens no banco de dados
	If Eventos.Eof Then 
%>
<table width="90%" cellspacing="2" cellpadding="1">
	<tr>
		<td bgcolor='#FFFFDF'>
			Bem Vindo ao Site Sabichão Web, onde você se <b>Diverte e Testa</b> seus Conhecimentos.
		</td> 
	</tr>
</table>
<%
	Else
		contador = Eventos.RecordCount - 3
%>
<Script Language="JavaScript">
function limpaMens(){
	i = j = 0
	while(formDelete["nBox" + regisDat[i]]){
		if(formDelete["nBox" + regisDat[i]].checked) j++
		i++
	}
	if(j == 0){ alert("SABICHÃO WEB ALERTA:\n\nPara remover uma Mensagem do Registro é necessário marcar pelo menos uma caixa.")
		return false
	}
}
</Script>
<table width="90%" cellspacing="2" cellpadding="1" style="color: #0000FF; font-size: 10pt">
	<tr align="center" bgcolor="#FFCC66">
		<td width="5%"><b>x</b></td>
		<td width="15%"><b>Data</b></td>
		<td width="65%"><b>Descrição</b></td>
		<td width="15%"><b>OBS.</b></td>
	</tr>
</table>
<Script Language="JavaScript">
	regisDat = new Array()
	regisOrd = 0
</Script>
<%
		ContMost = 1
		Eventos.MoveFirst
		While Not Eventos.EOF And ContMost < 4
			ContMost = ContMost + 1
			nBox = "nBox" & Eventos("EVN_Cod")
%>
<Script Language="JavaScript">
	regisDat[regisOrd] = <%=Eventos("EVN_Cod")%>
	regisOrd++
</Script>
<table width="90%" cellspacing="2" cellpadding="1">
	<tr bgcolor='#FFFFDF' align="center">
		<td width='5%'><input type='checkbox' name='<%=nBox%>' value='<%=Eventos("EVN_Cod")%>'></td> 
		<td width='15%'><%= Eventos("EVN_Inclusao")%></td> 
		<td align="left" width='65%'><%= Eventos("EVN_Desc")%></td> 
		<td width='15%'><%= Eventos("EVN_Tipo")%></td> 
	</tr>
</table>
<%
			Eventos.MoveNext
		Wend
		If contador > 0 Then
%>
<table width="90%" cellspacing="2" cellpadding="1">
	<tr>
		<td bgcolor='#FFEDA7'>
<%			If contador = 1 Then %>
			Existe ainda 1 mensagem para você, que será mostrada quando ao menos 1 das acima for removida.
<%			Else %>
			Existe ainda <%=contador%> mensagens para você, que serão mostradas quando as acima forem removidas.
<%			End If %>
		</td> 
	</tr>
</table>
<%
		End If
%>
<table width="90%">
	<tr>
		<td>
			<br><input type="submit" value="Remover Mens." name="ApagaData" style="border:0;background-color:rgb(255,255,255);background-image:url('images/bt3.gif');width:115;height:25">
		</td>
	</tr>
</table>
<%
	End If
	Eventos.Close
	Set Eventos = Nothing
%>
</form>
<table width="90%">
	<tr>
		<td align='right'>
			<input type="button" onClick="location.href='sabio04.asp'" value="Dados Usuário" style="border:0;background-color:rgb(255,255,255);background-image:url('images/bt3b.gif');width:115;height:25">
		</td>
	</tr>
</table>
<table width="90%" style="font-size: 12pt">
	<tr>
		<td>
			<b>Resumo de suas Atividades no Sabichão</b>
		</td>
	</tr>
</table>
<%
	Set DadosUsuario = Server.CreateObject("ADODB.Recordset")
	'DadosUsuario.CursorType = adOpenKeyset
	'DadosUsuario.LockType = adLockOptimistic
	DadosUsuario.Open "SELECT * FROM UserDados WHERE USR_ID = " & Session("id"), Conexao
	if DadosUsuario("USD_Acesso") = "new" Then
		pTotl = 500
		pCosc = 0	
%>
<table width="90%" cellspacing="2" cellpadding="1">
	<tr>
		<td bgcolor="#FFEDA7">
			Por sua inscrição você já Ganhou <b>500 PONTOS</b> - Responda suas perguntas do dia e aumente muito mais os seus PONTOS.
		</td> 
	</tr>
	<tr>
		<td bgcolor="#FFFFDF">
			Para acessar as Salas de Perguntas do Sabichão clique em qualquer item no Menu Salas-QUIZ à esquerda.
		</td> 
	</tr>
<%
' Abre tabela de indicados usando a conexao aberta acima.
		Set Promos = Server.CreateObject("ADODB.Recordset")
		'Promos.CursorType = adOpenKeyset
		'Promos.LockType = adLockOptimistic
		Promos.Open "SELECT PRM_Email_Indicado FROM Promos WHERE PRM_Email_indicado = '" & Session("mail") & "'", Conexao
		strUP = ""
		If Not Promos.Eof Then
			Conexao.Execute "UPDATE Promos SET PRM_Confirmado = 1 WHERE PRM_Email_indicado = '" & Session("mail") & "'"
			strUP = ", USD_Total = 1000 "
%>
	<tr>
		<td bgcolor="#FFEDA7">
			Por ser indicado pela Promoção Indique um Amigo você faturou <b>+ 500 PONTOS EXTRAS</b> - Afinal amigo é pra essas coisas né ...
		</td> 
	</tr>
<%
			pTotl = 1000
		End If
		Promos.Close
		Set Promos = Nothing
%>
</table>
<%
	Else
		pTotl = DadosUsuario("USD_Total")
		pGerl = pTotl + DadosUsuario("USD_Apts") 
		pCosc = DadosUsuario("USD_Consec")
%>
<table width="90%" cellspacing="2" cellpadding="1">
	<tr align="center" bgcolor="#FFCC66" style="color: #0000FF; font-size: 10pt">
		<td><b>Item</b></td>
		<td><b>Descrição - Valor</b></td>
	</tr>
	<tr bgcolor="#FFFFDF">
		<td>Data último Acesso</td>
		<td><b><%=DadosUsuario("USD_Acesso")%></b></td>
	</tr>
	<tr bgcolor="#FFFFDF">
		<td>CONSECUTIVAS</td>
		<td><b><big><%=pCosc%></big></b></td>
	</tr>
	<tr bgcolor="#FFFFDF">
		<td>DISPONÍVEL PARA PRÊMIOS ou JOGOS</td>
		<td><b><big><%=pTotl%></big></b> do TOTAL de <big><%=pGerl%></big></td>
	</tr>
	<tr bgcolor="#FFFFDF">
	</tr>
	<tr bgcolor="#FFEDA7">
		<td width="100%" colspan=2 align="center">
			Para acessar as Salas do Sabichão clique em qualquer item no Menu à esquerda.
		</td>
	</tr>
</table>
<p><input type="button" onClick="location.href='sabio22.asp'" value="Detalhar Salas" style="border:0;background-color:rgb(255,255,255);background-image:url('images/bt3.gif');width:115;height:25">
<%
	End If
	data = FormatDateTime(Now, 0)
	Conexao.Execute "UPDATE UserDados SET USD_Acesso = '" & data & "'" & strUP & " WHERE USR_ID = " & Session("id")
	DadosUsuario.Close
	Set DadosUsuario = Nothing
%>
<Script Language=JavaScript>
<!--
	if(top.frames.super1.USerID) top.frames.super1.USerID.innerText = '<%=Session("IPUserSab")%>'
	if(top.frames.super1.Ponto) top.frames.super1.Ponto.innerText = <%=pTotl%>
	if(top.frames.super1.LogOK) top.frames.super1.LogOK.style="position:absolute;top:3;left:3;visibility:visible"
//-->
</Script>
<p>
<%
' Numero de enquetes no banco de dados e grava a informação do cliente

	Set RS_Max = Server.CreateObject("ADODB.Recordset")
	RS_Max.Open "SELECT MAX(ENQ_Cod) AS max_Cod FROM Enquetes", Conexao
	ref = RS_Max("max_Cod")
	RS_Max.Close
	Set RS_Max = Nothing

	Set Clicks = Server.CreateObject("ADODB.Recordset")
	Randomize
	ref = Int(ref * Rnd + 1)
	Clicks.Open "SELECT * FROM Enquetes WHERE ENQ_Cod = " & ref, Conexao

%>
<Script Language="JavaScript">
<!--//
function Vote(obj){
	URL = 'sabio16.asp?ID=<%=ref%>&Voto=' + obj
	location.href = URL
}
//-->
</Script>
<table width="90%" style="font-size: 12pt">
	<tr>
		<td>
			<b>Vote-Veja nossas Enquetes</b>
		</td>
	</tr>
</table>
<table width="90%" cellspacing="2" cellpadding="1">
	<tr>
		<td bgcolor='#FFEDA7'>
			&nbsp;<a href="sabio16.asp" title="Lista todas as Enquetes"><%=Clicks("ENQ_Cod")%></a>. <%=Clicks("ENQ_Desc")%>
		</td> 
	</tr>
	<tr>
		<td bgcolor='#FFFFDF'>
			<%tot = Round(Clicks("ENQ_Aa") / Clicks("ENQ_Total"),2) * 100%><INPUT TYPE="radio" NAME="rdresp0" onClick="Vote('ENQ_Aa')"><%=tot%>% <%=Clicks("ENQ_A")%> (<%=Clicks("ENQ_Aa")%>)
			<%tot = Round(Clicks("ENQ_Bb") / Clicks("ENQ_Total"),2) * 100%><INPUT TYPE="radio" NAME="rdresp0" onClick="Vote('ENQ_Bb')"><%=tot%>% <%=Clicks("ENQ_B")%> (<%=Clicks("ENQ_Bb")%>)
			<%tot = Round(Clicks("ENQ_Cc") / Clicks("ENQ_Total"),2) * 100%><INPUT TYPE="radio" NAME="rdresp0" onClick="Vote('ENQ_Cc')"><%=tot%>% <%=Clicks("ENQ_C")%> (<%=Clicks("ENQ_Cc")%>)
			<%tot = Round(Clicks("ENQ_Dd") / Clicks("ENQ_Total"),2) * 100%><INPUT TYPE="radio" NAME="rdresp0" onClick="Vote('ENQ_Dd')"><%=tot%>% <%=Clicks("ENQ_D")%> (<%=Clicks("ENQ_Dd")%>)
		</td> 
	</tr>
</table>
<%
	Clicks.Close
	Conexao.Close
	Set Clicks = Nothing
	Set Conexao = Nothing
%>
<p>
<table cellpadding="0" cellspacing="0" width="90%" style="font-family: Arial; font-size:9pt">
	<tr>
		<td colspan=5 style="font-family: Verdana; font-size:12pt"><b>Legenda para as Salas de Perguntas</b>:<p> </p></td>
	</tr>
	<tr align="center" valign="middle">
		<td width="20%"><img src="images/resp000.gif"></td>
		<td width="20%"><img src="images/happy2.gif"></td>
		<td width="20%"><img src="images/happy3.gif"></td>
		<td width="20%"><img src="images/happy1.gif"></td>
		<td width="20%"><img src="images/cont000.gif"></td>
	</tr>
	<tr align="center" valign="middle">
		<td width="20%">Enviar<br>Responta</td>
		<td width="20%">Resposta<br>Errada</td>
		<td width="20%">Seu<br>Palpite</td>
		<td width="20%">Resposta<br>Certa</td>
		<td width="20%">Próxima<br>(Sala/Pergunta)</td>
	</tr>
</table>
<p>
<%
	If Session("mail") = "rg30@bol.com.br" Then
		If Err <> 0 Then
			Response.Write "Ocorreu um erro na tentativa de carregar esta página: <B>" & Err.Description & "</B>"
		End If
		Serial = Request.ServerVariables("HTTP_REFERER")
		Response.Write("<p>O REFERER é: " & Serial & "<br>")
		Serial = Request.ServerVariables("HTTP_HOST")
		Response.Write("O HOST é: " & Serial & "<p>")
		Response.Write("<a href=http://" & Serial & "/adm/sabichao target=_top>GERSab 1.0<br>(Gerenciamento WEB do Site Sabichão)</a>")
        Response.Write("<br><br>IPUserSab: " & Session("IPUserSab"))
        Response.Write("<br>mail: " & Session("mail"))

	End If
'       End If
%>
</center>
<div id="INV002" style="position:absolute; width: 100%; height: 60px; left:0px; top:20px; z-index: 8; visibility: inherit"><marquee behavior="scroll" direction="right" scrollamount="5"><img src="images/coelho2R.gif" width="60" height="60"></marquee></div>
<embed name="somcerto" src="/_Library/rgchico.wav" loop="false" autostart="false" hidden="true" width="0" height="0"></embed>
</body></html>