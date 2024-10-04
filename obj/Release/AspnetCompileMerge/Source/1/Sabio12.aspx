<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sabio12.aspx.cs" Inherits="Sabio._1.Sabio12" %>
<%@ Import Namespace="System.Data.Odbc" %>

<!DOCTYPE html>

<Script Language="JScript" src="scripts/SimplesC.js"></Script>
<html><head><title>Sabichao</title><style>@import url(images/coUC.css);</style></head>
<BODY bgColor="#FFFFFF" leftMargin="0" topMargin="3" marginwidth="0" marginheight="0">
<TABLE border="0" cellPadding="0" cellSpacing="0" width="100%">
	<TBODY>
	<TR align="center" valign="top">
		<TD width="40px">&nbsp;</TD>
		<TD><br><br>
            <div width="100%" height="40px" style="background-color:#0f4baf; text-align:left; width:auto; height:40px;">
                <img height="40" src="images/supdate03.gif" width="27" style="float:left" /><span class="textvalignmiddle" style="font-size:large; font-family:Verdana, Arial, Helvetica, sans-serif; color:#ffffff"><b><i>A SEÇÃO EXPIROU!</i></b></span><img height="40" src="images/supdate02.gif" width="27" style="float:right" />
            </div>
<p>
			<table border="0" cellpadding="0" cellspacing="0" width="90%" style="font-family: Arial; font-size:9pt">
				<tr>
					<td>
			<p align="justify">A página que esteve tentando acessar não esta disponível, devido às informações
			personalizadas do usuário terem sido perdidas. Isto acontece normalmente quando o tempo limite da seção,
			que é de 20 (vinte) minutos sem atividade com o servidor, expira ou também quando os botões [Fechar] e
			[Logoff] são acionados e a navegação e feita através dos botões de avançar e retroceder do Site.
			Para re-personalizar, reintroduza <b><font color="blue">Seu E-mail e Senha</font></b>, e sua seção será reinicializada. Grato.</p>
					</td>
				</tr>
				<tr>
					<td>
                        <form id="logonForm" runat="server" action="Sabio10.aspx" method="get" onsubmit="return verifica()">
                            <br />
			                <table cellspacing="1" cellpadding="2" width="100%" style="font-family: Arial; font-size:9pt;color:#000080">
			                	<tr>
			                		<td align="right"><b>Seu Log-in</b>:</td>
			                		<td>
                                        <asp:TextBox ID="userlogon" name="userlogon" runat="server" size="30" maxlength="30" />&nbsp;<span style="font-size:8pt"> (E-mail Completo)</span></td>
			                	</tr>
			                	<tr>
			                		<td align="right"><b>Uma Senha</b>:</td>
			                		<td>
                                        <asp:TextBox ID="userpassw" name="userpassw" runat="server" size="12" maxlength="12" TextMode="Password" />&nbsp;<span style="font-size:8pt"> (Mínimo 6 Caracteres)</span></td>
			                	</tr>
			                	<tr valign="bottom">
			                		<td colspan="2" align="right">
                                        <%--<input width="115px" height="25px" type="submit" value="Entre (é gratis)" id="lggonAgn" name="lggonAgn" style="border:0;background-color:rgb(255,255,255);background-image:url('images/bt3.gif');width:115px;height:25px" />
                                        <asp:ImageButton ID="ImageButton1" runat="server" Height="25px" ImageUrl="images/bt3-Entre.gif" OnClick="ImageButton1_Click" Width="115px" AlternateText="Entre (É Gratis)" ImageAlign="Right" />--%>
                                        <div style="width:125px; height:25px;text-align:center; background-image: url('images/bt3.gif'); background-repeat: no-repeat; vertical-align:bottom; cursor: pointer; line-height: 25px;"><asp:LinkButton ID="LinkButton1" runat="server" Text="Entre (é grátis) &nbsp;" Height="25px" Width="125px" /></div>
			                		</td>
			                	</tr>
			                </table>
                        </form>
					</td>
				</tr>
			</table>
		</TD>
		<TD width="40px">&nbsp;</TD>
		<TD width="130px">
			<table border="0" cellPadding="0" cellSpacing="0" width="120px" style="border-collapse:collapse; border-spacing:0">
				<tbody>
				<tr><td background="images/menu11.gif" height="70" width="120" /></tr>
				<tr><td background="images/menu13.gif" height="10" width="120" /></tr>
				<tr><td background="images/menu12.gif" height="10" width="120" /></tr>
				<tr><td background="images/menu14.gif">
					<table border="0" cellPadding="5" cellSpacing="0" width="120px">
						<tbody>
							<tr><td>
							<P align="left">
							<b><font face="Verdana" color="#ff3333">NOSSAS ENQUETES.</font></b>
							<font color="#000080"><br />-Fornece subsídios<br />-Interação total</font>
							<b><font color="#ff3333"><br /><br />VEJA ESTA:</font></b>
							</td></tr>
						</tbody>
					</table>
