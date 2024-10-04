<%@ Language=VBScript %>
<%
	Response.Expires = 0
	
'                   If inStr(Request.ServerVariables("HTTP_HOST"), "www.aggora.com.br") = 0 Then
'                   	Response.Redirect "http://www.aggora.com.br/sabio/help.htm"
'                   	Response.End
'                   Else
	If Session("IPUserSab") = "" Or Session("mail") = "" Then
		Response.Redirect "sabio12.asp"             'http://www.aggora.com.br/sabio/1/
		Response.End
	Else
		Set Conexao = Server.CreateObject("ADODB.Connection")
		'SQLServer =>  'Conexao.Open "Provider=SQLOLEDB.1;SERVER=187.45.196.225;DATABASE=aggora1;UID=aggora1;PWD=dade02;"
		Conexao.Open "DRIVER={MySQL ODBC 5.3 ANSI Driver};SERVER=187.45.196.225;PORT=3306;DATABASE=aggora1;USER=aggora1;PASSWORD=dade02;OPTION=3;"

' Abre tabela de eventos usando a conexao aberta acima.
		Set Eventos = Server.CreateObject("ADODB.Recordset")

		If Request.Form <> "" Then
			For Each field_name In Request.Form
				If field_name <> "ApagaData" And Request.Form(field_name) <> "0" Then
					Conexao.Execute "DELETE FROM Eventos WHERE EVN_Cod = " & Request.Form(field_name) & " AND EVN_Email = '" & Session("mail") & "'"
				End If
			Next
		End If

		Conexao.Close

		Set Eventos = Nothing
		Set Conexao = Nothing

		Response.Redirect "Sabio03.aspx"         'http://www.aggora.com.br/sabio/1/
		Response.End
	End If
'                   End If
%>