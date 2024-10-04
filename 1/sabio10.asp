<%@ Language=VBScript %>
<%
	Response.Expires = 0
	
'               If inStr(Request.ServerVariables("HTTP_HOST"), "www.aggora.com.br") = 0 Then
'               	Response.Redirect "http://www.aggora.com.br/sabio/help.htm"
'               	Response.End
'               Else

%>

<Script Language="JScript" runat="Server">
	Session("IPUserSab") = null
	startPage = "sabio01.asp"                   //http://www.aggora.com.br/sabio/1/

	if(Request.Form("userlogon").Count == 0) Response.Redirect(startPage)

	ax = Request.Form("userlogon")(1)
	if(ax.indexOf("@") < 0 || ax.indexOf(" ") >= 0 || ax.length < 10) ax = ""
	else Session("logmail") = ax

	bx = Request.Form("userpassw")(1)
	if(bx.length < 5) bx = ""

	if(ax == "" && bx == "") Response.Redirect(startPage)
	if(ax == "") Response.Redirect(startPage + "?log=1&pas=" + (bx == "" ? 1 : 0))
	if(bx == "") Response.Redirect(startPage + "?pas=1&log=" + (ax == "" ? 1 : 0))
	ax = ax.toLowerCase()
</Script>

<%
' Abre conexao com banco de dados.
	Set Conexao = Server.CreateObject("ADODB.Connection")
	'SQLServer =>  'Conexao.Open "Provider=SQLOLEDB.1;SERVER=187.45.196.225;DATABASE=aggora1;UID=aggora1;PWD=dade02;"
	Conexao.Open "DRIVER={MySQL ODBC 5.3 ANSI Driver};SERVER=187.45.196.225;PORT=3306;DATABASE=aggora1;USER=aggora1;PASSWORD=dade02;OPTION=3;"

' Abre tabela de produtos usando a conexao aberta acima.
	Set Usuarios = Server.CreateObject("ADODB.Recordset")
	Usuarios.Open "SELECT * FROM Users WHERE USR_Email='" & ax & "'", Conexao

	If Usuarios.Eof Then
		Usuarios.Close
		Set Usuarios = Nothing

		nome = ":Anonimo:"
		email = ax
		senha = bx

		'data = FormatDateTime(Now(), 0)  'NAO CONSEGUI POR A DATA HORA DE HOJE NESSA MERDA
		data = "2021-04-07 00:00:00"

		ip = Request.ServerVariables("REMOTE_HOST")
		Conexao.Execute "INSERT INTO Users(USR_Nome, USR_Email, USR_Senha, USR_IP) VALUES('" & nome & "','" & email & "','" & senha & "','" & ip & "')"

		'Conexao.Execute "INSERT INTO UserCadastro(dia_usuario) VALUES(1)"

		Set RS_Max = Server.CreateObject("ADODB.Recordset")
		RS_Max.Open "SELECT MAX(USR_ID) AS max_cod FROM Users", Conexao
			novo_codigo = RS_Max("max_cod")
			Conexao.Execute "INSERT INTO UserDados (USR_ID, USR_Email) VALUES('" & novo_codigo & "','" & email & "')"
		RS_Max.Close
		Set RS_Max = Nothing
		Conexao.Close
		Set Conexao = Nothing


		HTML = "<html><head></head><body bgcolor=#ffffff><center>"
		HTML = HTML & "<table width=100% cellspacing=0 cellpadding=0 bgcolor=#0588C0><tr align=right>"
		HTML = HTML & "<td align=left>&nbsp;Apoio:<br>&nbsp;<img src=http://www.aggora.com.br/sabio/logo3.gif></td>"
		HTML = HTML & "<td><img src=http://www.aggora.com.br/sabio/logo2.gif width=171 height=92><a href=http://www.aggora.com.br/sabio><img src=http://www.aggora.com.br/sabio/logo1.jpg border=0></a></td>"
		HTML = HTML & "</tr><tr bgcolor=#0B9F77 align=right><td colspan=2><font color=#FFFFFF size=2><b>R G &nbsp;&nbsp;S a b i c h ã o &nbsp;&nbsp;W e b &nbsp;&nbsp;</b></font></td>"
		HTML = HTML & "</tr></table><p><font face=verdana size=3><b>Sabichão - Um desafio aos seus Conhecimentos</b>"
		HTML = HTML & "</font></p><p><font face=arial size=2>Esta é uma mensagem do seu Site Sabichão sobre "
		HTML = HTML & "Cadastro de Novo Usuário.<br>Acumule quantos pontos conseguir, que em breve voce poderá "
		HTML = HTML & "arrisca-los no <a href=http://www.aggora.com.br/sabio>Sabichão Web</a> e obter grandes prêmios.</p>"
		HTML = HTML & "<hr><p>Ola <b>" & nome & "</b>, sua inscrição foi feita com sucesso em " & Now
		HTML = HTML & ".<br>Acesse o Site Sabichão Web <a href=http://www.aggora.com.br/sabio>http://www.aggora.com.br/sabio</a>, "
		HTML = HTML & "quando desejar, com:<p>E-mail do Usuario = [ <b><big>" & email & "</big></b> ].<br>"
		HTML = HTML & "Senha de acesso = [ <b><big>" & senha & "</big></b> ].</p><hr><p>Agradecemos sua Inscrição</font>"
		HTML = HTML & "</p><p></p></center><font face=arial size=1><p>Copyright &copy;2000 by "
		HTML = HTML & "<a href=mailto:sabichao@aggora.com.br>Borg</a><br>Todos os direitos reservados</p></font></body></html>"

		'Set nyMail = CreateObject("CDONTS.NewMail")

		'nyMail.From = "Sabichao - Um desafio aos seus Conhecimentos <sabichao@aggora.com.br>"
		'nyMail.To = email
		'nyMail.Bcc = "rg30@bol.com.br"
		'nyMail.Subject = "Sua Inscriçao foi Registrada com Sucesso"
		'nyMail.BodyFormat = 0
		'nyMail.MailFormat = 0
		'nyMail.Body = HTML
		'nyMail.Importance = 0
		'nyMail.Send

		'Set nyMail = Nothing

		Session("id") = novo_codigo
		Session("IPUserSab") = nome
		Session("mail") = email
		Response.Cookies("Sabichao")("nome") = email
		Response.Cookies("Sabichao").Expires = Now+1000

		Response.Redirect "sabio05.htm"                 'http://www.aggora.com.br/sabio/1/
		Response.End
	Else
		ax1 = 1
		If ax <> "" Then ax1 = 0
		Usuarios.MoveFirst
		If Usuarios("USR_Senha") <> bx Then
			Usuarios.Close
			Conexao.Close
			Set Usuarios = Nothing
			Set Conexao = Nothing

			Response.Redirect(startPage & "?pas=1&log=" & ax1)
			Response.End
		Else
			Session("id") = Usuarios("USR_ID")
			Session("IPUserSab") = Usuarios("USR_Nome")
			Session("mail") = Usuarios("USR_Email")
			Usuarios.Close
			Conexao.Close
			Set Usuarios = Nothing
			Set Conexao = Nothing

			Response.Redirect "sabio05.htm"                 'http://www.aggora.com.br/sabio/1/
			Response.End
		End If
	End If
'               End If
%>