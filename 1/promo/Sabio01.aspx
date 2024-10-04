<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sabio01.aspx.cs" Inherits="Sabio._1.promo.Sabio01" %>
<%@ Import Namespace="System.Data.Odbc" %>

<!DOCTYPE html>

<Script Language="JScript" src="../scripts/SimplesA.js"></Script>
<html><head><title>Sabichao</title><style>@import url(../images/coUC.css);</style></head> 
<body bgcolor="#FFFFFF" onLoad="OnCarg()">
<p style="font-size: 10pt">
	Sala de: <font color="#0588C0"><b>PROMOÇÕES - INDIQUE UM AMIGO</font><Span ID="NCalc"> - Carregando .... </Span></b>
	<span style="font-size: 9pt"><br>
	 - AQUI VOCÊ GANHA PONTOS SEM PRECISAR QUEIMAR CEREBELOS
	</span>
</p>
<form method="GET" name="formProm">
<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#44AA00" width="2%"><img src="../images/cant01s.gif"></td>
		<td bgcolor="#44AA00" width="64%" style="font-size: 9pt; color: #FFFFFF">
			</b><span style="font-size:12pt"><b>Indique um Amigo para o Sabichão</span>
			<br>Ganhe <font color="#FFFF00">500 Pontos</font> por indicação válida + <font color="#FFFF00">500
			Pontos</font> caso o indicado se cadastre no Sabichão. É so preencher e clicar na
			seta da direita para <font color="#FFFF00">EVIAR E GANHAR</font>.</b>
		</td>
		<td bgcolor="#44AA00" width="2%" align="RIGHT"><img src="../images/cant02s.gif"></td>
		<td width="24%" align="CENTER" valign="TOP">
			<b><font style="font-size: 14pt; color: #F94942">Ganhe</font>
			<br><font style="font-size: 12pt">até<br>1000 pontos</b></font>
		</td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#44AA00" width="2%"><img src="../images/cant01ii.gif"></td>
		<td bgcolor="#44AA00" width="64%">OS ANOTADOS EM <b><font color="#FF0000">VERMELHO</font></b> SÃO NECESSÁRIOS</td>
		<td bgcolor="#44AA00" width="2%" align="RIGHT"><img src="../images/cant02ii.gif"></td>
		<td width="24%" align="CENTER" valign="TOP"></td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#AAEE22" width="2%" valign="BOTTOM"><img src="../images/cant03i.gif"></td>
		<td bgcolor="#AAEE22" width="64%"><br>
			<table width="100%" cellspacing="1" cellpadding="0" style="font-family: Arial; font-size:9pt">
				<tr>
					<td align="right">De:&nbsp;</td>
					<td><%=Session["IPUserSab"]%></td>
				</tr>
				<tr>
					<td align="right">Email:&nbsp;</td>
					<td><%=Session["mail"]%><input type=hidden name="email_cliente" value="<%=Session["mail"]%>"></td>
				</tr>
				<tr>
					<td align="right" style="color: red"><b>Nome do Amigo(a):&nbsp;</b></td>
					<td><input name="nome_indicado" style="width:100%" maxlength=30></td>
				</tr>
				<tr>
					<td align="right" style="color: red"><b>E-mail do Amigo:&nbsp;</b></td>
					<td><input name="email_indicado" style="width:100%" maxlength=30></td>
				</tr>
				<tr>
					<td align="right">Assunto:&nbsp;</td>
					<td>Convite para conhecer o Site Sabichão Web</td>
				</tr>
				<tr>
					<td align="right">Texto&nbsp;<br>opcional:&nbsp;</td>
					<td><textarea style="width:100%;height:60" name="info_usuario" maxlength="255">O link do Site é: http://www.aggora.com.br/sabio - Um Site-Quiz que dá Prêmios aos participantes</textarea></td>
				</tr>
				<tr>
					<td colspan=2><br>
