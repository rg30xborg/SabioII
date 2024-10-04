<%@ Language=VBScript %>
<%
'           If inStr(Request.ServerVariables("HTTP_HOST"), "www.aggora.com.br") = 0 Then
'           	Response.Redirect "http://www.aggora.com.br/sabio/help.htm"
'           	Response.End
'           Else
	cod = Request("ID")
	If cod < 10 Then orig = "000" & cod Else orig = "00" & cod End If
	If cod = 1 Then fig = cod End If
	Select Case orig
		Case "0001" perg0 = "OLIMPÍADAS"
		Case "0005" perg0 = "INFORMÁTICA"
		Case "0006" perg0 = "VARIEDADES"
		Case "0007" perg0 = "TELEVISÃO"
		Case "0008" perg0 = "ESPORTES"
		Case "0009" perg0 = "CINEMA"
		Case "0010" perg0 = "TRANSITO"
		Case "0011" perg0 = "ATUALIDADES"
		Case "0012" perg0 = "NA ESCOLA (Geografia, História...)"
		Case "0013" perg0 = "DICIONÁRIO"
		Case "0014" perg0 = "SEU TALENTO"
		Case "0015" perg0 = "DE USUÁRIOS"
		Case Else perg0 = "OLIMPIADAS"
	End Select
	msgIn = Request.Cookies("Sabichao")("nome")
	If Session("logmail") <> "" Then msgIn = Session("logmail") End If

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
		<TD>
<p align=left style="font-size: 10pt">
	Exemplo de Sala: <font color="#0588C0"><b><%=perg0%></font></b>
	<span style="font-size: 8pt"><br>
	 - Pontos: <font color="#0000FF"><%=cod%>00</font>
	 - Consec: <font color="#0000FF"><%=cod%></font>
	 - Tempo: <font color="#0000FF">00min:00seg.</font>
	</span>
</p>
<%
' Abre conexao com banco de dados
	Set Conexao = Server.CreateObject("ADODB.Connection")
	'SQLServer =>  'Conexao.Open "Provider=SQLOLEDB.1;SERVER=187.45.196.225;DATABASE=aggora1;UID=aggora1;PWD=dade02;"
	Conexao.Open "DRIVER={MySQL ODBC 5.3 ANSI Driver};SERVER=187.45.196.225;PORT=3306;DATABASE=aggora1;USER=aggora1;PASSWORD=dade02;OPTION=3;"

' Grava informacoes no banco de dados
	Set Perguntas = Server.CreateObject("ADODB.Recordset")
	Randomize Timer /Rnd
	cod = Int(10 * Rnd + 1)
	Perguntas.Open "SELECT * FROM Perg" & orig & " WHERE Codigo = " & cod, Conexao

	If fig <> "" Then fig = "tema" & fig & "/images/" & Perguntas("Figura") End If
%>
<table width="100%" cellspacing="0" cellpadding="0">
	<tr valign="TOP"> 
		<td width="5%"></td>
		<td bgcolor="#F94942" width="2%"><img src="images/cant01s.gif"></td>
		<td bgcolor="#F94942" width="67%">TIPO DE PERGUNTAS NA SALA<br>
			<b><Span style="font-size: 9pt; color: #FFFFFF"><%=Perguntas("Pergunta")%></Span></b>
		</td>
		<td bgcolor="#F94942" width="2%" align="RIGHT"><img src="images/cant02s.gif"></td>
		<td width="24%" align="CENTER" valign="TOP">
			<b><font style="font-size: 14pt; color: #F94942">Ganhe</font>
			<br><font style="font-size: 12pt">20 pontos</b></font>
		</td>
	</tr>
	<tr valign="TOP"> 
		<td width="5%"></td>
		<td bgcolor="#F94942" width="2%"><img src="images/cant01ii.gif"></td>
		<td bgcolor="#F94942" width="67%"></td>
		<td bgcolor="#F94942" width="2%" align="RIGHT"><img src="images/cant02ii.gif"></td>
		<td width="24%" align="CENTER" valign="TOP"></td>
	</tr>
	<tr valign="TOP"> 
		<td width="5%"></td>
		<td bgcolor="#FDB4B1" width="2%" valign="BOTTOM"><img src="images/cant03i.gif"></td>
		<td bgcolor="#FDB4B1" width="67%">
