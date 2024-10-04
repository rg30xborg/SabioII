<%@ Language=VBScript %>
<%
	Response.Expires = 0
	
'                   If inStr(Request.ServerVariables("HTTP_HOST"), "www.aggora.com.br") = 0 Then
'                   	Response.Redirect "http://www.aggora.com.br/sabio/help.htm"
'                   	Response.End
'                   Else
	Session.Abandon
'                   End If

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
					<TD bgColor=#0f4baf><FONT size=4><FONT face="Verdana, Arial, Helvetica, sans-serif" color=#ffffff><B><I>O QUE É O SABICHÃO?</I></FONT></B></TD>
					<TD width=27><IMG height=40 src="images/supdate02.gif" width=27></TD>
				</TR>
			</TABLE>
<p>
			<table border="0" cellpadding="0" cellspacing="0" width="90%" style="font-family: Arial; font-size:9pt">
				<tr>
					<td>
			<p align="justify">É um Site-Jogo interativo com característica educacional e de entretenimento. 
			O Jogo possui Salas de Perguntas tipo QUIZ sobre assuntos variados. A cada dia o Internauta 
			pode responder até 5(cinco) perguntas por Sala, e a cada Pergunta respondida corretamente é adicionado 
			20 PONTOS a Pontuação Total do Jogador. Depois os PONTOS acumulados, podem ser investidos em varios 
			prêmios disponibilizados no Site(breve). Participe e teste seus Conhecimentos - É Totalmente Gratuito 
			e voce ainda corre o risco de ganhar varios PRÊMIOS!</p>
					</td>
				</tr>
				<tr>
					<td>
<FORM action=sabio10.asp method=post name="logonForm" onsubmit="return verifica()"><br>
			<table cellspacing=1 cellpadding=2 width=100% style="font-family: Arial; font-size:9pt;color:#000080">
				<tr>
					<td align=right><b>Seu E-mail</b>:</td>
					<td><input type="text" name="userlogon" size="30" maxlength="30">&nbsp;<span style="font-size:8pt"> (E-mail Completo)</span></td>
				</tr>
				<tr>
					<td align=right><b>Uma Senha</b>:</td>
					<td><input type="password" name="userpassw" size="12" maxlength="12">&nbsp;<span style="font-size:8pt"> (Mínimo 6 Caracteres)</span></td>
				</tr>
				<tr>
					<td colspan=2 align=right><input type="submit" value="Entre (é gratis)" name="lggonAgn" style="border:0;background-color:rgb(255,255,255);background-image:url('images/bt3.gif');width:115;height:25"></td>
				</tr>
			</table>
</FORM>
					</td>
				</tr>
			</table>
			<TABLE cellPadding=0 cellSpacing=0  width=100%>
				<TR>
					<TD width=27><IMG height=40 src="images/supdate03.gif" width=27></TD>
					<TD bgColor=#0f4baf><FONT size=4><FONT face="Verdana, Arial, Helvetica, sans-serif" color=#ffffff><B><I>COMO ENTRAR NO JOGO</I></FONT></B></TD>
					<TD width=27><IMG height=40 src="images/supdate02.gif" width=27></TD>
				</TR>
			</TABLE>
<p>
 			<table border="0" cellpadding="0" cellspacing="0" width="90%" style="font-family: Arial; font-size:9pt">
				<tr>
					<td>
			<p align="justify">Nos campos do formulário acima, digite seu Log-in (<b><font color=red>E-MAIL completo</font></b>) e uma
			SENHA exclusiva para este Site-Jogo. Pronto você automaticamente já estará registrado no Sabichão, e entrara
			no ambiente do jogo. Mas lembre-se, para concorrer aos prêmios quando estes estiverem disponíveis você deverá completar seus dados
			cadastrais, ou atualiza-los. Eles podem ser alterados (exceto e-mail) a qualquer momento a partir
			da página interna [Menu] com um clique simples em [Alterar Cadastro].</p>
					</td>
				</tr>
			</table>
<p>
			<TABLE border=0 cellPadding=0 cellSpacing=0  width=100%>
				<TR>
					<TD width=27><IMG height=40 src="images/supdate03.gif" width=27></TD>
					<TD bgColor=#0f4baf><FONT size=4><FONT face="Verdana, Arial, Helvetica, sans-serif" color=#ffffff><B><I>TURMA DO FUNDÃO</I></FONT></B></TD>
					<TD width=27><IMG height=40 src="images/supdate02.gif" width=27></TD>
				</TR>
			</TABLE>
