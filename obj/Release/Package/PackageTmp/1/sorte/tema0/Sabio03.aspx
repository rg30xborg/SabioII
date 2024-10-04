<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sabio03.aspx.cs" Inherits="Sabio._1.sorte.tema0.Sabio03" %>
<%@ Import Namespace="System.Data.Odbc" %>
<%@ Import Namespace="System.Globalization" %>

<!DOCTYPE html>

<Script Language="JScript"> var cred = <%=libok%>, pSala = <%=libSl%>; pPremio = "<%=libPr%>" </Script>
<Script Language="JScript" src="../../scripts/Simpl3a.js"></Script>
<HTML><HEAD><TITLE>RG 3.0 - Sabichão Web</TITLE>
<style>@import url(../../images/coUC.css);</style>
</HEAD><body bgcolor=#FFFFFF scroll="auto" onLoad="Aviso3()">
<p style="font-size: 10pt">
	Sala de: <font color="#0588C0"><b>MINHAS APOSTAS</font><Span ID="NCalc"> - Criando Ambiente II ...</Span></b>
	<span style="font-size: 9pt"><br>
	 - CONFIRA AQUI SUAS APOSTAS NOS PRÊMIOS DO SABICHÃO
	 - Prêmio: <font color="#0000FF"><span ID="Reg15"><%=libPr%></span> (em: <%=libDt%>)</font>
	 - Pontos da Apostas: <font color="#0000FF"><span ID="Reg18"><%=libAps%></span> pontos</font>
	</span>
</p>
<%  	CultureInfo idioma = new CultureInfo("pt-Br");
        if (libTx != "") { %>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#585858" width="2%" align="LEFT"><img src="../../images/cant01s.gif"></td>
		<td bgcolor="#585858" width="80%" align=center>
			<font color="#FFFFFF">
				<br /><b><span ID="Reg17a">DADOS DO PRÊMIO...</span></b><br />
				<br />Codigo: <b><%=libCd%></b> - Codhex: <b><%=libHx%></b>
				<br />Premio: <b><%=libPr%></b>
				<br />Data do Sorteio: <b><%=Convert.ToDateTime(libDt.ToString()).ToString("D",idioma)%></b><br /><br />
			</font>
		</td>
		<td bgcolor="#585858" width="2%" align="RIGHT"><img src="../../images/cant02s.gif"></td>
		<td width="8%"></td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#585858" width="2%" align="LEFT"><img src="../../images/cant01ii.gif"></td>
		<td bgcolor="#585858" width="80%" align=center><span ID="Reg16" style="color:white;font-weight:bold">Aguarde...</Span></td>
		<td bgcolor="#585858" width="2%" align="RIGHT"><img src="../../images/cant02ii.gif"></td>
		<td width="8%"></td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#C0C0C0" width="2%" valign="BOTTOM" align="LEFT"><img src="../../images/cant03i.gif"></td>
		<td bgcolor="#C0C0C0" width="80%" align=center>
			<font color="#000000">
				<br /><b><span ID="Reg17b">DADOS DA APOSTA...</span></b><br />
                <br />Codhex: <b><%=libHx%></b>
				<br />Credito: <b><%=libok%></b> - Aposta: <b><%=libAps%></b> - Saldo: <b><%=(libok-libAps)%></b> 
                <br />Data desta Aposta: <b><%=DateTime.Today.ToString("D",idioma)%></b>
				<br />Dezenas: <b><%=libTx%></b><br /><br />
			</font>
		</td>
		<td bgcolor="#C0C0C0" width="2%" align="RIGHT" valign="BOTTOM"><img src="../../images/cant04i.gif"></td>
		<td width="8%" align="CENTER"><td>
	</tr>
</table><br>
<%  	} %>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr> 
		<td>
		<p align="justify">No final desta Sala você Acompanha e Confere suas apostas registradas nos Prêmios do Site.
		IMPORTANTE: para concorrer efetivamente nos sorteios de Prêmios oferecidos, confira detalhes em: <a href="../../extra02.htm">Regras</a>,
		sendo que três itens merecem destaque: (1)Estar cadastrado no Site, com <b>dados verdadeiros</b> e uma única vez; (2)
		<font color=blue>Compartilhar o link <b>www.aggora.com.br/sabio</b></font> em ao menos uma de suas redes sociais, antes do sorteio do
		Prêmio e; (3)Realizar a aposta nos Prêmios de seu interesse, quantas vezes quiser e seu pontos acumulados o permitirem. Os resultados
		serão os anunciado pela Mega-Sena da Caixa (CEF) no Dia do Sorteio do Prêmio. Boa Sorte!</p>
	<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr valign="MIDDLE"> 
		<td nowrap>
			Como e o quê você ganha ->
			<br> - Acertando a SENNA 6 dezenas: <b>O Prêmio(*)</b>;
			<br> - Acertando a QUINNA 5 dezenas: Devolução de 50% dos Pontos da aposta;
			<br> - Acertando a QUADRRA 4 dezenas: Devolução de 20% dos Pontos da aposta;
			<br> - Acertando a BIT-SENNA Somente 1 dezena: Devolução de 10% dos Pontos da aposta;
			<br> - Prêmio não cumulativo: Vale apenas o maior.
		</td>
		<td align="center">Importante:<br>
			<img src="../../images/luminoso.gif" width=40 height=40>
			<br>Compartilhe o link <font color=blue><b>www.aggora.com.br/sabio</b></font> em suas redes sociais!!!
		</td>
	</tr>
	</table>
		<p>(*) havendo mais de um ganhador o valor do Prêmio será dividido entre os vencedores e neste caso Devolução INTEGRAL dos Pontos da 
		aposta. - Se tiver alguma sugestão ou crítica sobre o Giga-Senna, envie e-mail para: <a href="mailto:contato@aggora.com.br">Contate-nos</a></p>
		</td>
	</tr>
