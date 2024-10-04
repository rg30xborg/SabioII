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
<html><head><title>Sabichão</title><style>@import url(images/coUC.css);</style>
<STYLE>
BODY 		{font-family:"Arial"; font-size:12; font-weight:normal}
.intro 	{font-family:"Arial"; font-size:14; font-weight:bold; color:#FF0000}
</STYLE>
</HEAD><BODY bgColor=#ffffff leftMargin=0 rightMargin=0 topMargin=3 marginheight="0" marginwidth="0"><center>...
<table cellpadding="0" cellspacing="0" width="600" style="font-family: Arial; font-size:9pt">
	<tr>
		<td>
<SPAN CLASS=intro>Processando sua mensagem E-Mail</SPAN><HR>
Enviando mensagem email para: <font color=blue><b>RG 3.0 - Sabichão Web</b></font> ... 
		</td>
	</tr>
</table>
<%
	if(Request.Form("origem") = "Anuncie") Then
		assunto = "Anúncio no RG Sabichao WEB - "
	Else
		assunto = "Contato no RG Sabichao WEB - "
	End If
	assunto = assunto & Request.Form("Tipo")
	txtinfo = "Mensagem de: " & Request.Form("Contato")
		txtinfo = txtinfo & "." & VbCrLf & "Endereço E-mail: " & Request.Form("E_mail")
		txtinfo = txtinfo & "." & VbCrLf & VbCrLf & "Enviada em: " & x
		txtinfo = txtinfo & "." & VbCrLf & VbCrLf & "Usuário/Empresa: " & Request.Form("Empr")
		txtinfo = txtinfo & "." & VbCrLf & "Telefone: " & Request.Form("Fone")
		txtinfo = txtinfo & "." & VbCrLf & "Prefere Contato por: " & Request.Form("Cntt")
		txtinfo = txtinfo & "." & VbCrLf & "Comentários Adicionais: " & Request.Form("Obsv")
	txtweb = "Mensagem de: <b>" & Request.Form("Contato")
		txtweb = txtweb & "</b>.<br>Endereço E-mail: <b>" + Request.Form("E_mail")
		txtweb = txtweb & "</b>.<br>Enviada em: <b>" & x
		txtweb = txtweb & "</b>.<p>Usuário/Empresa: <b>" & Request.Form("Empr")
		txtweb = txtweb & "</b>.<br>Telefone: <b>" & Request.Form("Fone")
		txtweb = txtweb & "</b>.<br>Prefere Contato por: <b>" & Request.Form("Cntt")
		txtweb = txtweb & "</b>.<br>Comentários Adicionais: <b>" & Request.Form("Obsv") & "</b>"

'Declaramos as váriaveis a serem utilizadas no script
	Dim AspEmail, nomeRemetente, emailRemetente, nomeDestinatario, emailDestinatario, emailRetorno, mensagem, servidor
 
'Configuramos os dados a serem utilizados no cabeçalho da mensagem
	nomeDestinatario = Request.Form("Contato")
	emailDestinatario = Request.Form("E_mail")
	nomeRemetente = "Sabichao - Um desafio aos seus Conhecimentos"
	emailRemetente = "contato@aggora.com.br" 'O endereço de e-mail deve ser preenchido com uma conta existente em seu próprio domínio.
	emailRetorno = "contato@aggora.com.br"
	responderPara = "rg30@aggora.com.br"
	'assunto="Teste AspEmail"
	mensagem = txtweb   			'"Esta é uma mensagem de teste enviada através do componente AspEmail."
	servidor = "localhost"
 
'Agora configuramos o componente utilizando os dados informados nas variáveis
 
	'Instancia o objeto na memória
		SET AspEmail = Server.CreateObject("Persits.MailSender")
 
	'Contfigura o servidor SMTP a ser utilizado
		AspEmail.Host = servidor
 
	'Configura o Nome do remetente da mensagem
		AspEmail.FromName = nomeRemetente
 
	'Configura o e-mail do remetente da mensagem que OBRIGATORIAMENTE deve ser um e-mail do seu próprio domínio
		AspEmail.From = emailRemetente
 
	'Configura o E-mail de retorno para você ser avisado em caso de problemas no envio da mensagem
		AspEmail.MailFrom = emailRemetente  'Desabilitar essa linha caso o servidor esteja configurado para rodar em 64 bits
 
 
	'Configura o e-mail que receberá as respostas desta mensagem
		AspEmail.AddReplyTo responderPara
 
	'Configura os destinatários da mensagem
		AspEmail.AddAddress emailDestinatario, nomeDestinatario
 
	'Configura para enviar e-mail Com Cópia
		AspEmail.AddCC "rg30@bol.com.br", "Borges pelo Contato/Anúncio SABICHAO"
		'AspEmail.AddCC "nome1@dominio.com.br", "Nome"
		'AspEmail.AddCC "nome2@dominio.com.br", "Nome"
 
	'Configura o Assunto da mensagem enviada
		AspEmail.Subject = assunto
 
	'Configura o formato da mensagem para HTML
		AspEmail.IsHTML = True
 
	'Configura o conteúdo da Mensagem
		AspEmail.Body = mensagem
 
	'Definir porta no caso de envio autenticado
		'AspEmail.Port = 587
 
	'Utilize este código caso queira enviar arquivo anexo
		'AspEmail.AddAttachment("E:\home\SEU_LOGIN_FTP\Web\caminho_do_arquivo")
 
	'Para quem utiliza serviços da REVENDA conosco
		'AspEmail.AddAttachment("E:\vhosts\DOMINIO_COMPLETO\httpdocs\caminho_do_arquivo")
 
	'#Ativa o tratamento de erros
		On Error Resume Next
 
	'Envia a mensagem
		AspEmail.Send

	'## Remove a referência do componente da memória ##
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
		Response.Write("<p>" & txtweb & "</p><p>... Concluído.<HR><p align=center>Recebemos sua Mensagem  sobre: <b>" & assunto & "</b><br>A <font color=blue><b>RG 3.0</b></font> agradece sua Remessa e informa que entraremos em contato em até 24h.</p><HR>")
	End If
End If
%>
		</td>
	</tr>
</table>
<p><input type="button" value="Voltar" style="border:0;background-color:rgb(255,255,255);background-image:url('images/bt3.gif');width:115;height:25" onClick="history.back()"></p>
</center></BODY></HTML>