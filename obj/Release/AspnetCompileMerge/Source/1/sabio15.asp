<%@ Language=VBScript %>
<%
	Response.Expires = 0
	
	'                   If inStr(Request.ServerVariables("HTTP_HOST"), "www.aggora.com.br") = 0 Then
	'                   	Response.Redirect "http://www.aggora.com.br/sabio/help.htm"
	'                   	Response.End
	'                   End If

If Session("IPUserSab") = "" Or Session("mail") = "" Then
	Response.Redirect "Sabio01.aspx"                 'http://www.aggora.com.br/sabio/1/
	Response.End
Else
	Dim x
	x = Now 
	x = FormatDateTime(x, 0)
%>
<Script Language="JScript" src="scripts/SimplesF.js"></Script>
<html><head><title>Sabich�o</title><style>@import url(images/coUC.css);</style>
<STYLE>
BODY 		{font-family:"Arial"; font-size:12; font-weight:normal}
.intro 	{font-family:"Arial"; font-size:14; font-weight:bold; color:#FF0000}
</STYLE>
</HEAD><BODY bgColor=#ffffff leftMargin=0 rightMargin=0 topMargin=3 marginheight="0" marginwidth="0"><center>...
<table cellpadding="0" cellspacing="0" width="600" style="font-family: Arial; font-size:9pt">
	<tr>
		<td>
<SPAN CLASS=intro>Processando sua mensagem E-Mail</SPAN><HR>
Enviando mensagem email para: <font color=blue><b>RG 3.0 - Sabich�o Web</b></font> ... 
		</td>
	</tr>
</table>
<%
	if(Request.Form("origem") = "Anuncie") Then
		assunto = "An�ncio no RG Sabichao WEB - "
	Else
		assunto = "Contato no RG Sabichao WEB - "
	End If
	assunto = assunto & Request.Form("Tipo")
	txtinfo = "Mensagem de: " & Request.Form("Contato")
		txtinfo = txtinfo & "." & VbCrLf & "Endere�o E-mail: " & Request.Form("E_mail")
		txtinfo = txtinfo & "." & VbCrLf & VbCrLf & "Enviada em: " & x
		txtinfo = txtinfo & "." & VbCrLf & VbCrLf & "Usu�rio/Empresa: " & Request.Form("Empr")
		txtinfo = txtinfo & "." & VbCrLf & "Telefone: " & Request.Form("Fone")
		txtinfo = txtinfo & "." & VbCrLf & "Prefere Contato por: " & Request.Form("Cntt")
		txtinfo = txtinfo & "." & VbCrLf & "Coment�rios Adicionais: " & Request.Form("Obsv")
	txtweb = "Mensagem de: <b>" & Request.Form("Contato")
		txtweb = txtweb & "</b>.<br>Endere�o E-mail: <b>" + Request.Form("E_mail")
		txtweb = txtweb & "</b>.<br>Enviada em: <b>" & x
		txtweb = txtweb & "</b>.<p>Usu�rio/Empresa: <b>" & Request.Form("Empr")
		txtweb = txtweb & "</b>.<br>Telefone: <b>" & Request.Form("Fone")
		txtweb = txtweb & "</b>.<br>Prefere Contato por: <b>" & Request.Form("Cntt")
		txtweb = txtweb & "</b>.<br>Coment�rios Adicionais: <b>" & Request.Form("Obsv") & "</b>"

'Declaramos as v�riaveis a serem utilizadas no script
	Dim AspEmail, nomeRemetente, emailRemetente, nomeDestinatario, emailDestinatario, emailRetorno, mensagem, servidor
 
'Configuramos os dados a serem utilizados no cabe�alho da mensagem
	nomeDestinatario = Request.Form("Contato")
	emailDestinatario = Request.Form("E_mail")
	nomeRemetente = "Sabichao - Um desafio aos seus Conhecimentos"
	emailRemetente = "contato@aggora.com.br" 'O endere�o de e-mail deve ser preenchido com uma conta existente em seu pr�prio dom�nio.
	emailRetorno = "contato@aggora.com.br"
	responderPara = "rg30@aggora.com.br"
	'assunto="Teste AspEmail"
	mensagem = txtweb   			'"Esta � uma mensagem de teste enviada atrav�s do componente AspEmail."
	servidor = "localhost"
 
'Agora configuramos o componente utilizando os dados informados nas vari�veis
 
	'Instancia o objeto na mem�ria
		SET AspEmail = Server.CreateObject("Persits.MailSender")
 
	'Contfigura o servidor SMTP a ser utilizado
		AspEmail.Host = servidor
 
	'Configura o Nome do remetente da mensagem
		AspEmail.FromName = nomeRemetente
 
	'Configura o e-mail do remetente da mensagem que OBRIGATORIAMENTE deve ser um e-mail do seu pr�prio dom�nio
		AspEmail.From = emailRemetente
 
	'Configura o E-mail de retorno para voc� ser avisado em caso de problemas no envio da mensagem
		AspEmail.MailFrom = emailRemetente  'Desabilitar essa linha caso o servidor esteja configurado para rodar em 64 bits
 
 
	'Configura o e-mail que receber� as respostas desta mensagem
		AspEmail.AddReplyTo responderPara
 
	'Configura os destinat�rios da mensagem
		AspEmail.AddAddress emailDestinatario, nomeDestinatario
 
	'Configura para enviar e-mail Com C�pia
		AspEmail.AddCC "rg30@bol.com.br", "Borges pelo Contato/An�ncio SABICHAO"
		'AspEmail.AddCC "nome1@dominio.com.br", "Nome"
		'AspEmail.AddCC "nome2@dominio.com.br", "Nome"
 
	'Configura o Assunto da mensagem enviada
		AspEmail.Subject = assunto
 
	'Configura o formato da mensagem para HTML
		AspEmail.IsHTML = True
 
	'Configura o conte�do da Mensagem
		AspEmail.Body = mensagem
 
	'Definir porta no caso de envio autenticado
		'AspEmail.Port = 587
 
	'Utilize este c�digo caso queira enviar arquivo anexo
		'AspEmail.AddAttachment("E:\home\SEU_LOGIN_FTP\Web\caminho_do_arquivo")
 
	'Para quem utiliza servi�os da REVENDA conosco
		'AspEmail.AddAttachment("E:\vhosts\DOMINIO_COMPLETO\httpdocs\caminho_do_arquivo")
 
	'#Ativa o tratamento de erros
		On Error Resume Next
 
	'Envia a mensagem
		AspEmail.Send

	'## Remove a refer�ncia do componente da mem�ria ##
		SET AspEmail = Nothing

%>
<table cellpadding="0" cellspacing="0" width="600" style="font-family: Arial; font-size:9pt">
	<tr>
		<td>
<%
'Caso ocorra problemas no envio, descreve os detalhes do mesmo.
	If Err <> 0 Then
		erro = "<b><font color='red'> Erro ao enviar a mensagem.</font></b><br>"
		erro = erro & "<b>Erro.Description:</b> " & Err.Description & "<br>"
		erro = erro & "<b>Erro.Number:</b> "      & Err.Number & "<br>"
		erro = erro & "<b>Erro.Source:</b> "      & Err.Source & "<br>"
		response.write erro
	Else
		response.write "<font color='blue'><b>Mensagem enviada com sucesso para</b></font> " & emailDestinatario
		Response.Write("<p>" & txtweb & "</p><p>... Conclu�do.<HR><p align=center>Recebemos sua Mensagem  sobre: <b>" & assunto & "</b><br>A <font color=blue><b>RG 3.0</b></font> agradece sua Remessa e informa que entraremos em contato em at� 24h.</p><HR>")
	End If
End If
%>
		</td>
	</tr>
</table>
<p><input type="button" value="Voltar" style="border:0;background-color:rgb(255,255,255);background-image:url('images/bt3.gif');width:115;height:25" onClick="history.back()"></p>
</center></BODY></HTML>