<%@ Language=VBScript %>
<%
'           If inStr(Request.ServerVariables("HTTP_HOST"), "www.aggora.com.br") = 0 Then
'           	Response.Redirect "http://www.aggora.com.br/sabio/help.htm"
'           	Response.End
'           Else
	msgIn = Request.Cookies("Sabichao")("nome")
	If Session("logmail") <> "" Then msgIn = Session("logmail") End If

	'       Set fs = CreateObject("Scripting.FileSystemObject")

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
	Exemplo de Sala: <font color="#0588C0"><b>PRÊMIOS</font></b>
	<span style="font-size: 8pt"><br>
	 - ARRISQUE SEUS PONTOS NOS PRÊMIOS DO SABICHÃO
	</span>
</p>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr valign="TOP"> 
		<td width="5%"></td>
		<td bgcolor="#ffcc00" width="2%"><img src="images/cant01s.gif"></td>
		<td bgcolor="#ffcc00" width="86%" style="font-size: 9pt; align:justify;">EXEMPLOS DE PRÊMIOS:
			<span style="color:#0000FF;">
				<br><b>Aqui apresentamos exemplos de Prêmios (*) que serão sorteados (em breve). Você poderá colocar livremente seus  
				pontos nos Prêmios que lhe agradar, depois, é só aguardar e acompanhar as datas dos sorteios que estiver concorrendo.</b>
			</span>
				<br><br>(*) Eventuais prêmios só serão entregues, se seus <font color="blue"><b>Dados Cadastrais</b></font> forem
				Verdadeiros, e o link <font color="blue"><b>www.aggora.com.br/sabio</b></font> ter sido compartilhado em uma de suas 
				<font color="blue"><b>redes sociais</b></font> antes do sorteio do Prêmio.</b>
		</td>
		<td bgcolor="#ffcc00" width="2%" align="RIGHT"><img src="images/cant02s.gif"></td>
		<td width="5%"></td>
	</tr>
	<tr valign="TOP"> 
		<td width="5%"></td>
		<td bgcolor="#ffcc00" width="2%"><img src="images/cant01ii.gif"></td>
		<td bgcolor="#ffcc00" width="86%"></td>
		<td bgcolor="#ffcc00" width="2%" align="RIGHT"><img src="images/cant02ii.gif"></td>
		<td width="5%"></td>
	</tr>
	<tr valign="TOP"> 
		<td width="5%"></td>
		<td bgcolor="#ffff99" width="2%" valign="BOTTOM"><img src="images/cant03i.gif"></td>
		<td bgcolor="#ffff99" width="86%">
			<form name="Aposta">
			<table border="0" width="100%" cellspacing="0" cellpadding="5">
				<tr>
					<td><b>Pr&ecirc;mio / Apoio</b></td>
					<td><b>Data do Sorteio</b></td>
					<td><b>Total de Apostas</b></td>
					<td><b>Apostar</b></td>
				</tr>
<%
	Set Conexao = Server.CreateObject("ADODB.Connection")
	'SQLServer =>  'Conexao.Open "Provider=SQLOLEDB.1;SERVER=187.45.196.225;DATABASE=aggora1;UID=aggora1;PWD=dade02;"
	Conexao.Open "DRIVER={MySQL ODBC 5.3 ANSI Driver};SERVER=187.45.196.225;PORT=3306;DATABASE=aggora1;USER=aggora1;PASSWORD=dade02;OPTION=3;"

	Set Premios = Server.CreateObject("ADODB.Recordset")
	Premios.Open "SELECT * FROM Premios P, Patrocinio DE WHERE P.PAT_Cod = DE.PAT_Cod ORDER BY P.PRE_Data", Conexao

' Checa se existem produtos no banco de dados
	If Premios.Eof Then 
%>

				<tr bgcolor="#FFD699"> 
					<td colspan=4><b>Nenhum Premios programado para o momento. Aguarde para Breve.</td>
				</tr>
<%
	Else
		bgcolor = "#FFFFDF"
		ultMdia = 1
		Premios.MoveFirst
		While Not Premios.EOF
			pDias = DateDiff("d", Date, Premios("PRE_Data"))
			If (pDias >= 0 And pDias < 7) Or (Premios("PRE_Special") <> "0" And pDias >= 0) Then
				codigo = Premios("PRE_Cod")
				If bgcolor = "#FFFFDF" Then 
					bgcolor = "#FFEDA7"
				Else
					bgcolor = "#FFFFDF"
				End If
%>
				<tr bgcolor="<%=bgcolor%>"> 
					<td><b><%=codigo%>) <%=Premios("PRE_Desc")%></b><br><%=Premios("PAT_Nome")%></td>
					<td><%=Premios("PRE_Data")%><br><%=WeekdayName(WeekDay(Premios("PRE_Data")))%></td>
					<td><span id="Pgs<%=codigo%>"><%=Premios("PRE_Apts")%></span></td>
					<td><input type="TEXT" name="Bot<%=codigo%>" size="5" maxlength="5"></td>
				</tr>
<%
				ultMdia = ultMdia + 1
			End If
			Premios.MoveNext
		Wend
		If ultMdia = 1 Then
%>
				<tr bgcolor="#FFD699"> 
					<td colspan=4><b>Nenhum Premios programado para o momento. Aguarde para Breve.</td>
				</tr>
<%
		End If
	End If
	Premios.Close
	Conexao.Close
	Set Premios = Nothing
	Set Conexao = Nothing
'           End If
%>
			</table>
			</form>
		</td>
		<td bgcolor="#ffff99" width="2%" align="RIGHT" valign="BOTTOM"><img src="images/cant04i.gif"></td>
		<td width="5%"></td>
	</tr>
</table>
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
				<p align=justify>Estamos trabalhando firme para que os prêmios sejam disponibilizados o mais
				rápido possível, e tão logo sejam implementados você recebera um e-mail avisando-o da novidade.
				Assim, nesta fase de implantação, você poderá acumular quantos PONTOS desejar, pois eles valerão
				para serem arriscados nos prêmios quando de sua efetiva implementação.</p>
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
			<p><a href="extra02.htm">regras</a><br><a href="sabio21.asp">já sorteados</a><br>Ajuda</p>
		</TD>
	</TR>
	</TBODY>
</TABLE>
<div id="INV002" style="position:absolute; width: 100%; height: 60px; left:0px; top:20px; z-index: 8; visibility: inherit"><marquee behavior="scroll" direction="right" scrollamount="5"><img src="images/coelho2R.gif" width="60" height="60"></marquee></div>
<p> </p>
</BODY></HTML>