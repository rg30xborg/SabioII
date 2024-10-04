<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sabio02.aspx.cs" Inherits="Sabio._1.sorte.tema1.Sabio02" %>
<%@ Import Namespace="System.Web.Script.Serialization" %>

<!DOCTYPE html>

<script language="JScript">
<!--//
    var cred = <%=LibOk%>, pSala = <%=LibSl%>
//-->
</script><HTML><HEAD><TITLE>RG 3.0 - Sabichão Web</TITLE>
<style>@import url(../../images/coUC.css);</style>
</HEAD><body bgcolor=#FFFFFF scroll="auto">   <%--onLoad="Aviso2()"--%>
<p style="font-size: 10pt">
	Sala de Apostas: <font color="#0588C0"><b>JOKEY CLUB</font><Span id="NCalc"> - Criando Ambiente ...</Span></b>
	<span style="font-size: 8pt"><br>
	 - Pontos nos Jogos: <font color="#0000FF"><span id="Reg18"><%=LibSl%></span> pontos</font>
	 - Resultados: <font color="#0000FF"><span id="Reg17">Iniciando...</span></font>
	</span>
</p>

<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#4444FF" width="2%" align="LEFT"><img src="../../images/cant01s.gif" /></td>
		<td bgcolor="#4444FF" width="80%" align=center><br>
		<table width="590" height="50" cellspacing="0" cellpadding="0" style="font-size: 10pt; color: yellow">
			<tr align="center" valign="middle">
				<td width="80"><b>&gt;<br>Partida</b></td>
				<td width="55"><img id="Reg01" name="Reg01" STYLE="visibility:hidden" src="/_Library/ficha1.gif" onClick="selBet1(1)"></td>
				<td width="55"><img id="Reg01" name="Reg01" STYLE="visibility:hidden" src="/_Library/ficha2.gif" onClick="selBet1(2)"></td>
				<td width="55"><img id="Reg01" name="Reg01" STYLE="visibility:hidden" src="/_Library/ficha3.gif" onClick="selBet1(3)"></td>
				<td width="100"><div style="position: relative"><img id="Reg00" name="Reg00" STYLE="visibility:hidden" SRC="/_Library/Rolsorte.gif" width="70" height="50" /><img src="/_Library/ficha00.gif" style="position:absolute;top:13px;left:31px;cursor:help" alt="Regras do Jogo / Progresso" onClick="instrui()" onMouseOver="regras1()" onMouseOut="regras2()" id="Reg39" name="Reg39" /></div></td>
				<td width="55"><img id="Reg01" name="Reg01" STYLE="visibility:hidden" src="/_Library/ficha4.gif" onClick="selBet1(4)"></td>
				<td width="55"><img id="Reg01" name="Reg01" STYLE="visibility:hidden" src="/_Library/ficha5.gif" onClick="selBet1(5)"></td>
				<td width="55"><img id="Reg01" name="Reg01" STYLE="visibility:hidden" src="/_Library/ficha6.gif" onClick="selBet1(10)"></td>
				<td width="80"><b>&gt;<br>Chegada</b></td>
			</tr>
		</table>
		</td>
		<td bgcolor="#4444FF" width="2%" align="RIGHT"><img src="../../images/cant02s.gif" /></td>
		<td width="8%"></td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#4444FF" width="2%" align="LEFT"><img src="../../images/cant01ii.gif" /></td>
		<td bgcolor="#4444FF" width="80%" align=center>
		<span id="Reg16" style="color:white;font-weight:bold">Aguarde .... </Span>
		</td>
		<td bgcolor="#4444FF" width="2%" align="RIGHT"><img src="../../images/cant02ii.gif" /></td>
		<td width="8%"></td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#7FCCFF" width="2%" valign="BOTTOM" align="LEFT"><img src="../../images/cant03i.gif" /></td>
		<td bgcolor="#7FCCFF" width="80%" align=center><br>
		<table width="590" height="195" cellspacing="0" cellpadding="0" boder="0">
			<tr>
				<td>
