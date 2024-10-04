<%@ LANGUAGE=VBSCRIPT %>
<%
	Response.Expires = 0

'                   If inStr(Request.ServerVariables("HTTP_HOST"), "www.aggora.com.br") = 0 Then
'                   	Response.Redirect "http://www.aggora.com.br/sabio/help.htm"
'                   	Response.End
'                   Else
	senha = "sabioquiz"
	ip = Request.ServerVariables("REMOTE_HOST")
	nome = ":Anonimo:"
	email = "0000" & ip

' Abre conexao com banco de dados.
	Set Conexao = Server.CreateObject("ADODB.Connection")
	'SQLServer =>  'Conexao.Open "Provider=SQLOLEDB.1;SERVER=187.45.196.225;DATABASE=aggora1;UID=aggora1;PWD=dade02;"
	Conexao.Open "DRIVER={MySQL ODBC 5.3 ANSI Driver};SERVER=187.45.196.225;PORT=3306;DATABASE=aggora1;USER=aggora1;PASSWORD=dade02;OPTION=3;"

' Abre tabela de produtos usando a conexao aberta acima.
	Set Usuarios = Server.CreateObject("ADODB.Recordset")
	Usuarios.Open "SELECT * FROM Users WHERE USR_Email = '" & email & "'", Conexao

	If Usuarios.Eof Then
		Usuarios.Close
		Set Usuarios = Nothing

		Conexao.Execute "INSERT INTO Users(USR_Nome, USR_Email, USR_Senha, USR_IP) VALUES('" & nome & "','" & email & "','" & senha & "','" & ip & "')"

		Set RS_Max = Server.CreateObject("ADODB.Recordset")
		RS_Max.Open "SELECT MAX(USR_ID) AS max_cod FROM Users", Conexao
			Session("id") = RS_Max("max_cod")
			Conexao.Execute "INSERT INTO UserDados (USR_ID, USR_Email) VALUES('" & Session("id") & "','" & email & "')"
		RS_Max.Close
		Set RS_Max = Nothing

		Conexao.Close
		Set Conexao = Nothing
	Else
		Session("id") = Usuarios("USR_ID")
		Usuarios.Close
		Conexao.Close
		Set Usuarios = Nothing
		Set Conexao = Nothing
	End If

	Session("IPUserSab") = nome
	Session("mail") = email

	Response.Redirect "sabio05.htm"                 'http://www.aggora.com.br/sabio/1/
	Response.End

%>