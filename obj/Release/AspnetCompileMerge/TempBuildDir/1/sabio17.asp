<%@ LANGUAGE=VBSCRIPT %>
<%
	Response.Expires = 0

'                   If inStr(Request.ServerVariables("HTTP_HOST"), "www.aggora.com.br") = 0 Then
'                   	Response.Redirect "http://www.aggora.com.br/sabio/help.htm"
'                   	Response.End
'                   Else
	Set Conexao = Server.CreateObject("ADODB.Connection")
	'SQLServer =>  'Conexao.Open "Provider=SQLOLEDB.1;SERVER=187.45.196.225;DATABASE=aggora1;UID=aggora1;PWD=dade02;"
	Conexao.Open "DRIVER={MySQL ODBC 5.3 ANSI Driver};SERVER=187.45.196.225;PORT=3306;DATABASE=aggora1;USER=aggora1;PASSWORD=dade02;OPTION=3;"

	If Request("ID") <> "" Then
		ref = Request("ID")
		voto = Request("Voto")

' Numero de enquetes no banco de dados e grava a informação do cliente
		Set Clicks = Server.CreateObject("ADODB.Recordset")
		'Clicks.CursorType = adOpenKeyset
		'Clicks.LockType = adLockOptimistic
		Clicks.Open "SELECT * FROM Enquetes WHERE ENQ_Cod = " & ref, Conexao
			tvot = Clicks(voto) + 1
			clik = Clicks("ENQ_Total") + 1
			Conexao.Execute "UPDATE Enquetes SET ENQ_Total = " & clik & ", " & voto & " = " & tvot & " WHERE ENQ_Cod = " & ref
		Clicks.Close
		Set Clicks = Nothing
	End If

%><Script Language="JScript" src="scripts/SimplesF.js"></Script>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Sabichão</title><style>@import url(images/coUC.css);</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"></head>
<body bgcolor="#FFFFFF"" onLoad="OnCarg()">
<p style="font-size: 10pt">
	<font color="#0588C0"><b>ESPAÇO BATE PAPO</font><Span ID="NCalc"> - Carregando .... </Span></b>
	<span style="font-size: 8pt"><br>
	 - AQUI SERA IMPLEMENTADO O CHAT DO SABICHÃO
	</span>
</p>
<center>
<%
' Numero de enquetes no banco de dados e grava a informação do cliente
	Set Clicks = Server.CreateObject("ADODB.Recordset")
	Clicks.Open "SELECT * FROM Enquetes", Conexao

' Checa se existem mensagens no banco de dados
	If Clicks.Eof Then 
%>
<table width="90%" cellspacing="2" cellpadding="1">
	<tr>
		<td bgcolor='#FFFFDF'>
			Nenhuma Enquete disponível no momento. Aguarde para breve...
		</td> 
	</tr>
</table>
<%
	Else
		bgcl = "background-color:#FFFFEE"
		Clicks.MoveFirst
		While Not Clicks.EOF
			If bgcl = "background-color:#FFFFEE" Then bgcl = "background-color:#FFFFDF" Else  bgcl = "background-color:#FFFFEE" End If
%>

<table width="90%" cellspacing="2" cellpadding="1">
	<tr>
		<td align="center">
			<div class="panel panel-default" style="box-shadow: -5px 5px 4px; <%=bgcl%>" >
    				<div class="panel-body" style="text-align: justify;">
<p align="justify"><b><%=Clicks("ENQ_Cod")%>. <%=Clicks("ENQ_Desc")%></b></p>
	<%tot = Round(Clicks("ENQ_Aa") / Clicks("ENQ_Total"),2)%>
<p><img src="images/barra01.gif" width="15" height="19"><img src="images/barra02.gif" width="<%=(tot * 100)%>" height="19"><img src="images/barra03.gif" width="<%=((1 - tot) * 100)%>" height="19"><img src="images/barra04.gif" width="15" height="19"> <%=tot * 100%>% <%=Clicks("ENQ_A")%> (<%=Clicks("ENQ_Aa")%>)
	<%tot = Round(Clicks("ENQ_Bb") / Clicks("ENQ_Total"),2)%>
<br><img src="images/barra01.gif" width="15" height="19"><img src="images/barra02.gif" width="<%=(tot * 100)%>" height="19"><img src="images/barra03.gif" width="<%=((1 - tot) * 100)%>" height="19"><img src="images/barra04.gif" width="15" height="19"> <%=tot * 100%>% <%=Clicks("ENQ_B")%> (<%=Clicks("ENQ_Bb")%>)
	<%tot = Round(Clicks("ENQ_Cc") / Clicks("ENQ_Total"),2)%>
<br><img src="images/barra01.gif" width="15" height="19"><img src="images/barra02.gif" width="<%=(tot * 100)%>" height="19"><img src="images/barra03.gif" width="<%=((1 - tot) * 100)%>" height="19"><img src="images/barra04.gif" width="15" height="19"> <%=tot * 100%>% <%=Clicks("ENQ_C")%> (<%=Clicks("ENQ_Cc")%>)
	<%tot = Round(Clicks("ENQ_Dd") / Clicks("ENQ_Total"),2)%>
<br><img src="images/barra01.gif" width="15" height="19"><img src="images/barra02.gif" width="<%=(tot * 100)%>" height="19"><img src="images/barra03.gif" width="<%=((1 - tot) * 100)%>" height="19"><img src="images/barra04.gif" width="15" height="19"> <%=tot * 100%>% <%=Clicks("ENQ_D")%> (<%=Clicks("ENQ_Dd")%>)
</p>
				</div>
			</div>
		</td> 
	</tr>
</table>
<br>
<%
			Clicks.MoveNext
		Wend
	End If

	Clicks.Close
	Conexao.Close
	Set Clicks = Nothing
	Set Conexao = Nothing
'                   End If
%>
<table border="0" width="90%" cellspacing="0" cellpadding="0">
	<tr> 
		<td>
			<p align="justify"><b>ENQUANTO O CHAT NÂO FICA PRONTO:</b> As Enquetes do Sabichão determinam como nossa Equipe ira conduzir os trabalhos de
			aperfeiçoamento e evolução do Site, assim, quanto maior for a sua participação, mais estaremos deixando
			a aparência e funcionalidade do Sabichão de acordo com seu gosto e da maioria de nossos usuários.</p>
		</td>
	</tr>
</table>
<p align=center><input type="button" value="Voltar" style="border:0;background-color:rgb(255,255,255);background-image:url('images/bt3.gif');width:115;height:25" onClick="history.back()"></p>
</center>
</body></html>