<DIV STYLE="position:relative;top:0;left:0;width:590px;height:195px;background:#000000"><img STYLE="position:absolute;top:3px;left:0;width:590px;height:22px;visibility:hidden" id="Reg30" name="Reg30" src="/_Library/Jok02.gif" /><DIV STYLE="position:absolute;top:0;left:557px;width:1px;height:195px;background:#FFFFFF"></DIV><DIV STYLE="position:absolute;top:0;left:590px;width:1px;height:195px;background:#FFFFFF"></DIV>
<input onFocus="selCav1('Vermelho')" type=text id="Bet0" name="Bet0" SIZE="3" readonly STYLE="position:absolute;top:  3px;left:0;width:31px;height:22px;background:#FF0000"><DIV id="Cav01" STYLE="position:absolute;top:  3px;left:33px;width:31px;height:22px;background:#FF0000"><img name="Reg31" src="/_Library/Jok00.gif" onClick="selCav1('Vermelho')"></DIV>
<input onFocus="selCav1('Verde')"    type=text id="Bet0" name="Bet0" SIZE="3" readonly STYLE="position:absolute;top: 27px;left:0;width:31px;height:22px;background:#00FF00"><DIV id="Cav02" STYLE="position:absolute;top: 27px;left:33px;width:31px;height:22px;background:#00FF00"><img name="Reg32" src="/_Library/Jok00.gif" onClick="selCav1('Verde')"></DIV>
<input onFocus="selCav1('Azul')"     type=text id="Bet0" name="Bet0" SIZE="3" readonly STYLE="position:absolute;top: 51px;left:0;width:31px;height:22px;background:#0000FF"><DIV id="Cav03" STYLE="position:absolute;top: 51px;left:33px;width:31px;height:22px;background:#0000FF"><img name="Reg33" src="/_Library/Jok00.gif" onClick="selCav1('Azul')"></DIV>
<input onFocus="selCav1('Amarelo')"  type=text id="Bet0" name="Bet0" SIZE="3" readonly STYLE="position:absolute;top: 76px;left:0;width:31px;height:22px;background:#FFF000"><DIV id="Cav04" STYLE="position:absolute;top: 76px;left:33px;width:31px;height:22px;background:#FFF000"><img name="Reg34" src="/_Library/Jok00.gif" onClick="selCav1('Amarelo')"></DIV>
<input onFocus="selCav1('Magenta')"  type=text id="Bet0" name="Bet0" SIZE="3" readonly STYLE="position:absolute;top:100px;left:0;width:31px;height:22px;background:#FF00FF"><DIV id="Cav05" STYLE="position:absolute;top:100px;left:33px;width:31px;height:22px;background:#FF00FF"><img name="Reg35" src="/_Library/Jok00.gif" onClick="selCav1('Magenta')"></DIV>
<input onFocus="selCav1('Ciano')"    type=text id="Bet0" name="Bet0" SIZE="3" readonly STYLE="position:absolute;top:124px;left:0;width:31px;height:22px;background:#00FFFF"><DIV id="Cav06" STYLE="position:absolute;top:124px;left:33px;width:31px;height:22px;background:#00FFFF"><img name="Reg36" src="/_Library/Jok00.gif" onClick="selCav1('Ciano')"></DIV>
<input onFocus="selCav1('Salmon')"   type=text id="Bet0" name="Bet0" SIZE="3" readonly STYLE="position:absolute;top:148px;left:0;width:31px;height:22px;background:#FA8072"><DIV id="Cav07" STYLE="position:absolute;top:148px;left:33px;width:31px;height:22px;background:#FA8072"><img name="Reg37" src="/_Library/Jok00.gif" onClick="selCav1('Salmon')"></DIV>
<input onFocus="selCav1('Laranja')"  type=text id="Bet0" name="Bet0" SIZE="3" readonly STYLE="position:absolute;top:172px;left:0;width:31px;height:22px;background:#FFA500"><DIV id="Cav08" STYLE="position:absolute;top:172px;left:33px;width:31px;height:22px;background:#FFA500"><img name="Reg38" src="/_Library/Jok00.gif" onClick="selCav1('Laranja')"></DIV>
</DIV>
				</td>
			</tr>
		</table><br>
		</td>
		<td bgcolor="#7FCCFF" width="2%" align="RIGHT" valign="BOTTOM"><img src="../../images/cant04i.gif" /></td>
		<td width="8%" align="CENTER"><td>
	</tr>
	<tr>
		<td colspan=5 align=center width=100%>
