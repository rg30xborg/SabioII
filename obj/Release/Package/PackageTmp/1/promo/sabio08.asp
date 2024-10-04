<%@ Language=VBScript %>
<%
	Response.Expires = 0
	
If inStr(Request.ServerVariables("HTTP_HOST"), "www.aggora.com.br") = 0 Then
	Response.Redirect "http://www.aggora.com.br/Sabichao/help.htm"
	Response.End
Else
	If Session("IPUserSab") = "" Or Session("mail") = "" Then
		Response.Redirect "http://www.aggora.com.br/sabio/1/sabio12.asp"
		Response.End
	End If

	cod = Request("cod")

' Abre conexao com banco de dados
	Set Conexao = Server.CreateObject("ADODB.Connection")
	'SQLServer =>  'Conexao.Open "Provider=SQLOLEDB.1;SERVER=aggora1.mysql.dbaas.com.br;DATABASE=aggora1;UID=aggora1;PWD=dade02;"
	Conexao.Open "DRIVER={MySQL ODBC 5.3 ANSI Driver};SERVER=aggora1.mysql.dbaas.com.br;PORT=3306;DATABASE=aggora1;USER=aggora1;PASSWORD=dade02;OPTION=3;"

	If Request.Form("codR") Then
		cod = Request.Form("codR")
		title = Request("title")
		descr = Request("descr")
		spec = Request("spec")
		If title <> "" And descr <> "" And spec <> "" Then
			arq = ""
			If spec = "a" Then
				spec = "Poesia"
			Else
				if spec = "b" Then
					spec = "Imagem"
					arq = "User" & Session("id") & "-" & cod & ".jpg"
				Else
					if spec = "c" Then
						spec = "Audio"
						arq = "User" & Session("id") & "-" & cod & ".mp3"
					Else
						if spec = "d" Then
							spec = "Video"
							arq = "User" & Session("id") & "-" & cod & ".mp4"
						Else
							spec = "Outros"
						End If
					End If
				End If
			End If
			Conexao.Execute "UPDATE Perg0014 SET Titulo = '" & title & "',Descricao = '" & descr & "',Tipo = '" & spec & "',Arquivo = '" & arq & "' WHERE Codigo = " & cod
			ok = 1
		Else
			err1 = 1
		End If
	End If

%><Script Language="JScript" src="../images/SimplesU.js"></Script>
<html><head><title>Sabichao</title><style>@import url(../images/coUC.css);</style></head>
<body bgcolor="#FFFFFF" onLoad="OnCarg()">
<p style="font-size: 10pt">
	Sala de: <font color="#0588C0"><b>ADM MEU TALENTO</font><Span ID="NCalc"> - Processando Dados .... </Span></b>
	<span style="font-size: 9pt"><br>
	 - REVISÃO DE CRIAÇÃO PESSOAL NO SABICHÃO <B>
<%
	If ok  = 1 Then Response.Write "<font color=blue>CRIAÇÃO REVISADA COM SUCESSO</font>" End If
	If err1 = 1 then Response.Write "<font color=red>DADOS INSUFICIENTES - REVISÃO ABORTADA</font>" End If
%>
	</B></span>
</p>
<center>
<form method="POST" action="sabio08.asp" onSubmit="return VerficaART()" name="Revisar">
<table width="90%">
	<tr>
		<td style="font-size: 12pt">
			<b>Dados para Revisar a Criação Pessoal.</b>
		</td>
	</tr>
</table>
<%
' Grava informacoes no banco de dados
	Set Talento = Server.CreateObject("ADODB.Recordset")
	Talento.Open "SELECT * FROM Perg0014 T, Users U WHERE T.USR_ID = U.USR_ID And Codigo = " & cod, Conexao
		Nome = Talento("USR_Nome")
		Titulo = Talento("Titulo")
		Descricao = Talento("Descricao")
		Tipo = Talento("Tipo")
		Arquivo = "uploads/" & Talento("Arquivo")
%>
<table width="90%" cellspacing="2" cellpadding="1">
	<tr align="center" bgcolor="#4E5CA0" style="color: #FFFFFF; font-size: 10pt">
		<td width="5%"><b>Nº</b></td>
		<td width="95%"><b>Detalhes da "Obra de Arte" (Seu talento poderá ser compartilhado)</b></td>
	</tr>
	<tr bgcolor="#D7DBEC" align="center">
		<td width="5%"><%=cod%></td>
		<td width="95%" nowrap align="right">
		Titulo: <input type="text" style="width:80%; background-color:#FFFFDF" name="title" maxlength="256" value="<%=Titulo%>">
		<br><br>Descrição: <textarea style="width:80%; height:60" name="descr" maxlength="1024"><%=Descricao%></textarea>
		<center>
		<br>Tipo de Criação a encaminhar: <input type="file" style="visibility:hidden" name="arqUpLoad">
		<br>Poesia <input type="radio" name="spec" value="a" onClick="tipoA(1)" <%If Tipo = "Poesia" Then%>checked<%End If%>>
		&nbsp; &nbsp; Imagem <input type="radio" name="spec" value="b" onClick="tipoA(2)" <%If Tipo = "Imagem" Then%>checked<%End If%>> 
		&nbsp; &nbsp; Audio <input type="radio" name="spec" value="c" onClick="tipoA(3)"  <%If Tipo = "Audio" Then%>checked<%End If%>> 
		&nbsp; &nbsp; Video <input type="radio" name="spec" value="d" onClick="tipoA(4)"  <%If Tipo = "Video" Then%>checked<%End If%>> 
		&nbsp; &nbsp; Outros <input type="radio" name="spec" value="e" onClick="tipoA(5)" <%If Tipo = "Outros" Then%>checked<%End If%>>
		</center>
		</td>
	</tr>
	<tr>
		<td colspan=2><input type="hidden" name="codR" value='<%=Talento("Codigo")%>'><br><b>
