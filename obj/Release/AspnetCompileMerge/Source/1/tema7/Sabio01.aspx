<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Sabio01.aspx.cs" Inherits="Sabio._1.tema7.Sabio01" %>
<%@ Import Namespace="System.Web.Script.Serialization" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Sabichao</title><style>@import url(../images/coUC.css);</style>
</head>
<%--<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>--%>
<body bgcolor="#FFFFFF">  <%--onLoad="OnCarg()"--%>
<p style="font-size: 10pt">
	Assunto da Sala: <b><font color="#0588C0">TELEVISÃO</font><Span ID="NCalc"> - Carregando .... </Span></b>
	<span style="font-size: 8pt"><br>
	 - Pontos na Sala: <font color="#0000FF"><span ID="Salas"><%=pSala%></span> pontos</font>
	 - Consecutivas: <font color="#0000FF"><span ID="Consc"><%=pCosc%></span></font>
	 - Tempo: <font color="#0000FF"><span ID="Tempos">00min:00seg.</span></font>
	</span>
</p>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#F94942" width="2%"><img src="../images/cant01s.gif"></td>
		<td bgcolor="#F94942" width="64%"><br />
			<b><Span style="font-size: 9pt; color: #FFFFFF" ID="NPerg"><%=perg1%></Span></b>
		</td>
		<td bgcolor="#F94942" width="2%" align="RIGHT"><img src="../images/cant02s.gif"></td>
		<td width="24%" align="CENTER" valign="TOP">
			<b><font style="font-size: 14pt; color: #F94942">Ganhe</font>
			<br><font style="font-size: 12pt">20 pontos</b></font></td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#F94942" width="2%"><img src="../images/cant01ii.gif"></td>
		<td bgcolor="#F94942" width="64%"></td>
		<td bgcolor="#F94942" width="2%" align="RIGHT"><img src="../images/cant02ii.gif"></td>
		<td width="24%" align="CENTER" valign="TOP"></td>
	</tr>
	    <tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#FDB4B1" width="2%" valign="BOTTOM"><img src="../images/cant03i.gif"></td>
		<td bgcolor="#FDB4B1" width="64%">
			<table border="0" width="100%" cellspacing="0" cellpadding="2">
				<tr>
					<td width="3%" valign="top" nowrap><img src="../images/happy3.gif" id="n1" name="n1" align="center" hspace="3"><input type="radio" id="Resposta" name="Resposta" onClick="onImage(1)"></td>
					<td width="97%" valign="top"><Span ID="NResp1"><%=resp1%></Span></td>
				</tr>
				<tr>
					<td width="3%" valign="top" nowrap><img src="../images/happy3.gif" id="n2" name="n2" align="center" hspace="3"><input type="radio" id="Resposta" name="Resposta" onClick="onImage(2)"></td>
					<td width="97%" valign="top"><Span ID="NResp2"><%=resp2%></Span></td>
				</tr>
				<tr>
					<td width="3%" valign="top" nowrap><img src="../images/happy3.gif" id="n3" name="n3" align="center" hspace="3"><input type="radio" id="Resposta" name="Resposta" onClick="onImage(3)"></td>
					<td width="97%" valign="top"><Span ID="NResp3"><%=resp3%></Span></td>
				</tr>
				<tr>
					<td width="3%" valign="top" nowrap><img src="../images/happy3.gif" id="n4" name="n4" align="center" hspace="3"><input type="radio" id="Resposta" name="Resposta" onClick="onImage(4)"></td>
					<td width="97%" valign="top"><Span ID="NResp4"><%=resp4%></Span></td>
				</tr>
				<tr>
					<td width="3%" valign="top" nowrap><img src="../images/happy3.gif" id="n5" name="n5" align="center" hspace="3"><input type="radio" id="Resposta" name="Resposta" onClick="onImage(5)"></td>
					<td width="97%" valign="top"><Span ID="NResp5"><%=resp5%></Span></td>
				</tr>
			</table>
		</td>
		<td bgcolor="#FDB4B1" width="2%" align="RIGHT" valign="BOTTOM"><img src="../images/cant04i.gif"></td>
		<td width="24%" align="CENTER" valign="MIDDLE">
            <form id="Sala" runat="server">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" EnableViewState="False">
                    <contenttemplate>     
                        <%--<%=co[0]%> <%=co[1]%> <%=co[2]%> <%=co[3]%> <%=co[4]%> <%=co[5]%> <%=co[6]%><br /><br />--%>
                        <asp:ImageButton ID="IBbotao" runat="server" onMouseOver="onBotao1(this)" onMouseOut="ofBotao1(this)" OnClientClick="return StartRGQuizWeb1(this)" ImageUrl="../images/cont001.gif" OnClick="IBbotao_Click" /> <%--../images/resp001.gif--%>
                        <%--<br /><br />
                            <asp:Label ID="lblTime" runat="server" Text="Hora Atualizada" />
                        <br /><br />--%>
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
                                if (OqueFaz == 0) { OqueFaz++; OnCarg(); document.getElementById("IBbotao").src="../images/resp001.gif"; }  <%--<%=IBbotao.ClientID %>--%>
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
                                    document.getElementById("HFPCert").value = "0";    <%--<%=HFPCert.ClientID %>--%>
                                }
                                <%--var date = new Date();
                                var hours = date.getHours() < 10 ? "0" + date.getHours() : date.getHours();
                                var minutes = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
                                var seconds = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();
                                time = hours + ":" + minutes + ":" + seconds;
                                var lblTime = document.getElementById("lblTime");
                                lblTime.innerHTML = time + " Fz:" + OqueFaz;
                                lblTime.innerHTML += " StQz:" + document.getElementById("HFPCert").value + " Ap:" + document.getElementById("HFApost").value;--%>
                            };
                        </script>
                        <script type="text/javascript" src="../scripts/Simples1.js"></script>
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
<%--<script language="JScript" SRC="/_Library/Defaull.js"></script>--%>
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
<audio id="somsorte" name="somsorte" autoplay><source src="/_Library/rgrodar.wav"></audio>
<audio id="somregis" name="somregis"><source src="/_Library/rgcaixa.wav"></audio>
<audio id="somclick" name="somclick"><source src="/_Library/rgclick.wav"></audio>
<audio id="somcerto" name="somcerto"><source src="/_Library/rgcerto.wav"></audio>
</body>
</html>