<form id="Sala" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableCdn="True"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" EnableViewState="False">
        <contenttemplate>
		<table width="610" cellspacing="0" cellpadding="0">
			<tr align="center" height="40"><br />
				<td width="30%"><asp:ImageButton Width="160" Height="38" ID="Reg21" style="visibility:hidden" runat="server" ImageUrl="/_Library/botrr.gif" OnClientClick="return startCor1()" OnClick="Reg21_Click" /></td>
				<td width="40%"><asp:ImageButton width="160" height="38" ID="Reg22" style="visibility:visible" runat="server" ImageUrl="/_Library/botpg.gif" OnClientClick="return addProsp()" OnClick="Reg22_Click" /></td>
				<td width="30%"><asp:ImageButton width="160" height="38" ID="Reg20" style="visibility:hidden" runat="server" ImageUrl="/_Library/botlt.gif" OnClientClick="return ajustIni()" OnClick="Reg20_Click" /></td>
			</tr>
		</table>
        <script type="text/javascript">
            var OqueFaz = 0;
        
            window.onload = function () {
                DisplayCurrentTime();
            };
        
            //On UpdatePanel Refresh
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            if (prm != null) {
                prm.add_endRequest(function (sender, e) {
                    if (sender._postBackSettings.panelsToUpdate != null) {
                        DisplayCurrentTime();
                    }
                });
            };
        
            function DisplayCurrentTime() {
                if (OqueFaz == 0) { OqueFaz++; Aviso2(); Reg22.src="/_Library/botpt.gif"; }
                if (OqueFaz == 2) { OqueFaz++; Reg22.style.visibility = ""; 
                    cox = <%= new JavaScriptSerializer().Serialize(@co) %>;
                    cox[0] = document.getElementById("HFco0").value;
                    cox[1] = document.getElementById("HFco1").value;
                    cox[2] = document.getElementById("HFco2").value;
                    //cox[3] = document.getElementById("HFco3").value;
                    //cox[4] = document.getElementById("HFco4").value;
                    //cox[5] = document.getElementById("HFco5").value;
                    //cox[6] = document.getElementById("HFco6").value;
                    Reg22.style.visibility = "hidden"; addProspR(cox); 
                    document.getElementById("HFPCert").value = "1";
                }
                if (OqueFaz == 4) { OqueFaz++; Reg22.style.visibility = ""; 
                    coy = <%= new JavaScriptSerializer().Serialize(@cu) %>;
                    coy[0] = document.getElementById("HFco0").value;
                    coy[1] = document.getElementById("HFco1").value;
                    coy[2] = document.getElementById("HFco2").value;
                    //coy[3] = document.getElementById("HFco3").value;
                    //coy[4] = document.getElementById("HFco4").value;
                    //coy[5] = document.getElementById("HFco5").value;
                    //coy[6] = document.getElementById("HFco6").value;
                    Reg22.style.visibility = "hidden"; myBackCart(coy);
                }
                if (OqueFaz == 6) { OqueFaz++; Reg22.style.visibility = ""; 
                    coy = <%= new JavaScriptSerializer().Serialize(@cu) %>;
                    coy[0] = document.getElementById("HFco0").value;
                    coy[1] = document.getElementById("HFco1").value;
                    coy[2] = document.getElementById("HFco2").value;
                    Reg22.style.visibility = "hidden"; ajustIniR();
                    document.getElementById("HFPCert").value = "3";
                }
            };
        </script>
        <script language="JScript" src="../../scripts/Simpl1.js"></script>
        <asp:HiddenField ID="HFPCert" runat="server" Value="0" />
        <asp:HiddenField ID="HFApost" runat="server" Value="a" />
        <asp:HiddenField ID="HFco0" runat="server" Value="ZERO" />
        <asp:HiddenField ID="HFco1" runat="server" Value="ZERO" />
        <asp:HiddenField ID="HFco2" runat="server" Value="ZERO" />
        <asp:HiddenField ID="HFco3" runat="server" Value="ZERO" />
        <asp:HiddenField ID="HFco4" runat="server" Value="ZERO" />
        <asp:HiddenField ID="HFco5" runat="server" Value="ZERO" />
        <asp:HiddenField ID="HFco6" runat="server" Value="ZERO" />
        </contenttemplate>
    </asp:UpdatePanel>
</form>
		</td>
	</tr>
</table>
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
<audio id="somcerto" name="somcerto" autoplay><source src="/_Library/rgcerto.wav"></audio>
<audio id="sominici" name="somerro"><source src="/_Library/rgcerto.wav"></audio>
<audio id="somcapit" name="somsorte"><source src="/_Library/rgerror.wav"></audio>
<audio id="somrolar" name="somclick" loop><source src="/_Library/rgrolar.wav"></audio>
<audio id="somregis" name="somregis"><source src="/_Library/rgcaixa.wav"></audio>

</BODY></HTML>
