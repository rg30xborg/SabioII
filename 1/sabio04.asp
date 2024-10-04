<%@ Language=VBScript %>
<%
	Response.Expires = 0
	
'                   If inStr(Request.ServerVariables("HTTP_HOST"), "www.aggora.com.br") = 0 Then
'                   	Response.Redirect "http://www.aggora.com.br/sabio/help.htm"
'                   	Response.End
'                   Else
	If Session("IPUserSab") = "" Or Session("mail") = "" Then
		Response.Redirect "sabio12.asp"             'http://www.aggora.com.br/sabio/1/
		Response.End
	Else

' Abre conexao com banco de dados. Alterar a string de conexao em global.asa
		Set Conexao = Server.CreateObject("ADODB.Connection")
		'SQLServer =>  'Conexao.Open "Provider=SQLOLEDB.1;SERVER=187.45.196.225;DATABASE=aggora1;UID=aggora1;PWD=dade02;"
		Conexao.Open "DRIVER={MySQL ODBC 5.3 ANSI Driver};SERVER=187.45.196.225;PORT=3306;DATABASE=aggora1;USER=aggora1;PASSWORD=dade02;OPTION=3;"

' Abre tabela de produtos usando a conexao aberta acima.
		Set Usuarios = Server.CreateObject("ADODB.Recordset")
		Usuarios.Open "SELECT * FROM Users U, UserDados UD WHERE U.USR_ID = UD.USR_ID and U.USR_ID = " & Session("id"), Conexao

		nome = Session("IPUserSab")
		sexo = Usuarios("sexo_usuario")
		dia = Usuarios("dia_usuario")
		mes = Usuarios("mes_usuario")
		ano = Usuarios("ano_usuario")
		rua = Usuarios("rua_usuario")
		bairro = Usuarios("bairro_usuario")
		cidade = Usuarios("cidade_usuario")
		estado = Usuarios("estado_usuario")
		cep = Usuarios("cep_usuario")
		fone = Usuarios("telefone_usuario")

		cor = Usuarios("opcoes_usuario")
		cor0 = Mid(cor,1,1)
		cor1 = Mid(cor,3,1)
		cor2 = Mid(cor,5,1)

		Usuarios.Close
		Conexao.Close

		Set Usuarios = Nothing
		Set Conexao = Nothing
	End If
'                   End If

