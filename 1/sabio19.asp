<%@ Language=VBScript %>
<%
'               If inStr(Request.ServerVariables("HTTP_HOST"), "www.aggora.com.br") = 0 Then
'               	Response.Redirect "http://www.aggora.com.br/sabio/help.htm"
'               	Response.End
'               Else
	msgIn = Request.Cookies("Sabichao")("nome")
	If Session("logmail") <> "" Then msgIn = Session("logmail") End If
'               End If

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
	Exemplo de: <font color="#0588C0"><b>JOGOS ONLINE</font></b>
	<span style="font-size: 8pt"><br>
	 - AUMENTE SEUS PONTOS COM OS JOGOS
	</span>
</p>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr valign="TOP"> 
		<td width="5%"></td>
		<td bgcolor="#4444FF" width="2%" align="LEFT"><img src="images/cant01s.gif"></td>
		<td bgcolor="#4444FF" width="86%" style="font-size:10pt;color:#FFFFFF">
			<b><p align="justify"><br>Após os estudos um momento para o Lazer.
			<br>- Perg.: Quem pode desfrutar desta área?  
			<br>- Resp.: Todos que acumularam pontos nas Salas de Perguntas.<br>
			<br>Aqui voce arrisca quantos pontos desejar em diversas opções de Jogo, e pode com isto, aumentar ainda
			mais seus pontos acumulados. Mas cuidado, os pontos arriscados serão descontados do seu total...</p></b>
		</td>
		<td bgcolor="#4444FF" width="2%" align="RIGHT"><img src="images/cant02s.gif"></td>
		<td width="5%"></td>
	</tr>
	<tr valign="TOP"> 
		<td width="5%"></td>
		<td bgcolor="#4444FF" width="2%" align="LEFT"><img src="images/cant01ii.gif"></td>
		<td bgcolor="#4444FF" width="86%" align=center></td>
		<td bgcolor="#4444FF" width="2%" align="RIGHT"><img src="images/cant02ii.gif"></td>
		<td width="5%"></td>
	</tr>
	<tr valign="TOP"> 
		<td width="5%"></td>
		<td bgcolor="#7FCCFF" width="2%" valign="BOTTOM" align="LEFT"><img src="images/cant03i.gif"></td>
		<td bgcolor="#7FCCFF" width="86%" style="font-size:10pt"><br>
			<p align="justify"><b>JOGOS INÉDITOS - </b> São pelo menos 7 jogos exclusivos, criados especialmente
			para o Sabichão, alem de mais outros 8 que estão em fase final de testes e serão implantados gradativamente,
			assim que concluídos e aprovados. - Entre e Confira.</p><br>
		</td>
		<td bgcolor="#7FCCFF" width="2%" align="RIGHT" valign="BOTTOM"><img src="images/cant04i.gif"></td>
		<td width="5%" align="CENTER"><td>
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
						<p align="justify"><img src="images/novo.gif"> <b>RG Podium F1</b> é um jogo individual, não se trata de bolão.
						O jogador anota a posição exata dos três primeiros colocados na etapa da Fórmula 1 e faz sua aposta. Ai é só
						aguardar e torcer. Além de apostar, aqui você acompanha tudo sobre este Campeonato: classificação, os pilotos
						e equipes.</p>
						<p align="justify"><img src="images/novo.gif"> <b>RG Esportiva</b> é um jogo individual, não se trata de bolão.
						O jogador anota o placar dos treze jogos da loteria esportiva e faz sua aposta. Ai é só aguardar e torcer.
						Além de apostar, aqui você acompanha tudo sobre o Campeonato: classificação, os atletas e equipes.</p>
						<p align="justify"><b>RG Jokey Club</b> é um jogo que o jogador define sua pule no Cavalo Vencedor do Páreo
						- Em breve apostas por um tradicional turfe do Brasil.</p>
						<p align="justify"><b>RG Giga-Senna</b> em uma cartela similar a da mega sena, com 60 dezenas, o jogador
						anota 15 palpites para o sorteio. - Tem varias chances de ganhar, inclusive acertando só um número.</p>
						<p align="justify"><b>RG Três Dados</b> neste você ganha sempre, desde que suas apostas sejam distribuidas
						inteligentemente.</p>
						<p align="justify"><b>RG Video Poker</b> é o tradicional jogo americano de cartas, em versão lazer para a
						internet. - Tem dobra maior ou menor que 7 e dobra seca, onde você arrisca a carta exata que vai sair.</p>
						<p align="justify"><b>RG Roleta Web</b> é o tradicional jogo dos cassinos, em versão lazer para a internet.</p>
						<p align="justify">Para <font color=red>Entrar nos  Jogos</font> será necessário acumular PONTOS nas
						Salas de Perguntas. - Seus PONTOS disponíveis são menores que o mínimo para acessa-los.</p>
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
		</TD>
	</TR>
	</TBODY>
</TABLE>
<p> </p>
</BODY></HTML>