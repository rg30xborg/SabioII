<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Extra00.aspx.cs" Inherits="Sabio._1.Extra00" %>

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
			<span style="font-family: verdana; font-size:12pt">Seu <b>Contato</b> com o <b>SABICHÃO</b></span>
			<p align="justify">Temos muito prazer em receber seu contato, e estamos abertos a qualquer tipo de
			sugestão, crítica ou comentários. Afinal sua participação é muito Importante para nós.</p>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr> 
		<td> 
			<img src="images/happy3.gif" align="right" width="32" height="32">
			<p align="justify">Preencha as informações abaixo e clique em [responder]. Se necessário,
			retornaremos seu contato em até 24 horas. - A Equipe Sabichão.</p>
			<form name="contato" action="Sabio15.aspx" method="GET" onSubmit="return Envia1(this)"><center>
			<table width="90%" cellspacing="0" cellpadding="0">
				<tr>
					<td><b>1. Nome do Contato:</b><br><input type="TEXT" name="Contato" size="50" value=<%=Session["IPUserSab"]%>></td>
					<td align="right"><b>2. E-mail:</b><br><input type="TEXT" name="E_mail" size="25" value=<%=Session["mail"]%>></td>
				</tr>
				<tr><td>&nbsp;</td></tr>
				<tr>
					<td><b>3. Empresa:</b><br><input type="TEXT" name="Empr" size="50" value="Usuário Sabichao"></td>
					<td align="right"><b>4. DDD e Telefone:</b><br><input type="TEXT" name="Fone" size="25"></td>
				</tr>
				<tr><td>&nbsp;</td></tr>
				<tr>
					<td><b>5. Prefere retorno por:</b><br><input type="radio" name="Cntt" value="Telefone"><b> Telefone<input type="radio" name="Cntt" value="E-Mail" checked> E-mail<input type="radio" name="Cntt" value="Desnecessario"> Desnecessário</b></td>
					<td align="right"><b>6. Tipo de Contato:</b><br>
						<select name="Tipo">
							<Option value="1.Sujestao_Geral">1. Sujestão Geral
							<Option value="2.Comentario_Simples">2. Comentário Simples
							<Option value="3.Critica_Simples">3. Crítica Simples
							<Option value="4.Tema_Salas">4. Tema para Salas
							<Option value="5.Tema_Perguntas">5. Tema para Perguntas
							<Option value="6.Tema_Jogos">6. Tema para Jogos
							<Option value="7.Tema_Site">7. Tema para o Site
							<Option value="8.Tema_Enquetes">8. Tema para Enquetes
							<Option value="9.Contato_Franquia">9. Contato para Franquia
							<Option value="0.Outros_Especificar">0. Outros - Especificar
						</select>
				</td></tr>
				<tr><td>&nbsp;</td></tr>
				<tr>
					<td><b>7. Comentários:</b><br><textarea name="Obsv" cols="50" rows="4"></textarea></td>
					<td align="center" valign="middle">
                        <% if (Session["IPUserSab"] != null) { %><input type="image" name="botao" src="images/cont001.gif" border="0" width="97" height="56"><% } else { %>Ver Nota abaixo<% } %>
					</td>
				</tr>
			</table></center><input type="hidden" name="origem" value="Contato">
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