</table>
<center><hr>
<table width="90%">
	<tr>
		<td style="font-size: 12pt">
			<b>Confira aqui suas Apostas Registradas no Site.</b>
		</td>
	</tr>
</table>
<%
    //Checa se existem Apostas dste Usuários no Premio selecionado
    string connString = System.Configuration.ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
    OdbcConnection Conexao = new OdbcConnection(connString);

    using (Conexao)
    {
        string queryString = "SELECT USA_Cod, USA_Dez, PRE_Desc, PRE_Data, PAT_Nome, USA_Apts, USA_Data FROM Premios_Apostas PA, Premios PP, Patrocinio PT WHERE PA.PRE_Cod = PP.PRE_Cod and PP.PAT_Cod = PT.PAT_Cod and PA.USR_ID = " + Session["id"] + " ORDER BY USA_Cod DESC";
        OdbcCommand command = new OdbcCommand(queryString, Conexao);
        // Open the connection in a try/catch block.
        try
        {
            Conexao.Open();
            OdbcDataReader Apostas = command.ExecuteReader();
            if (!Apostas.HasRows)
            {
%>
<table width="90%">
	<tr>
		<td bgcolor='#FFFFDF'>Você ainda não investiu Pontos em Prêmios. Confira ofertas em: <a href="../../Sabio07.aspx">Prêmios...</a></td>
	</tr>
</table>
<%
	        }
            else
            {
%>
<table width="90%" cellspacing="2" cellpadding="1">
	<tr align="center" bgcolor="#FFCC66" style="color: #0000FF; font-size: 10pt">
		<td><b>Nº</b></td>
		<td><b>Dezenas da Aposta / Prêmio / Apoio</b></td>
		<td><b>Aposta</b></td>
		<td><b>Data&nbsp;da&nbsp;Aposta</b></td>
		<td><b>Data&nbsp;do&nbsp;Sorteio</b></td>
	</tr>
<%
                string bgcl = "bgcolor=#FFFFEE";
                while (Apostas.Read())
                {
                    if (bgcl == "bgcolor=#FFFFEE") bgcl = "bgcolor=#FFFFDF"; else bgcl = "bgcolor=#FFFFEE";
%>
	<tr <%=bgcl%>>
		<td align="center"><%=Apostas["USA_Cod"]%></td>
		<td>Dezenas: <b><%=Apostas["USA_Dez"]%></b>
			<br>Prêmio: <b><%=Apostas["PRE_Desc"]%></b>
			<br>Patrocínio: <b><%=Apostas["PAT_Nome"]%></b></td>
 		<td align="center" nowrap><%=Apostas["USA_Apts"]%></td>
		<td align="center" nowrap><%=Apostas["USA_Data"]%></td>
		<td align="center" nowrap><%=Convert.ToDateTime(Apostas["PRE_Data"]).ToString("dd/MM/yyyy")%><br><%=Convert.ToDateTime(Apostas["PRE_Data"].ToString()).ToString("dddd",idioma)%></td>   <%--DayOfWeek--%>
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
<embed name="somregis" src="/_Library/rgcaixa.wav" loop="false" autostart="false" hidden="true" width="0" height="0"></embed>
</BODY></HTML>
