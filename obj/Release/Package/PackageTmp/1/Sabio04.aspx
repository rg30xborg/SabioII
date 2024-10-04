<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sabio04.aspx.cs" Inherits="Sabio._1.Sabio04" %>

<!DOCTYPE html>

<Script Language="JScript" src="scripts/SimplesR.js"></Script>
<html><head><title>Sabichao</title><style>@import url(images/coUC.css); </style></head> 
<body bgcolor="#ffffff" onLoad="OnCarg()">
<p style="font-size: 10pt">
	Sala de : <font color="#0588C0"><b>MEUS DADOS CADASTRADOS</font><Span ID="NCalc"> - Carregando .... </Span></b>
	<span style="font-size: 9pt"><br>
	 - MANTENHA SEUS DADOS CADASTRAIS ATUALIZADOS
	</span>
</p>
<center>
<table width="700" border="0" width="auto" cellspacing="0" cellpadding="0">
	<tr valign="TOP"> 
		<td width="2%"></td>
		<td bgcolor="#585858" width="2%"><img src="images/cant01s.gif"></td>
		<td bgcolor="#585858" width="94%">
            <br /><span style="font-family: Verdana; font-size:12pt; color: #FFFFFF;"><b>Alteração de Cadastro de Usuário - Sabichão</b></span>
		</td>
		<td bgcolor="#585858" width="2%" align="RIGHT"><img src="images/cant02s.gif"></td>
		<!-- <td width="24%" align="CENTER" valign="middle"></td> -->
	</tr>
	<tr valign="TOP"> 
		<td width="2%"></td>
		<td bgcolor="#585858" width="2%"><img src="images/cant01ii.gif"></td>
		<td bgcolor="#585858" width="94%"></td>
		<td bgcolor="#585858" width="2%" align="RIGHT"><img src="images/cant02ii.gif"></td>
	</tr>
	<tr valign="TOP"> 
		<td width="2%"></td>
		<td bgcolor="#C0C0C0" width="2%" valign="BOTTOM"><img src="images/cant03i.gif"></td>
		<td bgcolor="#C0C0C0" width="94%">
        <br /><span style="font-family: Verdana; font-size:9pt; text-align: left;">OS ANOTADOS EM <b><font color="#FF0000">VERMELHO</font></b> SÃO NECESSÁRIOS</span>
        <form method="GET" id="Cads" name="Cads" runat="server" onsubmit="return verifica()">	
			<table width="auto" cellspacing="0" cellpadding="0" style="border: 0px solid #000000; font-family:Arial; font-size:9pt; background-color: #FFFFFF;">
				<tr>
					<td align="center">
					<center>
					<table cellspacing="1" cellpadding="0" style="font-family: Arial; font-size:9pt">
						<tr style="color: red" nowrap valign="middle">
							<td><b>Nome:</b></td>
							<td nowrap>
                                <table align="left"><tr><td>
                                    <asp:TextBox ID="nome_cliente" Text="" runat="server" Width="180px" />
                                    </td><td valign="top">&nbsp;<asp:RadioButtonList ID="sexo_cliente" runat="server" RepeatDirection="Horizontal" TextAlign="Left">
                                    <asp:ListItem Value="M" Text="&nbsp;Homem:"></asp:ListItem>
                                    <asp:ListItem Value="F" Text="&nbsp;Mulher:"></asp:ListItem>
                                    <asp:ListItem Value="O" Text="&nbsp;Outros:"></asp:ListItem>
                                </asp:RadioButtonList>
                                </td></tr></table>
							</td>
						</tr>
						<tr style="color: red">
							<td><b>Nascim:</b></td>
							<td class="auto-style1">Dia:
                                <asp:DropDownList ID="dia_cliente" runat="server">
                                    <asp:ListItem Text="1" Value="1" />
                                    <asp:ListItem Text="2" Value="2" />
                                    <asp:ListItem Text="3" Value="3" />
                                    <asp:ListItem Text="4" Value="4" />
                                    <asp:ListItem Text="5" Value="5" />
                                    <asp:ListItem Text="6" Value="6" />
                                    <asp:ListItem Text="7" Value="7" />
                                    <asp:ListItem Text="8" Value="8" />
                                    <asp:ListItem Text="9" Value="9" />
                                    <asp:ListItem Text="10" Value="10" />
                                    <asp:ListItem Text="11" Value="11" />
                                    <asp:ListItem Text="12" Value="12" />
                                    <asp:ListItem Text="13" Value="13" />
                                    <asp:ListItem Text="14" Value="14" />
                                    <asp:ListItem Text="15" Value="15" />
                                    <asp:ListItem Text="16" Value="16" />
                                    <asp:ListItem Text="17" Value="17" />
                                    <asp:ListItem Text="18" Value="18" />
                                    <asp:ListItem Text="19" Value="19" />
                                    <asp:ListItem Text="20" Value="20" />
                                    <asp:ListItem Text="21" Value="21" />
                                    <asp:ListItem Text="22" Value="22" />
                                    <asp:ListItem Text="23" Value="23" />
                                    <asp:ListItem Text="24" Value="24" />
                                    <asp:ListItem Text="25" Value="25" />
                                    <asp:ListItem Text="26" Value="26" />
                                    <asp:ListItem Text="27" Value="27" />
                                    <asp:ListItem Text="28" Value="28" />
                                    <asp:ListItem Text="29" Value="29" />
                                    <asp:ListItem Text="30" Value="30" />
                                    <asp:ListItem Text="31" Value="31" />
                                </asp:DropDownList>&nbsp; Mês:
                                <asp:DropDownList ID="mes_cliente" runat="server">
                                    <asp:ListItem Text="1" Value="1" />
                                    <asp:ListItem Text="2" Value="2" />
                                    <asp:ListItem Text="3" Value="3" />
                                    <asp:ListItem Text="4" Value="4" />
                                    <asp:ListItem Text="5" Value="5" />
                                    <asp:ListItem Text="6" Value="6" />
                                    <asp:ListItem Text="7" Value="7" />
                                    <asp:ListItem Text="8" Value="8" />
                                    <asp:ListItem Text="9" Value="9" />
                                    <asp:ListItem Text="10" Value="10" />
                                    <asp:ListItem Text="11" Value="11" />
                                    <asp:ListItem Text="12" Value="12" />
                                </asp:DropDownList>&nbsp; Ano:
                                <asp:DropDownList ID="ano_cliente" runat="server">
                                    <asp:ListItem Text="1970" Value="1970" />
                                    <asp:ListItem Text="1971" Value="1971" />
                                    <asp:ListItem Text="1972" Value="1972" />
                                    <asp:ListItem Text="1973" Value="1973" />
                                    <asp:ListItem Text="1974" Value="1974" />
                                    <asp:ListItem Text="1975" Value="1975" />
                                    <asp:ListItem Text="1976" Value="1976" />
                                    <asp:ListItem Text="1977" Value="1977" />
                                    <asp:ListItem Text="1978" Value="1978" />
                                    <asp:ListItem Text="1979" Value="1979" />
                                    <asp:ListItem Text="1980" Value="1980" />
                                    <asp:ListItem Text="1981" Value="1981" />
                                    <asp:ListItem Text="1982" Value="1982" />
                                    <asp:ListItem Text="1983" Value="1983" />
                                    <asp:ListItem Text="1984" Value="1984" />
                                    <asp:ListItem Text="1985" Value="1985" />
                                    <asp:ListItem Text="1986" Value="1986" />
                                    <asp:ListItem Text="1987" Value="1987" />
                                    <asp:ListItem Text="1988" Value="1988" />
                                    <asp:ListItem Text="1989" Value="1989" />
                                    <asp:ListItem Text="1990" Value="1990" />
                                    <asp:ListItem Text="1991" Value="1991" />
                                    <asp:ListItem Text="1992" Value="1992" />
                                    <asp:ListItem Text="1993" Value="1993" />
                                    <asp:ListItem Text="1994" Value="1994" />
                                    <asp:ListItem Text="1995" Value="1995" />
                                    <asp:ListItem Text="1996" Value="1996" />
                                    <asp:ListItem Text="1997" Value="1997" />
                                    <asp:ListItem Text="1998" Value="1998" />
                                    <asp:ListItem Text="1999" Value="1999" />
                                    <asp:ListItem Text="1990" Value="1990" />
                                    <asp:ListItem Text="2000" Value="2000" />
                                    <asp:ListItem Text="2001" Value="2001" />
                                    <asp:ListItem Text="2002" Value="2002" />
                                    <asp:ListItem Text="2003" Value="2003" />
                                    <asp:ListItem Text="2004" Value="2004" />
                                    <asp:ListItem Text="2005" Value="2005" />
                                    <asp:ListItem Text="2006" Value="2006" />
                                    <asp:ListItem Text="2007" Value="2007" />
                                    <asp:ListItem Text="2008" Value="2008" />
                                    <asp:ListItem Text="2009" Value="2009" />
                                    <asp:ListItem Text="2010" Value="2010" />
                                    <asp:ListItem Text="2011" Value="2011" />
                                </asp:DropDownList>&nbsp; Idade: ~<%=idade%> anos</td>
						</tr>
						<tr>
							<td>Endereço:&nbsp;</td>
							<td class="auto-style1"><asp:TextBox ID="rua_cliente" Text="" runat="server" Width="260px" /></td>
						</tr>
						<tr>
							<td>Bairro:</td>
							<td class="auto-style1"><asp:TextBox ID="bairro_cliente" Text="" runat="server" Width="180px" /></td>
						</tr>
						<tr>
							<td style="color: red"><b> Cidade:</b></td>
							<td class="auto-style1"><asp:TextBox ID="cidade_cliente" Text="" runat="server" Width="180px" /></td>
						</tr>
						<tr>
							<td style="color: red"><b>Estado:</b></td>
							<td class="auto-style1"><asp:DropDownList ID="estado_cliente" runat="server">
                                    <asp:ListItem Text="Exterior" Value="EX" />
                                    <asp:ListItem Text="AC" Value="AC" />
                                    <asp:ListItem Text="AL" Value="AL" />
                                    <asp:ListItem Text="AM" Value="AM" />
                                    <asp:ListItem Text="AP" Value="AP" />
                                    <asp:ListItem Text="BA" Value="BA" />
                                    <asp:ListItem Text="CE" Value="CE" />
                                    <asp:ListItem Text="DF" Value="DF" />
                                    <asp:ListItem Text="ES" Value="ES" />
                                    <asp:ListItem Text="GO" Value="GO" />
                                    <asp:ListItem Text="MA" Value="MA" />
                                    <asp:ListItem Text="MG" Value="MG" />
                                    <asp:ListItem Text="MS" Value="MS" />
                                    <asp:ListItem Text="MT" Value="MT" />
                                    <asp:ListItem Text="PA" Value="PA" />
                                    <asp:ListItem Text="PB" Value="PB" />
                                    <asp:ListItem Text="PE" Value="PE" />
                                    <asp:ListItem Text="PI" Value="PI" />
                                    <asp:ListItem Text="PR" Value="PR" />
                                    <asp:ListItem Text="RJ" Value="RJ" />
                                    <asp:ListItem Text="RN" Value="RN" />
                                    <asp:ListItem Text="RO" Value="RO" />
                                    <asp:ListItem Text="RR" Value="RR" />
                                    <asp:ListItem Text="RS" Value="RS" />
                                    <asp:ListItem Text="SC" Value="SC" />
                                    <asp:ListItem Text="SE" Value="SE" />
                                    <asp:ListItem Text="SP" Value="SP" />
                                    <asp:ListItem Text="TO" Value="TO" />
                                </asp:DropDownList>&nbsp; CEP: <asp:TextBox Text="" ID="cep_cliente" runat="server" Width="80px" /></td>
						</tr>
						<tr>
							<td>Telefone:</td>
							<td class="auto-style1"><asp:TextBox ID="fone_cliente" Text="" runat="server" Width="100px" /></td>
						</tr>
						<tr>
							<td style="color: blue">Email:</td>
							<td class="auto-style1"><%=Session["mail"]%><asp:HiddenField ID="email_cliente" runat="server" /></td>
						</tr>
						<tr style="color: red">
							<td><b>Senha:</b></td>
							<td nowrap class="auto-style1"><asp:TextBox Text="" ID="senha_cliente" runat="server" Width="100px" MaxLength="20" TextMode="Password" /><b>&nbsp; Confere-Senha: </b><asp:TextBox Text="" ID="senha_cliente1" runat="server" Width="100px" MaxLength="20" TextMode="Password" /></td>
						</tr>
					</table>
					</center>
					</td>
				</tr>
                <asp:HiddenField ID="c0" runat="server" Value="0" />
                <asp:HiddenField ID="c1" runat="server" Value="0" />
                <asp:HiddenField ID="c2" runat="server" Value="0" />
				<tr>
					<td align="left">
                        <table width="100%">
