<%@ Language=VBScript %>
<%
	Response.Expires = 0
	
'                   If inStr(Request.ServerVariables("HTTP_HOST"), "www.aggora.com.br") = 0 Then
'                   	Response.Redirect "http://www.aggora.com.br/sabio/help.htm"
'                   	Response.End
'                   Else
%>
<Script Language="JScript" runat="Server">

	Session("logmail") = null
	startPage = "sabio01.asp"                   //http://www.aggora.com.br/sabio/1/
	ax = Request("email")(1); if (ax == "") Response.Redirect(startPage)
	if (ax.indexOf("@") < 0 || ax.indexOf(" ") >= 0 || ax.length < 7) ax = ""; else Session("logmail") = ax
	if (ax == "") Response.Redirect(startPage + "?log=1")

</Script>
<%
' Abre conexao com banco de dados.
	Set Conexao = Server.CreateObject("ADODB.Connection")
	'SQLServer =>  'Conexao.Open "Provider=SQLOLEDB.1;SERVER=187.45.196.225;DATABASE=aggora1;UID=aggora1;PWD=dade02;"
	Conexao.Open "DRIVER={MySQL ODBC 5.3 ANSI Driver};SERVER=187.45.196.225;PORT=3306;DATABASE=aggora1;USER=aggora1;PASSWORD=dade02;OPTION=3;"


' Abre tabela de produtos usando a conexao aberta acima.
	Set Usuarios = Server.CreateObject("ADODB.Recordset")
	Usuarios.Open "SELECT * FROM Users WHERE USR_Email = '" & ax & "'", Conexao

	If Usuarios.Eof Then
		Usuarios.Close
		Conexao.Close

		Set Usuarios = Nothing
		Set Conexao = Nothing
		' O USU�RIO N�O EXISTE E ESTA SENDO SOLICITADO LEMBRAR SENHA
		Response.Redirect("http://www.aggora.com.br/sabio/1/sabio01.asp?log=" & ax & "&pas=" + bx)
		Response.End
	Else
		bx = Usuarios("USR_Senha")

		HTML = "<html><head></head><body bgcolor=#ffffff><center>"
		HTML = HTML & "<table width=100% cellspacing=0 cellpadding=0 bgcolor=#0588C0><tr align=right>"
		HTML = HTML & "<td align=left>&nbsp;Apoio:<br>&nbsp;<img src=http://www.aggora.com.br/sabio/logo3.gif></td>"
		HTML = HTML & "<td><img src=http://www.aggora.com.br/sabio/logo2.gif width=171 height=92><a href=http://www.aggora.com.br/sabio><img src=http://www.aggora.com.br/sabio/logo1.jpg border=0></a></td>"
		HTML = HTML & "</tr><tr bgcolor=#0B9F77 align=right><td colspan=2><font color=#FFFFFF size=2><b>R G &nbsp;&nbsp;S a b i c h � o &nbsp;&nbsp;W e b &nbsp;&nbsp;</b></font></td>"
		HTML = HTML & "</tr></table><p><font face=verdana size=3><b>Sabich�o - Um desafio aos seus Conhecimentos</b>"
		HTML = HTML & "</font></p><p><font face=arial size=2>Esta � uma mensagem do seu Site Sabich�o sobre Lembrar Senha de Acesso. "
		HTML = HTML & "Se n�o foi voc� que solicitou esta mensagem, entre em contato imediatamente com nosso suporte."
		HTML = HTML & "<br>Acumule quantos pontos conseguir, que em breve voce poder� "
		HTML = HTML & "arrisca-los no <a href=http://www.aggora.com.br/sabio>Sabich�o Web</a> e obter grandes pr�mios.</p>"
		HTML = HTML & "<hr><p>Ola <b>" & Usuarios("USR_Nome") & "</b>, sua solicita��o de Lembrar Senha foi atendida "
		HTML = HTML & "com sucesso em " & Now & ".<br>Acesse o Site Sabich�o Web <a href=http://www.aggora.com.br/sabio>"
		HTML = HTML & "http://www.aggora.com.br/sabio</a>, quando desejar, com:<p>E-mail do Usuario = [ <b><big>" & ax & "</big></b> ]."
		HTML = HTML & "<br>Senha de acesso = [ <b><big>" & bx & "</big></b> ].</p><hr><p>Agradecemos sua Visita</font>"
		HTML = HTML & "</p><p></p></center><font face=verdana size=1><p>Copyright &copy;2000 by "
		HTML = HTML & "<a href=mailto:contato@aggora.com.br>RG Sabich�o Web</a><br>Todos os direitos reservados</p></body></font></html>"

		'Declaramos as v�riaveis a serem utilizadas no script
			Dim AspEmail, nomeRemetente, emailRemetente, nomeDestinatario, emailDestinatario, emailRetorno, mensagem, servidor, assunto
 
		'Configuramos os dados a serem utilizados no cabe�alho da mensagem
			nomeDestinatario = Usuarios("USR_Nome")
			emailDestinatario = Usuarios("USR_Email")
			nomeRemetente = "Sabich�o - Um desafio aos seus Conhecimentos"
			emailRemetente = "contato@aggora.com.br"
			emailRetorno = "contato@aggora.com.br"
			responderPara = "rg30@aggora.com.br"
			assunto = "Solicita��o de Lembrar Senha do Site RG Sabich�o Web"
			mensagem = HTML
			servidor = "localhost"
 
		'Agora configuramos o componente utilizando os dados informados nas vari�veis
 			SET AspEmail = Server.CreateObject("Persits.MailSender")
			AspEmail.AddAddress emailDestinatario, nomeDestinatario
 			AspEmail.FromName = nomeRemetente
			AspEmail.From = emailRemetente
				'AspEmail.AddReplyTo emailRetorno, "Sabichao - Email de Retorno"
				'AspEmail.AddBcc responderPara, "Sabichao - Email em BCC"
				'AspEmail.AddCC responderPara, "Sabichao - Email em BCC"
				'AspEmail.AddCC "nome2@dominio.com.br", "Nome"
 			AspEmail.Subject = assunto
			AspEmail.IsHTML = True
			AspEmail.Body = mensagem
			AspEmail.Host = servidor

		'Configura o E-mail de retorno para voc� ser avisado em caso de problemas no envio da mensagem
		'	AspEmail.MailFrom = emailRemetente  'Desabilitar essa linha caso o servidor esteja configurado para rodar em 64 bits

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
	End If

	Usuarios.Close
	Set Usuarios = Nothing