%><Script Language="JScript" src="images/SimplesR.js"></Script>
<html><head><title>Sabichao</title><style>@import url(images/coUC.css);</style></head> 
<body bgcolor="#ffffff"><center>
<table cellspacing="0" cellpadding="0" width="600" style="font-family: Arial; font-size:9pt">
	<tr>
		<td><span style="font-family: Verdana; font-size:12pt"><b>Alteração de Cadastro de Usuário - Sabichão</b></span><br>
			<span style="font-family: Verdana; font-size:8pt">OS ANOTADOS EM 
			<b><font color="#FF0000">VERMELHO</font></b> SÃO NECESSÁRIOS</span>
			<br>Eventuais Prêmios só serão entregues, se seus <font color="blue"><b>Dados Cadastrais</b></font> forem Verdadeiros, e o link 
			<font color="blue"><b>www.aggora.com.br/sabio</b></font> ter sido compartilhado em uma de suas <font color="blue"><b>redes sociais</b></font> antes do sorteio.
			<form method="post" name="Cads" action="sabio11.asp" onsubmit="return verifica()">		
			<table cellspacing="0" cellpadding="0" style="font-family: Arial; font-size:9pt">
				<tr>
					<td>
					<blockquote>
					<table cellspacing="1" cellpadding="0" style="font-family: Arial; font-size:9pt">
						<tr style="color: red">
							<td><b>Nome:</b></td>
							<td><input name="nome_cliente" size="30" value="<%=nome%>">
								&nbsp; Homem:<input type="radio" name="sexo_cliente" value="M"<%If sexo = "M" Then%> checked <%End If%>>
								&nbsp; Mulher:<input type="radio" name="sexo_cliente" value="F"<%If sexo = "F" Then%> checked <%End If%>>
								&nbsp; Outros:<input type="radio" name="sexo_cliente" value="O"<%If sexo = "O" Then%> checked <%End If%>>
							</td>
						</tr>
						<tr style="color: red">
							<td><b>Nascim:</b></td>
							<td>Dia:<select name="dia_cliente">
								<option value="<%=dia%>" selected><%=dia%>
								<option value="1">1
								<option value="2">2
								<option value="3">3
								<option value="4">4
								<option value="5">5
								<option value="6">6
								<option value="7">7
								<option value="8">8
								<option value="9">9
								<option value="10">10
								<option value="11">11
								<option value="12">12
								<option value="13">13
								<option value="14">14
								<option value="15">15
								<option value="16">16
								<option value="17">17
								<option value="18">18
								<option value="19">19
								<option value="20">20
								<option value="21">21
								<option value="22">23
								<option value="24">24
								<option value="25">25
								<option value="26">26
								<option value="27">27
								<option value="28">28
								<option value="29">29
								<option value="30">30
								<option value="31">31
								</select>&nbsp; Mês:<select name="mes_cliente">
								<option value="<%=mes%>" selected><%=mes%>
								<option value="1">1
								<option value="2">2
								<option value="3">3
								<option value="4">4
								<option value="5">5
								<option value="6">6
								<option value="7">7
								<option value="8">8
								<option value="9">9
								<option value="10">10
								<option value="11">11
								<option value="12">12
								</select>&nbsp; Ano:<select name="ano_cliente">
								<option value="<%=ano%>" selected><%=ano%>
								<option value="1950">&lt; 50
								<option value="1951">1951
								<option value="1952">1952
								<option value="1953">1953
								<option value="1954">1954
								<option value="1955">1955
								<option value="1956">1956
								<option value="1957">1957
								<option value="1958">1958
								<option value="1959">1959
								<option value="1960">1960
								<option value="1961">1961
								<option value="1962">1962
								<option value="1963">1963
								<option value="1964">1964
								<option value="1965">1965
								<option value="1966">1966
								<option value="1967">1967
								<option value="1968">1968
								<option value="1969">1969
								<option value="1970">1970
								<option value="1971">1971
								<option value="1972">1972
								<option value="1973">1973
								<option value="1974">1974
								<option value="1975">1975
								<option value="1976">1976
								<option value="1977">1977
								<option value="1978">1978
								<option value="1979">1979
								<option value="1980">1980
								<option value="1981">1981
								<option value="1982">1982
								<option value="1983">1983
								<option value="1984">1984
								<option value="1985">1985
								<option value="1986">1986
								<option value="1987">1987
								<option value="1988">1988
								<option value="1989">1989
								<option value="1990">1990
								<option value="1991">1991
								<option value="1992">1992
								<option value="1993">1993
								<option value="1994">1994
								<option value="1995">&gt; 95
								</select>&nbsp; Idade: ~<%=DateDiff("yyyy", CDate(dia & " " & mes & "," & ano), Date)%> anos</td>
						</tr>
						<tr>
							<td>Endereço:&nbsp;</td>
							<td><input name="rua_cliente" size="43" value="<%=rua%>"></td>
						</tr>
						<tr>
							<td>Bairro:</td>
							<td><input name="bairro_cliente" size="30" value="<%=bairro%>"></td>
						</tr>
						<tr>
							<td style="color: red"><b> Cidade:</b></td>
							<td><input name="cidade_cliente" size="30" value="<%=cidade%>"></td>
						</tr>
						<tr>
							<td style="color: red"><b>Estado:</b></td>
							<td><select name="estado_cliente">
								<option value="<%=estado%>" selected><%=estado%>
								<option value="EX">(Exterior)
								<option value="AC">AC
								<option value="AL">AL
								<option value="AM">AM
								<option value="AP">AP
								<option value="BA">BA
								<option value="CE">CE
								<option value="DF">DF
								<option value="ES">ES
								<option value="GO">GO
								<option value="MA">MA
								<option value="MG">MG
								<option value="MS">MS
								<option value="MT">MT
								<option value="PA">PA
								<option value="PB">PB
								<option value="PE">PE
								<option value="PI">PI
								<option value="PR">PR
								<option value="RJ">RJ
								<option value="RN">RN
								<option value="RO">RO
								<option value="RR">RR
								<option value="RS">RS
								<option value="SC">SC
								<option value="SE">SE
								<option value="SP">SP
								<option value="TO">TO
								</select>&nbsp; CEP: <input name="cep_cliente" size="11" value="<%=cep%>"></td>
						</tr>
						<tr>
							<td>Telefone:</td>
							<td><input name="fone_cliente" size="17" value="<%=fone%>"></td>
						</tr>
						<tr>
							<td style="color: blue">Email:</td>
							<td><%=Session("mail")%><input type=hidden name="email_cliente" value="<%=Session("mail")%>"></td>
						</tr>
						<tr style="color: red">
							<td><b>Senha:</b></td>
							<td nowrap><input type="password" name="senha_cliente" size="12" maxlength="10"><b>&nbsp; Confere-Senha: </b><input type="password" name="senha_cliente1" size="12" maxlength="10"></td>
						</tr>
					</table>
					</blockquote>
					</td>
				</tr>
			<input type="hidden" name="c0" value=<%=cor0%>>
			<input type="hidden" name="c1" value=<%=cor1%>>
			<input type="hidden" name="c2" value=<%=cor2%>>
				<tr>
					<td>
