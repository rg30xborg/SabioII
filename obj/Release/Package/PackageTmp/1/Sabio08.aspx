<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sabio08.aspx.cs" Inherits="Sabio._1.Sabio08" %>
<%@ Import Namespace="System.Data.Odbc" %>

<!DOCTYPE html>

<Script Language="JScript" src="scripts/SimplesF.js"></Script>
<html><head><title>Sabichao</title><style>@import url(images/coUC.css);</style></head>
<body bgcolor="#FFFFFF" onLoad="OnCarg()">
<p style="font-size: 10pt">
	Sala de : <font color="#0588C0"><b>HANKING</font><Span ID="NCalc"> - Carregando .... </Span></b>
	<span style="font-size: 9pt"><br>
	 - CLASSIFICAÇÃO GERAL POR PONTOS NO SABICHÃO
	</span>
</p>
<center>
<%
    int ultimo = 0;
    int pUltimo = 0;
    string nUltimo = "";

    int voce = 0;
    int pVoce = 0;
    string nVoce = "";
    int posAtual = 0;

    int primeiro = 0;
    int pPrimeiro = 0;
    string nPrimeiro = "";

    double fatGraf = 0;

    string connString = System.Configuration.ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
    OdbcConnection Conexao = new OdbcConnection(connString);
    using (Conexao)
    {
        // PRIMEIRO   = SELECT U.USR_ID, U.USR_Nome, UD.USD_Total FROM Users U, UserDados UD WHERE U.USR_ID = UD.USR_ID and UD.USD_Total = (Select MAX(USD_Total) from UserDados) ORDER BY UD.USD_Total Desc, U.USR_Nome Asc LIMIT 1;
        // ULTIMO     = SELECT U.USR_ID, U.USR_Nome, UD.USD_Total FROM Users U, UserDados UD WHERE U.USR_ID = UD.USR_ID and UD.USD_Total = (Select MIN(USD_Total) from UserDados) ORDER BY UD.USD_Total Desc, U.USR_Nome Desc LIMIT 1;
        // QUANTIDADE = SELECT Count(*) from UserDados;

        int pos = 0; int volta = 5;
        // Open the connection in a try/catch block.
        try
        {
            Conexao.Open();
            string queryString = "SELECT U.USR_ID, U.USR_Nome, UD.USD_Total FROM Users U, UserDados UD WHERE U.USR_ID = UD.USR_ID and UD.USD_Total = (Select MAX(USD_Total) from UserDados) ORDER BY UD.USD_Total Desc, U.USR_Nome Asc LIMIT 1";
            OdbcCommand command = new OdbcCommand(queryString, Conexao);
            command.CommandTimeout = 120;
            OdbcDataReader Primeiro = command.ExecuteReader();
            Primeiro.Read();
                primeiro = Convert.ToInt32(Primeiro["USR_ID"].ToString());
                pPrimeiro = Convert.ToInt32(Primeiro["USD_Total"].ToString());
                nPrimeiro = Primeiro["USR_Nome"].ToString();
            Primeiro.Close();

            queryString = "SELECT U.USR_ID, U.USR_Nome, UD.USD_Total FROM Users U, UserDados UD WHERE U.USR_ID = UD.USR_ID ORDER BY UD.USD_Total Desc, U.USR_Nome Asc";
            command = new OdbcCommand(queryString, Conexao);
            OdbcDataReader Usuarios = command.ExecuteReader();
            while (posAtual == 0 && Usuarios.Read())
            {
                pos = pos + 1;
                int UsId = (int)Usuarios["USR_ID"];
                int SsId = (int)Session["id"];
                if (UsId == SsId) {
                    posAtual = pos;
                    voce = Convert.ToInt32(Usuarios["USR_ID"].ToString());
                    pVoce = Convert.ToInt32(Usuarios["USD_Total"].ToString());
                    nVoce = Usuarios["USR_Nome"].ToString();
                }
            }
            Usuarios.Close();

            queryString = "SELECT U.USR_ID, U.USR_Nome, UD.USD_Total FROM Users U, UserDados UD WHERE U.USR_ID = UD.USR_ID and UD.USD_Total = (Select MIN(USD_Total) from UserDados) ORDER BY UD.USD_Total Desc, U.USR_Nome Desc LIMIT 1";
            command = new OdbcCommand(queryString, Conexao);
            OdbcDataReader Ultimo = command.ExecuteReader();
            Ultimo.Read();
                ultimo = Convert.ToInt32(Ultimo["USR_ID"].ToString());
                pUltimo = Convert.ToInt32(Ultimo["USD_Total"].ToString());
                nUltimo = Ultimo["USR_Nome"].ToString();
            Ultimo.Close();

            fatGraf = 160.0 / Convert.ToDouble(pPrimeiro);

            Conexao.Close();
        }
        catch (Exception ex)
        {
            var perg1 = ex.Message;
        }
    }
    Conexao.Dispose();

    //
    //    pos = 0
    //
    //    WHILE ((Usuarios("USR_ID") <> Session("id")) And (Not Usuarios.EOF))
    //
    //        pos = pos + 1
    //
    //           Usuarios.MoveNext
    //    WEND
    //
    //    volta = 5
    //
    //     WHILE ((volta > 0) And (pos > 0))
    //
    //        volta = volta - 1
    //
    //        pos = pos - 1
    //
    //        Usuarios.MovePrevious
    //    WEND

    string bgcl = "bgcolor=#FFFFEE";