%><Script Language="JScript" src="images/SimplesC.js"></Script>
<html><head><title>Sabichao</title><style>@import url(images/coUC.css);</style></head>
<BODY bgColor=#FFFFFF background="../mundi.gif" leftMargin=0 topMargin=0 marginwidth="0" marginheight="0">
<TABLE border=0 cellPadding=0 cellSpacing=0 width="100%">
	<TBODY>
	<TR align=center valign=top>
		<TD width=130>
			<!-- #include file = "sabio01.inc" -->
		</TD>
		<TD width=40>&nbsp;</TD>
		<TD><br><br>
			<TABLE border=0 cellPadding=0 cellSpacing=0  width=100%>
				<TR>
					<TD width=27><IMG height=40 src="images/supdate03.gif" width=27></TD>
					<TD bgColor=#0f4baf><font size=4><font face="Verdana, Arial, Helvetica, sans-serif" color=#ffffff><B><I>O QUE � O SABICH�O?</I></font></B></TD>
					<TD width=27><IMG height=40 src="images/supdate02.gif" width=27></TD>
				</TR>
			</TABLE>
<p>
			<table border="0" cellpadding="0" cellspacing="0" width="90%" style="font-family: Arial; font-size:9pt">
				<tr>
					<td>
			<span style="font-family: verdana; font-size:12pt"><b>SABICH�O - � Um Desafio Aos Seus Conhecimentos</b></span>
			<p align="justify">Dica! - Acumule o m�ximo de PONTOS que conseguir e arrisque-os em um 
			dos v�rios pr�mios dispon�veis em nosso Site na se��o Pr�mios(breve). 
			Pontos acumulados na fase de implanta��o, ser�o v�lidos quando da 
			implanta��o oficial - Totalmente Gratuito!</p>
					</td>
				</tr>
				<tr>
					<td>
			<p align="justify"><br>Lembre-se que seus dados de Cadastro podem ser alterados a qualquer momento
			clicando em [Alterar Cadastro], dispon�vel na P�gina Cadastro, internamente no Site.
					</td>
				</tr>
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
		response.write "<br><font color='red'>Sua Senha foi encaminhada para: <b>" & nomeDestinatario & ", " & emailDestinatario & "</b>.</font>"
		Response.Write "<font color='blue'> - Verifique-a no seu Correio Eletr�nico! - Se n�o recebe-la nos pr�ximos minutos (verifique tmb caixa span) entre em contato com nosso suporte em: contato@aggora.com.br</font> (^-^)"
	End If
