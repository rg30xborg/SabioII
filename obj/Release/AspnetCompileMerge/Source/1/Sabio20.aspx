<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sabio20.aspx.cs" Inherits="Sabio._1.Sabio20" %>
<%@ Import Namespace="System.Data.Odbc" %>
<%@ Import Namespace="System.Globalization" %>

<!DOCTYPE html>

<Script Language="JScript" src="scripts/SimplesC.js"></Script>
<html><head><title>Sabichao</title><style>@import url(images/coUC.css);</style></head>
<body bgColor="#FFFFFF" background="../mundi.gif" leftMargin="0" topMargin="0" marginwidth="0" marginheight="0">
<table border="0" cellPadding="0" cellSpacing="0" width="100%">
	<tbody>
	<tr align="center" valign="top">
		<td width="130px">
			<!-- #include file = "sabio01.inc" -->
		</td>
		<td width="40px">&nbsp;</td>
		<td>
<p align="left" style="font-size: 10pt">
	Exemplo de Sala: <font color="#0588C0"><b>PRÊMIOS</b></font>
	<span style="font-size: 8pt"><br>
	 - ARRISQUE SEUS PONTOS NOS PRÊMIOS DO SABICHÃO
	</span>
</p>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr valign="TOP"> 
		<td width="5%"></td>
		<td bgcolor="#ffcc00" width="2%"><img src="images/cant01s.gif" /></td>
		<td bgcolor="#ffcc00" width="86%" style="font-size: 9pt; align:justify;">EXEMPLOS DE PRÊMIOS:
			<span style="color:#0000FF;">
				<br><b>Aqui apresentamos exemplos de Prêmios (*) que serão sorteados (em breve). Você poderá colocar livremente seus  
				pontos nos Prêmios que lhe agradar, depois, é só aguardar e acompanhar as datas dos sorteios que estiver concorrendo.</b>
			</span>
				<%--<br><br>(*) Eventuais prêmios só serão entregues, se seus <font color="blue"><b>Dados Cadastrais</b></font> forem
				Verdadeiros, e o link <font color="blue"><b>www.aggora.com.br/sabio</b></font> ter sido compartilhado em uma de suas 
				<font color="blue"><b>redes sociais</b></font> antes do sorteio do Prêmio.</b>--%>
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
			<table border="0" width="100%" cellspacing="0" cellpadding="5">
				<tr>
					<td><b>Prêmio / Apoio</b></td>
					<td><b>Data do Sorteio</b></td>
					<td><b>Total de Apostas</b></td>
					<td><b>Apostar</b></td>
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
					<td colspan="4"><b>Nenhum Premios programado para o momento. Aguarde para Breve.</b></td>
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
					<td><input type="TEXT" name="Bot<%=codigo%>" size="5" maxlength="5"></td>
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
<p>
            <div width="100%" height="40px" style="background-color:#0f4baf; text-align:left; width:auto; height:40px;">
                <img height="40" src="images/supdate03.gif" width="27" style="float:left" /><span class="textvalignmiddle" style="font-size:large; font-family:Verdana, Arial, Helvetica, sans-serif; color:#ffffff"><b><i>DESCRIÇÃO</i></b></span><img height="40" src="images/supdate02.gif" width="27" style="float:right" />
            </div>
<p>
 			<table border="0" cellpadding="0" cellspacing="0" width="90%" style="font-family: Arial; font-size:9pt">
				<tr>
					<td>
				<p align=justify>Estamos trabalhando firme para que os prêmios sejam disponibilizados o mais
				rápido possível, e tão logo sejam implementados você recebera um e-mail avisando-o da novidade.
				Assim, nesta fase de implantação, você poderá acumular quantos PONTOS desejar, pois eles valerão
				para serem arriscados nos prêmios quando de sua efetiva implementação.</p>
					</td>
				</tr>
			</table>