<% If fig <> "" Then %>
			<table width="100%" cellspacing="0" cellpadding="2">
				<tr>
					<td width=100><img src="<%=fig%>" name="NFigr" width=100 height=180></td>
					<td>
<% End If %>
			<table border="0" width="100%" cellspacing="0" cellpadding="2">
				<tr>
					<td width="3%" valign="top" nowrap><img src="images/happy3.gif" name="n1" align="center" hspace="3"><input type="radio" name="Resposta"></td>
					<td width="97%" valign="top"><Span><%=Perguntas("a")%></Span></td>
				</tr>
				<tr>
					<td width="3%" valign="top" nowrap><img src="images/happy3.gif" name="n2" align="center" hspace="3"><input type="radio" name="Resposta"></td>
					<td width="97%" valign="top"><Span><%=Perguntas("b")%></Span></td>
				</tr>
				<tr>
					<td width="3%" valign="top" nowrap><img src="images/happy3.gif" name="n3" align="center" hspace="3"><input type="radio" name="Resposta"></td>
					<td width="97%" valign="top"><Span><%=Perguntas("c")%></Span></td>
				</tr>
				<tr>
					<td width="3%" valign="top" nowrap><img src="images/happy3.gif" name="n4" align="center" hspace="3"><input type="radio" name="Resposta"></td>
					<td width="97%" valign="top"><Span><%=Perguntas("d")%></Span></td>
				</tr>
				<tr>
					<td width="3%" valign="top" nowrap><img src="images/happy3.gif" name="n5" align="center" hspace="3"><input type="radio" name="Resposta"></td>
					<td width="97%" valign="top"><Span><%=Perguntas("e")%></Span></td>
				</tr>
			</table>
<% If fig <> "" Then %>
					</td>
				</tr>
			</table>
<% End If %>
		</td>
		<td bgcolor="#FDB4B1" width="2%" align="RIGHT" valign="BOTTOM"><img src="images/cant04i.gif"></td>
		<td width="24%" align="CENTER" valign="MIDDLE"><img src="images/resp01.gif"><p>(botão responder<br>desabilitado no preview)</p></td>
	</tr>
</table>
<p>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr> 
		<td>
			<p align="justify"><b>OLHO VIVO - </b> Fique ligado e bem informado neste ítem. Em cada Sala de
			Perguntas tem também o parágrafo OLHO VIVO, com muita informação e curiosidades sobre os mais variados
			temas, apresentados na tradicional forma do <i>Você Sabia Que...?</i>, alem de inumeras <i>Piadas...</i>
			que trazem muito bom humor ao Site.</p>
		</td>
	</tr>
</table>
<%
	Perguntas.Close
	Conexao.Close
	Set Perguntas = Nothing
	Set Conexao = Nothing
'               End If
%>
<p>
			<TABLE cellPadding=0 cellSpacing=0  width=100%>
				<TR>
					<TD width=27><IMG height=40 src="images/supdate03.gif" width=27></TD>
					<TD bgColor=#0f4baf><FONT size=4><FONT face="Verdana, Arial, Helvetica, sans-serif" color=#ffffff><B><I>DESCRIÇÃO</I></FONT></B></TD>
					<TD width=27><IMG height=40 src="images/supdate02.gif" width=27></TD>
				</TR>
			</TABLE>
