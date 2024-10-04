<HTML>
<head><title>Usuários do Sabichão</title></head>
<body><font face='verdana' size='2'> 
<p> Lista de usuários do <b>Sabichão</b> </p>
<%
	Dim nada
	nada = 0
	Set conexaoSQL = CreateObject("ADODB.Connection") 
	'SQLServer =>  'conexaoSQL.Open "Provider=SQLOLEDB.1;SERVER=aggora1.mysql.dbaas.com.br;DATABASE=aggora1;UID=aggora1;PWD=dade02;"
	conexaoSQL.Open "DRIVER={MySQL ODBC 5.3 ANSI Driver};SERVER=aggora1.mysql.dbaas.com.br;PORT=3306;DATABASE=aggora1;USER=aggora1;PASSWORD=dade02;OPTION=3;"

	Set rs = Server.CreateObject("AdoDB.Recordset") 
	rs.open "Select * from UserDados order by USR_ID", conexaoSQL 
%>
<table border=1 cellspacing=1 cellpadding=5 style="font-face:'verdana';font-size:'10'"><tr bgcolor=#CACACA>
<% 
	if not rs.EOF then
		for each x in rs.fields
			response.write "<td>" & (x.name) & "</td>"
		next
		response.write "</tr>"
		nada=1
	else
		response.write("<td>Nenhum dado na tabela Users</td></tr>")
	end if

	while not rs.EOF
		response.write "<tr>"
		for each x in rs.fields
			response.write "<td>" & (x.value) & "</td>"
		next
		rs.movenext 
		response.write "</tr>"
	wend

	response.write "</table>"
	response.write "<p>Em: " & now() & "</p>"

	conexaoSQL.close 
	set rs = nothing 
	set conexaoSQL = nothing 
%>
</font></body>
</HTML>