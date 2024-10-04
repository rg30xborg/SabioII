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
</Script><Script Language="JScript" src="../../images/Simpl1.js"></Script>
<HTML><HEAD><TITLE>RG 3.0 - Sabichão Web</TITLE>
<style>@import url(../../images/coUC.css);</style>
</HEAD><body bgcolor=#FFFFFF scroll="auto" onLoad="Aviso2()">
<p style="font-size: 10pt">
	Sala de Apostas: <font color="#0588C0"><b>JOKEY CLUB</font><Span ID="NCalc"> - Criando Ambiente ...</Span></b>
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
		<table width="590" height="50" cellspacing="0" cellpadding="0" style="font-size: 10pt; color: yellow">
			<tr align="center" valign="middle">
				<td width="80"><b>&gt;<br>Partida</b></td>
				<td width="55"><img name="Reg01" STYLE="visibility:hidden" src="/_Library/ficha1.gif" onClick="selBet1(1)"></td>
				<td width="55"><img name="Reg01" STYLE="visibility:hidden" src="/_Library/ficha2.gif" onClick="selBet1(2)"></td>
				<td width="55"><img name="Reg01" STYLE="visibility:hidden" src="/_Library/ficha3.gif" onClick="selBet1(3)"></td>
				<td width="100"><div style="position: relative"><img name="Reg00" STYLE="visibility:hidden" SRC="/_Library/Rolsorte.gif" width="70" height="50"><img name="Reg39" STYLE="POSITION:absolute;TOP:13;LEFT:31" SRC="/_Library/ficha1.gif" onClick="addProsp()"></div></td>
				<td width="55"><img name="Reg01" STYLE="visibility:hidden" src="/_Library/ficha4.gif" onClick="selBet1(4)"></td>
				<td width="55"><img name="Reg01" STYLE="visibility:hidden" src="/_Library/ficha5.gif" onClick="selBet1(5)"></td>
				<td width="55"><img name="Reg01" STYLE="visibility:hidden" src="/_Library/ficha6.gif" onClick="selBet1(10)"></td>
				<td width="80"><b>&gt;<br>Chegada</b></td>
			</tr>
		</table>
		</td>
		<td bgcolor="#F94942" width="2%" align="RIGHT"><img src="../../images/cant02s.gif"></td>
		<td width="8%"></td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#F94942" width="2%" align="LEFT"><img src="../../images/cant01ii.gif"></td>
		<td bgcolor="#F94942" width="80%" align=center>
		<span ID="Reg16" style="color:white;font-weight:bold">Aguarde .... </Span>
		</td>
		<td bgcolor="#F94942" width="2%" align="RIGHT"><img src="../../images/cant02ii.gif"></td>
		<td width="8%"></td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#FDB4B1" width="2%" valign="BOTTOM" align="LEFT"><img src="../../images/cant03i.gif"></td>
		<td bgcolor="#FDB4B1" width="80%" align=center><br>
		<table width="590" height="195" cellspacing="0" cellpadding="0">
			<tr>
				<td>
