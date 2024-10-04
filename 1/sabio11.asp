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
	End If

' Pega os dados de endereco
	nome = Request("nome_cliente")
	sexo = Request("sexo_cliente")
	dia = Request("dia_cliente")
	mes = Request("mes_cliente")
	ano = Request("ano_cliente")
	rua = Request("rua_cliente")
	bairro = Request("bairro_cliente")
	cidade = Request("cidade_cliente")
	estado = Request("estado_cliente")
	cep = Request("cep_cliente")
	opcoes = Request("c0") & "," & Request("c1") & "," & Request("c2")
	fone = Request("fone_cliente")
	email = Request("email_cliente")
	senha = Request("senha_cliente")

	If email <> Session("mail") Then
		Session("logmail") = email
		Response.Redirect "sabio001.asp?usr=1 target=top.frames.inicial"            'http://www.aggora.com.br/sabio/1/
		Response.End
	Else
		' Grava informacoes no banco de dados
		Set Conexao = Server.CreateObject("ADODB.Connection")
		'SQLServer =>  'Conexao.Open "Provider=SQLOLEDB.1;SERVER=187.45.196.225;DATABASE=aggora1;UID=aggora1;PWD=dade02;"
		Conexao.Open "DRIVER={MySQL ODBC 5.3 ANSI Driver};SERVER=187.45.196.225;PORT=3306;DATABASE=aggora1;USER=aggora1;PASSWORD=dade02;OPTION=3;"

			strUPDATE = "UPDATE Users SET sexo_usuario = '" & sexo & "'"
			strUPDATE = strUPDATE & ", dia_usuario = " & dia
			strUPDATE = strUPDATE & ", mes_usuario = " & mes
			strUPDATE = strUPDATE & ", ano_usuario = " & ano
			strUPDATE = strUPDATE & ", cidade_usuario = '" & cidade & "'"
			strUPDATE = strUPDATE & ", estado_usuario = '" & estado & "'"
			strUPDATE = strUPDATE & ", opcoes_usuario = '" & opcoes & "'"
			' Grava opcionais se houver
			If rua <> "" Then strUPDATE = strUPDATE & ", rua_usuario = '" & rua & "'" End If 
			If bairro <> "" Then strUPDATE = strUPDATE & ", bairro_usuario = '" & bairro & "'" End If
			If cep <> "" Then strUPDATE = strUPDATE & ", cep_usuario = '" & cep & "'" End If
			If fone <> "" Then strUPDATE = strUPDATE & ", telefone_usuario = '" & fone & "'" End If
			strUPDATE = strUPDATE & " WHERE USR_ID = " & Session("id")
			Conexao.Execute strUPDATE

			strUPDATE = "UPDATE Users SET USR_Nome = '" & nome & "'"
			strUPDATE = strUPDATE & ", USR_Senha = '" & senha & "'"
			strUPDATE = strUPDATE & " WHERE USR_ID = " & Session("id")
			Conexao.Execute strUPDATE
		Conexao.Close
		Set Conexao = Nothing

		HTML = "<html><head></head><body bgcolor=#ffffff><center>"
		HTML = HTML & "<table width=100% cellspacing=0 cellpadding=0 bgcolor=#0588C0><tr align=right>"
		HTML = HTML & "<td align=left>&nbsp;Apoio:<br>&nbsp;<img src=http://www.aggora.com.br/sabio/logo3.gif></td>"
		HTML = HTML & "<td><img src=http://www.aggora.com.br/sabio/logo2.gif width=171 height=92><a href=http://www.aggora.com.br/sabio><img src=http://www.aggora.com.br/sabio/logo1.jpg border=0></a></td>"
		HTML = HTML & "</tr><tr bgcolor=#0B9F77 align=right><td colspan=2><font color=#FFFFFF size=2><b>R G &nbsp;&nbsp;S a b i c h ã o &nbsp;&nbsp;W e b &nbsp;&nbsp;</b></font></td>"
		HTML = HTML & "</tr></table><p><font face=verdana size=3><b>Sabichão - Um desafio aos seus Conhecimentos</b>"
		HTML = HTML & "</font></p><p><font face=arial size=2>Esta é uma mensagem do seu Site Sabichão sobre "
		HTML = HTML & "Atualização Cadastral de Usuário.<br>Acumule quantos pontos conseguir, que em breve voce poderá "
		HTML = HTML & "arrisca-los no <a href=http://www.aggora.com.br/sabio>Sabichão Web</a> e obter grandes prêmios.</p>"
		HTML = HTML & "<hr><p>Ola <b>" & nome & "</b>, a atualização de sua inscriçao foi feita com sucesso em " & Now
		HTML = HTML & ".<br>Acesse o Site Sabichão Web <a href=http://www.aggora.com.br/sabio>http://www.aggora.com.br/sabio</a>, "
		HTML = HTML & "quando desejar, com:<p>E-mail do Usuario = [ <b><big>" & email & "</big></b> ].<br>"
		HTML = HTML & "Senha de acesso = [ <b><big>" & senha & "</big></b> ].</p><hr><p>Agradecemos sua Visita</font>"
		HTML = HTML & "</p><p></p></center><font face=arial size=1><p>Copyright &copy;2000 by "
		HTML = HTML & "<a href=mailto:sabichao@aggora.com.br>Borg</a><br>Todos os direitos reservados</p></font></body></html>"

		'	Set myMail = CreateObject("CDONTS.NewMail")

		'	myMail.From = "Sabichao - Um desafio aos seus Conhecimentos <sabichao@aggora.com.br>"
		'	myMail.To = email
		'	myMail.Bcc = "rg30@bol.com.br"
		'	myMail.Subject = "Atualização Cadastral Registrada com Sucesso"
		'	myMail.BodyFormat = 0
		'	myMail.MailFormat = 0
		'	myMail.Body = HTML
		'	myMail.Importance = 0
		'	myMail.Send

		'	Set myMail = Nothing

		Session("IPUserSab") = nome
		Session("mail") = email
		Response.Cookies("Sabichao")("nome") = email
		Response.Cookies("Sabichao").Expires = Now+1000

		Response.Redirect "sabio03.asp"                 'http://www.aggora.com.br/sabio/1/
		Response.End

	End If
'                   End If
%>
