<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sabio07.aspx.cs" Inherits="Sabio._1.Sabio07" %>
<%@ Import Namespace="System.Data.Odbc" %>

<!DOCTYPE html>

<Script Language="JScript"> var pTotal =<%=pTotal%>; pNome = "<%=Session["IPUserSab"]%>"; </Script>
<Script Language="JScript" src="scripts/SimplesB.js"></Script><html><head>
<title>Sabichao</title><style>@import url(images/coUC.css);</style></head>
<body bgcolor="#FFFFFF" onLoad="OnCarg()">
<p style="font-size: 10pt">
	Sala de : <font color="#0588C0"><b>PRÊMIOS</font><Span ID="NCalc"> - Carregando .... </Span></b>
	<span style="font-size: 9pt"><br>
	 - ARRISQUE SEUS PONTOS NOS PRÊMIOS DO SABICHÃO - <font color="#0000FF"><b>Disponíveis para aposta: <span ID="Total"><%=pTotal%></span> Pontos</b></font>
	</span>
</p>
<center><table border="0" width="90%" cellspacing="0" cellpadding="0">
	<tr valign="TOP"> 
		<td width="2%"></td>
		<td bgcolor="#ffcc00" width="2%"><img src="images/cant01s.gif"></td>
		<td bgcolor="#ffcc00" width="94%">VOCÊ JA INVESTIU (<%=pSala%>) PONTOS NOS SORTEIOS DO SITE
			<span style="font-size: 9pt; align:justify;">
				<br><b>Aqui apresentamos os Prêmios (*) que serão sorteados nos próximos dias. Coloque 
				livremente seus pontos no(s) Prêmio(s) que lhe agradar, depois, é só aguardar e acompanhar as
				datas dos sorteios que estiver concorrendo. (Página em Desenvolvimento).</b>
			</span>
		</td>
		<td bgcolor="#ffcc00" width="2%" align="RIGHT"><img src="images/cant02s.gif"></td>
		<!-- <td width="24%" align="CENTER" valign="middle"></td> -->
	</tr>
	<tr valign="TOP"> 
		<td width="2%"></td>
		<td bgcolor="#ffcc00" width="2%"><img src="images/cant01ii.gif"></td>
		<td bgcolor="#ffcc00" width="70%"></td>
		<td bgcolor="#ffcc00" width="2%" align="RIGHT"><img src="images/cant02ii.gif"></td>
		<!-- <td width="24%" align="CENTER" valign="TOP"></td> -->
	</tr>
	<tr valign="TOP"> 
		<td width="2%"></td>
		<td bgcolor="#ffff99" width="2%" valign="BOTTOM"><img src="images/cant03i.gif"></td>
		<td bgcolor="#ffff99" width="70%">
			<form name="Aposta">
			<table border="0" width="100%" cellspacing="0" cellpadding="5">
				<tr>
					<td><b>Pr&ecirc;mio / Apoio</b></td>
					<td><b>Data do Sorteio</b></td>
					<td><b>Apostas / Total</b></td>
					<td><b>Apostar</b></td>
				</tr>
<%
    string bgcolor = "#FFFFDF";
    string connString = System.Configuration.ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
    OdbcConnection Conexao = new OdbcConnection(connString);
    using (Conexao)
    {
        int Pontos = 0;
        string queryString = "SELECT *, HEX(UUID) as pUUID FROM Premios P, Patrocinio DE WHERE P.PAT_Cod = DE.PAT_Cod ORDER BY P.PRE_Data";
        OdbcCommand command = new OdbcCommand(queryString, Conexao);
        command.CommandTimeout = 120;
        // Open the connection in a try/catch block.
        try
        {
            Conexao.Open();
            OdbcDataReader Premios = command.ExecuteReader();
            if (!Premios.HasRows)
            {
%>
				<tr bgcolor="#FFD699"> 
					<td colspan=4><b>Nenhum Premios programado para o momento. Aguarde para Breve.</td>
				</tr>
<%
            }
            else
            {
                int ultMdia = 1;
                while (Premios.Read())
                {
                    if (bgcolor == "#FFFFDF") bgcolor = "#FFEDA7"; else bgcolor = "#FFFFDF";
                    //string pUuid = Premios["pUUID"];
                    int pDias = (Convert.ToDateTime(Premios["PRE_Data"]) - DateTime.Today).Days;
                    int preEsp = Convert.ToInt16(Premios["PRE_Special"]);
                    if ((pDias >= 0 && pDias < 200) || (preEsp == 1 && pDias >= 0))
                    {
                        var codigo = Premios["PRE_Cod"];
                        string queryString1 = "SELECT SUM(USA_Apts) MyTOT FROM Premios_Apostas WHERE USR_ID = " + Session["id"] + " And PRE_Cod = " + codigo;
                        OdbcCommand command1 = new OdbcCommand(queryString1, Conexao);
                        try
                        {
                            OdbcDataReader ApostaPremio = command1.ExecuteReader();
                            if (!ApostaPremio.HasRows)
                                Pontos = 0;
                            else
                            {
                                ApostaPremio.Read();
                                Pontos = Convert.ToInt16(ApostaPremio["MyTOT"]);
                                ApostaPremio.Close();
                            }
                        }
                        catch
                        {
                            Pontos = 0;
                        }
%>
	        			<tr bgcolor="<%=bgcolor%>"> 
	        				<td><b><%=codigo%>) <%=Premios["PRE_Desc"]%></b><br><%=Premios["PAT_Nome"]%></td>
	        				<td><%=Convert.ToDateTime(Premios["PRE_Data"]).ToString("dd/MM/yyyy")%><br><%=Convert.ToDateTime(Premios["PRE_Data"].ToString()).DayOfWeek%></td>
	        				<td><span id="Pts<%=codigo%>"><%=(Pontos == 0 ? "Não apostei aki!" : "Tô nessa: " + Pontos)%></span>
	        				<br><span id="Pgs<%=codigo%>"><%=("T: " + Premios["PRE_Apts"])%></span></td>
	        				<td>
                            <% if (pTotal >= 900 && Request["Err"] == null) { %>
	        					<input type="BUTTON" id="Butt<%=codigo%>" name="Butt<%=codigo%>" value="Apostar" onclick="self.location='sorte/tema0/Sabio01.aspx?premio=<%=Premios["pUUID"]%>'">
                            <% } else { %>
	        					<input type="BUTTON"  value="Apostas?" onclick="alert('RG 3.0 Informação (º_º):\n\nPara concorrer aos Prêmios e estar com as apostas liberadas\n - São necessários um mínimo de 900 Pontos adquiridos.\n - No momento você tem: <%=pTotal%> Pontos');">
                            <% } %>
	        				</td>
	        			</tr>
<%
                        ultMdia = ultMdia + 1;
                    }
                }
                if (ultMdia == 1)
                {
%>
				<tr bgcolor="#FFD699"> 
					<td colspan=4><b>Nenhum Premios programado para o momento. Aguarde para Breve.</td>
				</tr>
<%
                }

            }
            Conexao.Close();
        }
        catch (Exception ex)
        {
            var perg1 = ex.Message;
        }
    }

    if (bgcolor == "#FFFFDF") bgcolor = "#FFEDA7"; else bgcolor = "#FFFFDF";

