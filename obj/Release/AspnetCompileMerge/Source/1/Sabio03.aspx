<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sabio03.aspx.cs" Inherits="Sabio._1.Sabio03" %>
<%@ Import Namespace="System.Data.Odbc" %>

<!DOCTYPE html>

<Script Language="JScript" src="scripts/SimplesF.js"></Script>
<html><head><title>Sabichao</title><style>@import url(images/coUC.css);</style></head>
<body bgcolor="#FFFFFF" onLoad="OnCarg()">
<p style="font-size: 10pt">
	Sala de : <font color="#0588C0"><b>MENU DE CONTROLE</font><Span ID="NCalc"> - Carregando ....</Span></b>
	<span style="font-size: 8pt"><br>
	 - MENSAGENS, CADASTRO, RESUMO e LEGENDAS DO SABICHÃO (<%=Application["visita"]%>) - (<%=Session["id"]%>)
	</span>
</p>
<center>
<form method="post" name="formDelete" action="Sabio13.aspx" onsubmit="return limpaMens()">
<table width="90%" style="font-size: 12pt">
	<tr>
		<td>
			<b>Mensagens ou Premiações: <%=Session["IPUserSab"]%></b>
		</td>
	</tr>
</table>
<%
    string connString = System.Configuration.ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
    OdbcConnection Conexao = new OdbcConnection(connString);
    using (Conexao)
    {
        string queryString = "SELECT * FROM Eventos WHERE EVN_Email = '" + Session["mail"] + "' ORDER BY EVN_Cod Desc";
        OdbcCommand command = new OdbcCommand(queryString, Conexao);
        command.CommandTimeout = 120;
        // Open the connection in a try/catch block.
        try
        {
            Conexao.Open();
            OdbcDataReader Eventos = command.ExecuteReader();
            int contador = Eventos.RecordsAffected - 3;    //.RecordCount - 3
            if (!Eventos.HasRows)
            {
%>
<table width="90%" cellspacing="2" cellpadding="1">
	<tr>
		<td bgcolor='#FFFFDF'>
			Bem Vindo ao Site Sabichão Web, onde você se <b>Diverte e Testa</b> seus Conhecimentos.
		</td> 
	</tr>
</table>
<%
            }
            else
            {
%>
<script language="JavaScript">
function limpaMens(){
    i = j = 0;
	while(formDelete["nBox" + regisDat[i]]){
        if (formDelete["nBox" + regisDat[i]].checked) j++;
        i++;
	}
    if (j == 0) {
        alert("SABICHÃO WEB ALERTA:\n\nPara remover uma Mensagem do Registro é necessário marcar pelo menos uma caixa.");
        return false;
	}
}
</script>
<table width="90%" cellspacing="2" cellpadding="1" style="color: #0000FF; font-size: 10pt">
	<tr align="center" bgcolor="#FFCC66">
		<td width="5%"><b>x</b></td>
		<td width="15%"><b>Data</b></td>
		<td width="65%"><b>Descrição</b></td>
		<td width="15%"><b>OBS.</b></td>
	</tr>
</table>
<Script Language="JavaScript">
    regisDat = new Array();
    regisOrd = 0;
</Script>
<%
                int ContMost = 1;
                while (Eventos.Read() && ContMost < 4)
                {
                    ContMost = ContMost + 1;
                    string nBox = "nBox" + Eventos["EVN_Cod"];
%>
<Script Language="JavaScript">
    regisDat[regisOrd] = <%=Eventos["EVN_Cod"]%>;
    regisOrd++;
</Script>
<table width="90%" cellspacing="2" cellpadding="1">
	<tr bgcolor='#FFFFDF' align="center">
		<td width='5%'><input type='checkbox' name='<%=nBox%>' value='<%=Eventos["EVN_Cod"]%>'></td> 
		<td width='15%'><%=Eventos["EVN_Inclusao"]%></td> 
		<td align="left" width='65%'><%=Eventos["EVN_Desc"]%></td> 
		<td width='15%'><%=Eventos["EVN_Tipo"]%></td> 
	</tr>
</table>
<%
                }
                if (contador > 0)
                {
%>
<table width="90%" cellspacing="2" cellpadding="1">
	<tr>
		<td bgcolor='#FFEDA7'>
<%			        if (contador == 1) { %>
			Existe ainda 1 mensagem para você, que será mostrada quando ao menos 1 das acima for removida.
<%			        } else { %>
			Existe ainda <%=contador%> mensagens para você, que serão mostradas quando as acima forem removidas.
<%			        } %>
		</td> 
	</tr>
</table>
<%
                }
%>
<table width="90%">
	<tr>
		<td>
			<br><input type="submit" value="Remover Mens." name="ApagaData" style="cursor:pointer;border:0;background-color:rgb(255,255,255);background-image:url('images/bt3.gif');width:115px;height:25px">
		</td>
	</tr>
</table>
<%
            }
%>
</form>
<table width="90%">
	<tr>
		<td align='right'>
			<input type="button" onClick="location.href='Sabio04.aspx'" value="Dados Usuário" style="cursor:pointer;border:0;background-color:rgb(255,255,255);background-image:url('images/bt3b.gif');width:115px;height:25px">
		</td>
	</tr>
</table>
<table width="90%" style="font-size: 12pt">
	<tr>
		<td>
			<b>Resumo de suas Atividades no Sabichão</b>
		</td>
	</tr>
</table>
<%
            int pTotl = 0;
            int pCosc = 0;
            string strUP = "";
            queryString = "SELECT * FROM UserDados WHERE USR_ID = " + Session["id"];
            command = new OdbcCommand(queryString, Conexao);
            OdbcDataReader DadosUsuario = command.ExecuteReader();
            DadosUsuario.Read();
            if (DadosUsuario["USD_Acesso"].ToString() == "new")
            {
                pTotl = 500;
                pCosc = 0;
%>
<table width="90%" cellspacing="2" cellpadding="1">
	<tr>
		<td bgcolor="#FFEDA7">
			Por sua inscrição você já Ganhou <b>500 PONTOS</b> - Responda suas perguntas do dia e aumente muito mais os seus PONTOS.
		</td> 
	</tr>
	<tr>
		<td bgcolor="#FFFFDF">
			Para acessar as Salas de Perguntas do Sabichão clique em qualquer item no Menu Salas-QUIZ à esquerda.
		</td> 
	</tr>
<%
                queryString = "SELECT PRM_Email_Indicado FROM Promos WHERE PRM_Email_indicado = '" + Session["mail"] + "'";
                command = new OdbcCommand(queryString, Conexao);
                OdbcDataReader Promos = command.ExecuteReader();
                if (Promos.HasRows)
                {
                    queryString = "UPDATE Promos SET PRM_Confirmado = 1 WHERE PRM_Email_indicado = '" + Session["mail"] + "'";
                    command = new OdbcCommand(queryString, Conexao);
                    command.ExecuteReader();
                    strUP = ", USD_Total = 1000 ";
                    pTotl = 1000;
%>
	<tr>
		<td bgcolor="#FFEDA7">
			Por ser indicado pela Promoção Indique um Amigo você faturou <b>+ 500 PONTOS EXTRAS</b> - Afinal amigo é pra essas coisas né ...
		</td> 
	</tr>
</table>
<%
                }
            }
            else
            {
                pTotl = Convert.ToInt16(DadosUsuario["USD_Total"]);
                int pGerl = pTotl + Convert.ToInt16(DadosUsuario["USD_Apts"]);
                pCosc = Convert.ToInt16(DadosUsuario["USD_Consec"]);
%>
<table width="90%" cellspacing="2" cellpadding="1">
	<tr align="center" bgcolor="#FFCC66" style="color: #0000FF; font-size: 10pt">
		<td><b>Item</b></td>
		<td><b>Descrição - Valor</b></td>
	</tr>
	<tr bgcolor="#FFFFDF">
		<td>Data último Acesso</td>
		<td><b><%=DadosUsuario["USD_Acesso"]%></b></td>
	</tr>
	<tr bgcolor="#FFFFDF">
		<td>CONSECUTIVAS</td>
		<td><b><big><%=pCosc%></big></b></td>
	</tr>
	<tr bgcolor="#FFFFDF">
		<td>DISPONÍVEL PARA PRÊMIOS ou JOGOS</td>
		<td><b><big><%=pTotl%></big></b> do TOTAL de <big><%=pGerl%></big></td>
	</tr>
	<tr bgcolor="#FFFFDF">
	</tr>
	<tr bgcolor="#FFEDA7">
		<td width="100%" colspan=2 align="center">
			Para acessar as Salas do Sabichão clique em qualquer item no Menu à esquerda.
		</td>
	</tr>
</table>
<p><input type="button" onClick="location.href='Sabio22.aspx'" value="Detalhar Salas" style="cursor:pointer;border:0;background-color:rgb(255,255,255);background-image:url('images/bt3b.gif');width:115px;height:25px">
<%
                DadosUsuario.Close();
            }
            DateTime data = DateTime.Now;
            queryString = "UPDATE UserDados SET USD_Acesso = '" + data + "'" + strUP + " WHERE USR_ID = " + Session["id"];
            command = new OdbcCommand(queryString, Conexao);
            command.ExecuteReader();
%>
<script language="JavaScript">
<!--
    if (top.frames.super1.USerID) top.frames.super1.USerID.innerText = '<%=Session["IPUserSab"]%>';
	if(top.frames.super1.Ponto) top.frames.super1.Ponto.innerText = <%=pTotl%>;
	if (top.frames.super1.LogOK) top.frames.super1.LogOK.style = "position:absolute;top:3;left:3;visibility:visible";
//-->
</script>
<p>
<%
    // Numero de enquetes no banco de dados e grava a informação do cliente
            int tot = 0;
    //          OdbcConnection Conexao2 = new OdbcConnection(connString);
    //          using (Conexao2)
    //          {
            int refC = 0;
            queryString = "SELECT MAX(ENQ_Cod) AS max_Cod FROM Enquetes";
            command = new OdbcCommand(queryString, Conexao);

            OdbcDataReader reader = command.ExecuteReader();
            reader.Read();
                refC = Convert.ToInt16(reader["max_Cod"].ToString());
                Random rnd = new Random();
                refC = rnd.Next(0, refC);
            reader.Close();

            queryString = "SELECT * FROM Enquetes WHERE ENQ_Cod = " + refC;
            command = new OdbcCommand(queryString, Conexao);
            OdbcDataReader Clicks = command.ExecuteReader();
            Clicks.Read();
%>
<Script Language="JavaScript">
<!--//
function Vote(obj){
    var URL = 'Sabio16.aspx?ID=<%=refC%>&Voto=' + obj;
    location.href = URL;
}
//-->
</Script>
<table width="90%" style="font-size: 12pt">
	<tr>
		<td>
			<b>Vote-Veja nossas Enquetes</b>
		</td>
	</tr>
</table>
<table width="90%" cellspacing="2" cellpadding="1">
	<tr>
		<td bgcolor='#FFEDA7'>
			&nbsp;<a href="Sabio16.aspx" title="Lista todas as Enquetes"><%=Clicks["ENQ_Cod"]%></a>. <%=Clicks["ENQ_Desc"]%>
		</td> 
	</tr>
	<tr>
		<td bgcolor='#FFFFDF'>
			<%tot = Convert.ToInt16(Math.Round((Convert.ToDecimal(Clicks["ENQ_Aa"].ToString()) / Convert.ToDecimal(Clicks["ENQ_Total"].ToString())) * 100));%><INPUT TYPE="radio" NAME="rdresp0" onClick="Vote('ENQ_Aa')"><%=tot%>% <%=Clicks["ENQ_A"]%> (<%=Clicks["ENQ_Aa"]%>)
			<%tot = Convert.ToInt16(Math.Round((Convert.ToDecimal(Clicks["ENQ_Bb"].ToString()) / Convert.ToDecimal(Clicks["ENQ_Total"].ToString())) * 100));%><INPUT TYPE="radio" NAME="rdresp0" onClick="Vote('ENQ_Bb')"><%=tot%>% <%=Clicks["ENQ_B"]%> (<%=Clicks["ENQ_Bb"]%>)
			<%tot = Convert.ToInt16(Math.Round((Convert.ToDecimal(Clicks["ENQ_Cc"].ToString()) / Convert.ToDecimal(Clicks["ENQ_Total"].ToString())) * 100));%><INPUT TYPE="radio" NAME="rdresp0" onClick="Vote('ENQ_Cc')"><%=tot%>% <%=Clicks["ENQ_C"]%> (<%=Clicks["ENQ_Cc"]%>)
			<%tot = Convert.ToInt16(Math.Round((Convert.ToDecimal(Clicks["ENQ_Dd"].ToString()) / Convert.ToDecimal(Clicks["ENQ_Total"].ToString())) * 100));%><INPUT TYPE="radio" NAME="rdresp0" onClick="Vote('ENQ_Dd')"><%=tot%>% <%=Clicks["ENQ_D"]%> (<%=Clicks["ENQ_Dd"]%>)
		</td> 
	</tr>
</table>
<%
            Clicks.Close();
            Conexao.Close();
        }
        catch (Exception ex)
        {
            var perg1 = ex.Message;
        }
    }
    Conexao.Dispose();
