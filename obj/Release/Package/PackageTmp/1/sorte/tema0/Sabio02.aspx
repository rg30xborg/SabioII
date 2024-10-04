<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sabio02.aspx.cs" Inherits="Sabio._1.sorte.tema0.Sabio02" %>
<%@ Import Namespace="System.Data.Odbc" %>
<%@ Import Namespace="System.Globalization" %>

<!DOCTYPE html>

<Script Language="JScript"> var cred = <%=libok%>, pSala = <%=libSl%>; pPremio = "<%=libPr%>" </Script>
<Script Language="JScript" src="../../scripts/Simpl3a.js"></Script>
<% CultureInfo idioma = new CultureInfo("pt-Br"); %>
<HTML><HEAD><TITLE>RG 3.0 - Sabichão Web</TITLE>
<style>@import url(../../images/coUC.css);</style>
</HEAD><body bgcolor=#FFFFFF scroll="auto" onLoad="Aviso2()">
<p style="font-size: 10pt">
	Sala de Apostas (<%=libSl%>): <font color="#0588C0"><b>GIGA SENNA</font><Span ID="NCalc"> - Criando Ambiente ...</Span></b>
	<span style="font-size: 9pt"><br>
	 - Premio: <font color="#0000FF"><span ID="Reg15"><%=libPr%></span></font> Sorteio em: <font color="#0000FF"><%=Convert.ToDateTime(libDt.ToString()).ToString("D",idioma)%></font>
	 - Pontos para Apostas: <font color="#0000FF"><span ID="Reg18"><%=libok%></span> pontos</font>
	</span>