%>
					</td>
				</tr>
				<tr>
					<td>
<form action=Sabio10.asp method=post name="logonForm" onsubmit="return verifica()"><br>
			<table cellspacing=1 cellpadding=2 width=100% style="font-family: Arial; font-size:9pt;color:#000080">
				<tr>
					<td align=right><b>Seu E-mail</b>:</td>
					<td><input type="text" name="userlogon" size="30" maxlength="30" value="<%= Session("logmail")%>">&nbsp;<span style="font-size:8pt"> (E-mail Completo)</span></td>
				</tr>
				<tr>
					<td align=right><b>Uma Senha</b>:</td>
					<td><input type="password" name="userpassw" size="12" maxlength="12">&nbsp;<span style="font-size:8pt"> (M�nimo 6 Caracteres)</span></td>
				</tr>
				<tr>
					<td colspan=2 align=right><input type="submit" value="Entre (� gratis)" name="lggonAgn" style="border:0;background-color:rgb(255,255,255);background-image:url('images/bt3.gif');width:115;height:25"></td>
				</tr>
			</table>
</form>
					</td>
				</tr>
			</table>
			<TABLE cellPadding=0 cellSpacing=0  width=100%>
				<TR>
					<TD width=27><IMG height=40 src="images/supdate03.gif" width=27></TD>
					<TD bgColor=#0f4baf><font size=4><font face="Verdana, Arial, Helvetica, sans-serif" color=#ffffff><B><I>COMO ENTRAR NO JOGO</I></font></B></TD>
					<TD width=27><IMG height=40 src="images/supdate02.gif" width=27></TD>
				</TR>
			</TABLE>
<p>
 			<table border="0" cellpadding="0" cellspacing="0" width="90%" style="font-family: Arial; font-size:9pt">
				<tr>
					<td>
			<p align="justify">Nos campos do formul�rio acima, digite seu E-MAIL <b><font color=red>completo</font></b> e uma
			SENHA exclusiva para este Site-Jogo. Pronto voc� automaticamente j� estar� registrado no Sabich�o, e entrara
			no ambiente do jogo. Mas lembre-se, para concorrer aos pr�mios quando estes estiverem dispon�veis voc� dever� completar seus dados
			cadastrais, ou atualiza-los. Eles podem ser alterados (exceto e-mail) a qualquer momento a partir
			da p�gina interna [Home] com um clique simples em [Alterar Cadastro].</p>
					</td>
				</tr>
				<tr>
					<td align="right" height=30>Quero uma amostra <a href="demos/sabio01.htm">Mini-Demo</a> | <a href="sabio23.aspx">Full-Demo</a> antes de Cadastrar-me.</td>
				</tr>
			</table>
<p>
			<TABLE border=0 cellPadding=0 cellSpacing=0  width=100%>
				<TR>
					<TD width=27><IMG height=40 src="images/supdate03.gif" width=27></TD>
					<TD bgColor=#0f4baf><font size=4><font face="Verdana, Arial, Helvetica, sans-serif" color=#ffffff><B><I>TURMA DO FUND�O</I></font></B></TD>
					<TD width=27><IMG height=40 src="images/supdate02.gif" width=27></TD>
				</TR>
			</TABLE>
<p>
			<table border="0" cellpadding="0" cellspacing="0" width="90%" style="font-family: Arial; font-size:9pt">
				<tr>
					<td>
			<p  align="justify">Enturme-se com sua Turma (<b><font color=red>Bate papo com os Sabios-Amigos</font></b>). Nas salas do Sabich�o, estar�
			dispon�vel campo-texto para compartilhamento de id�ias e assuntos diversos, podendo o usu�rio selecior para este entrosamento at� 5 
			usuarios que podem ser Locais (da sua cidade ou bairro), Regional (do seu estado) ou Nacional em fun��o dos seus dados cadastrais. Ser� 
			poss�vel tamb�m uma sele��o de amigos por outros crit�rios de escolha, tais como idade a ser implementados.</p>
					</td>
				</tr>
			</table>
