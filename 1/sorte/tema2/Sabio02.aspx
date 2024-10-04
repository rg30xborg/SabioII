<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sabio02.aspx.cs" Inherits="Sabio._1.sorte.tema2.Sabio02" %>
<%@ Import Namespace="System.Web.Script.Serialization" %>

<!DOCTYPE html>

<script language="JScript">
<!--//
	var cred = <%=LibOk%>, pSala = <%=LibSl%>
//-->
</script><HTML><HEAD><TITLE>RG 3.0 - Sabichão Web</TITLE>
<style>@import url(../../images/coUC.css);</style>
</HEAD><body bgcolor=#FFFFFF scroll="auto" onLoad="Aviso2()">
<p style="font-size: 10pt">
	Sala de Apostas: <font color="#0588C0"><b>VidEO POKER I</font><Span id="NCalc"> - Criando Ambiente ...</Span></b>
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
<div style="POSITION:relative;width:100%">
		<table width="590" height="75" cellspacing="0" cellpadding="0" style="font-size: 10pt; color: yellow">
			<tr align="center" valign="middle">
				<td width="80"><b>Banca de</b></td>
				<td width="55"><img id="Reg01" name="Reg01" src="/_Library/ficha1.gif" onClick="selBet1(1)"></td>
				<td width="55"><img id="Reg01" name="Reg01" src="/_Library/ficha2.gif" onClick="selBet1(2)"></td>
				<td width="55"><img id="Reg01" name="Reg01" src="/_Library/ficha3.gif" onClick="selBet1(3)"></td>
				<td width="100"><img src="/_Library/ficha00.gif" title="Regras do Jogo / Progresso" onClick="instrui()" onMouseOver="regras1()" onMouseOut="regras2()"  style="cursor:help" id="Reg00" name="Reg00" /></td>
				<td width="55"><img id="Reg01" name="Reg01" src="/_Library/ficha4.gif" onClick="selBet1(4)"></td>
				<td width="55"><img id="Reg01" name="Reg01" src="/_Library/ficha5.gif" onClick="selBet1(5)"></td>
				<td width="55"><img id="Reg01" name="Reg01" src="/_Library/ficha6.gif" onClick="selBet1(10)"></td>
				<td width="80"><b>Apostas</b></td>
			</tr>
		</table>
<div id="Reg19" style="POSITION:absolute;TOP:0;LEFT:0;width:100%;background:#4444FF;visibility:hidden">
		<table width="590" height="75" cellspacing="0" cellpadding="0" style="font-size: 10pt; color: yellow">
			<tr align="center" valign="middle">
				<td width="10%">
				<img src="/_Library/botmv.gif" width="30" height="30" title="Carta maior que 7" id="Reg25" name="Reg25" onClick="nDob='&gt;'; Reg21a.click();" /><br><b>7</b><br>
				<img src="/_Library/botmv.gif" width="30" height="30" title="Carta menor que 7" id="Reg24" name="Reg24" onClick="nDob='&lt;'; Reg21a.click();" /></td>
				<td width="20%">
				<img src="/_Library/acima.gif" width="20" height="19" title="Avança Naipe" onClick="adinai()" /><br>
				<img src="/_Library/esque.gif" width="19" height="30" title="Diminue Número" onClick="subnum()" />
				<img src="/_Library/botcv.gif" width="50" height="30" name="Reg26" title="Dobra Cheia" onClick="Reg21b.click();" />
				<img src="/_Library/direi.gif" width="19" height="30" title="Aumenta Número" onClick="adinum()" /><br>
				<img src="/_Library/abaix.gif" width="20" height="19" title="Retorna Naipe" onClick="subnai()" /></td>
				<td width="20%"><img src="/_Library/01o.gif" width="50" height="75" title="Carta-Palpite (Regras)" id="f6" name="f6" onClick="infodobr()" /></td>
				<td width="50%"><img src="/_Library/carta.gif" title="Última Carta" id="Reg27" name="Reg27" width="50" height="75"> <img src="/_Library/carta.gif" title="A Duas Cartas" id="Reg28" name="Reg28" width="50" height="75" /> <img src="/_Library/carta.gif" title="A Tres Cartas" id="Reg29" name="Reg29" width="50" height="75" /> <img src="/_Library/carta.gif" title="A Quatro Cartas" id="Reg30" name="Reg30" width="50" height="75" /> <img src="/_Library/carta.gif" title="A Cinco Cartas" id="Reg31" name="Reg31" width="50" height="75" /></td>
			</tr>
		</table>
