<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sabio03.aspx.cs" Inherits="Sabio._1.perfil.Sabio03" %>
<%@ Import Namespace="System.Globalization" %>

<!DOCTYPE html>

<Script Language="JScript" src="../scripts/Simples7.js"></Script>
<html><head><title>Sabichao</title><style>@import url(../images/coUC.css);</style>
</head><body bgcolor="#FFFFFF" onLoad="Aviso2('somregis',17)">
<p style="font-size: 10pt">
	Sala de: <font color="#0588C0"><b>RESULTADO do TESTE SEU PERFIL</b></font>
	<span style="font-size: 9pt"><br>
	 - Teste da Semana Completado com Sucesso
	</span>
</p><% CultureInfo idioma = new CultureInfo("pt-Br"); %>
<table width="100%" cellspacing="0" cellpadding="0">
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#44AA00" width="2%"><img src="../images/cant01s.gif"></td>
		<td bgcolor="#44AA00" width="64%" style="font-size: 9pt; color: #FFFFFF"><b><p align="justify">
			<br>Congratulações <%=Session["IPUserSab"]%>:
			<br>Suas Perguntas do SEU ANALISTA desta semana estão concluídas e seus 200 PONTOS EXTRAS já estão computados. 
			Seu próximo Teste estará disponivel a partir da próxima <%= gData.ToString("dddd",idioma).ToUpper() %> - <%= cData.ToString("dd/MM/yyyy") %>.</p></b></td>
		<td bgcolor="#44AA00" width="2%" align="RIGHT"><img src="../images/cant02s.gif"></td>
		<td width="24%" align="CENTER" valign="TOP"><b><font style="font-size: 14pt; color: #F94942">No Teste</font>
			<br><font style="font-size: 12pt">200 pontos</font></b></td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#44AA00" width="2%"><img src="../images/cant01ii.gif"></td>
		<td bgcolor="#44AA00" width="64%"></td>
		<td bgcolor="#44AA00" width="2%" align="RIGHT"><img src="../images/cant02ii.gif"></td>
		<td width="24%" align="CENTER" valign="TOP"></td>
	</tr>
	<tr valign="TOP"> 
		<td width="8%"></td>
		<td bgcolor="#AAEE22" width="2%" valign="BOTTOM"><img src="../images/cant03i.gif"></td>
		<td bgcolor="#AAEE22" width="64%">
			<table width="100%" cellspacing="0" cellpadding="10">
				<tr>
					<td width="100%" valign="middle" colspan=2><p align="justify">
                        Seu último TESTE - <b>TEMA</b>: <%= tema %>
						<p align="justify"><i>Analize do Sabichão.</i> <b><%= resl %></b></p></td>
				</tr>
				<tr>
					<td width="90%" valign="middle"><p align="justify"><b>Sabichão. </b><i>Adj. e Sub. Masculino:</i> Grande sábio;
						aquele que alardeia sabedoria; presunçoso. <i>Feminino:</i> Sabichã ou Sabichona.
						Detone em seu assunto preferido, ou conheça mais sobre temas de interesse ou diversos.
						Em cada Sala tem perguntas sobre um mesmo tema que, podem mudam a qualquer hora. Se
						tiver alguma sujestão para outros temas preferidos, envie-nos sua
						<a href="mailto:contato0@aggora.com.br?Subject=Sugestão para Tema de Sala">Sugestão</a></p></td>
					<td width="10%" align="center" valign="middle"><img src="../images/happy3.gif"
						align="center" hspace="3" /><p><input type="button"
						onClick="location.href='../Sabio22.aspx'" value="Detalhar Salas"
						style="cursor:pointer;border:0;background-color:#AAEE22;background-image:url('../images/bt3.gif');width:115px;height:25px" /></td>
				</tr>
			</table>
		</td>
		<td bgcolor="#AAEE22" width="2%" align="RIGHT" valign="BOTTOM"><img src="../images/cant04i.gif"></td>
		<td width="24%" align="CENTER" valign="MIDDLE"><a href="../sabio07.asp">SORTEIO<br>de<br>PRÊMIOS</a></td>
	</tr>
</table>
<p>Sala [Seu Analista] Concluida! - Esta foi moleza eihm??? Semana que vem tem MAIS. :)</p>
<audio id="somregis" name="somregis"><source src="/_Library/rgcaixa.wav"></audio>
</body></html>