<p>
			<table border="0" cellpadding="0" cellspacing="0" width="90%" style="font-family: Arial; font-size: 9pt; color:#770000">
				<tr>
					<td>
			<p align="justify">
			Atrav�s de nosso sistema voc� receber� somente os e-mails de: (1)Confirma��o/Altera��o
			de Cadastro; (2)Os eventuais para Lembrar Senha; e (3)Os que ser�o marcados por voc� mesmo em sua
			Agenda-Boletins.</p>
					</td>
				</tr>
			</table>
		</TD>
		<TD width=40>&nbsp;</TD>
		<TD width=130>
			<TABLE border=0 cellPadding=0 cellSpacing=0 width=120>
				<TBODY>
				<TR><TD><IMG height=70 src="images/menu11.gif" width=120></TD></TR>
				<TR><TD><IMG height=5 src="images/menu13.gif" width=120></TD></TR>
				<TR><TD height=10><IMG height=10 src="images/menu12.gif" width=120></TD></TR>
				<TR><TD background=images/menu14.gif>
					<TABLE border=0 cellPadding=5 cellSpacing=0 width=120>
						<TBODY>
							<TR><TD>
							<P align=left>
							<B><font face=Verdana><font color=#ff3333>NOSSAS ENQUETES.</font></B>
							<font color=#000080><BR>-Fornece subs�dios<BR>-Intera��o total</font>
							<B><font color=#ff3333><BR><BR>VEJA ESTA:</font></font></B>
							</TD></TR>
						</TBODY>
					</TABLE>
<%
' Numero de enquetes no banco de dados e grava a informa��o do cliente
	Set RS_Max = Server.CreateObject("ADODB.Recordset")
	RS_Max.Open "SELECT MAX(ENQ_Cod) AS max_Cod FROM Enquetes", Conexao
	ref = RS_Max("max_Cod")
	RS_Max.Close
	Set RS_Max = Nothing

	Set Clicks = Server.CreateObject("ADODB.Recordset")
	Randomize Timer /Rnd
	ref = Int(ref * Rnd + 1)
	Clicks.Open "SELECT * FROM Enquetes WHERE ENQ_Cod = " & ref, Conexao
%>
	<Script Language="JavaScript">
	<!--//
		function Vote(obj){
			URL = 'sabio02.asp?ID=<%=ref%>&Voto=' + obj
			location.href = URL
		}
	//-->
	</Script>
					<TABLE border=0 cellPadding=0 cellSpacing=5 width=110 style="font-size:7pt">
						<TBODY>
							<TR><TD colspan=2 style="font-size:8pt"><%=Clicks("ENQ_Cod")%>. <b><%=Clicks("ENQ_Desc")%></b></TD></TR>

							<TR>	<TD><%tot = Round(Clicks("ENQ_Aa") / Clicks("ENQ_Total"),2) * 100%><INPUT TYPE="radio" onClick="Vote('ENQ_Aa')"></TD>
								<TD><%=tot%>% <%=Clicks("ENQ_A")%></TD></TR>

							<TR>	<TD><%tot = Round(Clicks("ENQ_Bb") / Clicks("ENQ_Total"),2) * 100%><INPUT TYPE="radio" onClick="Vote('ENQ_Bb')"></TD>
								<TD><%=tot%>% <%=Clicks("ENQ_B")%></TD></TR>

							<TR>	<TD><%tot = Round(Clicks("ENQ_Cc") / Clicks("ENQ_Total"),2) * 100%><INPUT TYPE="radio" onClick="Vote('ENQ_Cc')"></TD>
								<TD><%=tot%>% <%=Clicks("ENQ_C")%></TD></TR>

							<TR>	<TD><%tot = Round(Clicks("ENQ_Dd") / Clicks("ENQ_Total"),2) * 100%><INPUT TYPE="radio" onClick="Vote('ENQ_Dd')"></TD>
								<TD><%=tot%>% <%=Clicks("ENQ_D")%></TD></TR>
						</TBODY>
					</TABLE>
<%
	Clicks.Close
	Conexao.Close
	Set Clicks = Nothing
	Set Conexao = Nothing

'                   End If
%>
				</TD></TR>
				<TR><TD><IMG height=36 src="images/menu16.gif" width=120></TD></TR>
				<TR align=center><TD><br><span style="font-size:7pt">Copyright &copy;2000<br>by Borg.</span></TD></TR>
				</TBODY>
			</TABLE>
		</TD>
	</TR>
	</TBODY>
</TABLE>
<p> </p>
</BODY></HTML>