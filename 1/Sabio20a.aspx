<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sabio20a.aspx.cs" Inherits="Sabio._1.Sabio20a" %>
<%@ Import Namespace="System.Data.Odbc" %>
<%@ Import Namespace="System.Globalization" %>

<!DOCTYPE html>

<Script Language="JScript" src="scripts/SimplesC.js"></Script>
<html><head><title>Sabichao</title><style>@import url(images/coUC.css);</style></head>
<body bgColor="#FFFFFF" leftMargin="0" topMargin="0" marginwidth="0" marginheight="0">
<center>
<table border="0" cellPadding="0" cellSpacing="0" width="96%">
	<tbody>
	<tr align="center" valign="top">
		<td>
<p align="left" style="font-size: 10pt">
	Exemplo de Sala: <font color="#0588C0"><b>PRÊMIOS</b></font>
	<span style="font-size: 9pt"><br>
	 - ARRISQUE SEUS PONTOS NOS PRÊMIOS DO SABICHÃO
	</span>
</p>
<center>
<table border="0" width="100%%" cellspacing="0" cellpadding="0" style="font-family: Arial; font-size:10pt">
	<tr valign="TOP"> 
		<td width="5%"></td>
		<td bgcolor="#ffcc00" width="2%"><img src="images/cant01s.gif" /></td>
		<td bgcolor="#ffcc00" width="86%" style="font-size: 10pt; align:justify;">EXEMPLOS DE PRÊMIOS:
			<span style="color:#0000FF;">
				<br><b>Aqui apresentamos Prêmios (*) que serão sorteados na fase implantação. Você poderá arriscar livremente seus  
				pontos nos Prêmios que lhe agradar, depois, é só acompanhar as datas dos sorteios que estiver concorrendo.</b>
			</span>
		</td>
		<td bgcolor="#ffcc00" width="2%" align="RIGHT"><img src="images/cant02s.gif" /></td>
		<td width="5%"></td>
	</tr>
	<tr valign="TOP"> 
		<td width="5%"></td>
		<td bgcolor="#ffcc00" width="2%"><img src="images/cant01ii.gif" /></td>
		<td bgcolor="#ffcc00" width="86%"></td>
		<td bgcolor="#ffcc00" width="2%" align="RIGHT"><img src="images/cant02ii.gif" /></td>
		<td width="5%"></td>
	</tr>
	<tr valign="TOP"> 
		<td width="5%"></td>
		<td bgcolor="#ffff99" width="2%" valign="BOTTOM"><img src="images/cant03i.gif" /></td>
		<td bgcolor="#ffff99" width="86%">
			<form name="Aposta">
			<table border="0" width="100%" cellspacing="0" cellpadding="5" style="font-family: Arial; font-size:14pt">
				<tr>
					<td><b>Prêmio / Apoio</b></td>
					<td><b>Data do Sorteio</b></td>
					<td><b>Total de Apostas</b></td>
				</tr>
<%
    string bgcolor = "#FFFFDF";
    string connString = System.Configuration.ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
    OdbcConnection Conexao = new OdbcConnection(connString);
    using (Conexao)
    {
        int pDias = 0;
        string queryString = "SELECT * FROM Premios P, Patrocinio DE WHERE P.PAT_Cod = DE.PAT_Cod ORDER BY P.PRE_Data";
        OdbcCommand command = new OdbcCommand(queryString, Conexao);
        // Open the connection in a try/catch block.
        try
        {
            Conexao.Open();
            OdbcDataReader Premios = command.ExecuteReader();
            //Premios.Read();
            if (!Premios.HasRows){
%>
				<tr bgcolor="#FFD699"> 
					<td colspan="3"><b>Nenhum Premios programado para o momento. Aguarde para Breve.</b></td>
				</tr>
<%
            }
            else
            {

                while (Premios.Read())
                {
                    if (bgcolor == "#FFFFDF") bgcolor = "#FFEDA7"; else bgcolor = "#FFFFDF";
                    pDias = (Convert.ToDateTime(Premios["PRE_Data"]) - DateTime.Today).Days;
                    int preEsp = Convert.ToInt16(Premios["PRE_Special"]);
                    if ((pDias >= 0 && pDias < 200) || (preEsp == 1 && pDias >= 0))
                    {
                        var codigo = Premios["PRE_Cod"];
%>
				<tr bgcolor="<%=bgcolor%>"> 
					<td><b><%=codigo%>) <%=Premios["PRE_Desc"]%></b><br><%=Premios["PAT_Nome"]%></td>
					<td><%=Convert.ToDateTime(Premios["PRE_Data"]).ToString("dd/MM/yyyy")%><br><%=Convert.ToDateTime(Premios["PRE_Data"].ToString()).DayOfWeek%></td>
					<td><span id="Pgs<%=codigo%>"><%=Premios["PRE_Apts"]%></span></td>
				</tr>
<%
                    }
                }
                Premios.Close();
                Conexao.Close();
            }
        }
        catch (Exception ex)
        {
            var perg1 = ex.Message;
        }
    }
    if (bgcolor == "#FFFFDF") bgcolor = "#FFEDA7"; else bgcolor = "#FFFFDF";
