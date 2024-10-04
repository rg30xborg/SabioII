<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sabio22.aspx.cs" Inherits="Sabio._1.Sabio22" %>
<%@ Import Namespace="System.Data.Odbc" %>

<!DOCTYPE html>

<Script Language="JScript" src="scripts/Simples6.js"></Script>
<html><head><title>Sabichao</title><style>@import url(images/coUC.css);</style>
</head><body bgcolor="#FFFFFF" onLoad="Aviso2('somregis')">
<p style="font-size: 10pt">
	Relação Geral para: <font color="#0588C0"><b><%=Session["IPUserSab"]%></font><Span ID="NCalc"> - Processando .... </Span></b>
	<span style="font-size: 9pt"><br>
	 - POSIÇÃO DE SUAS SALAS NO SABICHÃO - EM DETALHES
	</span>
</p>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#F39C12" width="2%"><img src="images/cant01s.gif" /></td>
		<td bgcolor="#F39C12" width="64%" style="font-size:9pt;color:#FFFFFF;text-align:justify;">
			<b><br>NO MENU SALAS-QUIZ: caso você
			ainda tenha perguntas disponíveis para hoje, os links e a seta CONTINUAR serão apresentados na tabela
			abaixo.</b>
		</td>
		<td bgcolor="#F39C12" width="2%" align="RIGHT"><img src="images/cant02s.gif" /></td>
		<td width="24%" align="CENTER" valign="TOP"><img src="images/happy3.gif" hspace=5 /></td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#F39C12" width="2%"><img src="images/cant01ii.gif" /></td>
		<td bgcolor="#F39C12" width="64%"></td>
		<td bgcolor="#F39C12" width="2%" align="RIGHT"><img src="images/cant02ii.gif" /></td>
		<td width="24%" align="CENTER" valign="TOP"></td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#ffff99" width="2%" valign="BOTTOM"><img src="images/cant03i.gif" /></td>
		<td bgcolor="#ffff99" width="64%"><br>
<table bgcolor="#FFFFFF" width="100%" cellspacing="0" cellpadding="0">
	<tr>
		<td>
		<table border="0" width="100%" cellspacing="2" cellpadding="1" style="color: #0000FF; font-size: 10pt">
			<tr align="center" bgcolor="#FFCC66">
				<td width="25%" ><b>Sala</b></td>
				<td width="7%"><b>Pf.</b></td>
				<td width="7%"><b>Rc.</b></td>
				<td width="50%"><b>Data ou Link - Status</b></td>
				<td width="11%"><b>Pts</b></td>
			</tr>
		</table>
		<table border="0" width="100%" cellspacing="2" cellpadding="1">