<p>
			<table border="0" cellpadding="0" cellspacing="0" width="90%" style="font-family: Arial; font-size:9pt">
				<tr>
					<td>
			<p  align="justify">Se enturme com sua Turma! (<b><font color=red>Bate papo com os Sabios-Amigos</font></b>). Nas salas do Sabichão, estará
			disponível chat para compartilhamento de idéias e assuntos diversos, podendo o usuário selecionar para este entrosamento até 5 
			usuarios que podem ser Locais (da sua cidade ou bairro), Regional (do seu estado) ou Nacional em função dos seus dados cadastrais. Será 
			possível também a seleção de amigos por outros critérios de escolha, tais como idade ou interesses comuns, a serem implementados.</p>
					</td>
				</tr>
			</table>
<p>
			<table border="0" cellpadding="0" cellspacing="0" width="90%" style="font-family: Arial; font-size: 9pt; color:#770000">
				<tr>
					<td>
			<p align="justify">
			Através de nosso sistema você receberá somente os e-mails de: (1)Confirmação/Alteração
			de Cadastro; (2)Os eventuais para Lembrar Senha; e (3)Os que serão marcados por você mesmo em sua
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
							<B><FONT face=Verdana size=1><FONT color=#ff3333>NOSSAS ENQUETES.</FONT></B>
							<FONT color=#000080><BR>-Fornece subsídios<BR>-Interação total</FONT>
							<B><FONT color=#ff3333><BR><BR>VEJA ESTA:</FONT></FONT></B>
							</TD></TR>
						</TBODY>
					</TABLE>
<%
' Abre conexao com banco de dados.
	Set Conexao = Server.CreateObject("ADODB.Connection")
	'SQLServer =>  'Conexao.Open "Provider=SQLOLEDB.1;SERVER=187.45.196.225;DATABASE=aggora1;UID=aggora1;PWD=dade02;"
	Conexao.Open "DRIVER={MySQL ODBC 5.3 ANSI Driver};SERVER=187.45.196.225;PORT=3306;DATABASE=aggora1;USER=aggora1;PASSWORD=dade02;OPTION=3;"

' Numero de enquetes no banco de dados e grava a informação do cliente
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
					<TABLE border=0 cellPadding=0 cellSpacing=5 width=110>
						<TBODY>
							<TR><TD colspan=2><FONT face="Verdana, Arial, Helvetica, sans-serif" size=1><%=Clicks("ENQ_Cod")%>. <b><%=Clicks("ENQ_Desc")%></b></FONT></TD></TR>

							<TR>	<TD><%tot = Round(Clicks("ENQ_Aa") / Clicks("ENQ_Total"),2) * 100%><INPUT TYPE="radio" onClick="Vote('ENQ_Aa')"></TD>
								<TD><FONT face="Verdana, Arial, Helvetica, sans-serif" size=1><%=tot%>% <%=Clicks("ENQ_A")%></FONT></TD></TR>

							<TR>	<TD><%tot = Round(Clicks("ENQ_Bb") / Clicks("ENQ_Total"),2) * 100%><INPUT TYPE="radio" onClick="Vote('ENQ_Bb')"></TD>
								<TD><FONT face="Verdana, Arial, Helvetica, sans-serif" size=1><%=tot%>% <%=Clicks("ENQ_B")%></FONT></TD></TR>

							<TR>	<TD><%tot = Round(Clicks("ENQ_Cc") / Clicks("ENQ_Total"),2) * 100%><INPUT TYPE="radio" onClick="Vote('ENQ_Cc')"></TD>
								<TD><FONT face="Verdana, Arial, Helvetica, sans-serif" size=1><%=tot%>% <%=Clicks("ENQ_C")%></FONT></TD></TR>

							<TR>	<TD><%tot = Round(Clicks("ENQ_Dd") / Clicks("ENQ_Total"),2) * 100%><INPUT TYPE="radio" onClick="Vote('ENQ_Dd')"></TD>
								<TD><FONT face="Verdana, Arial, Helvetica, sans-serif" size=1><%=tot%>% <%=Clicks("ENQ_D")%></FONT></TD></TR>
						</TBODY>
					</TABLE>
<%
	Clicks.Close
	Conexao.Close
	Set Clicks = Nothing
	Set Conexao = Nothing
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
<p><Script Language=JavaScript>
<!--
	top.frames.super1.USerID.innerText = "Bem-Vindo :)"
	top.frames.super1.Ponto.innerText = "PRÊMIOS"
	top.frames.super1.LogOK.style="visibility:hidden"
//-->
</Script></p>
</BODY></HTML>