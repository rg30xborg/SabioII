<%@ LANGUAGE=JSCRIPT EnableSessionState=False %>
<%
	Response.Expires = 0
	startPage = "http://www.aggora.com.br/sabio/1/sorte/sabio02.asp"
	if(Request.Form.Count > 0){
		var libok = Request.Form("dataz")
		if(libok < 1) Response.Redirect(startPage)
		var libSl = Request.Form("salax")
	}
	else Response.Redirect(startPage)
%>
<Script Language="JScript"><!--//
	var cred = <%=libok%>, pSala = <%=libSl%>
//-->
</Script><Script Language="JScript" src="../../images/Simpl2.js"></Script>
<HTML><HEAD><TITLE>RG 3.0 - Sabichão Web</TITLE>
<style>@import url(../../images/coUC.css);</style>
</HEAD><body bgcolor=#FFFFFF scroll="auto" onLoad="Aviso2()">
<p style="font-size: 10pt">
	Sala de Apostas: <font color="#0588C0"><b>VIDEO POKER I</font><Span ID="NCalc"> - Criando Ambiente ...</Span></b>
	<span style="font-size: 8pt"><br>
	 - Pontos nos Jogos: <font color="#0000FF"><span ID="Reg18"><%=libSl%></span> pontos</font>
	 - Resultados: <font color="#0000FF"><span ID="Reg17">Iniciando...</span></font>
	</span>
</p>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#F94942" width="2%" align="LEFT"><img src="../../images/cant01s.gif"></td>
		<td bgcolor="#F94942" width="80%" align=center><br>
<div style="POSITION:relative;width:100%">
		<table width="590" height="75" cellspacing="0" cellpadding="0" style="font-size: 10pt; color: yellow">
			<tr align="center" valign="middle">
				<td width="80"><b>Banca de</b></td>
				<td width="55"><img name="Reg01" src="/_Library/ficha1.gif" onClick="selBet1(1)"></td>
				<td width="55"><img name="Reg01" src="/_Library/ficha2.gif" onClick="selBet1(2)"></td>
				<td width="55"><img name="Reg01" src="/_Library/ficha3.gif" onClick="selBet1(3)"></td>
				<td width="100"><img name="Reg00" SRC="/_Library/Rolsorte.gif" width="70" height="50"></td>
				<td width="55"><img name="Reg01" src="/_Library/ficha4.gif" onClick="selBet1(4)"></td>
				<td width="55"><img name="Reg01" src="/_Library/ficha5.gif" onClick="selBet1(5)"></td>
				<td width="55"><img name="Reg01" src="/_Library/ficha6.gif" onClick="selBet1(10)"></td>
				<td width="80"><b>Apostas</b></td>
			</tr>
		</table>
<div ID="Reg19" style="POSITION:absolute;TOP:0;LEFT:0;width:100%;background:#F94942;visibility:hidden">
		<table width="590" height="75" cellspacing="0" cellpadding="0" style="font-size: 10pt; color: yellow">
			<tr align="center" valign="middle">
				<td width="10%">
				<img src="/_Library/botmv.gif" width="30" height="30" alt="Carta maior que 7" name="Reg25" onClick="dobram('&gt;')"><br><b>7</b><br>
				<img src="/_Library/botmv.gif" width="30" height="30" alt="Carta menor que 7" name="Reg24" onClick="dobram('&lt;')"></td>
				<td width="20%">
				<img src="/_Library/acima.gif" width="20" height="19" alt="Avança Naipe" onClick="adinai()"><br>
				<img src="/_Library/esque.gif" width="19" height="30" alt="Diminue Número" onClick="subnum()">
				<img src="/_Library/botcv.gif" width="50" height="30" name="Reg26" alt="Dobra Cheia" onClick="cheiax()">
				<img src="/_Library/direi.gif" width="19" height="30" alt="Aumenta Número" onClick="adinum()"><br>
				<img src="/_Library/abaix.gif" width="20" height="19" alt="Retorna Naipe" onClick="subnai()"></td>
				<td width="20%"><img src="/_Library/01o.gif" width="50" height="75" alt="Carta-Palpite (Regras)" name="f6" onClick="infodobr()"></td>
				<td width="50%"><img src="/_Library/carta.gif" alt="Última Carta" name="Reg27" width="50" height="75"> <img src="/_Library/carta.gif" alt="A Duas Cartas" name="Reg28" width="50" height="75"> <img src="/_Library/carta.gif" alt="A Tres Cartas" name="Reg29" width="50" height="75"> <img src="/_Library/carta.gif" alt="A Quatro Cartas" name="Reg30" width="50" height="75"> <img src="/_Library/carta.gif" alt="A Cinco Cartas" name="Reg31" width="50" height="75"></td>
			</tr>
		</table>
