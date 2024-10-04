<%@ Language=VBScript %>
<%

If inStr(Request.ServerVariables("HTTP_HOST"), "www.aggora.com.br") = 0 Then
	Response.Redirect "http://www.aggora.com.br/sabio/help.htm"
	Response.End
Else
	If Session("IPUserSab") = "" Or Session("mail") = "" Then
		Response.Redirect "http://www.aggora.com.br/sabio/help.htm"
		Response.End
	End If

	CodE = Request("CodE")
	If Not isNumeric(CodE) Or CodE = "" Then CodE = 1
	If CodE > 11 Or CodE < 0 Then CodE = 1 End If

	CodP = Request("CodP")
	If Not isNumeric(CodP) Or CodP = "" Then CodP = 1
	'If CodP > 2 Or CodP < 1 Then CodP = 1 End If

	CodC = Request("CodC")
	If CodC = 1 Then
		acesso = "RESULT:"
		ElseIf CodC = 2 Then
			acesso = "SEU<BR>PALPITE:"
		Else acesso = "INFO:"
	End If

	'On Error Resume Next

%><Script Language="JScript" src="../scripts/SimplesF.js"></Script>
<html><head><title>Sabichão - Pilotos F1</title>
<style>@import url(../images/coUC.css);</style></head>
<body topmargin="5" marginwidth="0" bgcolor="#FFFFFF"><center>
<table bgcolor="#858EA9" cellpadding=0 cellspacing=0 width=338>
	<tr valign=top bgcolor="#858EA9">
		<td width=9><img src=images/cant1s.gif width=9 height=9><BR></td>
		<td width=320> </td>
		<td width=9><img src=images/cant2s.gif width=9 height=9></td>
	</tr>
	<tr align=center>
		<td valign=top colspan=3>
			<table cellpadding=0 cellspacing=0 width=320>
				<tr>
					<td>
<%

' Abre conexao com banco de dados.
	Set Conexao = Server.CreateObject("ADODB.Connection")
	Conexao.Open "DBQ=c:\Sabichao\Cadastro.mdb;Driver={Microsoft Access Driver (*.mdb)}"


	Set Pilotos = Server.CreateObject("ADODB.Recordset")
	Pilotos.Open "SELECT * FROM Equipes E, Pilotos P WHERE E.Equ_Cod = P.Equ_Cod And P.Equ_Cod = " & CodE & " ORDER BY P.Equ_Cod, P.Pil_Cod", Conexao

	If Pilotos.Eof Then
%>
	<font color="cyan">Nenhum Piloto Cadastrado com esta Referência - Verifique prováveis erro nesta Requisição</font>
<%
	Else
		While CInt(CodP) <> Pilotos("Pil_Cod") And Not Pilotos.Eof
			Pilotos.MoveNext
		WEnd
%>
						<table cellpadding=3 cellspacing=1 width=320>
							<tr>
								<td width="35%"><big><b><%=acesso%></b></big><p>E:<%=CodE%> - P:<%=CodP%></p></td>
								<td height=105 align=right valign=center><img src="images/form<%=CodE%>b<%=CodP%>.gif" width=79 height=79 hspace=10> <img src="images/form<%=CodE%>a<%=CodP%>.jpg" width=80 height=95></td>
							</tr>
							<tr valign=top>
								<td align=left bgcolor=#9EB8D1>Equipe de 2005</td>
								<td  bgcolor=#E7ECF2><b><%=Pilotos("Pil_Nome")%></b> (carro nº <%=Pilotos("Pil_Carro")%>)</td>
							</tr>
							<tr valign=top>
								<td width="35%" align=left bgcolor=#9EB8D1>Nacionalidade</td>
								<td  bgcolor=#E7ECF2><%=Pilotos("Pil_Nacao")%></td>
							</tr>
							<tr valign=top>
								<td align=left bgcolor=#9EB8D1>Data - Idade</td>
								<td  bgcolor=#E7ECF2><%=Pilotos("Pil_DtNasc")%> - <%=DateDiff("yyyy", Pilotos("Pil_DtNasc"), Date)%> anos</td>
							</tr>
							<tr valign=top>
								<td align=left bgcolor=#9EB8D1>GPs-Vitórias-Poles</td>
								<td  bgcolor=#E7ECF2><%=Pilotos("Pil_Gps")%> - <%=Pilotos("Pil_Vitorias")%> - <%=Pilotos("Pil_Poles")%></td>
							</tr>
							<tr>
								<td colspan=2 height=105><img src="images/form<%=CodE%>a.jpg" width=320 height=89 VSPACE=2></td>
							</tr>
							<tr>
								<td colspan=2 height=105><img src="images/form<%=CodE%>b.gif" width=320 height=95 VSPACE=2></td>
							</tr>
							<tr valign=top>
								<td bgcolor=#9EB8D1 width=120>Nome da Equipe</td>
								<td width=200  bgcolor=#E7ECF2><%=Pilotos("Equ_Nome")%></td>
							</tr>
							<tr valign=top>
								<td bgcolor=#9EB8D1 width=120>Sede</td>
								<td width=200  bgcolor=#E7ECF2><%=Pilotos("Equ_Sede")%></td>
							</tr>
							<tr valign=top><td bgcolor=#9EB8D1>Estréia na F1</td>
								<td bgcolor=#E7ECF2><%=Pilotos("Equ_Estreia")%></td>
							</tr>
							</tr>
							<tr valign=top>
								<td bgcolor=#9EB8D1>Motor</td>
								<td bgcolor=#E7ECF2><%=Pilotos("Equ_Motor")%></td>
							</tr>
							<tr valign=top>
								<td bgcolor=#9EB8D1>Câmbio</td>
								<td bgcolor=#E7ECF2><%=Pilotos("Equ_Cambio")%></td>
							</tr>
							<tr valign=top>
								<td bgcolor=#9EB8D1>Pilotos de 2005</td>
								<td bgcolor=#E7ECF2>
<%
		Pilotos.MoveFirst
		While Not Pilotos.Eof
%>
									<%=Pilotos("Pil_Cod")%>º - <a href="Sabio03.aspx?CodE=<%=CodE%>&CodP=<%=Pilotos("Pil_Cod")%>&CodC=3"><%=Pilotos("Pil_Nome")%></a><BR>
<%
			Pilotos.MoveNext
		WEnd
%>
								</td>
						</table>
<%
	End If
	Pilotos.Close
	Conexao.Close
	Set Pilotos = Nothing
	Set Conexao = Nothing
End If
%>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr bgcolor="#858EA9" valign=bottom>
		<td><img src=images/cant1i.gif width=9 height=9></td>
		<td align=center style="font-size:6pt">fonte: www.estadao.com.br</td>
		<td><img src=images/cant2i.gif width=9 height=9></td>
	</tr>
</table>
<table cellpadding=0 cellspacing=0 width=338 height=40>
	<tr align=center>
		<td witdh="33%"><img src="../images/setab.gif" onClick="history.back()"></td>
		<td witdh="34%"><img src="../images/close.gif" onClick="window.close()"></td>
		<td witdh="33%"><img src="../images/setaf.gif" onClick="history.forward()"></td>
	</tr>
</table>
</center></body></html>