</p>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#585858" width="2%" align="LEFT"><img src="../../images/cant01s.gif"></td>
		<td bgcolor="#585858" width="80%" align=center><font color="#FFFFFF"><b>Posição: <span ID="Reg17">Iniciando...</span></b></font><br>
		<table width="590" height="50" cellspacing="0" cellpadding="0" style="font-size: 10pt; color: yellow">
			<tr align="center" valign="middle">
				<td width="80"><b>Dezenas a</b></td>
				<td width="55"><img name="Reg01" src="/_Library/ficha10.gif" onClick="selBet1(900, 10, 'quadra: 1:195; quina: 1:3.973; sena: 1:238.399')"><small><small><br><b>Pts: 900</b></small></small></td>
				<td width="55"><img name="Reg01" src="/_Library/ficha11.gif" onClick="selBet1(2000, 11, 'quadra: 1:129; quina: 1:2.211; sena: 1:108.363')"><small><small><br><b>2.000</b></small></small></td>
				<td width="55"><img name="Reg01" src="/_Library/ficha12.gif" onClick="selBet1(4000, 12, 'quadra: 1:90; quina: 1:1.317; sena: 1:54.182')"><small><small><br><b>4.000</b></small></small></td>
				<td width="100"><img name="Reg00" SRC="/_Library/Rolsorte.gif" width="70" height="50"></td>
				<td width="55"><img name="Reg01" src="/_Library/ficha13.gif" onClick="selBet1(7700, 13, 'quadra: 1:65; quina: 1:828; sena: 1:29.175')"><small><small><br><b>7.700</b></small></small></td>
				<td width="55"><img name="Reg01" src="/_Library/ficha14.gif" onClick="selBet1(13500, 14, 'quadra: 1:48; quina: 1:544; sena: 1:16.671')"><small><small><br><b>13.500</b></small></small></td>
				<td width="55"><img name="Reg01" src="/_Library/ficha15.gif" onClick="selBet1(22500, 15, 'quadra: 1:37; quina: 1:370; sena: 1:10.003')"><small><small><br><b>22.500</b></small></small></td>
				<td width="80"><b>Apostar</b></td>
			</tr>
		</table>
		</td>
		<td bgcolor="#585858" width="2%" align="RIGHT"><img src="../../images/cant02s.gif"></td>
		<td width="8%"></td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#585858" width="2%" align="LEFT"><img src="../../images/cant01ii.gif"></td>
		<td bgcolor="#585858" width="80%" align=center>
		<span ID="Reg16" style="color:white;font-weight:bold">Aguarde...</Span>
		</td>
		<td bgcolor="#585858" width="2%" align="RIGHT"><img src="../../images/cant02ii.gif"></td>
		<td width="8%"></td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#C0C0C0" width="2%" valign="BOTTOM" align="LEFT"><img src="../../images/cant03i.gif"></td>
		<td bgcolor="#C0C0C0" width="80%" align=center><br>
		<table width="590" height="195" cellspacing="0" cellpadding="0">
			<tr>
				<td>
	<table width="590" height="195" id="volante" name="volante" style="visibility:hidden" cellspacing="0" cellpadding="0" bgcolor="#000000">
	<tr align="center">
	<td width="300">
	  <table width="290" cellspacing="0" cellpadding="0" height="195" onMouseOver="onTab()" onMouseOut="offTab()">
		<tr>
			<td colspan=10 style="font-size: 10pt; color: yellow"><b>Cartela - Marque suas <span ID="Dezs">10</span> dezenas</b></td>
		</tr>
            <tr align="center">
              <td width="10%"><img onClick="clicImage(11)" onMouseOver="onImage(11)" onMouseOut="offImage(11)" SRC="/_Library/11g.gif" name="n11" height="20" width="20"></td>
              <td width="10%"><img onClick="clicImage(12)" onMouseOver="onImage(12)" onMouseOut="offImage(12)" SRC="/_Library/12g.gif" name="n12" height="20" width="20"></td>
              <td width="10%"><img onClick="clicImage(13)" onMouseOver="onImage(13)" onMouseOut="offImage(13)" SRC="/_Library/13g.gif" name="n13" height="20" width="20"></td>
              <td width="10%"><img onClick="clicImage(14)" onMouseOver="onImage(14)" onMouseOut="offImage(14)" SRC="/_Library/14g.gif" name="n14" height="20" width="20"></td>
              <td width="10%"><img onClick="clicImage(15)" onMouseOver="onImage(15)" onMouseOut="offImage(15)" SRC="/_Library/15g.gif" name="n15" height="20" width="20"></td>
              <td width="10%"><img onClick="clicImage(16)" onMouseOver="onImage(16)" onMouseOut="offImage(16)" SRC="/_Library/16g.gif" name="n16" height="20" width="20"></td>
              <td width="10%"><img onClick="clicImage(17)" onMouseOver="onImage(17)" onMouseOut="offImage(17)" SRC="/_Library/17g.gif" name="n17" height="20" width="20"></td>
              <td width="10%"><img onClick="clicImage(18)" onMouseOver="onImage(18)" onMouseOut="offImage(18)" SRC="/_Library/18g.gif" name="n18" height="20" width="20"></td>
              <td width="10%"><img onClick="clicImage(19)" onMouseOver="onImage(19)" onMouseOut="offImage(19)" SRC="/_Library/19g.gif" name="n19" height="20" width="20"></td>
              <td width="10%"><img onClick="clicImage(20)" onMouseOver="onImage(20)" onMouseOut="offImage(20)" SRC="/_Library/20.gif" name="n20" height="20" width="20"></td>
            </tr>
            <tr align="center">
              <td><img onClick="clicImage(21)" onMouseOver="onImage(21)" onMouseOut="offImage(21)" SRC="/_Library/21.gif" name="n21" height="20" width="20"></td>
              <td><img onClick="clicImage(22)" onMouseOver="onImage(22)" onMouseOut="offImage(22)" SRC="/_Library/22.gif" name="n22" height="20" width="20"></td>
              <td><img onClick="clicImage(23)" onMouseOver="onImage(23)" onMouseOut="offImage(23)" SRC="/_Library/23.gif" name="n23" height="20" width="20"></td>
              <td><img onClick="clicImage(24)" onMouseOver="onImage(24)" onMouseOut="offImage(24)" SRC="/_Library/24.gif" name="n24" height="20" width="20"></td>
              <td><img onClick="clicImage(25)" onMouseOver="onImage(25)" onMouseOut="offImage(25)" SRC="/_Library/25.gif" name="n25" height="20" width="20"></td>
              <td><img onClick="clicImage(26)" onMouseOver="onImage(26)" onMouseOut="offImage(26)" SRC="/_Library/26.gif" name="n26" height="20" width="20"></td>
              <td><img onClick="clicImage(27)" onMouseOver="onImage(27)" onMouseOut="offImage(27)" SRC="/_Library/27.gif" name="n27" height="20" width="20"></td>
              <td><img onClick="clicImage(28)" onMouseOver="onImage(28)" onMouseOut="offImage(28)" SRC="/_Library/28.gif" name="n28" height="20" width="20"></td>
              <td><img onClick="clicImage(29)" onMouseOver="onImage(29)" onMouseOut="offImage(29)" SRC="/_Library/29.gif" name="n29" height="20" width="20"></td>
              <td><img onClick="clicImage(30)" onMouseOver="onImage(30)" onMouseOut="offImage(30)" SRC="/_Library/30.gif" name="n30" height="20" width="20"></td>
            </tr>
            <tr align="center">
              <td><img onClick="clicImage(31)" onMouseOver="onImage(31)" onMouseOut="offImage(31)" SRC="/_Library/31.gif" name="n31" height="20" width="20"></td>
              <td><img onClick="clicImage(32)" onMouseOver="onImage(32)" onMouseOut="offImage(32)" SRC="/_Library/32.gif" name="n32" height="20" width="20"></td>
              <td><img onClick="clicImage(33)" onMouseOver="onImage(33)" onMouseOut="offImage(33)" SRC="/_Library/33.gif" name="n33" height="20" width="20"></td>
              <td><img onClick="clicImage(34)" onMouseOver="onImage(34)" onMouseOut="offImage(34)" SRC="/_Library/34.gif" name="n34" height="20" width="20"></td>
              <td><img onClick="clicImage(35)" onMouseOver="onImage(35)" onMouseOut="offImage(35)" SRC="/_Library/35.gif" name="n35" height="20" width="20"></td>
              <td><img onClick="clicImage(36)" onMouseOver="onImage(36)" onMouseOut="offImage(36)" SRC="/_Library/36.gif" name="n36" height="20" width="20"></td>
              <td><img onClick="clicImage(37)" onMouseOver="onImage(37)" onMouseOut="offImage(37)" SRC="/_Library/37.gif" name="n37" height="20" width="20"></td>
              <td><img onClick="clicImage(38)" onMouseOver="onImage(38)" onMouseOut="offImage(38)" SRC="/_Library/38.gif" name="n38" height="20" width="20"></td>
              <td><img onClick="clicImage(39)" onMouseOver="onImage(39)" onMouseOut="offImage(39)" SRC="/_Library/39.gif" name="n39" height="20" width="20"></td>
              <td><img onClick="clicImage(40)" onMouseOver="onImage(40)" onMouseOut="offImage(40)" SRC="/_Library/40.gif" name="n40" height="20" width="20"></td>
            </tr>
            <tr align="center">
              <td><img onClick="clicImage(41)" onMouseOver="onImage(41)" onMouseOut="offImage(41)" SRC="/_Library/41.gif" name="n41" height="20" width="20"></td>
              <td><img onClick="clicImage(42)" onMouseOver="onImage(42)" onMouseOut="offImage(42)" SRC="/_Library/42.gif" name="n42" height="20" width="20"></td>
              <td><img onClick="clicImage(43)" onMouseOver="onImage(43)" onMouseOut="offImage(43)" SRC="/_Library/43.gif" name="n43" height="20" width="20"></td>
              <td><img onClick="clicImage(44)" onMouseOver="onImage(44)" onMouseOut="offImage(44)" SRC="/_Library/44.gif" name="n44" height="20" width="20"></td>
              <td><img onClick="clicImage(45)" onMouseOver="onImage(45)" onMouseOut="offImage(45)" SRC="/_Library/45.gif" name="n45" height="20" width="20"></td>
              <td><img onClick="clicImage(46)" onMouseOver="onImage(46)" onMouseOut="offImage(46)" SRC="/_Library/46.gif" name="n46" height="20" width="20"></td>
              <td><img onClick="clicImage(47)" onMouseOver="onImage(47)" onMouseOut="offImage(47)" SRC="/_Library/47g.gif" name="n47" height="20" width="20"></td>
              <td><img onClick="clicImage(48)" onMouseOver="onImage(48)" onMouseOut="offImage(48)" SRC="/_Library/48g.gif" name="n48" height="20" width="20"></td>
              <td><img onClick="clicImage(49)" onMouseOver="onImage(49)" onMouseOut="offImage(49)" SRC="/_Library/49g.gif" name="n49" height="20" width="20"></td>
              <td><img onClick="clicImage(50)" onMouseOver="onImage(50)" onMouseOut="offImage(50)" SRC="/_Library/50g.gif" name="n50" height="20" width="20"></td>
            </tr>
            <tr align="center">
              <td><img onClick="clicImage(51)" onMouseOver="onImage(51)" onMouseOut="offImage(51)" SRC="/_Library/51g.gif" name="n51" height="20" width="20"></td>
              <td><img onClick="clicImage(52)" onMouseOver="onImage(52)" onMouseOut="offImage(52)" SRC="/_Library/52g.gif" name="n52" height="20" width="20"></td>
              <td><img onClick="clicImage(53)" onMouseOver="onImage(53)" onMouseOut="offImage(53)" SRC="/_Library/53g.gif" name="n53" height="20" width="20"></td>
              <td><img onClick="clicImage(54)" onMouseOver="onImage(54)" onMouseOut="offImage(54)" SRC="/_Library/54g.gif" name="n54" height="20" width="20"></td>
              <td><img onClick="clicImage(55)" onMouseOver="onImage(55)" onMouseOut="offImage(55)" SRC="/_Library/55g.gif" name="n55" height="20" width="20"></td>
              <td><img onClick="clicImage(56)" onMouseOver="onImage(56)" onMouseOut="offImage(56)" SRC="/_Library/56g.gif" name="n56" height="20" width="20"></td>
              <td><img onClick="clicImage(57)" onMouseOver="onImage(57)" onMouseOut="offImage(57)" SRC="/_Library/57g.gif" name="n57" height="20" width="20"></td>
              <td><img onClick="clicImage(58)" onMouseOver="onImage(58)" onMouseOut="offImage(58)" SRC="/_Library/58g.gif" name="n58" height="20" width="20"></td>
              <td><img onClick="clicImage(59)" onMouseOver="onImage(59)" onMouseOut="offImage(59)" SRC="/_Library/59g.gif" name="n59" height="20" width="20"></td>
              <td><img onClick="clicImage(60)" onMouseOver="onImage(60)" onMouseOut="offImage(60)" SRC="/_Library/60g.gif" name="n60" height="20" width="20"></td>
            </tr>
            <tr align="center">
              <td><img onClick="clicImage(61)" onMouseOver="onImage(61)" onMouseOut="offImage(61)" SRC="/_Library/61g.gif" name="n61" height="20" width="20"></td>
              <td><img onClick="clicImage(62)" onMouseOver="onImage(62)" onMouseOut="offImage(62)" SRC="/_Library/62g.gif" name="n62" height="20" width="20"></td>
              <td><img onClick="clicImage(63)" onMouseOver="onImage(63)" onMouseOut="offImage(63)" SRC="/_Library/63g.gif" name="n63" height="20" width="20"></td>
              <td><img onClick="clicImage(64)" onMouseOver="onImage(64)" onMouseOut="offImage(64)" SRC="/_Library/64g.gif" name="n64" height="20" width="20"></td>
              <td><img onClick="clicImage(65)" onMouseOver="onImage(65)" onMouseOut="offImage(65)" SRC="/_Library/65g.gif" name="n65" height="20" width="20"></td>
              <td><img onClick="clicImage(66)" onMouseOver="onImage(66)" onMouseOut="offImage(66)" SRC="/_Library/66g.gif" name="n66" height="20" width="20"></td>
              <td><img onClick="clicImage(67)" onMouseOver="onImage(67)" onMouseOut="offImage(67)" SRC="/_Library/67g.gif" name="n67" height="20" width="20"></td>
              <td><img onClick="clicImage(68)" onMouseOver="onImage(68)" onMouseOut="offImage(68)" SRC="/_Library/68g.gif" name="n68" height="20" width="20"></td>
              <td><img onClick="clicImage(69)" onMouseOver="onImage(69)" onMouseOut="offImage(69)" SRC="/_Library/69g.gif" name="n69" height="20" width="20"></td>
              <td><img onClick="clicImage(70)" onMouseOver="onImage(70)" onMouseOut="offImage(70)" SRC="/_Library/70g.gif" name="n70" height="20" width="20"></td>
            </tr>
	  </table>
	</td>
	<td width="180" valign="middle">
		<img SRC="/_Library/Senspani.gif" id="Reg32" name="Reg32" onClick="resMostr()" title="Toggle Resumo de Aposta" height="90" width="150">
		<!-- <p><select id="Reg39" name="Reg39" size="1" style="background-color: black; color: white" onChange="nesTipo()"><option value="1">Sorteio Página Web<option value="2">Sorteio Mega-Senna</select> -->
		<br><br><span align="center" style="color:white; visibility:hidden" id="SML">Simular não consome Pontos<br>Teste a vontade!</span>
		<br><br><input type="button" value="Sem Sons()" onClick="soundOK = !soundOK; (soundOK ? this.value='Sem Sons()' : this.value='Com Sons()');">
	</td>
	<td width="110" valign="middle">
		<img src="/_Library/1p.gif" name="rol41"> - 
		<img src="/_Library/00.jpg" name="rol01" height="30" width="30">
		<img src="/_Library/00.jpg" name="rol11" height="30" width="30"><br>
		<img src="/_Library/2p.gif" name="rol42"> - 
		<img src="/_Library/00.jpg" name="rol02" height="30" width="30">
		<img src="/_Library/00.jpg" name="rol12" height="30" width="30"><br>
		<img src="/_Library/3p.gif" name="rol43"> - 
		<img src="/_Library/00.jpg" name="rol03" height="30" width="30">
		<img src="/_Library/00.jpg" name="rol13" height="30" width="30"><br>
		<img src="/_Library/4p.gif" name="rol44"> - 
		<img src="/_Library/00.jpg" name="rol04" height="30" width="30">
		<img src="/_Library/00.jpg" name="rol14" height="30" width="30"><br>
		<img src="/_Library/5p.gif" name="rol45"> - 
		<img src="/_Library/00.jpg" name="rol05" height="30" width="30">
		<img src="/_Library/00.jpg" name="rol15" height="30" width="30"><br>
		<img src="/_Library/6p.gif" name="rol46"> - 
		<img src="/_Library/00.jpg" name="rol06" height="30" width="30">
		<img src="/_Library/00.jpg" name="rol16" height="30" width="30"><br>
	</td>
	</tr>
	</table>
				</td>
			</tr>
		</table><br>
		</td>
		<td bgcolor="#C0C0C0" width="2%" align="RIGHT" valign="BOTTOM"><img src="../../images/cant04i.gif"></td>
		<td width="8%" align="CENTER"><td>
	</tr>
	<tr>
		<td colspan=5 align=center width=100%>
		<table width="610" cellspacing="0" cellpadding="0">
			<tr align="center" height="40">
				<td width="30%"><img src="/_Library/bottv.gif" width="160" height="38" onClick="StartRGSennaWeb()" name="Reg21"></td>
				<td width="40%"><img src="/_Library/botgsc.gif" width="160" height="38" title="Regras do Jogo / Progresso" alt="Regras do Jogo / Progresso" onClick="instrui()" onMouseOver="regras1()" onMouseOut="regras2()" style="cursor: help" name="Reg22"></td>
				<td width="30%"><img src="/_Library/bottv.gif" width="160" height="38" onClick="ProssRGSennaWeb()" name="Reg20"></td>
			</tr>
		</table>
		</td>
	</tr>
