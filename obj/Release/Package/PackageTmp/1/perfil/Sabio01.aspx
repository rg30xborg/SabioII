<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sabio01.aspx.cs" Inherits="Sabio._1.perfil.Sabio01" %>
<%@ Import Namespace="System.Web.Script.Serialization" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Sabichao</title><style>@import url(../images/coUC.css);</style>
</head>
<body bgcolor="#FFFFFF">  <%--onLoad="OnCarg()"--%>
<p style="font-size: 10pt">
	Sala de: <font color="#0588C0"><b>TESTE SEU PERFIL</font><span id="NCalc"> - Carregando .... </span></b>
	<span style="font-size: 9pt"><br>
	 - AQUI VOCÊ GANHA PONTOS MOSTRANDO SEUS CEREBELOS
	</span>
</p>
<p align="justify"><span style="font-family: Verdana; font-size:12pt"> <b>SEU PERFIL no Sabichão</b>
		    </span> - Vamos ver qual o seu perfil e sua personalidade atravez destas perguntas. Com elas o Sabichão
			pode definir qual a melhor interação e conteúdo que o Site pode oferecer a você. Os pontos serão
			adicionados ao seu total pela Promoção assim que você completar o teste.
			- Sete dias após concluir este TESTE você tera um diferente de esperando.</p>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#44AA00" width="2%"><img src="../images/cant01s.gif" /></td>
		<td bgcolor="#44AA00" width="64%" style="font-size: 9pt; color: #FFFFFF">
			<b><span style="font-size:12pt">Verifique seu Perfil junto com o Sabichão</span>
			<br>TEMA: <span id="NTema" style="color: #FFFF00"><%=tema%></span>
			<br><br><span id="NPerg"><%=perg1%></span></b>
		</td>
		<td bgcolor="#44AA00" width="2%" align="RIGHT"><img src="../images/cant02s.gif" /></td>
		<td width="24%" align="CENTER" valign="TOP">
			<b><font style="font-size: 14pt; color: #F94942">Ganhe</font>
			<br><font style="font-size: 12pt">200 pontos</b></font><br>(ao completar)
		</td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#44AA00" width="2%"><img src="../images/cant01ii.gif" /></td>
		<td bgcolor="#44AA00" width="64%"></td>
		<td bgcolor="#44AA00" width="2%" align="RIGHT"><img src="../images/cant02ii.gif" /></td>
		<td width="24%" align="CENTER" valign="TOP"></td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#AAEE22" width="2%" valign="BOTTOM"><img src="../images/cant03i.gif" /></td>
		<td bgcolor="#AAEE22" width="64%">
            <table border="0" width="100%" cellspacing="0" cellpadding="2">
				<tr>
					<td width="3%" valign="top" nowrap><img src="../images/happy3.gif" id="n1" name="n1" align="center" hspace="3" /><input type="radio" id="Resposta" name="Resposta" onClick="onImage(1)" /></td>
					<td width="97%" valign="top"><span id="NResp1"><%=resp1%></span></td>
				</tr>
				<tr>
					<td width="3%" valign="top" nowrap><img src="../images/happy3.gif" id="n2" name="n2" align="center" hspace="3" /><input type="radio" id="Resposta" name="Resposta" onClick="onImage(2)" /></td>
					<td width="97%" valign="top"><span id="NResp2"><%=resp2%></span></td>
				</tr>
				<tr>
					<td width="3%" valign="top" nowrap><img src="../images/happy3.gif" id="n3" name="n3" align="center" hspace="3" /><input type="radio" id="Resposta" name="Resposta" onClick="onImage(3)" /></td>
					<td width="97%" valign="top"><span id="NResp3"><%=resp3%></span></td>
				</tr>
			</table>
		</td>
		<td bgcolor="#AAEE22" width="2%" align="RIGHT" valign="BOTTOM"><img src="../images/cant04i.gif" /></td>
		<td width="24%" align="CENTER" valign="MidDLE">
            <form id="Sala" runat="server">
                <asp:ScriptManager id="ScriptManager1" runat="server" EnableCdn="True"></asp:ScriptManager>
                <asp:UpdatePanel id="UpdatePanel1" runat="server" UpdateMode="Conditional" EnableViewState="False">
                    <contenttemplate>
                        <asp:ImageButton id="IBbotao" runat="server" onMouseOver="onBotao1(this)" onMouseOut="ofBotao1(this)" OnClientClick="return StartRGQuizWeb1(this)" ImageUrl="../images/cont001.gif" OnClick="IBbotao_Click" />
                        <br /><br /><small>(Ver *Dica)</small>
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
                                if (OqueFaz == 0) { OqueFaz++; OnCarg(); document.getElementById("IBbotao").src="../images/resp001.gif"; }
                                if (OqueFaz == 2) { OqueFaz++;
                                    cox = <%= new JavaScriptSerializer().Serialize(@co) %>;
                                    cox[0] = document.getElementById("HFco0").value;
                                    cox[1] = document.getElementById("HFco1").value;
                                    cox[2] = document.getElementById("HFco2").value;
                                    cox[3] = document.getElementById("HFco3").value;
                                    cox[4] = document.getElementById("HFco4").value;
                                    cox[5] = document.getElementById("HFco5").value;
                                    cox[6] = document.getElementById("HFco6").value;
                                    myBackCart1(IBbotao, cox);
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
                                    myFirstBack1(IBbotao, coy);
                                    document.getElementById("HFPCert").value = "0";
                                }
                            };
                        </script>
                        <script type="text/javascript" src="../scripts/SimplesP.js"></script>
                        <asp:HiddenField id="HFPCert" runat="server" Value="0" />
                        <asp:HiddenField id="HFApost" runat="server" Value="a" />
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
<table cellspacing="0" cellpadding="0" width="100%" style="font-family: Arial; font-size:9pt">
	<tr>
		<td>(*) DICA: Aqui não tem resposta certa ou errada, é só completar as 10 Perguntas da semana para faturar
		    200 PONTOS EXTRAS no <b>Teste&nbsp;seu&nbsp;Perfil.</b>
		</td>
	</TR>
</TABLE>
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
