<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Extra01.aspx.cs" Inherits="Sabio._1.Extra01" %>

<!DOCTYPE html>

<Script Language="JScript" src="scripts/SimplesK.js"></Script>
<html><head><title>Sabichao</title><style>@import url(images/coUC.css);</style></head>
<body bgcolor="#ffffff" background="../mundi.gif"><center>
<TABLE border=0 cellPadding=0 cellSpacing=0 width=630 height="100%">
	<TBODY>
	<TR align=center>
		<TD valign=top><IMG src="images/lesq.gif" width=28 height="100%"></TD>
		<TD valign=top>
<table cellpadding="0" cellspacing="0" width="100%" style="font-family: Arial; font-size:9pt">
	<tr>
		<td>
			<span style="font-family: verdana; font-size:12pt">Como <b>Anunciar</b> aqui no <b>SABICHÃO</b></span>
			<p align="justify">Disponibilizamos diversas Opções de Anúncio, para divulgar <b>Sua Empresa</b> na
			Internet por intermédio do nosso Site. Além do banner, flexibilizamos outras formas de publicidade que
			utilizam o potencial da internet para dar maior efetividade à sua campanha. Estas outras formas de 
			publicidade foram desenvolvidas utilizando as principais ferramentas de marketing ou conforme
			solicitações de nossos clientes:</p>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr> 
		<td> 
			<img src="images/happy3.gif" align="right" width="32" height="32">
			<p><img src="images/ball3.gif" width="13" height="13">  Marketing Direto <b>Via E-mail</b>
			<br><img src="images/ball3.gif" width="13" height="13"> Conteúdos Especiais em <b>Promoções</b>
			<br><img src="images/ball3.gif" width="13" height="13"> Perguntas Personalizadas em <b>Sua Empresa</b>
			<br><img src="images/ball3.gif" width="13" height="13"> Apoio aos <b>Prêmios</b> no Sabichão
			<br><img src="images/ball3.gif" width="13" height="13"> Pontos Extras e Clique Premiado no <b>Clique em Banner</b>
			<br><img src="images/ball3.gif" width="13" height="13"> Clube de Vantagens e Plano de Fidelidade</p>
			<p align="justify">Converse com a gente para saber que tipo de publicidade combina melhor com seu
			produto. Para maiores informações, preencha as informações abaixo que entraremos em contato.</p>
			<form name="anuncie" action="Sabio15.aspx" method="GET" onSubmit="return Envia1(this)"><center>
			<table width="90%" cellspacing="0" cellpadding="0">
				<tr>
					<td><b>1. Nome do Contato:</b><br><input type="TEXT" name="Contato" size="50" value=<%=Session["IPUserSab"]%>></td>
					<td align="right"><b>2. E-mail:</b><br><input type="TEXT" name="E_mail" size="25" value=<%=Session["mail"]%>></td>
				</tr>
				<tr><td>&nbsp;</td></tr>
				<tr>
					<td><b>3. Empresa:</b><br><input type="TEXT" name="Empr" size="50"></td>
					<td align="right"><b>4. DDD e Telefone:</b><br><input type="TEXT" name="Fone" size="25"></td>
				</tr>
				<tr><td>&nbsp;</td></tr>
				<tr>
					<td><b>5. Prefere ser contatado por:</b><br><input type="radio" name="Cntt" value="Telefone" checked><b> Telefone</b><input type="radio" name="Cntt" value="E-Mail"><b> E-mail</b></td>
					<td align="right"><b>6. Interesse em Anúncio:</b><br>
						<select name="Tipo">
							<Option value="1.Todos">1. Todos
							<Option value="2.Marketing_Direto">2. Marketing Direto
							<Option value="3.Conteúdo_Especial">3. Conteúdo Especial
							<Option value="4.Sua_Empresa">4. Sala - Sua Empresa
							<Option value="5.Apoio_Prêmios">5. Apoio aos Prêmios
							<Option value="6.Clique_Banner">6. Clique em Banner
							<Option value="7.Banners_Site">7. Banners no Site
							<Option value="8.Alguns_deles">8. Alguns deles
							<Option value="9.Qualquer_deles">9. Qualquer um deles
							<Option value="0.Outros">0. Outros - Especificar
						</select></td>
				</tr>
				<tr><td>&nbsp;</td></tr>
				<tr>
					<td><b>6. Comentários adicionais:</b><br><textarea name="Obsv" cols="50" rows="4"></textarea></td>
					<td align="center" valign="middle">
                        <% if (Session["IPUserSab"] != null) { %><input type="image" name="botao" src="images/cont001.gif" border="0" width="97" height="56"><% } else { %>Ver Nota abaixo<% } %>
					</td>
				</tr>
			</table></center><input type="hidden" name="origem" value="Anuncie">
			</form>
		</td>
	</tr>
</table>
<p><input type="button" value="Cancelar-Voltar" style="cursor:pointer;border:0;background-color:rgb(255,255,255);background-image:url('images/bt3.gif');width:115px;height:25px" onClick="history.back()"></p>
<p>Nota: Para enviar menagem por esta página é necessário estar logado no Site</p>
		</TD>
		<TD valign=top><IMG src="images/ldir.gif" width=28 height="100%"></TD>
	</TR>
	</TBODY>
</TABLE>

</center></body></html>