%>
                <tr bgcolor="<%=bgcolor%>">
					<td colspan="4">
				<img src="images/luminoso.gif" width="25" height="25"  style="vertical-align: middle;" align="left" />
				(*) Eventuais prêmios só serão entregues, se seus <font color="blue"><b>Dados Cadastrais</b></font> forem
				Verdadeiros, e o link <font color="blue"><b>www.aggora.com.br/sabio</b></font> ter sido compartilhado em uma de suas 
				<font color="blue"><b>redes sociais</b></font> antes do sorteio do Prêmio.
					</td>
				</tr>
			</table>
                <br />
			</form>
		</td>
		<td bgcolor="#ffff99" width="2%" align="RIGHT" valign="BOTTOM"><img src="images/cant04i.gif" /></td>
		<td width="5%"></td>
	</tr>
</table>
<p><br />
            <div width="100%" height="40px" style="background-color:#0f4baf; text-align:left; width:auto; height:40px;">
                <img height="40" src="images/supdate03.gif" width="27" style="float:left" /><span class="textvalignmiddle" style="font-size:large; font-family:Verdana, Arial, Helvetica, sans-serif; color:#ffffff"><b><i>COMO ENTRAR NO JOGO</i></b></span><img height="40" src="images/supdate02.gif" width="27" style="float:right" />
            </div>
<p>
 			<table border="0" cellpadding="0" cellspacing="0" width="90%" style="font-family: Arial; font-size:9pt">
				<tr>
					<td>
                        <form id="logonForm" runat="server" method="GET" onsubmit="return verifica()">   <%--action="Sabio10.aspx"--%>
                            <br />
			                <table cellspacing="1" cellpadding="2" width="100%" style="font-size:12pt">
			                	<tr>
			                		<td align="right"><img src="images/mao.gif" /><b>Seu Log-in</b>:</td>
			                		<td>
                                        <asp:TextBox ID="userlogon" name="userlogon" runat="server" size="30" maxlength="30" />&nbsp; (email completo)</td>
			                	</tr>
			                	<tr>
			                		<td align="right"><b>Uma Senha</b>:</td>
			                		<td>
                                        <asp:TextBox ID="userpassw" name="userpassw" runat="server" size="12" maxlength="12" TextMode="Password" />&nbsp; (mínimo 6 caracteres)</td>
			                	</tr>
			                	<tr valign="bottom">
			                		<td colspan="2" align="right">
                                        <div style="width:125px; height:25px;text-align:center; background-image: url('images/bt3.gif'); background-repeat: no-repeat; vertical-align:bottom; cursor: pointer; line-height: 25px;"><asp:LinkButton ID="LinkButton1" runat="server" Text="Entre (é grátis) &nbsp;" Height="25px" Width="125px" OnClick="LinkButton1_Click" /></div>
			                		</td>
			                	</tr>
			                </table>
                        </form>
                        <p align="justify">No formulário acima digite seu Log-in (<b><font color=red>E-MAIL completo</font></b>) e uma
				SENHA exclusiva para este Site-Jogo. Pronto você automaticamente já estará registrado no Sabichão, e entrara
				no ambiente do jogo. Mas lembre-se, para concorrer aos prêmios quando estes estiverem disponíveis você deverá completar seus dados
				cadastrais, ou atualiza-los. Eles podem ser alterados (exceto e-mail) a qualquer momento a partir
				da página interna [Menu] com um clique simples em [Alterar Cadastro].</p>
                        <p align="right">Quero uma amostra <a href="sabio23.aspx">Full-Demo</a> antes de Cadastrar-me.</p>
					</td>
				</tr>
			</table>
    </center>
		</td>
	</tr>
	</tbody>
</table>
<div id="INV002" style="position:absolute; width: 100%; height: 60px; left:0px; top:2px; z-index: 8; visibility: inherit"><marquee behavior="scroll" direction="right" scrollamount="5"><img src="images/coelho2R.gif" width="60" height="60" /></marquee></div>
<br /><br />
</body></html>