<%
    string sNext = ""; string sNome = ""; string text = "";
    DateTime Hoje = DateTime.Today;
    string connString = System.Configuration.ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
    OdbcConnection Conexao = new OdbcConnection(connString);
    using (Conexao)
    {
        string queryString = "SELECT * FROM UserDados WHERE USR_ID = " + Session["id"];
        OdbcCommand command = new OdbcCommand(queryString, Conexao);
        command.CommandTimeout = 120;
        // Open the connection in a try/catch block.
        try
        {
            Conexao.Open();
            OdbcDataReader UsuarioDados = command.ExecuteReader();
            UsuarioDados.Read();
            int Sala = 1; string nSala = "";
            while (Sala < 16)
            {
                nSala = Salas(Sala);
                text = UsuarioDados["USD_Sala" + Sala].ToString();
                if (text != "new")
                {
                    int pSala = Convert.ToInt16(text.Substring(text.IndexOf("Sala:") + 5, (text.IndexOf("Data:") - (text.IndexOf("Sala:") + 5))));
                    string pPerg = text.Substring(text.IndexOf("Perg:") + 5, (text.IndexOf("Sala:") - (text.IndexOf("Perg:") + 5)));
                    int pCert = pSala / 20;
                    string pData = text.Substring(text.IndexOf("Data:") + 5, (text.IndexOf("Qtde:") - (text.IndexOf("Data:") + 5)));
                    int pQtde = Convert.ToInt16(text.Substring(text.IndexOf("Qtde:") + 5));

                    if (Sala == 2 || Sala == 3 || Sala == 4)
                    {
                        if (Sala != 4) pCert = 0;
                        pQtde = pQtde + 1;
                        pPerg = pPerg + 1;
                    }
%>
			<tr bgcolor='#FFFFDF' align="center">
				<td width='25%' align="left"><%=Salas(Sala)%></td> 
				<td width='7%'><%=pPerg%></td>
				<td width='7%'><%=pCert%></td>
				<td width='50%' align="left">
<%
                    int pDias = (Convert.ToDateTime(pData).Date - Hoje.Date).Days;
                    if (pDias == 0 && pQtde > Convert.ToInt16(Session["Dia"]))
                        Response.Write(Convert.ToDateTime(pData).ToString("dd/MM/yyyy HH:mm:ss") + " - Concluída");
                    else
                    {
                        if (sNext == "")
                        {
                            sNext = Sala.ToString();
                            sNome = nSala;
                        }
                        Response.Write("<a href=tema" + Sala + "/Sabio01.aspx>Link " + nSala + "</a> - Disponível");
                    }
%>
				</td> 
				<td width='11%'><%=pSala%></td> 
			</tr>
<%		        } else { %>
			<tr bgcolor='#FFFFEF'>
				<td width='25%'><%=Salas(Sala)%></td>
				<td width='14%' colspan=2></td>
				<td width='50%'><a href=tema<%=Sala%>/Sabio01.aspx>Link <%=nSala%></a> - Disponível</td>
				<td width='11%'></td>
			</tr>
<%
                    if (sNext == "")
                    {
                        sNext = Sala.ToString();
                        sNome = nSala;
                    }
                }
                Sala = Sala + 1;
            }
%>
		</table>
		</td>
	</tr>
</table>Pf. = Perguntas Feitas - Rc = Respostas Certas<br /><br />
		</td>
		<td bgcolor="#ffff99" width="2%" align="RIGHT" valign="BOTTOM"><img src="images/cant04i.gif"></td>
		<td width="24%" align="CENTER" valign="MIDDLE">
<%	if (sNext != "") { %>
<a href="tema<%=sNext%>/Sabio01.aspx"><img name="botao" title="Vai para <%=sNome%>" width="97" height="56" src="images/cont001.gif" onMouseOver="onBotao()" onMouseOut="ofBotao()" border=0></a>
<%	} else { %>
<a href="Sabio07.aspx">PRÊMIOS<br>do<br>SITE</a>
<%	} %>
		</td>
	</tr>
</table>
<p>
<hr>
<p>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#44AA00" width="2%"><img src="images/cant01s.gif"></td>
		<td bgcolor="#44AA00" width="64%" style="font-size: 9pt; color: #FFFFFF; text-align: justify;">
			<b><br>NO MENU PROMOÇÕES: caso você
			ainda tenha perguntas disponíveis para hoje, os links e a seta CONTINUAR serão apresentados na tabela
			abaixo.</b>
		</td>
		<td bgcolor="#44AA00" width="2%" align="RIGHT"><img src="images/cant02s.gif"></td>
		<td width="24%" align="CENTER" valign="TOP"><img src="images/happy3.gif" hspace=5></td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#44AA00" width="2%"><img src="images/cant01ii.gif"></td>
		<td bgcolor="#44AA00" width="64%"></td>
		<td bgcolor="#44AA00" width="2%" align="RIGHT"><img src="images/cant02ii.gif"></td>
		<td width="24%" align="CENTER" valign="TOP"></td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#AAEE22" width="2%" valign="BOTTOM"><img src="images/cant03i.gif"></td>
		<td bgcolor="#AAEE22" width="64%"><br>
<table bgcolor="#FFFFFF" width="100%" cellspacing="0" cellpadding="0">
	<tr>
		<td>
		<table border="0" width="100%" cellspacing="2" cellpadding="1" style="color: #0000FF; font-size: 10pt">
			<tr align="center" bgcolor="#FFCC66">
				<td width="25%" ><b>Sala</b></td>
				<td width="7%"><b>Pf.</b></td>
				<td width="7%"><b>Rc.</b></td>
				<td width="50%"><b>Data ou Link - Status</b></td>
				<td width="11%"><b>Pts</b></td>
			</tr>
		</table>
		<table border="0" width="100%" cellspacing="2" cellpadding="1">
<%
            sNext = "";
            text = UsuarioDados["USD_1em"].ToString();

            if (text != "new")
            {
                int pSala = Convert.ToInt16(text.Substring(text.IndexOf("Sala:") + 5, (text.IndexOf("Data:") - (text.IndexOf("Sala:") + 5))));
                string pPerg = text.Substring(text.IndexOf("Perg:") + 5, (text.IndexOf("Sala:") - (text.IndexOf("Perg:") + 5)));
                int pCert = pSala / 20;
                string pData = text.Substring(text.IndexOf("Data:") + 5, (text.IndexOf("Qtde:") - (text.IndexOf("Data:") + 5)));
                int pQtde = Convert.ToInt16(text.Substring(text.IndexOf("Qtde:") + 5, (text.IndexOf("Clik:") - (text.IndexOf("Qtde:") + 5))));
%>
			<tr bgcolor='#FFFFDF' align="center">
				<td width='25%' align="left">Sua Empresa</td> 
				<td width='7%'><%=pPerg%></td>
				<td width='7%'><%=pCert%></td>
				<td width='50%' align="left">
<%
                int pDias = (Convert.ToDateTime(pData).Date - Hoje.Date).Days;
                if (pDias == 0 && pQtde > Convert.ToInt16(Session["DiaE"]))
                    Response.Write(Convert.ToDateTime(pData).ToString("dd/MM/yyyy HH:mm:ss") + " - Concluída");
                else {
                    if (sNext == "") {
                        sNext = "empre";
                        sNome = "Sua Empresa";
                        }
                    Response.Write("<a href=empre/Sabio01.aspx>Link Sua Empresa</a> - Disponível");
                }
%>
				</td> 
				<td width='11%'><%=pSala%></td> 
			</tr>
<%
            }
            else
            {
                if (sNext == "")
                {
                    sNext = "empre";
                    sNome = "Sua Empresa";
                }
%>
			<tr bgcolor='#FFFFEF'>
				<td width='25%'>Sua Empresa</td> 
				<td width='14%' colspan=2></td>
				<td width='50%'><a href=empre/Sabio01.aspx>Link Sua Empresa</a> - Disponível</td>
				<td width='11%'></td>
			</tr>
<%
            }
            text = UsuarioDados["USD_1pf"].ToString();
            if (text != "new")
            {
                int pSala = 0;
                string pPerg = text.Substring(text.IndexOf("Perg:") + 5, (text.IndexOf("Sala:") - (text.IndexOf("Perg:") + 5)));
                string pData = text.Substring(text.IndexOf("Data:") + 5, (text.IndexOf("Qtde:") - (text.IndexOf("Data:") + 5)));
                int pQtde = Convert.ToInt16(text.Substring(text.IndexOf("Qtde:") + 5, (text.IndexOf("Clik:") - (text.IndexOf("Qtde:") + 5))));
%>
			<tr bgcolor='#FFFFDF' align="center">
				<td width='25%' align="left">Seu Analista</td> 
				<td width='7%'><%=pPerg%></td>
				<td width='7%'>-</td>
				<td width='50%' align="left">
<%
                int pDias = (Convert.ToDateTime(pData).Date - Hoje.Date).Days;
                if (pDias < -6 || pQtde <= Convert.ToInt16(Session["DiaP"])) {
                    if (sNext == "") {
                        sNext = "perfil";
                        sNome = "Seu Analista";
                    }
                    Response.Write("<a href=perfil/Sabio01.aspx>Link Seu Analista</a> - Disponível");
                }
                else
                {
                    pSala = 200;
                    Response.Write(Convert.ToDateTime(pData).ToString("dd/MM/yyyy HH:mm:ss") + " - Concluída");
                }
%>
				</td> 
				<td width='11%'><%=pSala%></td> 
			</tr>
<%
            }
            else
            {
                if (sNext == "") {
                    sNext = "perfil";
                    sNome = "Seu Analista";
                }
%>
			<tr bgcolor='#FFFFEF'>
				<td width='25%'>Seu Analista</td> 
				<td width='14%' colspan=2></td>
				<td width='50%'><a href=perfil/Sabio01.aspx>Link Seu Analista</a> - Disponível</td>
				<td width='11%'></td>
			</tr>
<%
            }
%>
		</table>
		</td>
	</tr>
</table>Pf. = Perguntas Feitas - Rc = Respostas Certas<br /><br />
		</td>
		<td bgcolor="#AAEE22" width="2%" align="RIGHT" valign="BOTTOM"><img src="images/cant04i.gif"></td>
		<td width="24%" align="CENTER" valign="MIDDLE">
<%	if (sNext != "") { %>
<a href="<%=sNext%>/Sabio01.aspx"><img name="botau" title="Vai para <%=sNome%>" width="97" height="56" src="images/cont001.gif" onMouseOver="onBotau()" onMouseOut="ofBotau()" border=0></a>
<%	} else { %>
<a href="Sabio08.aspx">CONFIRA<br>seu<br>HANKING</a>
<%  } %>
		</td>
	</tr>
</table>
<p>
<hr>
<p>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#4444FF" width="2%"><img src="images/cant01s.gif"></td>
		<td bgcolor="#4444FF" width="64%" style="font-size:9pt;color:#FFFFFF;text-align:justify;">
			<b><br>NO MENU PROMOÇÕES: Salas com acesso livre e permanente.</b>
		</td>
		<td bgcolor="#4444FF" width="2%" align="RIGHT"><img src="images/cant02s.gif"></td>
		<td width="24%" align="CENTER" valign="TOP"><img src="images/happy3.gif" hspace=5></td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#4444FF" width="2%"><img src="images/cant01ii.gif"></td>
		<td bgcolor="#4444FF" width="64%"></td>
		<td bgcolor="#4444FF" width="2%" align="RIGHT"><img src="images/cant02ii.gif"></td>
		<td width="24%" align="CENTER" valign="TOP"></td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#7FCCFF" width="2%" valign="BOTTOM"><img src="images/cant03i.gif"></td>
		<td bgcolor="#7FCCFF" width="64%"><br>
<table bgcolor="#FFFFFF" width="100%" cellspacing="0" cellpadding="0">
	<tr>
		<td>
		<table border="0" width="100%" cellspacing="2" cellpadding="1" style="color: #0000FF; font-size: 10pt">
			<tr align="center" bgcolor="#FFCC66">
				<td width="39%" ><b>Sala - Acesso</b></td>
				<td width="50%"><b>Link - Status</b></td>
				<td width="11%"><b>Pts</b></td>
			</tr>
		</table>
<%
            int pSSala = Convert.ToInt16(UsuarioDados["USD_1gm"]);
            string pPPerg = "";
            if (pSSala != 0)
                pPPerg = UsuarioDados["USD_Acesso"].ToString();
            else
                pPPerg = "Nenhum acesso";
%>
		<table border="0" width="100%" cellspacing="2" cellpadding="1">
			<tr bgcolor='#FFFFDF'>
				<td width='39%'>Menu Jogos - <%=pPPerg%></td> 
				<td width='50%'><a href=sorte/Sabio01.aspx>Link Menu de Jogos</a> - Disponível</td>
				<td width='11%' align="center"><%=pSSala%></td> 
			</tr>
<%
            pSSala = Convert.ToInt16(UsuarioDados["USD_Amigo"]);
            if (pSSala != 0)
                pPPerg = UsuarioDados["USD_Acesso"].ToString();
            else
                pPPerg = "Sem Registros";
%>
			<tr bgcolor='#FFFFDF'>
				<td width='39%'>Promoção I - <%=pPPerg%></td> 
				<td width='50%'><a href=promo/Sabio01.aspx>Link Indique Amigos</a> - Disponível</td>
				<td width='11%' align="center"><%=pSSala%></td> 
			</tr>
<%
            pSSala = Convert.ToInt16(UsuarioDados["USD_Pergunta"]);
            if (pSSala != 0)
                pPPerg = UsuarioDados["USD_Acesso"].ToString();
            else
                pPPerg = "Sem Registros";
%>
			<tr bgcolor='#FFFFDF'>
				<td width='39%'>Promoção II - <%=pPPerg%></td> 
				<td width='50%'><a href=promo/Sabio03.aspx>Link De Usuários</a> - Disponível</td>
				<td width='11%' align="center"><%=pSSala%></td> 
			</tr>
		</table>
		</td>
	</tr>
</table>
<%
            UsuarioDados.Close();
            Conexao.Close();
        }
        catch (Exception ex)
        {
            var perg1 = ex.Message;
        }
    }
%>
            <br>
		</td>
		<td bgcolor="#7FCCFF" width="2%" align="RIGHT" valign="BOTTOM"><img src="images/cant04i.gif" /></td>
		<td width="24%" align="CENTER" valign="MIDDLE"><a href="sorte/Sabio01.aspx"><img name="botaa" 
            title="Vai para Menu Jogos" width="97" height="56" src="images/cont001.gif"
		    onMouseOver="onBotaa()" onMouseOut="ofBotaa()" border=0 /></a>
		</td>
	</tr>
</table><br>
<center>
<hr>
* * * RG Sabichão Web - Versão 2000a * * *
<hr>
</center>
<embed name="somcerto" src="/_Library/rgchico.wav" loop="false" autostart="false" hidden="true" width="0" height="0"></embed>
</body></html>