<%
    string connString = System.Configuration.ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
    using (OdbcConnection Conexao = new OdbcConnection(connString))
    {
        int tot = 0;
        int refC = 0;
        string queryString = "SELECT MAX(ENQ_Cod) AS max_Cod FROM Enquetes";
        OdbcCommand command = new OdbcCommand(queryString, Conexao);
        // Open the connection in a try/catch block.
        try
        {
            Conexao.Open();
            OdbcDataReader reader = command.ExecuteReader();
            reader.Read();
                refC = Convert.ToInt16(reader["max_Cod"].ToString());
                Random rnd = new Random();
                refC = rnd.Next(0, refC);
            reader.Close();
%>
					<script language="JavaScript">
<!--//
					function Vote(obj){
						var URL = 'Sabio02.aspx?ID=<%=refC%>&Voto=' + obj
						location.href = URL
					}
//-->
					</script>
<%
            queryString = "SELECT * FROM Enquetes WHERE ENQ_Cod = " + refC;
            command = new OdbcCommand(queryString, Conexao);
            OdbcDataReader Clicks = command.ExecuteReader();
            Clicks.Read();
%>
					<table border="0" cellPadding="3" cellSpacing="1" width="120px" style="font-size:7pt">
						<tbody>
							<tr>
                                <td colspan="2" style="font-size:8pt"><%=Clicks["ENQ_Cod"]%>. <b><%=Clicks["ENQ_Desc"]%></b></td>
							</tr>
							<tr>
                                <td><%tot = Convert.ToInt16(Math.Round((Convert.ToDecimal(Clicks["ENQ_Aa"].ToString()) / Convert.ToDecimal(Clicks["ENQ_Total"].ToString())) * 100));%><input type="radio" onClick="Vote('ENQ_Aa')" /></td>
								<td><%=tot%>% <%=Clicks["ENQ_A"]%></td>
							</tr>
							<tr>
                                <td><%tot = Convert.ToInt16(Math.Round((Convert.ToDecimal(Clicks["ENQ_Bb"].ToString()) / Convert.ToDecimal(Clicks["ENQ_Total"].ToString())) * 100));%><input type="radio" onClick="Vote('ENQ_Bb')" /></td>
								<td><%=tot%>% <%=Clicks["ENQ_B"]%></td>
							</tr>
							<tr>
                                <td><%tot = Convert.ToInt16(Math.Round((Convert.ToDecimal(Clicks["ENQ_Cc"].ToString()) / Convert.ToDecimal(Clicks["ENQ_Total"].ToString())) * 100));%><input type="radio" onClick="Vote('ENQ_Cc')" /></td>
								<td><%=tot%>% <%=Clicks["ENQ_C"]%></td>
							</tr>
							<tr>
                                <td><%tot = Convert.ToInt16(Math.Round((Convert.ToDecimal(Clicks["ENQ_Dd"].ToString()) / Convert.ToDecimal(Clicks["ENQ_Total"].ToString())) * 100));%><input type="radio" onClick="Vote('ENQ_Dd')" /></td>
								<td><%=tot%>% <%=Clicks["ENQ_D"]%></td>
							</tr>
							<tr>
                                <td colspan="2" style="font-size:8pt" align="center"><br /><a href="Sabio16.aspx"><b>Ver Todas</b></a></td>
							</tr>
						</tbody>
					</table>
<%
            Clicks.Close();
            Conexao.Close();
        }
        catch (Exception ex)
        {
            var perg1 = ex.Message;
        }
        Conexao.Dispose();
    }
%>
				</td></tr>
				<tr><td background="images/menu16.gif" height="36" width="120" /></tr>
				<tr align="center"><td><br /><span style="font-size:7pt">Copyright &copy;2000<br />by Borg.</span></td></tr>
				</tbody>
			</table>
		</TD>
	</TR>
	</TBODY>
</TABLE>
<p> </p>
</BODY></HTML>