<p>
 			<table border="0" cellpadding="0" cellspacing="0" width="90%" style="font-family: Arial; font-size:9pt">
				<tr>
					<td>
				<B><I>COMO ENTRAR NO JOGO</I></B>
				<p align="justify">Nos campos do formulário à direita, digite seu Log-in (<b><font color=red>E-MAIL completo</font></b>) e uma
				SENHA exclusiva para este Site-Jogo. Pronto você automaticamente já estará registrado no Sabichão, e entrara
				no ambiente do jogo. Mas lembre-se, para concorrer aos prêmios quando estes estiverem disponíveis você deverá completar seus dados
				cadastrais, ou atualiza-los. Eles podem ser alterados (exceto e-mail) a qualquer momento a partir
				da página interna [Menu] com um clique simples em [Alterar Cadastro].</p>
					</td>
				</tr>
				<tr>
					<td align="right" height="30">Quero uma amostra <%--<a href="demos/sabio01.htm">Mini-Demo</a> | --%><a href="sabio23.aspx">Full-Demo</a> antes de Cadastrar-me.</td>
				</tr>
			</table>
		</td>
		<td width="40px">&nbsp;</td>
		<td width="130px">
			<table border=0 cellPadding=0 cellSpacing=0 width="120px" style="border-collapse:collapse; border-spacing:0">
				<tbody>
				<tr><td background="images/menu11.gif" height="70" width="120" /></tr>
				<tr><td background="images/menu13.gif" height="10" width="120" /></tr>
				<tr><td background="images/menu12.gif" height="10" width="120" /></tr>
				<tr><td background="images/menu14.gif">
        <form id="logonForm" runat="server" action="Sabio10.aspx" method="get" onsubmit="return verifica()">
            <br>
	    	<table cellspacing="1" cellpadding="2" width="120px" style="font-family: Arial; font-size:8pt;color:#000080">
	    		<tr>
	    			<td align="right"><b>Seu Log-in</b>:&nbsp;<br />
                           <asp:TextBox ID="userlogon" name="userlogon" runat="server" style="width:100px" maxlength="30" />
	    			    <br /><span style="font-size:8pt"> (E-mail completo)</span></td>
	    		</tr>
	    		<tr>
	    			<td align="right"><b>Uma Senha</b>:&nbsp;<br />
                           <asp:TextBox ID="userpassw" name="userpassw" runat="server" style="width:100px" maxlength="12" TextMode="Password" />
	    			    <br /><span style="font-size:8pt"> (Mínimo 6 Caracteres)</span></td>
	    		</tr>
	    		<tr>
	    			<td align="center">
                        <%--<br /><input type="submit" value="Entre (é gratis)" name="lggonAgn" style="cursor:pointer; border:0;background-color:rgb(204,204,204);background-image:url('images/bt3.gif');width:115px;height:25px" />
                        <br /><asp:ImageButton ID="ImageButton1" runat="server" Height="25px" ImageAlign="Right" ImageUrl="images/bt3-Entre.gif" OnClick="ImageButton1_Click" Width="115px" AlternateText="Entre (É Gratis)" />--%>
                        <div style="width:115px; height:25px;text-align:center; background-image: url('images/bt3.gif'); background-repeat: no-repeat; vertical-align:bottom; cursor: pointer; line-height: 25px;"><asp:LinkButton ID="LinkButton1" runat="server" Text="Entre (é grátis)" Height="25px" Width="115px" /></div>
					</td>
	    		</tr>
	    	</table>
        </form>
				</td></tr>
				<tr><td background="images/menu16.gif" height="36" width="120" /></tr>
				<tr align=center><td><br><span style="font-size:7pt">Copyright &copy;2000<br>by Borg.</span></td></tr>
				</tbody>
			</table>
			<p><a href="extra02.htm">Regras</a><br><a href="sabio21.aspx">Já sorteados</a><br><a href="#" onClick="Help1()">Ajuda</a></p>
		</td>
	</tr>
	</tbody>
</table>
<div id="INV002" style="position:absolute; width: 100%; height: 60px; left:0px; top:2px; z-index: 8; visibility: inherit"><marquee behavior="scroll" direction="right" scrollamount="5"><img src="images/coelho2R.gif" width="60" height="60" /></marquee></div>
<p> </p>
</body></html>