<% If ok = 1 Or err1 = 1 Then %>
		<input type="button" value="ADM Criação" onClick="location.href='sabio06.asp'" style="border:0;background-color:rgb(255,255,255);background-image:url('../images/bt3.gif');width:115;height:25"> &nbsp; 
		<input type="submit" name="revPrem" value="Revisar Criação" style="border:0;background-color:rgb(255,255,255);background-image:url('../images/bt3.gif');width:115;height:25">
<% Else %>
		<input type="button" value="Cancelar-Voltar" onClick="history.back()" style="border:0;background-color:rgb(255,255,255);background-image:url('../images/bt3.gif');width:115;height:25"> &nbsp; 
		<input type="submit" name="revPrem" value="Revisar Criação" style="border:0;background-color:rgb(255,255,255);background-image:url('../images/bt3.gif');width:115;height:25">
<% End If %>
		</b></td>
	</tr>
</table>
</form>

<p align="left" style="font-size:12pt"><b>Veja como será apresentada aos Usuários.</b></p>

<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#44AA00" width="2%"><img src="../images/cant01s.gif"></td>
		<td bgcolor="#44AA00" width="64%">
			 - AQUI VOCÊ GANHA PONTOS CURTINDO O TALENTO DOS ARTISTAS DO SITE<br>
			<b><Span style="font-size: 9pt; color: #FFFFFF" ID="NPerg">Abaixo está sendo apresentada uma "Obra de Arte" criada e encaminhada por Usuários
			do Site Sabichão para voce Curtir o Talento destes "Artistas Natos". Exprima sua opinião sobre essa e ganhe pontos nesta Promoção.</Span></b>
		</td>
		<td bgcolor="#44AA00" width="2%" align="RIGHT"><img src="../images/cant02s.gif"></td>
		<td width="24%" align="CENTER" valign="TOP">
			<b><font style="font-size: 14pt; color: #F94942">Ganhe</font>
			<br><font style="font-size: 12pt">20 pontos</b></font>
		</td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#44AA00" width="2%"><img src="../images/cant01ii.gif"></td>
		<td bgcolor="#44AA00" width="64%"></td>
		<td bgcolor="#44AA00" width="2%" align="RIGHT"><img src="../images/cant02ii.gif"></td>
		<td width="24%" align="CENTER" valign="TOP"></td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#AAEE22" width="2%" valign="BOTTOM"><img src="../images/cant03i.gif"></td>
		<td bgcolor="#AAEE22" width="64%"><br>
			<table width="100%" cellspacing="2" cellpadding="1" style="font-family: Arial; font-size:9pt">
				<tr align="center" bgcolor="#4E5CA0" style="color: #FFFFFF; font-size: 10pt">
					<td width="5%"><b>Nº</b></td>
					<td width="95%"><b>Talento do Usuário (<%=Nome%> - Tipo: <%=Tipo%>)</b></td>
				</tr>
				<tr bgcolor="#D7DBEC" align="center">
					<td width="5%"><%=cod%></td>
					<td width="95%" align="center">
<%
' Checa se existem Usuários no banco de dados
	If Talento.Eof Then
%>
		Você ainda não adicionou criações para a Sala [Meus Talentos]. Aproveite agora e fature Pontos Extras...
<%
	Else
		'vbCrLf = Chr$(13) & Chr$(10)
%>
					<p align="justify"><span align="right">Título: <b><%=Titulo%></b></span><br><%=Replace(Descricao, vbCrLf, "<br />")%>.</p>
<% 
		If Talento("Tipo") = "Audio" Then %>
					<audio src=<%=Arquivo%> controls>
    						Seu navegador não suporta áudio HTML5
  					</audio>
<% 
		Else
			If Talento("Tipo") = "Video" Then
%>
					<!-- <iframe width="450" height="240" frameborder="0" allowfullscreen src="/CAU_004_Previa_001.mp4"></iframe> -->
					<video src="/CAU_004_Previa_001.mp4" width="450" height="240" frameborder="0" controls allowfullscreen>
    						Seu navegador não suporta áudio HTML5
  					</video>
<%
			Else
				If Talento("Tipo") = "Imagem" Then
%>
					<img src=<%=Arquivo%> width="450" height="240" frameborder="0">
<%
				End If
 	 		End If
   		End If 
	End If
%>
					<br><br>O que achou desta Arte?
					<br>Manero <input type="radio" name="spec" value="m" onClick="tipoA(1)">
					&nbsp; &nbsp; Legal<input type="radio" name="spec" value="l" onClick="tipoA(2)">
					&nbsp; &nbsp; DMais<input type="radio" name="spec" value="d" onClick="tipoA(3)">
					<br>
					</td>
				</tr>
				<tr>
					<td colspan=2>
						<br>
					</td>
				</tr>
			</table>
		</td>
		<td bgcolor="#AAEE22" width="2%" align="RIGHT" valign="BOTTOM"><img src="../images/cant04i.gif"></td>
		<td width="24%" align="CENTER" valign="MIDDLE"><img src="../images/resp01.gif"></td>
	</tr>
</table>
<%
	Talento.Close
	Conexao.Close

	Set Talento = Nothing
	Set Conexao = Nothing
End If
%>
<p>
<hr>
* * * RG Sabichão Web - Versão 2000a * * *
<hr>

</center>
</body></html>