%>
<%--<table width="90%" cellspacing="2" cellpadding="1" style="color: #0000FF; font-size: 10pt">
	<tr align="center" bgcolor="#FFCC66">
		<td width="25"><b>P.</b></td>
		<td><b>Nome do Sabichão</b></td>
		<td width="60"><b>PTs</b></td>
		<td width="210"><b>Pontuação Gráfica</b></td>
		<td width="60"><b>Dif</b></td>
	</tr>
</table>
<%
	on error resume next
	avanca = 0
	WHILE ((avanca < 10) And (Not Usuarios.EOF))
		nome = Usuarios("USR_Nome")
		codg = Usuarios("USR_ID")
		tot  = Usuarios("USD_Total")

		barA = 10 + Round((tot * fatGraf),0)
		barV = 10 + (160 - barA)
		If bgcl = "bgcolor=#FFFFEE" Then bgcl = "bgcolor=#FFFFDF" Else  bgcl = "bgcolor=#FFFFEE" End If

		If (codg <> Session("id")) Then
%>
<table width="90%" cellspacing="2" cellpadding="1" cellpadding="1">
	<tr <%=bgcl%>>
		<td width="25">&nbsp;<%=pos+1%></td>
		<td><%=nome%>&nbsp;(<%=codg%>)</td>
		<td width="60" align="right"><%=tot%>&nbsp;</td>
		<td width="210">&nbsp;<img src="images/barra01.gif" width="15" height="19"><img src="images/barra02.gif" width="<%=barA%>" height="19"><img src="images/barra03.gif" width="<%=barV%>" height="19"><img src="images/barra04.gif" width="15" height="19"></td>
		<td width="60" style="color: red">&nbsp;<%=(tot - pPrimeiro)%></td>
	</tr>
</table>
<%
		Else
%>
<table width="90%" cellspacing="2" cellpadding="1" cellpadding="1">
	<tr bgcolor=#FFEDA7>
		<td width="25">&nbsp;<b><%=pos+1%></b></td>
		<td><b><marquee behavior="alternate" title="Veja você aqui !!" ><%=nome%>&nbsp;(<%=codg%>)</marquee></b></td>
		<td width="60" align="right"><b><%=tot%>&nbsp;</b></td>
		<td width="210">&nbsp;<img src="images/barra01.gif" width="15" height="19"><img src="images/barra02.gif" width="<%=barA%>" height="19"><img src="images/barra03.gif" width="<%=barV%>" height="19"><img src="images/barra04.gif" width="15" height="19"></td>
		<td width="60" style="color: red"><b>&nbsp;<%=(tot - pPrimeiro)%></b></td>
	</tr>
</table>
<%
		End If
		avanca = avanca + 1
		pos = pos + 1 
   		Usuarios.MoveNext
	WEND
	Usuarios.close
	Conexao.Close
	Set Usuarios = Nothing
	Set Conexao = Nothing
%>
<p>--%>
<hr>
<table cellpadding="1" cellspacing="2" width="90%" style="font-family: Arial; font-size:9pt">
	<tr>
		<td colspan=6 style="font-family: Verdana; font-size:12pt"><b>Destaques do Mês</b>:<p> </p></td>
	</tr>