</div>
</div>
		</td>
		<td bgcolor="#F94942" width="2%" align="RIGHT"><img src="../../images/cant02s.gif"></td>
		<td width="8%"></td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#F94942" width="2%" align="LEFT"><img src="../../images/cant01ii.gif"></td>
		<td bgcolor="#F94942" width="80%" align=center><span ID="Reg16" style="color:white;font-weight:bold">Aguarde .... </Span></td>
		<td bgcolor="#F94942" width="2%" align="RIGHT"><img src="../../images/cant02ii.gif"></td>
		<td width="8%"></td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#FDB4B1" width="2%" valign="BOTTOM" align="LEFT"><img src="../../images/cant03i.gif"></td>
		<td bgcolor="#FDB4B1" width="80%" align=center><br>
      <table width="590" height="170" cellspacing="0" cellpadding="0" bgcolor="#000000">
        <tr align="center" valign="middle">
          <td width="20%">
	<div ID="rotImg1" STYLE="position:RELATIVE;height:150;width:99;filter:revealTrans(Duration=4.0, Transition=12)" onClick="seltip1()">
	<img src="/_Library/carta.gif" width="99" height="150" name="Reg11" style="cursor:hand" alt="clique numa Ficha">
	<img name="image1" STYLE="POSITION:absolute;TOP:0;LEFT:0;visibility:hidden" SRC="/_Library/carta.gif" alt="NÃO Descartar carta" width="99" height="150">
	</div></td>
          <td width="20%">
	<div ID="rotImg2" STYLE="position:RELATIVE;height:150;width:99;filter:revealTrans(Duration=4.0, Transition=12)" onClick="seltip2()">
	<img src="/_Library/carta.gif" width="99" height="150" name="Reg12" style="cursor:hand" alt="clique numa Ficha">
	<img name="image2" STYLE="POSITION:absolute;TOP:0;LEFT:0;visibility:hidden" SRC="/_Library/carta.gif" alt="NÃO Descartar carta" width="99" height="150">
	</div></td>
          <td width="20%">
	<div ID="rotImg3" STYLE="position:RELATIVE;height:150;width:99;filter:revealTrans(Duration=4.0, Transition=12)" onClick="seltip3()">
	<img src="/_Library/carta.gif" width="99" height="150" name="Reg13" style="cursor:hand" alt="clique numa Ficha">
	<img name="image3" STYLE="POSITION:absolute;TOP:0;LEFT:0;visibility:hidden" SRC="/_Library/carta.gif" alt="NÃO Descartar carta" width="99" height="150">
	</div></td>
          <td width="20%">
	<div ID="rotImg4" STYLE="position:RELATIVE;height:150;width:99;filter:revealTrans(Duration=4.0, Transition=12)" onClick="seltip4()">
	<img src="/_Library/carta.gif" width="99" height="150" name="Reg14" style="cursor:hand" alt="clique numa Ficha">
	<img name="image4" STYLE="POSITION:absolute;TOP:0;LEFT:0;visibility:hidden" SRC="/_Library/carta.gif" alt="NÃO Descartar carta" width="99" height="150">
	</div></td>
          <td width="20%">
	<div ID="rotImg5" STYLE="position:RELATIVE;height:150;width:99;filter:revealTrans(Duration=4.0, Transition=12)" onClick="seltip5()">
	<img src="/_Library/carta.gif" width="99" height="150" name="Reg15" style="cursor:hand" alt="clique numa Ficha">
	<img name="image5" STYLE="POSITION:absolute;TOP:0;LEFT:0;visibility:hidden" SRC="/_Library/carta.gif" alt="NÃO Descartar carta" width="99" height="150">
	</div></td>
        </tr>
      </table><br>
		</td>
		<td bgcolor="#FDB4B1" width="2%" align="RIGHT" valign="BOTTOM"><img src="../../images/cant04i.gif"></td>
		<td width="8%" align="CENTER"><td>
	</tr>
	<tr>
		<td colspan=5 align=center width=100%><Script Language="JScript.Encode" SRC="/_Library/Defaull.js"></Script>
		<table width="610" cellspacing="0" cellpadding="0">
			<tr align="center" height="40">
				<td width="30%"><img src="/_Library/bottv.gif" width="160" height="38" onClick="StartRGPokerWeb()" name="Reg21"></td>
				<td width="40%"><img src="/_Library/botjkb.gif" width="160" height="38" alt="Regras do Jogo / Progresso" onClick="instrui()" onMouseOver="regras1()" onMouseOut="regras2()" style="cursor: help" name="Reg22"></td>
				<td width="30%"><img src="/_Library/bottv.gif" width="160" height="38" onClick="ProssRGPokerWeb()" name="Reg20"></td>
			</tr>
		</table>
		</td>
	</tr>
</table><br>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr> 
		<td>
		<p align="justify">O <b>RG Poker[1] Web</b> é um jogo individual (não se trata de jogar compra a máquina),
		em que o jogador joga o Poker tradicional americano em rodadas, também chamadas de mão. No inicio de cada
		rodada o jogador define o valor da aposta a ser feita, que pode variar de 1 a 10 Pontos, e então abre
		as primeiras 5 cartas da mão. Após isto, o jogador tem a opção de troca das cartas, que podem ser de nenhuma
		(caso o <b>&quot;JOGO&quot;</b> já sai de primeira) a até todas, para com isto formar seu
		<b>&quot;JOGO&quot;</b>, e definir a mão. Só é permitida uma <b>troca de carta(s)</b> na rodada, desta forma,
		a seleção de cartas indesejadas a descartar, deve ser feita em uma unica etapa. - Isto é tudo. Boa Sorte, OK!.
		Se tiver alguma sugestão ou crítica sobre o Jogo, envie-nos um e-mail para:
		<a href="mailto:rg30@bol.com.br">rg30@bol.com.br</a></p>
		</td>
	</tr>
</table>
<embed src="/_Library/rgcerto.wav" loop="false" autostart="true" hidden="true" width="0" height="0">
<embed name="sominici" src="/_Library/rgcerto.wav" loop="false" autostart="false" hidden="true" width="0" height="0">
<embed name="somcapit" src="/_Library/rgerror.wav" loop="false" autostart="false" hidden="true" width="0" height="0">
<embed name="somsorte" src="/_Library/rgrodar.wav" loop="false" autostart="false" hidden="true" width="0" height="0">
<embed name="somregis" src="/_Library/rgcaixa.wav" loop="false" autostart="false" hidden="true" width="0" height="0">
</BODY></HTML>