</table><br>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr> 
		<td>
		<p align="justify"><b>RG Giga-Senna Web</b> aqui você aposta seus Pontos no Prêmio: <b><%=libPr%></b> escolhido,
		com resultado obtido na apuração da Mega-Sena da Caixa (CEF) do <b>dia <%=Convert.ToDateTime(libDt).ToString("dd/MM/yyyy")%></b>. Apostas neste prêmio estão liberadas até o
		<b>dia <%=Convert.ToDateTime(libDt).AddDays(-1).ToString("dd/MM/yyyy")%></b> (um dia antes da apuração). Como Apostar -> Após selecionar o número de dezenas que terá
		sua aposta e verificar a quantidade de Pontos correspondente a esta seleção, o jogador anota seus palpites em uma cartela com 
		dezenas indo de 01 a 60. Concluída as fases anterioras você poderá: [Simular Aposta] quantas vezes quizer em um sorteio local, 
		somente para consulta, ou; [Remeter Aposta] para enviar a aposta e efetivar seu Registro. - Após o sortei CEF verifique se sua 
		aposta foi vencedora. Boa Sorte.</p>
		<p>Como e o quê você ganha ->
			<br> - Acertando a SENNA 6 dezenas: <b>O Prêmio(*): <%=libPr%></b>;
			<br> - Acertando a QUINNA 5 dezenas: Devolução de 50% dos Pontos da aposta;
			<br> - Acertando a QUADRRA 4 dezenas: Devolução de 20% dos Pontos da aposta;
			<br> - Acertando a BIT-SENNA Somente 1 dezena: Devolução de 10% dos Pontos da aposta;
			<br> - Prêmio não cumulativo: Vale apenas o maior.</p>
		<p>(*) havendo mais de um ganhador o valor do Prêmio será dividido entre os vencedores e neste caso Devolução INTEGRAL dos Pontos da aposta. - Se tiver alguma sugestão ou crítica 
		sobre o Giga-Senna, envie e-mail para: <a href="mailto:contato@aggora.com.br">Contate-nos</a></p>
		</td>
	</tr>
