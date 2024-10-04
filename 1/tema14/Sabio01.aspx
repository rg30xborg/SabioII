<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sabio01.aspx.cs" Inherits="Sabio._1.tema14.Sabio01" %>
<%@ Import Namespace="System.Web.Script.Serialization" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Sabichao</title><style>@import url(../images/coUC.css);</style>
</head>
<body bgcolor="#FFFFFF">  <%--onLoad="OnCarg()"--%>
<p style="font-size: 10pt">
	Sala Especial de: <font color="#0588C0"><b>ARTES CRIADAS POR USUÁRIOS</font><span id="NCalc"> - Carregando .... </span></b>
	<span style="font-size: 9pt"><br />
	 - Pontos na Sala: <font color="#0000FF"><span id="Salas"><%=pSala%></span> pontos</font>
	 - Consecutivas: <font color="#0000FF"><span id="Consc"><%=pCosc%></span></font>
	 - Tempo: <font color="#0000FF"><span id="Tempos">00min:00seg.</span></font>
	</span>
</p>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#F94942" width="2%"><img src="../images/cant01s.gif" /></td>
		<td bgcolor="#F94942" width="64%">
             - AQUI VOCÊ GANHA PONTOS CURTINDO O TALENTO DOS ARTISTAS DO SITE<br>
			<b><span style="font-size: 9pt; color: #FFFFFF" id="NPerg">Abaixo está sendo apresentada uma "Obra de Arte" criada e 
            encaminhada por Usuários do Site Sabichão para voce Curtir o Talento destes "Artistas Natos". Exprima sua opinião sobre 
            essa e ganhe pontos nesta Promoção.</span></b>
		</td>
		<td bgcolor="#F94942" width="2%" align="RIGHT"><img src="../images/cant02s.gif" /></td>
		<td width="24%" align="CENTER" valign="TOP">
			<b><font style="font-size: 14pt; color: #F94942">Ganhe</font>
			<br><font style="font-size: 12pt">20 pontos</b></font></td>
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
		<td bgcolor="#FDB4B1" width="64%"><br />
			<table width="100%" cellspacing="2" cellpadding="1" style="font-family: Arial; font-size:9pt">
				<tr align="center" bgcolor="#4E5CA0" style="color: #FFFFFF; font-size: 10pt">
					<td width="5%"><b>Nº</b></td>
					<td width="95%"><b>Talento do Usuário (<span style="font-size: 9pt; color: #FFFFFF" id="NPerg"><%=Nome%></span> - Tipo: <span id="NResp3"><%=Tipo%></span>)</b></td>
				</tr>
				<tr bgcolor="#D7DBEC" align="center">
					<td width="5%"><span id="NResp5"><%=Codigo%></span></td>
					<td width="95%" align="center">
					<p align="justify">Título: <b><span align="right" id="NResp1"><%=Titulo%></span></b><br /><span id="NResp2"><%=Descricao.Replace(Environment.NewLine, "<br />")%></span>.</p>
                    <div id="tela" style="position:relative;height:auto">
                        <div id="audio" style="visibility:hidden;position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);">
                            <audio id="Aaudio" src="<%=Arquivo%>" autoplay controls>
                            		Seu navegador não suporta áudio HTML5
                            </audio>
                        </div>
                        <div id="video" style="visibility:hidden;position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);">
                            <video id="Avideo" src="<%=Arquivo%>" width="450" height="240" controls autoplay allowfullscreen>
                            		Seu navegador não suporta áudio HTML5
                            </video>
                        </div>
                        <div id="image" style="visibility:hidden;position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);">
                            <img id="Aimage" src="<%=Arquivo%>" width="450" height="240" />
                        </div>
                    </div>
<%
    if (Tipo == "Audio") Response.Write("<script>tela.style.height='50px'; audio.style.visibility='visible';</script>");
    else if (Tipo == "Imagem") Response.Write("<script>tela.style.height='250px'; image.style.visibility='visible';</script>");
    else if (Tipo == "Video") Response.Write("<script>tela.style.height='250px'; video.style.visibility='visible';</script>");