<%	if (Session["mail"].ToString().Substring(0, 4) != "0000") { %>
                            <tr>
                                <td>
						            Utilize tambem este cadastro para alterar sua senha frequentemente e aumentar ainda mais 
                                    a segurança de seus acesso ao site. Eventuais Prêmios só serão entregues, se seus 
                                    <font color="blue"><b>Dados Cadastrais</b></font> forem Verdadeiros, e o link 
			                        <font color="blue"><b>www.aggora.com.br/sabio</b></font> ter sido compartilhado em uma 
                                    de suas <font color="blue"><b>redes sociais</b></font> antes dos sorteios.
						        </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <input type="button" value="Cancelar-Voltar" style="cursor:pointer;border:0;background-color:rgb(255,255,255);background-image:url('images/bt3.gif');width:115px;height:25px" onClick="cancelA()"> &nbsp;&nbsp; 
                                    <br /><div style="width:125px; height:25px;text-align:center; background-image: url('images/bt3.gif'); background-repeat: no-repeat; vertical-align:bottom; cursor: pointer; line-height: 25px;"><asp:LinkButton ID="Atualizar" runat="server" Text="Gravar Dados" Height="25px" Width="125px" OnClick="Atualizar_Click" /></div>
                                </td>
                            </tr>
<%	} else { %>
                            <tr>
                                <td align="center">
						            <p align="left"></p>Dados Cadastrais não alteravéis, para usuário <b>VISITANTE</b>.</p>
						            <br><input type="button" value="Cancelar-Voltar" style="cursor:pointer;border:0;background-color:rgb(255,255,255);background-image:url('images/bt3.gif');width:115px;height:25px" onClick="cancelA()">
                                </td>
                            </tr>
<%	} %>
                        </table>
					</td>
				</tr>
			</table>
        </form><br />
		</td>
		<td bgcolor="#C0C0C0" width="2%" align="RIGHT" valign="BOTTOM"><img src="images/cant04i.gif"></td>
	</tr>