</div>
</div>
		</td>
		<td bgcolor="#4444FF" width="2%" align="RIGHT"><img src="../../images/cant02s.gif" /></td>
		<td width="8%"></td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#4444FF" width="2%" align="LEFT"><img src="../../images/cant01ii.gif" /></td>
		<td bgcolor="#4444FF" width="80%" align=center><br /><span id="Reg16" style="color:white;font-weight:bold">Aguarde .... </Span></td>
		<td bgcolor="#4444FF" width="2%" align="RIGHT"><img src="../../images/cant02ii.gif" /></td>
		<td width="8%"></td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#7FCCFF" width="2%" valign="BOTTOM" align="LEFT"><img src="../../images/cant03i.gif" /></td>
		<td bgcolor="#7FCCFF" width="80%" align=center><br>
      <table width="590" height="170" cellspacing="0" cellpadding="0" bgcolor="#000000">
        <tr align="center" valign="middle">
          <td width="20%">
	<div id="rotImg1" STYLE="position:RELATIVE;height:150px;width:99px;filter:revealTrans(Duration=4.0, Transition=12)" onClick="seltip1()">
	<img src="/_Library/carta.gif" width="99" height="150" id="Reg11" name="Reg11" style="cursor:pointer" title="clique numa Ficha">
	<img id="image1" name="image1" STYLE="POSITION:absolute;TOP:0;LEFT:0;visibility:hidden" SRC="/_Library/carta.gif" title="NÃO Descartar carta" width="99" height="150">
	</div></td>
          <td width="20%">
	<div id="rotImg2" STYLE="position:RELATIVE;height:150px;width:99px;filter:revealTrans(Duration=4.0, Transition=12)" onClick="seltip2()">
	<img src="/_Library/carta.gif" width="99" height="150" id="Reg12" name="Reg12" style="cursor:pointer" title="clique numa Ficha">
	<img id="image2" name="image2" STYLE="POSITION:absolute;TOP:0;LEFT:0;visibility:hidden" SRC="/_Library/carta.gif" title="NÃO Descartar carta" width="99" height="150">
	</div></td>
          <td width="20%">
	<div id="rotImg3" STYLE="position:RELATIVE;height:150px;width:99px;filter:revealTrans(Duration=4.0, Transition=12)" onClick="seltip3()">
	<img src="/_Library/carta.gif" width="99" height="150" id="Reg13" name="Reg13" style="cursor:pointer" title="clique numa Ficha">
	<img id="image3" name="image3" STYLE="POSITION:absolute;TOP:0;LEFT:0;visibility:hidden" SRC="/_Library/carta.gif" title="NÃO Descartar carta" width="99" height="150">
	</div></td>
          <td width="20%">
	<div id="rotImg4" STYLE="position:RELATIVE;height:150px;width:99px;filter:revealTrans(Duration=4.0, Transition=12)" onClick="seltip4()">
	<img src="/_Library/carta.gif" width="99" height="150" id="Reg14" name="Reg14" style="cursor:pointer" title="clique numa Ficha">
	<img id="image4" name="image4" STYLE="POSITION:absolute;TOP:0;LEFT:0;visibility:hidden" SRC="/_Library/carta.gif" title="NÃO Descartar carta" width="99" height="150">
	</div></td>
          <td width="20%">
	<div id="rotImg5" STYLE="position:RELATIVE;height:150px;width:99px;filter:revealTrans(Duration=4.0, Transition=12)" onClick="seltip5()">
	<img src="/_Library/carta.gif" width="99" height="150" id="Reg15" name="Reg15" style="cursor:pointer" title="clique numa Ficha">
	<img id="image5" name="image5" STYLE="POSITION:absolute;TOP:0;LEFT:0;visibility:hidden" SRC="/_Library/carta.gif" title="NÃO Descartar carta" width="99" height="150">
	</div></td>
        </tr>
      </table><br>
		</td>
		<td bgcolor="#7FCCFF" width="2%" align="RIGHT" valign="BOTTOM"><img src="../../images/cant04i.gif" /></td>
		<td width="8%" align="CENTER"><td>
	</tr>
	<tr>
		<td colspan=5 align=center width=100%><br>
