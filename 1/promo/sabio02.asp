<%@ Language=VBScript %>
<%
	Response.Expires = 0
	
If inStr(Request.ServerVariables("HTTP_HOST"), "www.aggora.com.br") = 0 Then
	Response.Redirect "http://www.aggora.com.br/sabio/help.htm"
	Response.End
Else
	If Session("IPUserSab") = "" Or Session("mail") = "" Then
		Response.Redirect "http://www.aggora.com.br/sabio/1/sabio12.asp"
		Response.End
	End If

	if Session("IPUserSab") = ":Anonimo:" Then
		Response.Redirect "http://www.aggora.com.br/sabio/1/promo/sabio01.asp?err=3"
		Response.End
	End If

' Pega os dados de cliente
	ex = Request("email_cliente")
	ax = Request("email_indicado")
	bx = Request("nome_indicado")
	cx = Session("IPUserSab")
	dx = Request("info_usuario")

' Abre conexao com banco de dados
	Set Conexao = Server.CreateObject("ADODB.Connection")
	'SQLServer =>  'Conexao.Open "Provider=SQLOLEDB.1;SERVER=187.45.196.225;DATABASE=aggora1;UID=aggora1;PWD=dade02;"
	Conexao.Open "DRIVER={MySQL ODBC 5.3 ANSI Driver};SERVER=187.45.196.225;PORT=3306;DATABASE=aggora1;USER=aggora1;PASSWORD=dade02;OPTION=3;"

	Set Usuario = Server.CreateObject("ADODB.Recordset")
	Usuario.Open "SELECT * FROM Users WHERE USR_Email = '" & ax & "'", Conexao

	If Usuario.Eof Then
		Usuario.Close
		Set Usuario = Nothing

		Set Promos = Server.CreateObject("ADODB.Recordset")
		Promos.Open "SELECT * FROM Promos WHERE PRM_Email_Indicado = '" & ax & "'", Conexao

		If Promos.Eof Then
			Promos.Close
			Set Promos = Nothing
			
			msg = cx & ": parabéns por sua participação na Promoção Indique um Amigo (" & bx & ", pelo E-mail: " & ax & "). Após validação os Pontos dessa Promoção serão adicionados ao seu total. Dica! - Indique quantos Amigos desejar."

			Conexao.Execute "INSERT INTO Promos(USR_ID, PRM_Email, PRM_Nome_Indicado, PRM_Email_Indicado) VALUES ('" & Session("id") & "','" & ex & "','" & bx & "','" & ax & "')"
			Conexao.Execute "INSERT INTO Eventos(USR_ID, EVN_Email, EVN_Desc, EVN_Tipo) VALUES ('" & Session("id") & "','" & ex & "','" & msg & "','Promoção Indique Amigo')"

			Conexao.Close
			Set Conexao = Nothing

			HTML = "<html><head></head><body bgcolor=#ffffff><center>"
			HTML = HTML & "<table width=100% cellspacing=0 cellpadding=0 bgcolor=#0588C0><tr align=right>"
			HTML = HTML & "<td align=left>&nbsp;Apoio:<br>&nbsp;<img src=http://www.aggora.com.br/sabio/logo3.gif></td>"
			HTML = HTML & "<td><img src=http://www.aggora.com.br/sabio/logo2.gif width=171 height=92><a href=http://www.aggora.com.br/sabio><img src=http://www.aggora.com.br/sabio/logo1.jpg border=0></a></td>"
			HTML = HTML & "</tr><tr bgcolor=#0B9F77 align=right><td colspan=2><font color=#FFFFFF size=2><b>R G &nbsp;&nbsp;S a b i c h ã o &nbsp;&nbsp;W e b &nbsp;&nbsp;</b></font></td>"
			HTML = HTML & "</tr></table><p><font face=verdana size=3><b>Sabichão - Um desafio aos seus Conhecimentos</b>"
			HTML = HTML & "</font></p><p><font face=arial size=2>Este é uma convite enviado por: <b>" & cx & "</b> para que você "
			HTML = HTML & "conheça nosso Site.<br>No <a href=http://www.aggora.com.br/sabio>Site Sabichão</a> você responde "
			HTML = HTML & "Perguntas sobre assuntos diversos e acumula pontos que em breve voce poderá arrisca-los e obter "
			HTML = HTML & "grandes prêmios. É Totalmente Gratuito e Você ainda corre o risco de Ganhar Prêmios.</p><hr><p>"
			HTML = HTML & bx & ", acesse o Site Sabichão Web em: <a href=http://www.aggora.com.br/sabio>http://www.aggora.com.br/sabio</a>, "
			HTML = HTML & "quando desejar. Ao entrar no Site, você e <b>" & cx & "</b> recebem automaticamente 500 Pontos de " 
			HTML = HTML & "bonificação na pontuação geral.</p><p>Agradecemos sua Visita - Promoção Indique um Amigo - OK!</p><hr>"
			HTML = HTML & "<p>" & dx & "</p></font></center><font face=arial size=1><p>Copyright &copy;2000 by "
			HTML = HTML & "<a href=mailto:sabichao@aggora.com.br>Borg</a><br>Todos os direitos reservados</p></font></body></html>"

			'nyMail.From = cx & "<contato@aggora.com.br>"
			'nyMail.To = bx & " <" & ax & ">"
			'nyMail.Bcc = "rg30@aggora.com.br"


		'Declaramos as váriaveis a serem utilizadas no script
			Dim AspEmail, nomeRemetente, emailRemetente, nomeDestinatario, emailDestinatario, mensagem, servidor, assunto 
 
		'Configuramos os dados a serem utilizados no cabeçalho da mensagem
			nomeDestinatario = bx
			emailDestinatario = ax
			nomeRemetente = "Sabichão - Um desafio aos seus Conhecimentos"
			emailRemetente = "contato@aggora.com.br"
			assunto = "Convite para conhecer o Site RG Sabichão Web"
			mensagem = HTML
			servidor = "localhost"
 
		'Agora configuramos o componente utilizando os dados informados nas variáveis
 			SET AspEmail = Server.CreateObject("Persits.MailSender")
			AspEmail.AddAddress emailDestinatario, nomeDestinatario
 			AspEmail.FromName = nomeRemetente
			AspEmail.From = emailRemetente
 			AspEmail.Subject = assunto
			AspEmail.IsHTML = True
			AspEmail.Body = mensagem
			AspEmail.Host = servidor

		'Definir porta no caso de envio autenticado
			'AspEmail.Port = 587

		'#Ativa o tratamento de erros
			On Error Resume Next
 
		'Envia a mensagem
			AspEmail.Send

		'## Remove a referência do componente da memória ##
			SET AspEmail = Nothing

			If Err <> 0 Then
                erro = "<html><head></head><body bgcolor=#ffffff><center>"
				erro = erro & "<b><font color='red'> Erro ao enviar a mensagem.</font></b><br>"
				erro = erro & "<b>Erro.Description:</b> " & Err.Description & "<br>"
				erro = erro & "<b>Erro.Number:</b> "      & Err.Number & "<br>"
				erro = erro & "<b>Erro.Source:</b> "      & Err.Source & "<br>"
                erro = erro & "</center><font face=arial size=1><p>Copyright &copy;2000 by "
			    erro = erro & "<a href=mailto:sabichao@aggora.com.br>Borg</a><br>Todos os direitos reservados</p></font></body></html>"
				response.write erro
			Else
				Response.Write "Mensagem Enviada:<br>" & HTML
			End If

		Else
			Promos.Close
			Conexao.Close
			Set Promos = Nothing
			Set Conexao = Nothing

			Response.Redirect "http://www.aggora.com.br/sabio/1/promo/sabio01.asp?err=1"
			Response.End
		End If
		
	Else
		Usuario.Close
		Conexao.Close
		Set Usuario = Nothing
		Set Conexao = Nothing
		Response.Redirect "http://www.aggora.com.br/sabio/1/promo/sabio01.asp?err=2"
		Response.End
	End If
End If
%>