<%	If Left(Session("mail"),4) <> "0000" Then %>
						Para acessar o Sabichão você deverá entrar com seu login, que é o endereço de email cadastrado na inicialização, e a senha que você cadastrar acima.
						<br><br><input type="button" value="Cancelar-Voltar" style="border:0;background-color:rgb(255,255,255);background-image:url('images/bt3.gif');width:115;height:25" onClick="cancelA()"> &nbsp; &nbsp; 
						<input type="submit" name="Atualizar" value="Gravar Dados" style="border:0;background-color:rgb(255,255,255);background-image:url('images/bt3.gif');width:115;height:25">
<%	Else %>
						Dados Cadastrais não alteravéis, para usuários <b>VISITANTES</b>.
						<br><br><input type="button" value="Cancelar-Voltar" style="border:0;background-color:rgb(255,255,255);background-image:url('images/bt3.gif');width:115;height:25" onClick="cancelA()">
<%	End If %>
					</td>
				</tr>
			</table>
			</form>
		</td>
	</tr>
</table>
<hr>
		<span style="font-size: 8pt; color:#777777">
		<b>Compromisso Sabichão Web</b>: Através de nosso sistema você receberá somente os e-mails de: (1)Confirmação/Alteração
		de Cadastro; (2)Os eventuais para Lembrar Senha; e (3)Os que serão solicitados por você mesmo em sua
		Agenda.</span>
<hr>
<p>
<form method="post" name="CC" >	
<table cellpadding="0" cellspacing="0" width="600" style="font-family: Arial; font-size:9pt">
	<tr>
		<td colspan=6 style="font-family: Verdana; font-size:12pt"><b>Receber E-mails do Sabichão</b>:<p> </p></td>
	</tr>
	<tr>
		<td><input type="checkbox" name="m0" <%If cor0 = "1" Then %>checked<%End If%> onClick="Corresp1(0)"></td>
		<td><span id="v0"></span>NOVOS PRÊMIOS</td>
		<td><input type="checkbox" name="m1" <%If cor1 = "1" Then %>checked<%End If%> onClick="Corresp1(1)"></td>
		<td><span id="v1"></span>RESULTADOS de SORTEIOS</td>
		<td><input type="checkbox" name="m2" <%If cor2 = "1" Then %>checked<%End If%> onClick="Corresp1(2)"></td>
		<td><span id="v2"></span>NOVOS LANÇAMENTOS</td>
	</tr>
</table>
</form>
<!-- Inicio Preload de Imagens (opcional) -->
<img src="images/bot0pg.gif" width="0" height="0">
<img src="images/resp000.gif" width="0" height="0">
<img src="images/cont000.gif" width="0" height="0">
<!-- Final Preload de Imagens (opcional) -->

</center>
</body></html>