<form id="SalaMax" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableCdn="True"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" EnableViewState="False">
        <contenttemplate>
        <asp:ImageButton ID="Reg21a" runat="server" width="0" Height="0" OnClick="Reg21a_Click" OnClientClick="return dobram1()"/>
        <asp:ImageButton ID="Reg21b" runat="server" width="0" Height="0" OnClick="Reg21a_Click" OnClientClick="return dobram2()"/>
		<table width="610" cellspacing="0" cellpadding="0">
			<tr align="center" height="40">
				<td width="30%"><asp:ImageButton ID="Reg21" style="visibility:hidden" ImageUrl="/_Library/botcr.gif" runat="server" width="160" height="38" OnClientClick="return StartRGPokerWeb1()"  OnClick="Reg21_Click" /></td>
				<td width="40%"><img id="Reg22" name="Reg22" SRC="/_Library/botpg.gif" width="160" height="38"></td>
				<td width="30%"><asp:ImageButton ID="Reg20" style="visibility:hidden" ImageUrl="/_Library/botmt.gif" runat="server" width="160" height="38" OnClientClick="return ProssRGPokerWeb1()"  OnClick="Reg20_Click" /></td>
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
                if (OqueFaz == 0) { OqueFaz++; Aviso2(); Reg22.style.visibility = "hidden"; }
                if (OqueFaz == 2) { OqueFaz++;          //Reg22.style.visibility = ""; 
                    cox = <%= new JavaScriptSerializer().Serialize(@co) %>;
                    cox[0] = document.getElementById("HFco0").value;
                    cox[1] = document.getElementById("HFco1").value;
                    cox[2] = document.getElementById("HFco2").value;
                    cox[3] = document.getElementById("HFco3").value;
                    cox[4] = document.getElementById("HFco4").value;
                    cox[5] = document.getElementById("HFco5").value;
                    cox[6] = document.getElementById("HFco6").value;
                    cox[7] = document.getElementById("HFco7").value;
                    cox[8] = document.getElementById("HFco8").value;
                                                        //Reg22.style.visibility = "hidden";
                    myBackCart1(cox);
                    document.getElementById("HFPCert").value = "1";
                }
                if (OqueFaz == 4) {
                    OqueFaz++;                          //Reg22.style.visibility = "";
                    coy = <%= new JavaScriptSerializer().Serialize(@co) %>;
                    coy[0] = document.getElementById("HFco0").value;
                    coy[1] = document.getElementById("HFco1").value;
                    coy[2] = document.getElementById("HFco2").value;
                    coy[3] = document.getElementById("HFco3").value;
                    coy[4] = document.getElementById("HFco4").value;
                    coy[5] = document.getElementById("HFco5").value;
                    coy[6] = document.getElementById("HFco6").value;
                    coy[7] = document.getElementById("HFco7").value;
                    coy[8] = document.getElementById("HFco8").value;
                                                        //Reg22.style.visibility = "hidden";
                    mySecondBack1(coy);
                    document.getElementById("HFPCert").value = "0";
                }
                if (OqueFaz == 6) { OqueFaz++;          //Reg22.style.visibility = ""; 
                    coy = <%= new JavaScriptSerializer().Serialize(@co) %>;
                    coy[0] = document.getElementById("HFco0").value;
                    coy[1] = document.getElementById("HFco1").value;
                    coy[2] = document.getElementById("HFco2").value;
                    coy[3] = document.getElementById("HFco3").value;
                    coy[4] = document.getElementById("HFco4").value;
                    coy[5] = document.getElementById("HFco5").value;
                    coy[6] = document.getElementById("HFco6").value;
                    coy[7] = document.getElementById("HFco7").value;
                    coy[8] = document.getElementById("HFco8").value;
                    coy[9] = document.getElementById("HFco9").value;
                                                        //Reg22.style.visibility = "hidden";
                    myThirdBack1(coy);
                    document.getElementById("HFPCert").value = "0";
                }
                if (OqueFaz == 8) { OqueFaz++;          //Reg22.style.visibility = ""; 
                    coy = <%= new JavaScriptSerializer().Serialize(@co) %>;
                    coy[0] = document.getElementById("HFco0").value;
                    coy[1] = document.getElementById("HFco1").value;
                    coy[2] = document.getElementById("HFco2").value;
                    coy[3] = document.getElementById("HFco3").value;
                    coy[4] = document.getElementById("HFco4").value;
                    coy[5] = document.getElementById("HFco5").value;
                    coy[6] = document.getElementById("HFco6").value;
                    coy[7] = document.getElementById("HFco7").value;
                    coy[8] = document.getElementById("HFco8").value;
                    coy[9] = document.getElementById("HFco9").value;
                                                        //Reg22.style.visibility = "hidden";
                    myFourthBack1(coy);
                    document.getElementById("HFPCert").value = "0";
                }
                if (OqueFaz == 10) { OqueFaz++;          //Reg22.style.visibility = ""; 
                    coy = <%= new JavaScriptSerializer().Serialize(@co) %>;
                    coy[0] = document.getElementById("HFco0").value;
                    coy[1] = document.getElementById("HFco1").value;
                    coy[2] = document.getElementById("HFco2").value;
                    coy[3] = document.getElementById("HFco3").value;
                    coy[4] = document.getElementById("HFco4").value;
                    coy[5] = document.getElementById("HFco5").value;
                    coy[6] = document.getElementById("HFco6").value;
                    coy[7] = document.getElementById("HFco7").value;
                    coy[8] = document.getElementById("HFco8").value;
                    coy[9] = document.getElementById("HFco9").value;
                                                        //Reg22.style.visibility = "hidden";
                    myFifthBack1(coy);
                    document.getElementById("HFPCert").value = "0";
                }
                if (OqueFaz == 12) { OqueFaz++;          //Reg22.style.visibility = ""; 
                    coy = <%= new JavaScriptSerializer().Serialize(@co) %>;
                    coy[0] = document.getElementById("HFco0").value;
                    coy[1] = document.getElementById("HFco1").value;
                    coy[2] = document.getElementById("HFco2").value;
                    coy[3] = document.getElementById("HFco3").value;
                    coy[4] = document.getElementById("HFco4").value;
                    coy[5] = document.getElementById("HFco5").value;
                    coy[6] = document.getElementById("HFco6").value;
                    coy[7] = document.getElementById("HFco7").value;
                    coy[8] = document.getElementById("HFco8").value;
                    coy[9] = document.getElementById("HFco9").value;
                                                        //Reg22.style.visibility = "hidden";
                    mySixthBack1(coy);
                    document.getElementById("HFPCert").value = "0";
                }
                if (OqueFaz == 14) { OqueFaz++;          //Reg22.style.visibility = ""; 
                    coy = <%= new JavaScriptSerializer().Serialize(@co) %>;
                    coy[0] = document.getElementById("HFco0").value;
                    coy[1] = document.getElementById("HFco1").value;
                    coy[2] = document.getElementById("HFco2").value;
                    coy[3] = document.getElementById("HFco3").value;
                    coy[4] = document.getElementById("HFco4").value;
                    coy[5] = document.getElementById("HFco5").value;
                    coy[6] = document.getElementById("HFco6").value;
                    coy[7] = document.getElementById("HFco7").value;
                    coy[8] = document.getElementById("HFco8").value;
                    coy[9] = document.getElementById("HFco9").value;
                                                        //Reg22.style.visibility = "hidden";
                    mySeventhBack1(coy);
                    document.getElementById("HFPCert").value = "0";
                }
            };
            </script>
            <script language="JScript" src="../../scripts/Simpl2.js"></script>
            <asp:HiddenField ID="HFPCert" runat="server" Value="0" />
            <asp:HiddenField ID="HFApost" runat="server" Value="a" />
            <asp:HiddenField ID="HFco0" runat="server" Value="ZERO" />
            <asp:HiddenField ID="HFco1" runat="server" Value="ZERO" />
            <asp:HiddenField ID="HFco2" runat="server" Value="ZERO" />
            <asp:HiddenField ID="HFco3" runat="server" Value="ZERO" />
            <asp:HiddenField ID="HFco4" runat="server" Value="ZERO" />
            <asp:HiddenField ID="HFco5" runat="server" Value="ZERO" />
            <asp:HiddenField ID="HFco6" runat="server" Value="ZERO" />
            <asp:HiddenField ID="HFco7" runat="server" Value="ZERO" />
            <asp:HiddenField ID="HFco8" runat="server" Value="ZERO" />
            <asp:HiddenField ID="HFco9" runat="server" Value="ZERO" />
        </contenttemplate>
    </asp:UpdatePanel>
</form>
		</td>
	</tr>
</table>
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

<audio id="sominici" name="sominici" autoplay><source src="/_Library/rgcerto.wav"></audio>
<audio id="somcapit" name="somsorte"><source src="/_Library/rgerror.wav"></audio>
<audio id="somsorte" name="somregis"><source src="/_Library/rgrodar.wav"></audio>
<audio id="somregis" name="somclick"><source src="/_Library/rgcaixa.wav"></audio>

</BODY></HTML>
