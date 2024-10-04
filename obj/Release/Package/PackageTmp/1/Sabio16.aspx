<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sabio16.aspx.cs" Inherits="Sabio._1.Sabio16" %>
<%@ Import Namespace="System.Data.Odbc" %>

<!DOCTYPE html>

<Script Language="JScript" src="scripts/SimplesF.js"></Script>
<html><head><title>Sabichão</title><style>@import url(images/coUC.css);</style></head>
<body bgcolor="#FFFFFF"" onLoad="OnCarg()">
<p style="font-size: 10pt">
	Sala de : <font color="#0588C0"><b>ENQUETES</font><Span ID="NCalc"> - Carregando .... </Span></b>
	<span style="font-size: 9pt"><br>
	 - VEJA AQUI TODAS AS ENQUETES DO SABICHÃO
	</span>
</p>
<center>
<%
    //  Numero de enquetes no banco de dados e grava a informação do cliente
    string connString = System.Configuration.ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
    using (OdbcConnection Conexao = new OdbcConnection(connString)) {
        string queryString = "SELECT * FROM Enquetes";
        OdbcCommand command = new OdbcCommand(queryString, Conexao);
        // Open the connection in a try/catch block.
        try
        {
            Conexao.Open();
            OdbcDataReader Clicks = command.ExecuteReader();
            if (!Clicks.HasRows)
            {
%>
<table width="90%" cellspacing="2" cellpadding="1">
	<tr>
		<td bgcolor='#FFFFDF'>
			Nenhuma Enquete disponível no momento. Aguarde para breve...
		</td> 
	</tr>
</table>
<%
            }
            else
            {
                int tot = 0;
                string bgcl = "bgcolor=#FFFFEE";
                while (Clicks.Read())
                {
                    if (bgcl == "bgcolor=#FFFFEE") bgcl = "bgcolor=#FFFFDF"; else bgcl = "bgcolor=#FFFFEE";
%>
<table width="90%" cellspacing="2" cellpadding="1">
	<tr>
		<td <%=bgcl%>>
            <p align="justify"><b><%=Clicks["ENQ_Cod"]%>. <%=Clicks["ENQ_Desc"]%></b></p>
            	<%tot = Convert.ToInt16(Math.Round(Convert.ToDecimal(Clicks["ENQ_Aa"].ToString()) / Convert.ToDecimal(Clicks["ENQ_Total"].ToString()) * 100));%>
            <p><img src="images/barra01.gif" width="15" height="19"><img src="images/barra02.gif" width="<%=(tot)%>" height="19"><img src="images/barra03.gif" width="<%=(100-tot)%>" height="19"><img src="images/barra04.gif" width="15" height="19"> <%=tot%>% <%=Clicks["ENQ_A"]%> (<%=Clicks["ENQ_Aa"]%>)
            	<%tot = Convert.ToInt16(Math.Round(Convert.ToDecimal(Clicks["ENQ_Bb"].ToString()) / Convert.ToDecimal(Clicks["ENQ_Total"].ToString()) * 100));%>
            <br><img src="images/barra01.gif" width="15" height="19"><img src="images/barra02.gif" width="<%=(tot)%>" height="19"><img src="images/barra03.gif" width="<%=(100-tot)%>" height="19"><img src="images/barra04.gif" width="15" height="19"> <%=tot%>% <%=Clicks["ENQ_B"]%> (<%=Clicks["ENQ_Bb"]%>)
            	<%tot = Convert.ToInt16(Math.Round(Convert.ToDecimal(Clicks["ENQ_Cc"].ToString()) / Convert.ToDecimal(Clicks["ENQ_Total"].ToString()) * 100));%>
            <br><img src="images/barra01.gif" width="15" height="19"><img src="images/barra02.gif" width="<%=(tot)%>" height="19"><img src="images/barra03.gif" width="<%=(100-tot)%>" height="19"><img src="images/barra04.gif" width="15" height="19"> <%=tot%>% <%=Clicks["ENQ_C"]%> (<%=Clicks["ENQ_Cc"]%>)
            	<%tot = Convert.ToInt16(Math.Round(Convert.ToDecimal(Clicks["ENQ_Dd"].ToString()) / Convert.ToDecimal(Clicks["ENQ_Total"].ToString()) * 100));%>
            <br><img src="images/barra01.gif" width="15" height="19"><img src="images/barra02.gif" width="<%=(tot)%>" height="19"><img src="images/barra03.gif" width="<%=(100-tot)%>" height="19"><img src="images/barra04.gif" width="15" height="19"> <%=tot%>% <%=Clicks["ENQ_D"]%> (<%=Clicks["ENQ_Dd"]%>)
            </p>
		</td> 
	</tr>
</table>
<br>
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
%>
</center>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr> 
		<td>
			<p align="justify">As Enquetes do Sabichão determinam como nossa Equipe ira conduzir os trabalhos de
			aperfeiçoamento e evolução do Site, assim, quanto maior for a sua participação, mais estaremos deixando
			a aparência e funcionalidade do Sabichão de acordo com seu gosto e da maioria de nossos usuários.</p>
		</td>
	</tr>
</table>
<p align=center><input type="button" value="Voltar" style="cursor:pointer;border:0;background-color:rgb(255,255,255);background-image:url('images/bt3.gif');width:115px;height:25px" onClick="history.back()"></p>
</body></html>