%>
				<tr bgcolor="<%=bgcolor%>">
					<td colspan=4>
				<img src="images/luminoso.gif" width=25 height=25  style="vertical-align: middle;" align="left">
				(*) Eventuais prêmios só serão entregues, se seus <font color="blue"><b>Dados Cadastrais</b></font> forem
				Verdadeiros, e o link <font color="blue"><b>www.aggora.com.br/sabio</b></font> ter sido compartilhado em uma de suas 
				<font color="blue"><b>redes sociais</b></font> antes do sorteio do Prêmio.
				<center><a href="extra02.htm">regras</a> | <a href="sorte/tema0/Sabio03.aspx">minhas apostas</a> | <a href="Sabio21.aspx">já sorteados</a> | <a href="#" onClick="Help1()">Ajuda</a></center>
					</td>
					<!-- <td></td>
					<td></td>
					<td></td> -->
				</tr>
			</table>
                <br />
			</form>
		</td>
		<td bgcolor="#ffff99" width="2%" align="RIGHT" valign="BOTTOM"><img src="images/cant04i.gif"></td>
		<!-- <td width="24%" align="CENTER" valign="MIDDLE"></td> -->
	</tr>
</table></center>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr> 
		<td>
			<p>&nbsp;</p>
			<p  align="justify">Se seus pontos acumulados estiverem acima de 900 Pontos, as apostas nos Prêmios estarão disponíveis até 
			um dia antes da Data do Sorteio.
			<br><b>COMO APOSTAR:</b> (1)Escolha o PRÊMIO que desejar clicando no Botão [ Apostar ] correspondente a este.
			(2)Após o clique em [Apostar], voce será direcionado para a Sala de Aposta neste PRÊMIO. (3a)Na Sala de Aposta você
			primeiramente escolhe a quantidade de dezenas (de 10 a 15 dezenas) que pretende apostar, conferindo a respectiva quantia
			de Pontos que esta aposta representa. (3b)A partir de uma aposta validada você preencherá a Cartela do 
			<b>RG Giga-Senna Web</b> com as dezenas de sua posta. (3c)Concluída as fases anterioras você poderá: [Simular&nbsp;Aposta]
			quantas vezes quizer em um sorteio local, somente para consulta, ou; [Remeter&nbsp;Aposta] para enviar a aposta e efetivar 
			seu Registro. - Isto é tudo. Boa Sorte!. Se tiver alguma sugestão ou crítica sobre o Site, envie-nos um e-mail para: 
			<a href="mailto:contato@aggora.com.br">contato@aggora.com.br</a></p>
		</td>
	</tr>
</table>
<br>
<center>
<hr>
* * * RG Sabichão Web - Versão 2000a * * *
<hr>
</center>
<div id="INV002" style="position:absolute; width: 100%; height: 60px; left:0px; top:2px; z-index: 8; visibility: inherit"><marquee behavior="scroll" direction="right" scrollamount="5"><img src="images/coelho2R.gif" width="60" height="60"></marquee></div>
<audio id="somsorte" name="somsorte" autoplay><source src="/_Library/rgchico.wav"></audio>
</body></html>