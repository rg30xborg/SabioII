﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sabio01.aspx.cs" Inherits="Sabio._1.tema4.Sabio01" %>
<%@ Import Namespace="System.Web.Script.Serialization" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Sabichao</title><style>@import url(../images/coUC.css);</style>
</head>
<body bgcolor="#FFFFFF">  <%--onLoad="OnCarg()"--%>
<p style="font-size: 10pt">
	Assunto da Sala: <b><font color="#0588C0">MISCELANIA III</font><span id="NCalc"> - Carregando .... 
    <img src="images/sabio01.gif" width="0" height="0" /><img src="images/sabio02.gif" width="0" height="0" />
    <img src="images/sabio03.gif" width="0" height="0" /><img src="images/sabio04.gif" width="0" height="0" />
    <img src="images/sabio05.gif" width="0" height="0" /></span></b>
	<span style="font-size: 9pt"><br>
	 - Pontos na Sala: <font color="#0000FF"><span id="Salas"><%=pSala%></span> pontos</font>
	 - Consecutivas: <font color="#0000FF"><span id="Consc"><%=pCosc%></span></font>
	 - Tempo: <font color="#0000FF"><span id="Tempos">00min:00seg.</span></font>
	</span>
</p>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#F94942" width="2%"><img src="../images/cant01s.gif" /></td>
		<td bgcolor="#F94942" width="64%"><br />
			<b><span style="font-size: 9pt; color: #FFFFFF" id="NPerg">O Temporal = As perguntas desta Sala 
			devem ser respondidas em até 25 segundos após apresentadas. Assim concentre-se..., quando estiver
			pronto para iniciar, clique na seta CONTINUAR.</span></b>
		</td>
		<td bgcolor="#F94942" width="2%" align="RIGHT"><img src="../images/cant02s.gif" /></td>
		<td width="24%" align="CENTER" valign="TOP">
			<b><font style="font-size: 14pt; color: #F94942">Ganhe</font>
			<br><font style="font-size: 12pt"><span id="NValr1">20</span> pontos</b></font></td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#F94942" width="2%"><img src="../images/cant01ii.gif" /></td>
		<td bgcolor="#F94942" width="64%"></td>
		<td bgcolor="#F94942" width="2%" align="RIGHT"><img src="../images/cant02ii.gif" /></td>
		<td width="24%" align="CENTER" valign="TOP"></td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#FDB4B1" width="2%" valign="BOTTOM"><img src="../images/cant03i.gif" /></td>
		<td bgcolor="#FDB4B1" width="64%">
			<table width="100%" cellspacing="0" cellpadding="2">
				<tr>
					<td align="center" width=100>
					<div style="position:relative;top:0;left:0;width:100px;height:80px"><img src="images/sabio00.gif" id="NFig1" name="NFig1" width="100" height="80" /><b><span id="Tempo" style="position:absolute;top:36px;left:42px">?!?</span></b></div>
					<div style="position:relative;top:0;left:0;width:100px;height:80px"><br /><img src="images/sabio05.gif" id="NFig2" name="NFig2" width="100" height="80" /><span style="position:absolute;top:46px;left:18px">Tmax. 25s.</span></div></td>
					<td><div id="NTabl" style="visibility:hidden">
			            <table width="100%" cellspacing="0" cellpadding="2">
			            	<tr>
			            		<td width="3%" valign="top" nowrap><img src="../images/happy3.gif" id="n1" name="n1" align="center" hspace="3" /><input type="radio" id="Resposta" name="Resposta" onClick="onImage(1)" /></td>
			            		<td width="97%" valign="top"><span id="NResp1"> </span></td>
			            	</tr>
			            	<tr>
			            		<td width="3%" valign="top" nowrap><img src="../images/happy3.gif" id="n2" name="n2" align="center" hspace="3" /><input type="radio" id="Resposta" name="Resposta" onClick="onImage(2)" /></td>
			            		<td width="97%" valign="top"><span id="NResp2"> </span></td>
			            	</tr>
			            	<tr>
			            		<td width="3%" valign="top" nowrap><img src="../images/happy3.gif" id="n3" name="n3" align="center" hspace="3" /><input type="radio" id="Resposta" name="Resposta" onClick="onImage(3)" /></td>
			            		<td width="97%" valign="top"><span id="NResp3"> </span></td>
			            	</tr>
			            	<tr>
			            		<td width="3%" valign="top" nowrap><img src="../images/happy3.gif" id="n4" name="n4" align="center" hspace="3" /><input type="radio" id="Resposta" name="Resposta" onClick="onImage(4)" /></td>
			            		<td width="97%" valign="top"><span id="NResp4"> </span></td>
			            	</tr>
			            	<tr>
			            		<td width="3%" valign="top" nowrap><img src="../images/happy3.gif" id="n5" name="n5" align="center" hspace="3" /><input type="radio" id="Resposta" name="Resposta" onClick="onImage(5)" /></td>
			            		<td width="97%" valign="top"><span id="NResp5"> </span></td>
			            	</tr>
			            </table>
					</div></td>
				</tr>
			</table>
		</td>
		<td bgcolor="#FDB4B1" width="2%" align="RIGHT" valign="BOTTOM"><img src="../images/cant04i.gif" /></td>
		<td width="24%" align="CENTER" valign="MidDLE">
            <form id="Sala" runat="server">
                <asp:ScriptManager id="ScriptManager1" runat="server" EnableCdn="True"></asp:ScriptManager>
                <asp:UpdatePanel id="UpdatePanel1" runat="server" UpdateMode="Conditional" EnableViewState="False">
                    <contenttemplate>
                        <asp:ImageButton id="IBbotao" runat="server" onMouseOver="onBotao1(this)" onMouseOut="ofBotao1(this)" OnClientClick="return StartRGQuizWeb1(this)" ImageUrl="../images/bot0pg.gif" OnClick="IBbotao_Click" /> <%--../images/resp001.gif--%>
                        <br /><br />
                        <table align="center">
                            <tr align="center" valign="middle">
                                <td colspan="5" align="left">Legenda:</td>
                            </tr>
                            <tr align="center" valign="middle">
                                <td><img src="../images/happy2.gif" height="20" width="20" /><br />Erro</td>
                                <td width="3">&nbsp;</td>
                                <td><img src="../images/happy3.gif" height="20" width="20" /><br />Paupite</td>
                                <td width="3">&nbsp;</td>
                                <td><img src="../images/happy1.gif" height="20" width="20" /><br />Certo</td>
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
                                if (OqueFaz == 0) { OqueFaz++; OnCarg(); document.getElementById("IBbotao").src="../images/cont001.gif"; }
                                if (OqueFaz == 2) { OqueFaz++;
                                    cox = <%= new JavaScriptSerializer().Serialize(@co) %>;
                                    cox[0] = document.getElementById("HFco0").value;
                                    cox[1] = document.getElementById("HFco1").value;
                                    cox[2] = document.getElementById("HFco2").value;
                                    cox[3] = document.getElementById("HFco3").value;
                                    cox[4] = document.getElementById("HFco4").value;
                                    cox[5] = document.getElementById("HFco5").value;
                                    cox[6] = document.getElementById("HFco6").value;
                                    myFirstBack1(IBbotao, cox);
                                    document.getElementById("HFPCert").value = "1";
                                }
                                if (OqueFaz == 4) { OqueFaz++;
                                    coy = <%= new JavaScriptSerializer().Serialize(@cu) %>;
                                    coy[0] = document.getElementById("HFco0").value;
                                    coy[1] = document.getElementById("HFco1").value;
                                    coy[2] = document.getElementById("HFco2").value;
                                    coy[3] = document.getElementById("HFco3").value;
                                    coy[4] = document.getElementById("HFco4").value;
                                    coy[5] = document.getElementById("HFco5").value;
                                    coy[6] = document.getElementById("HFco6").value;
                                    myBackCart1(IBbotao, coy);
                                    document.getElementById("HFPCert").value = "0";
                                    document.getElementById("HFTempo").value = "0";
                                }
                            };
                        </script>
                        <script type="text/javascript" src="../scripts/Simples3.js"></script>
                        <asp:HiddenField id="HFPCert" runat="server" Value="0" />
                        <asp:HiddenField id="HFApost" runat="server" Value="a" />
                        <asp:HiddenField id="HFTempo" runat="server" Value="0" />
                        <asp:HiddenField id="HFco0" runat="server" Value="ZERO" />
                        <asp:HiddenField id="HFco1" runat="server" Value="ZERO" />
                        <asp:HiddenField id="HFco2" runat="server" Value="ZERO" />
                        <asp:HiddenField id="HFco3" runat="server" Value="ZERO" />
                        <asp:HiddenField id="HFco4" runat="server" Value="ZERO" />
                        <asp:HiddenField id="HFco5" runat="server" Value="ZERO" />
                        <asp:HiddenField id="HFco6" runat="server" Value="ZERO" />
                    </contenttemplate>
                </asp:UpdatePanel>
            </form>
		</td>
	</tr>
</table>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr> 
		<td>
			<br><p align="justify"><b>OLHO VIVO - </b><i><%=Cod%></i> <%=OlhoVivo%> - Se o seu assunto preferido ainda não
			apareceu, mande sua sugestão para <a href="mailto:contato@aggora.com.br">contato@aggora.com.br</a></p>
		</td>
	</tr>
</table>
<p style="font-size: 10pt">Novidade na Sala: <font color="#0588C0"><b><I>TURMA DO FUNDÃO</I></b></font></p>
<center>
<iframe src="../Sabio17.aspx" width="90%" style="border: 0px solid blue;"></iframe>
</center>
<audio id="somerro" name="somerro"><source src="/_Library/rgerror.wav"></audio>
<audio id="somsorte" name="somsorte" autoplay><source src="/_Library/rgchico.wav"></audio>
<audio id="somregis" name="somregis"><source src="/_Library/rgcaixa.wav"></audio>
<audio id="somclick" name="somclick"><source src="/_Library/rgclick.wav"></audio>
<audio id="somcerto" name="somcerto"><source src="/_Library/rgcerto.wav"></audio>
</body>
</html>
