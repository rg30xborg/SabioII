<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sabio01.aspx.cs" Inherits="Sabio._1.tema1.Sabio01" %>
<%@ Import Namespace="System.Web.Script.Serialization" %>

<!DOCTYPE html>

<script language="JScript" src="../scripts/Simples2.js"></script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Sabichao</title><style>@import url(../images/coUC.css);</style>
</head>
<%--<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>--%>
    <script>
        function Fechar() {
            document.getElementById('divMensagem').style.display = "none";
        };

        var OqueFaz = 0;
        var cox = <%= new JavaScriptSerializer().Serialize(co) %>;
        var coy = <%= new JavaScriptSerializer().Serialize(cu) %>;
    </script>
<body bgcolor="#FFFFFF">  <%--onLoad="OnCarg()"--%>
<p style="font-size: 10pt">
	Assunto da Sala: <b><font color="#0588C0">OLIMPÍADAS, FUTEBOL, AUTOMOBILISMO</font><Span ID="NCalc"> - Carregando .... </Span></b>
	<span style="font-size: 8pt"><br>
	 - Pontos na Sala: <font color="#0000FF"><span ID="Salas"><%=pSala%></span> pontos</font>
	 - Consecutivas: <font color="#0000FF"><span ID="Consc"><%=pCosc%></span></font>
	 - Tempo: <font color="#0000FF"><span ID="Tempos">00min:00seg.</span></font>
	</span>
</p>
<form id="Sala" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <contenttemplate>     
    <table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#F94942" width="2%"><img src="../images/cant01s.gif"></td>
		<td bgcolor="#F94942" width="64%">Sala em testes com imagens:<br>
			<b><Span style="font-size: 9pt; color: #FFFFFF" ID="NPerg"><%=perg1%></Span> <%=co[0]%> <%=co[1]%> <%=co[2]%> <%=co[3]%> <%=co[4]%> <%=co[5]%> <%=co[6]%></b>
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
			<table width="100%" cellspacing="0" cellpadding="2">
				<tr>
					<td width=100><img src="images/<%=figr1%>" id="NFigr" width=100 height=180></td>
					<td>
			<table width="100%" cellspacing="0" cellpadding="2">
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
				</tr>
			</table>
		</td>
		<td bgcolor="#FDB4B1" width="2%" align="RIGHT" valign="BOTTOM"><img src="../images/cant04i.gif"></td>
		<td width="24%" align="CENTER" valign="MIDDLE">
            <input type="image" width="97" height="56" name="botao" id="botao" src="../images/bot0pg.gif" onClick="StartRGQuizWeb()" onMouseOver="onBotao()" onMouseOut="ofBotao()">
            <br />
            <asp:ImageButton ID="IBbotao" runat="server" onMouseOver="onBotao1(this)" onMouseOut="ofBotao1(this)" OnClientClick="return StartRGQuizWeb1(this)" ImageUrl="../images/cont001.gif" OnClick="IBbotao_Click" />
            <br /><br /><br />
                        <asp:Button ID="btnAtualizarParcial" runat="server" Text="Atualizar Paineis" OnClick="Atualizar_Click" />
            <br /><br /><asp:Button ID="btnAtualizarGeral" runat="server" Text="Atualizar Pagina" OnClick="Atualizar_Click" />
		</td>
	</tr>
</table>
            <asp:UpdatePanel ID="updPainel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                <ContentTemplate>
                    <asp:TextBox ID="txtPainel1" runat="server"></asp:TextBox>
                    <asp:Button ID="btnPainel1" runat="server" Text="Painel 1 (Trigger)" OnClick="Painel1_Click" />
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnAtualizarParcial" EventName="Click" />
                    <asp:PostBackTrigger ControlID="btnAtualizarGeral" />
                </Triggers>
            </asp:UpdatePanel>
            <asp:UpdatePanel ID="updPainel2" runat="server" UpdateMode="Conditional" >
                <ContentTemplate>
                    <asp:TextBox ID="txtPainel2" runat="server"></asp:TextBox>
                    <asp:Button ID="btnPainel2" runat="server" Text="Painel 2 (Conditional)" OnClick="Painel2_Click" />
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:UpdatePanel ID="updPainel3" runat="server" UpdateMode="Always" >
                <ContentTemplate>
                    <asp:TextBox ID="txtPainel3" runat="server"></asp:TextBox>
                    <asp:Button ID="btnPainel3" runat="server" Text="Painel 3 (Always)" OnClick="Painel3_Click" />
                </ContentTemplate>
            </asp:UpdatePanel>
            <br /><br />
            <div id="divMensagem" runat="server" style="display:none">
                        <asp:Label ID="TextMensagem" runat="server"></asp:Label>
                         <input type="button" id="btnFecharMensagem" value="Fechar Mensagem" onclick="Fechar()"/>
                    </div>
            <br /><br /><asp:Button ID="Button1" runat="server" Text="Executar Antes" OnClick="botao_Click" />

            <br /><br />
                <asp:Label ID="lblTime" runat="server" Text="Hora Atualizada" />
                <asp:Button Text="Executar Apos Post Back" runat="server" OnClientClick="OnCarg()" />
            <br /><br />

    <script type="text/javascript">
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
        <%--var IBbotao = document.getElementById("<%=IBbotao.ClientID %>");--%>
        <%--var HFPCert = document.getElementById("<%=HFPCert.ClientID %>");--%>
        function DisplayCurrentTime() {
            if (OqueFaz == 0) { OqueFaz++; OnCarg(); document.getElementById("<%=IBbotao.ClientID %>").src = "../images/resp001.gif";}
            if (OqueFaz == 2) { OqueFaz++;
                <%--var cox = document.getElementById("<%=HFPCert.ClientID %>").value;--%>
                 myBackCart1(IBbotao, cox);
            }
            if (OqueFaz == 4) { OqueFaz++;
                <%--var cox = document.getElementById("<%=HFPCert.ClientID %>").value;--%>
                <%--var IBbotao = document.getElementById("<%=IBbotao.ClientID %>");--%>
                myFirstBack1(IBbotao, coy);
                document.getElementById("<%=HFPCert.ClientID %>").value = "0";
            }
            var date = new Date();
            var hours = date.getHours() < 10 ? "0" + date.getHours() : date.getHours();
            var minutes = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
            var seconds = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();
            time = hours + ":" + minutes + ":" + seconds;
            var lblTime = document.getElementById("<%=lblTime.ClientID %>");
            lblTime.innerHTML = time + " Fz:" + OqueFaz;
            lblTime.innerHTML += " Hf:" + document.getElementById("<%=HFPCert.ClientID %>").value;
        };
    </script>
    <asp:HiddenField ID="HFPCert" runat="server" Value="0" />
            </contenttemplate>
    </asp:UpdatePanel>
</form>
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