<DIV STYLE="position:relative;top:0;left:  0;width:590;height:195;background:#000000"><img STYLE="position:absolute;top:3;left:  0;width:590;height: 22;visibility:hidden" name="Reg30" src="/_Library/Jok02.gif"><DIV STYLE="position:absolute;top:0;left:557;width:  1;height:195;background:#FFFFFF"></DIV><DIV STYLE="position:absolute;top:0;left:590;width:  1;height:195;background:#FFFFFF"></DIV>
<input onFocus="selCav1('Vermelho')" type=text name="Bet0" SIZE=3 readonly STYLE="position:absolute;top:  3;left:0;width:31;height:22;background:#FF0000"><DIV ID="Cav01" STYLE="position:absolute;top:  3;left:33;width:31;height:22;background:#FF0000"><img name="Reg31" src="/_Library/Jok00.gif" onClick="selCav1('Vermelho')"></DIV>
<input onFocus="selCav1('Verde')"    type=text name="Bet0" SIZE=3 readonly STYLE="position:absolute;top: 27;left:0;width:31;height:22;background:#00FF00"><DIV ID="Cav02" STYLE="position:absolute;top: 27;left:33;width:31;height:22;background:#00FF00"><img name="Reg32" src="/_Library/Jok00.gif" onClick="selCav1('Verde')"></DIV>
<input onFocus="selCav1('Azul')"     type=text name="Bet0" SIZE=3 readonly STYLE="position:absolute;top: 51;left:0;width:31;height:22;background:#0000FF"><DIV ID="Cav03" STYLE="position:absolute;top: 51;left:33;width:31;height:22;background:#0000FF"><img name="Reg33" src="/_Library/Jok00.gif" onClick="selCav1('Azul')"></DIV>
<input onFocus="selCav1('Amarelo')"  type=text name="Bet0" SIZE=3 readonly STYLE="position:absolute;top: 76;left:0;width:31;height:22;background:#FFF000"><DIV ID="Cav04" STYLE="position:absolute;top: 76;left:33;width:31;height:22;background:#FFF000"><img name="Reg34" src="/_Library/Jok00.gif" onClick="selCav1('Amarelo')"></DIV>
<input onFocus="selCav1('Magenta')"  type=text name="Bet0" SIZE=3 readonly STYLE="position:absolute;top:100;left:0;width:31;height:22;background:#FF00FF"><DIV ID="Cav05" STYLE="position:absolute;top:100;left:33;width:31;height:22;background:#FF00FF"><img name="Reg35" src="/_Library/Jok00.gif" onClick="selCav1('Magenta')"></DIV>
<input onFocus="selCav1('Ciano')"    type=text name="Bet0" SIZE=3 readonly STYLE="position:absolute;top:124;left:0;width:31;height:22;background:#00FFFF"><DIV ID="Cav06" STYLE="position:absolute;top:124;left:33;width:31;height:22;background:#00FFFF"><img name="Reg36" src="/_Library/Jok00.gif" onClick="selCav1('Ciano')"></DIV>
<input onFocus="selCav1('Salmon')"   type=text name="Bet0" SIZE=3 readonly STYLE="position:absolute;top:148;left:0;width:31;height:22;background:#FA8072"><DIV ID="Cav07" STYLE="position:absolute;top:148;left:33;width:31;height:22;background:#FA8072"><img name="Reg37" src="/_Library/Jok00.gif" onClick="selCav1('Salmon')"></DIV>
<input onFocus="selCav1('Laranja')"  type=text name="Bet0" SIZE=3 readonly STYLE="position:absolute;top:172;left:0;width:31;height:22;background:#FFA500"><DIV ID="Cav08" STYLE="position:absolute;top:172;left:33;width:31;height:22;background:#FFA500"><img name="Reg38" src="/_Library/Jok00.gif" onClick="selCav1('Laranja')"></DIV>
</DIV>
				</td>
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
				<td width="30%"><img src="/_Library/bottv.gif" width="160" height="38" onClick="startCor1()" name="Reg21"></td>
				<td width="40%"><img src="/_Library/botjkb.gif" width="160" height="38" alt="Regras do Jogo / Progresso" onClick="instrui()" onMouseOver="regras1()" onMouseOut="regras2()" style="cursor: help" name="Reg22"></td>
				<td width="30%"><img src="/_Library/bottv.gif" width="160" height="38" onClick="ajustIni()" name="Reg20"></td>
			</tr>
		</table>
		</td>
	</tr>
</table><br>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr> 
		<td>
		<p align="justify">O <b>RG Jokey[1] Web</b> é um jogo individual, em que o jogador define sua <b>"Pule"</b> no
		Cavalo Vencedor do Páreo - Para liberar as apostas é necessário adquirir o "Prognóstico do Páreo" com as
		chances de cada Cavalo, isto é feito com um clique simples na ficha central. A pule na rodada é definida em
		duas etapas: 1 - Definir o valor da aposta, com um clique simples em qualquer das fichas disponíveis de 1 a 10.
		2 - Escolhendo o Cavalo para Vencedor do Páreo, também com um clique simples em qualquer um dois oito
		cavalos da rodada. Após definada a Pule, clica-se no Botão [Rodar Roleta], para dar a largada e obter o
		"Resultado do Páreo". - Isto é tudo. Boa Sorte, OK!. Se tiver alguma sugestão ou crítica sobre o Jogo,
		envie-nos um e-mail para: <a href="mailto:rg30@bol.com.br">rg30@bol.com.br</a></p>
		</td>
	</tr>
</table>
<embed src="/_Library/rgcerto.wav" loop="false" autostart="true" hidden="true" width="0" height="0"></embed>
<embed name="sominici" src="/_Library/rgcerto.wav" loop="false" autostart="false" hidden="true" width="0" height="0"></embed>
<embed name="somcapit" src="/_Library/rgerror.wav" loop="false" autostart="false" hidden="true" width="0" height="0"></embed>
<embed name="somrolar" src="/_Library/rgrolar.wav" loop="true" autostart="false" hidden="true" width="0" height="0"></embed>
<embed name="somregis" src="/_Library/rgcaixa.wav" loop="false" autostart="false" hidden="true" width="0" height="0"></embed>
</BODY></HTML>