</table>
<form method="post" name="CC" >	
<table cellpadding="0" cellspacing="0" width="600" style="font-family: Arial; font-size:9pt">
	<tr>
		<td colspan=6 style="font-family: Verdana; font-size:12pt"><b>Receber E-mails do Sabichão</b>:<br /><br /></td>
	</tr>
	<tr>
		<td><input type="checkbox" name="m0" <%if(c0.Value == "1") { %>checked<% } %> onClick="Corresp1(0)"></td>
		<td><span id="v0"></span>NOVOS PRÊMIOS</td>
		<td><input type="checkbox" name="m1" <%if(c1.Value == "1") { %>checked<% } %> onClick="Corresp1(1)"></td>
		<td><span id="v1"></span>RESULTADOS de SORTEIOS</td>
		<td><input type="checkbox" name="m2" <%if(c2.Value == "1") { %>checked<% } %> onClick="Corresp1(2)"></td>
		<td><span id="v2"></span>NOVOS LANÇAMENTOS</td>
	</tr>
</table>
</form>
<hr>
		<span style="font-size: 9pt; color:#777777">
		<b>Compromisso Sabichão Web</b>: Através de nosso sistema você receberá somente os e-mails de: (1)Confirmação/Alteração
		de Cadastro; (2)Os eventuais para Lembrar Senha; e (3)Os que serão solicitados por você mesmo em sua
		Agenda.</span>
<hr>
    <br />

<!-- Inicio Preload de Imagens (opcional) -->
<img src="images/bot0pg.gif" width="0" height="0">
<img src="images/resp000.gif" width="0" height="0">
<img src="images/cont000.gif" width="0" height="0">
<!-- Final Preload de Imagens (opcional) -->
</center>
</body></html>