<p>
 			<table border="0" cellpadding="0" cellspacing="0" width="90%" style="font-family: Arial; font-size:9pt">
				<tr>
					<td>
			<p  align="justify"><b>Sabichão. </b><i>Adj. e Sub. Masculino:</i> Grande sábio; aquele que alardeia 
			sabedoria; presunçoso. <i>Feminino:</i> Sabichã ou Sabichona. Detone em seu assunto preferido, ou 
			conheça mais sobre temas de interesse ou diversos. Em cada Sala tem perguntas sobre um mesmo tema que, 
			mudam a qualquer hora. Se o seu assunto preferido ainda não apareceu, mande sua sugestão para o:
			<a href="mailto:contato@aggora.com.br?subject=Sujestão: Tema de Salas">RG Sabichão Web</a></p>
					</td>
				</tr>
			</table>
<p>
 			<table border="0" cellpadding="0" cellspacing="0" width="90%" style="font-family: Arial; font-size:9pt">
				<tr>
					<td>
			<B><I>COMO ENTRAR NO JOGO</I></B>
			<p align="justify">Nos campos do formulário à direita, digite seu Log-in (<b><font color=red>E-MAIL completo</font></b>) e uma
			SENHA exclusiva para este Site-Jogo. Pronto você automaticamente já estará registrado no Sabichão, e entrara
			no ambiente do jogo. Mas lembre-se, para concorrer aos prêmios quando estes estiverem disponíveis você deverá completar seus dados
			cadastrais, ou atualiza-los. Eles podem ser alterados (exceto e-mail) a qualquer momento a partir
			da página interna [Menu] com um clique simples em [Alterar Cadastro].</p>
					</td>
				</tr>
				<tr>
					<td align="right" height=30>Quero uma amostra <a href="demos/sabio01.htm">Mini-Demo</a> | <a href="sabio23.asp">Full-Demo</a> antes de Cadastrar-me.</td>
				</tr>
			</table>
<p>
			<table border="0" cellpadding="0" cellspacing="0" width="90%" style="font-family: Arial; font-size:9pt">
				<tr>
					<td>
			<B><I>TURMA DO FUNDÃO</I></B>
			<p  align="justify">Se enturme com sua Turma! (<b><font color=red>Bate papo com os Sabios-Amigos</font></b>). Nas salas do Sabichão, estará
			disponível chat para compartilhamento de idéias e assuntos diversos, podendo o usuário selecionar para este entrosamento até 5 
			usuarios que podem ser Locais (da sua cidade ou bairro), Regional (do seu estado) ou Nacional em função dos seus dados cadastrais. Será 
			possível também a seleção de amigos por outros critérios de escolha, tais como idade ou interesses comuns, a serem implementados.</p>
					</td>
				</tr>
			</table>
		</TD>
		<TD width=40>&nbsp;</TD>
		<TD width=130>
			<TABLE border=0 cellPadding=0 cellSpacing=0 width=120>
				<TBODY>
				<TR><TD><IMG height=70 src="images/menu02.gif" width=120></TD></TR>
				<TR><TD><IMG height=5 src="images/menu13.gif" width=120></TD></TR>
				<TR><TD height=10><IMG height=10 src="images/menu12.gif" width=120></TD></TR>
				<TR><TD background=images/menu14.gif>
<FORM action=sabio10.asp method=post name="logonForm" onsubmit="return verifica()"><br>
			<table cellspacing=1 cellpadding=2 width=120 style="font-family: Arial; font-size:8pt;color:#000080">
				<tr>
					<td align=right><b>Seu E-mail</b>:<br>
					<input type="text" name="userlogon" style="width:115" maxlength="30" value="<%=msgIn%>"><br><span style="font-size:8pt"> (E-mail completo)</span></td>
				</tr>
				<tr>
					<td align=right><b>Uma Senha</b>:<br>
					<input type="password" name="userpassw" style="width:115" maxlength="12"><br><span style="font-size:8pt"> (Mínimo 6 Caracteres)</span></td>
				</tr>
				<tr>
					<td align=right><input type="submit" value="Entre (é gratis)" name="lggonAgn" style="border:0;background-color:rgb(204,204,204);background-image:url('images/bt3.gif');width:115;height:25"></td>
				</tr>
			</table>
</FORM>
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