%>
					<br><br>O que achou desta Arte? <%--<span id="NResp4"><%=Arquivo%></span>--%>
					         <br>Manero (<span id="eman"><%=man%></span>)<input type="radio" id="Resposta" name="Resposta" value="m" onClick="noImage(1)" /><img src="../images/happy3.gif" id="n1" name="n1" align="center" hspace="3" />
					&nbsp; &nbsp; Legal (<span id="eleg"><%=leg%></span>)<input type="radio" id="Resposta" name="Resposta" value="l" onClick="noImage(2)" /><img src="../images/happy3.gif" id="n2" name="n2" align="center" hspace="3" />
					&nbsp; &nbsp; DMais (<span id="edma"><%=dma%></span>)<input type="radio" id="Resposta" name="Resposta" value="d" onClick="noImage(3)" /><img src="../images/happy3.gif" id="n3" name="n3" align="center" hspace="3" />
					<br />
					</td>
				</tr>
				<tr>
					<td colspan=2>
						<br />
					</td>
				</tr>
			</table>
		</td>
		<td bgcolor="#FDB4B1" width="2%" align="RIGHT" valign="BOTTOM"><img src="../images/cant04i.gif" /></td>
		<td width="24%" align="CENTER" valign="MidDLE">
            <form id="Sala" runat="server">
                <asp:ScriptManager id="ScriptManager1" runat="server" EnableCdn="True"></asp:ScriptManager>
                <asp:UpdatePanel id="UpdatePanel1" runat="server" UpdateMode="Conditional" EnableViewState="False">
                    <contenttemplate>     
                        <asp:ImageButton id="IBbotao" runat="server" onMouseOver="onBotao1(this)" onMouseOut="ofBotao1(this)" OnClientClick="return StartRGQuizWeb1(this)" ImageUrl="../images/botpg.gif" OnClick="IBbotao_Click" /> <%--../images/cont001.gif--%>
                        <br /><br /><small>(Ver *Dica)</small><br /><br />
                        <p><input type="button" value="Enviar Artes" style="border:0;background-color:rgb(255,255,255);background-image:url('../images/bt3c.gif');width:115px;height:25px" onClick="location.href='../promo/Sabio06.aspx'"></p>
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
                                if (OqueFaz == 0) { OqueFaz++; OnCarg(); document.getElementById("IBbotao").src="../images/resp001.gif"; }  <%--<%=IBbotao.Clientid %>--%>
                                if (OqueFaz == 2) { OqueFaz++;
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
                                    coy[7] = document.getElementById("HFco7").value;
                                    coy[8] = document.getElementById("HFco8").value;
                                    myFirstBack1(IBbotao, coy);
                                    document.getElementById("HFPCert").value = "0";
                                }
                            };
                        </script>
                        <script type="text/javascript" src="../scripts/Simples8.js"></script>
                        <asp:HiddenField id="HFPCert" runat="server" Value="0" />
                        <asp:HiddenField id="HFApost" runat="server" Value="a" />
                        <asp:HiddenField id="HFco0" runat="server" Value="ZERO" />
                        <asp:HiddenField id="HFco1" runat="server" Value="ZERO" />
                        <asp:HiddenField id="HFco2" runat="server" Value="ZERO" />
                        <asp:HiddenField id="HFco3" runat="server" Value="ZERO" />
                        <asp:HiddenField id="HFco4" runat="server" Value="ZERO" />
                        <asp:HiddenField id="HFco5" runat="server" Value="ZERO" />
                        <asp:HiddenField id="HFco6" runat="server" Value="ZERO" />
                        <asp:HiddenField id="HFco7" runat="server" Value="ZERO" />
                        <asp:HiddenField id="HFco8" runat="server" Value="ZERO" />
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
		<td>(*) DICA: Aqui não tem resposta certa ou errada, é só curtir as Criações Pessoais dos Talentosos do Site
            e faturar PONTOS EXTRAS.
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