</table>
<%
    int barA = 10 + Convert.ToInt16(Math.Round(Convert.ToDouble(pPrimeiro) * fatGraf));
    int barV = 10 + (160 - barA);
%>
<table cellpadding="1" cellspacing="2" width="90%" style="font-family: Arial; font-size:9pt">
	<tr bgcolor=#FFFFEE style="color: blue" valign="middle">
		<td width="25">&nbsp;1º</td>
		<td width="50">&nbsp; <img src="images/happy3.gif"> &nbsp;</td>
		<td><%=nPrimeiro%>&nbsp;(<%=primeiro%>)</td>
		<td width="60" align="right"><%=pPrimeiro%>&nbsp;</td>
		<td width="210">&nbsp;<img src="images/barra01.gif" width="15" height="19"><img src="images/barra02.gif" width="<%=barA%>" height="19"><img src="images/barra03.gif" width="<%=barV%>" height="19"><img src="images/barra04.gif" width="15" height="19"></td>
		<td width="60">&nbsp;zero</td>
	</tr>
</table>
<%
    barA = 10 + Convert.ToInt16(Math.Round(Convert.ToDouble(pVoce) * fatGraf));
    barV = 10 + (160 - barA);
%>
<table cellpadding="1" cellspacing="2" width="90%" style="font-family: Arial; font-size:9pt">
	<tr bgcolor="#FFFF88" style="color:black; vertical-align: middle" valign="middle">
		<td width="25">&nbsp;<b><%=posAtual%>º</b></td>
		<td><b><marquee behavior="alternate" title="Veja você aqui !!" ><%=nVoce%>&nbsp;(<% if (voce < 10) Response.Write("00" + voce); else if (voce < 100) Response.Write("0" + voce); else Response.Write(voce); %>)</marquee></b></td>
		<td width="60" align="right"><b><%=pVoce%>&nbsp;</b></td>
		<td width="210">&nbsp;<img src="images/barra01.gif" width="15" height="19"><img src="images/barra02.gif" width="<%=barA%>" height="19"><img src="images/barra03.gif" width="<%=barV%>" height="19"><img src="images/barra04.gif" width="15" height="19"></td>
		<td width="60" style="color: red"><b>&nbsp;<%=(pVoce - pPrimeiro)%></b></td>
	</tr>
</table>
<%
    barA = 10 + Convert.ToInt16(Math.Round(Convert.ToDouble(pUltimo) * fatGraf));
    barV = 10 + (160 - barA);
%>
<table cellpadding="1" cellspacing="2" width="90%" style="font-family: Arial; font-size:9pt">
	<tr bgcolor=#FFFFDF style="color: red" valign="middle">
		<td width="25">&nbsp;Xº</td>
		<td width="50">&nbsp; <img src="images/happy2.gif"> &nbsp;</td>
		<td valign="middle"><%=nUltimo%>&nbsp;(<%=ultimo%>)</td>
		<td width="60" align="right"><%=pUltimo%>&nbsp;</td>
		<td width="210">&nbsp;<img src="images/barra01.gif" width="15" height="19"><img src="images/barra02.gif" width="<%=barA%>" height="19"><img src="images/barra03.gif" width="<%=barV%>" height="19"><img src="images/barra04.gif" width="15" height="19"></td>
		<td width="60">&nbsp;<%=pUltimo - pPrimeiro%></td>
	</tr>
</table>
<br>
<hr>
<%
//'                   End If
%>
<p>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr> 
		<td>
			<p  align="justify"><b>Sabichão. </b><i>Adj. e Sub. Masculino:</i> Grande sábio; aquele que alardeia 
			sabedoria; presunçoso. <i>Feminino:</i> Sabichã ou Sabichona. Detone em seu assunto preferido, ou 
			conheça mais sobre temas de interesse ou diversos. Em cada Sala tem perguntas sobre um mesmo tema que, 
			mudam a a qualquer hora. Se o seu assunto preferido ainda não apareceu, mande sua sugestão para 
			<a href="mailto:contato@aggora.com.br">contato@aggora.com.br</a></p>
		</td>
	</tr>
</table>
</center>
<embed name="somcerto" src="/_Library/rgchico.wav" loop="false" autostart="false" hidden="true" width="0" height="0"></embed>
</BODY></HTML>