</table>
<center><hr>
<table width="90%">
	<tr>
		<td style="font-size: 12pt">
			<b>Confira aqui suas Apostas Registradas neste Prêmio.</b>
		</td>
	</tr>
</table>
<%
    string connString = System.Configuration.ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
    OdbcConnection Conexao = new OdbcConnection(connString);
    using (Conexao)
    {
        string queryString = "SELECT * FROM Premios_Apostas WHERE USR_ID = " + Session["id"] + " and PRE_Cod = " + libCd + " ORDER BY USA_Cod DESC";
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
		<td bgcolor='#FFFFDF'>Você ainda não investiu seus Pontos neste Prêmio. Aproveite agora e concorra a esta oferta...</td>
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
		<td><b>Dezenas da Aposta</b></td>
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
		<td>Dezenas: <b><%=Apostas["USA_Dez"]%></b></td>
 		<td align="center" nowrap><%=Apostas["USA_Apts"]%></td>
		<td align="center" nowrap><%=Apostas["USA_Data"]%></td>
		<td align="center" nowrap><%=Convert.ToDateTime(libDt).ToString("dd/MM/yyyy")%></td>
	</tr>

<%
                }
%>
</table>
<%
                Apostas.Close();
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
<form id="dadosc" name="dadosc" method="GET">
<input TYPE="hidden" id="dataz" name="dataz" value="<%=libok%>">
<input TYPE="hidden" id="salax" name="salax" value="<%=libSl%>">
<input TYPE="hidden" id="salay" name="salay" value="<%=libHx%>">
<input TYPE="hidden" id="salaz" name="salaz" value="">
</form>
<audio id="sominici" name="sominici" autoplay><source src="/_Library/rgcerto.wav"></audio>
<audio id="somcapit" name="somcapit"><source src="/_Library/rgerror.wav"></audio>
<audio id="somregis" name="somregis"><source src="/_Library/rgcaixa.wav"></audio>
<audio id="somclick" name="somclick"><source src="/_Library/rgclick.wav"></audio>
<audio id="somcerto" name="somcerto"><source src="/_Library/rgcerto.wav"></audio>
<audio id="somsorte" name="somsorte"><source src="/_Library/rgrodar.wav"></audio>

<script>
function PlaySound(soundObj) {
  var sound = document.getElementById(soundObj);
  sound.play();
}
</script>
</BODY></HTML>