%>

<p>
<table cellpadding="0" cellspacing="0" width="90%" style="font-family: Arial; font-size:9pt">
	<tr>
		<td colspan=5 style="font-family: Verdana; font-size:12pt"><b>Legenda para as Salas de Perguntas</b>:<p> </p></td>
	</tr>
	<tr align="center" valign="middle">
		<td width="20%"><img src="images/resp000.gif"></td>
		<td width="20%"><img src="images/happy2.gif"></td>
		<td width="20%"><img src="images/happy3.gif"></td>
		<td width="20%"><img src="images/happy1.gif"></td>
		<td width="20%"><img src="images/cont000.gif"></td>
	</tr>
	<tr align="center" valign="middle">
		<td width="20%">Enviar<br>Responta</td>
		<td width="20%">Resposta<br>Errada</td>
		<td width="20%">Seu<br>Palpite</td>
		<td width="20%">Resposta<br>Certa</td>
		<td width="20%">Próxima<br>(Sala/Pergunta)</td>
	</tr>
</table>
<p>
<%
    if (Session["mail"].ToString() == "rg30@bol.com.br") {
        //      if (Err != 0) {
        //          Response.Write("Ocorreu um erro na tentativa de carregar esta página: <b>" + Err.Description + "</b>");
        //      }

        string Serial = Request.ServerVariables["HTTP_REFERER"];
        Response.Write("<p>O REFERER é: " + Serial + "<br>");

        Serial = Request.ServerVariables["HTTP_HOST"];
        Response.Write("O HOST é: " + Serial + "<p>");

        Response.Write("<a href=http://" + Serial + "/adm/sabichao target=_top>GERSab 1.0<br>(Gerenciamento WEB do Site Sabichão)</a>");
        Response.Write("<br><br>IPUserSab: " + Session["IPUserSab"]);
        Response.Write("<br>mail: " + Session["mail"]);
    }
%>
</center>
<div id="INV002" style="position:absolute; width: 100%; height: 60px; left:0px; top:30px; z-index: 8; visibility: inherit"><marquee behavior="scroll" direction="right" scrollamount="5"><img src="images/coelho2R.gif" width="60" height="60"></marquee></div>
<embed id="somcerto" name="somcerto" src="/_Library/rgchico.wav" loop="false" autostart="false" hidden="true" width="0" height="0" />
</body></html>