<% if (erro != "") { %>
						<marquee behavior="alternate" title="Mensagem de Retorno aqui !!" ><b>INDICAÇÃO CANCELADA:</b> <%=erro%>.</marquee>
<% } %>
						<br>
					</td>
				</tr>

			</table>
		</td>
		<td bgcolor="#AAEE22" width="2%" align="RIGHT" valign="BOTTOM"><img src="../images/cant04i.gif"></td>
		<td width="24%" align="CENTER" valign="MIDDLE">
			<p><input type="button" value="Seu Talento" style="cursor:pointer;border:0;background-color:rgb(255,255,255);background-image:url('../images/bt3.gif');width:115px;height:25px" onClick="location.href='Sabio06.aspx'"></p>
			<img name="botao" src="../images/botpg.gif" width="97" height="56" onClick="verifica()" onMouseOver="onBotao()" onMouseOut="ofBotao()">
			<p><input type="button" value="Anti-Spam" style="cursor:pointer;border:0;background-color:rgb(255,255,255);background-image:url('../images/bt3.gif');width:115px;height:25px" onClick="parent.location.href='../extra04.htm'"></p>
		</td>
	</tr>
</table>
</form>
<table cellspacing="0" cellpadding="0" width="100%" style="font-family: Arial; font-size:9pt">
	<tr>
		<td><p align="justify">Após preencher os campos necessários acima, envie sua indicação para ganhar Pontos 
			Extras. Caso seu indicado seja válido voce ganha 500 pontos e, + 500 pontos se o seu indicado se 
			Cadastrar no nosso Site em até 10 dias. Esses pontos serão adicionados ao seu total pela Promoção assim 
			que validados. Indique quantos amigos desejar. Veja abaixo os que você já indicou.</p></td>
	</tr>
</TABLE>
<center><hr>
<table width="90%" style="font-size: 12pt">
	<tr>
		<td><b>Amigos já Indicados por Você</b>:</td>
	</tr>
</table>
<%
    //Checa se existem Apostas dste Usuários no Premio selecionado
    string connString = System.Configuration.ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
    OdbcConnection Conexao = new OdbcConnection(connString);

    using (Conexao)
    {
        string queryString = "SELECT * FROM Promos WHERE USR_ID = " + Session["id"] + " ORDER BY PRM_Cod DESC";
        OdbcCommand command = new OdbcCommand(queryString, Conexao);
        // Open the connection in a try/catch block.
        try
        {
            Conexao.Open();
            OdbcDataReader Promos = command.ExecuteReader();
            if (!Promos.HasRows)
            {
%>
<table width="90%">
	<tr>
		<td bgcolor='#FFFFDF'>
			Você ainda não indicou nenhum amigo para esta Promoção. Aproveite agora e fature pontos Extras..
		</td> 
	</tr>
</table>
<%
	        }
            else
            {
%>
<table width="90%" cellspacing="2" cellpadding="1" style="color: #0000FF; font-size: 10pt">
	<tr align="center" bgcolor="#FFCC66">
		<td width="7%"><b>Cod.</b></td>
		<td width="30%"><b>Nome do Indicado</b></td>
		<td width="30%"><b>E-mail do Indicado</b></td>
		<td width="19%"><b>Data</b></td>
		<td width="7%"><b>Val.</b></td>
		<td width="7%"><b>Cnf.</b></td>
	</tr>
</table>
<%
                string bgcl = "bgcolor=#FFFFEE";
                while (Promos.Read())
                {
                    if (bgcl == "bgcolor=#FFFFEE") bgcl = "bgcolor=#FFFFDF"; else bgcl = "bgcolor=#FFFFEE";
%>
<table width="90%" cellspacing="2" cellpadding="1">
	<tr <%=bgcl%>>
		<td align="center" width='7%'><%=Promos["PRM_Cod"]%></td> 
		<td width='30%'><%= Promos["PRM_Nome_Indicado"]%></td> 
		<td width='30%'><%= Promos["PRM_Email_Indicado"]%></td>
		<td width='19%'><%= Convert.ToDateTime(Promos["PRM_Inclusao"]).ToString("dd/MM/yyyy") %></td> 
 		<td width="7%" align="center">
<%
                    if (Promos["PRM_Valido"].ToString() == "1")
                        Response.Write("Sim");
                    else
                        if (Promos["PRM_Data_Extra"] == null) Response.Write("Não"); else Response.Write("(?)");
%>		</td>
		<td width="7%" align="center">
<%
                    if (Promos["PRM_Confirmado"].ToString() == "1") Response.Write("Sim"); else Response.Write("Não");
%>
		</td>
	</tr>
<%
                }
%>
</table>
<%
            }
            Conexao.Close();
            Conexao.Dispose();
        }
        catch (Exception ex)
        {
            var perg1 = ex.Message;
        }
    }
%>
<br>
<hr>
* * * RG Sabichão Web - Versão 2000a * * *
<hr>

</center>
</body></html>