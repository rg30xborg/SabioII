<%@ LANGUAGE=VBSCRIPT %>
<%
	Response.Expires = 0

'                   If inStr(Request.ServerVariables("HTTP_HOST"), "www.aggora.com.br") = 0 Then
'                   	Response.Redirect "http://www.aggora.com.br/sabio/help.htm"
'                   	Response.End
'                   Else
	If Request("ID") = "" Then
		Response.Redirect "sabio01.asp"             'http://www.aggora.com.br/sabio/1/
		Response.End
	Else
		ref = Request("ID")
		voto = Request("Voto")

' Numero de enquetes no banco de dados e grava a informação do cliente
		Set Conexao = Server.CreateObject("ADODB.Connection")
		'SQLServer =>  'Conexao.Open "Provider=SQLOLEDB.1;SERVER=187.45.196.225;DATABASE=aggora1;UID=aggora1;PWD=dade02;"
		Conexao.Open "DRIVER={MySQL ODBC 5.3 ANSI Driver};SERVER=187.45.196.225;PORT=3306;DATABASE=aggora1;USER=aggora1;PASSWORD=dade02;OPTION=3;"

		Set Clicks = Server.CreateObject("ADODB.Recordset")
		'Clicks.CursorType = adOpenKeyset
		'Clicks.LockType = adLockOptimistic
		Clicks.Open "SELECT * FROM Enquetes WHERE ENQ_Cod = " & ref, Conexao
			tvot = Clicks(voto) + 1
			clik = Clicks("ENQ_Total") + 1
			Conexao.Execute "UPDATE Enquetes SET ENQ_Total = " & clik & ", " & voto & " = " & tvot & " WHERE ENQ_Cod = " & ref
		Clicks.Close
		Conexao.Close

		Set Clicks = Nothing
		Set Conexao = Nothing

		Response.Redirect "sabio01.asp"         'http://www.aggora.com.br/sabio/1/
		Response.End
	End If
'                   End If
%>