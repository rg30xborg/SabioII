<%@ Language=VBScript %>
<%
	Response.Expires = 0

If inStr(Request.ServerVariables("HTTP_HOST"), "www.aggora.com.br") = 0 Then
	Response.Redirect "http://www.aggora.com.br/sabio/help.htm"
	Response.End
Else
	If Session("IPUserSab") = "" Or Session("mail") = "" Then
		Response.Redirect "http://www.aggora.com.br/sabio/1/sabio12.asp"
		Response.End
	End If

	if Session("IPUserSab") = ":Anonimo:" Or Session("IPUserSab") = "" Then
		Response.Redirect "http://www.aggora.com.br/sabio/1/promo/sabio06.asp?err=3"
		Response.End
	End If

' Pega os dados de cliente
	title = Request("title")
	descr = Request("descr")
	spec = Request("spec")

	If title = "" Or descr = "" Or spec = "" Then 
		Response.Redirect "http://www.aggora.com.br/sabio/1/promo/sabio06.asp?err=1"
		Response.End

	Else
' Abre conexao com banco de dados
		Set Conexao = Server.CreateObject("ADODB.Connection")
		'SQLServer =>  'Conexao.Open "Provider=SQLOLEDB.1;SERVER=aggora1.mysql.dbaas.com.br;DATABASE=aggora1;UID=aggora1;PWD=dade02;"
		Conexao.Open "DRIVER={MySQL ODBC 5.3 ANSI Driver};SERVER=aggora1.mysql.dbaas.com.br;PORT=3306;DATABASE=aggora1;USER=aggora1;PASSWORD=dade02;OPTION=3;"

		Set RS_Max = Server.CreateObject("ADODB.Recordset")
		'RS_Max.CursorType = adOpenKeyset
		'RS_Max.LockType = adLockOptimistic
		RS_Max.Open "SELECT MAX(Codigo) AS max_Codigo FROM Perg0014", Conexao
			If IsNull(RS_Max("max_Codigo")) Then
				novo_Codigo = 1
			Else
				novo_Codigo = RS_Max("max_Codigo") + 1
			End If
			ex = Session("mail")
			'perg = novo_Codigo & ". " & perg & " - (por: " & Session("IPUserSab") & ")"
			arq = ""
			If spec = "a" Then
				spec = "Poesia"
			Else
				if spec = "b" Then
					spec = "Imagem"
					arq = "User" & Session("id") & "-" & novo_Codigo & ".jpg"
				Else
					if spec = "c" Then
						spec = "Audio"
						arq = "User" & Session("id") & "-" & novo_Codigo & ".mp3"
					Else
						if spec = "d" Then
							spec = "Video"
							arq = "User" & Session("id") & "-" & novo_Codigo & ".mp4"
						Else
							spec = "Outros"
						End If
					End If
				End If
			End If
			ip = Request.ServerVariables("REMOTE_HOST")
			inc = FormatDateTime(Now, 0) 'NAO COSNEGUI INCLUIR DATA/HORA NO MYSQL - DEIXER PRO BANCO INSERIR
			msg = Session("IPUserSab") & ": Parabéns por sua participação na Promoção Seu Talento (nº " & novo_Codigo & "). Você já faturou 50 pts. Dica! - Envie quantas Artes desejar."

		Conexao.Execute "INSERT INTO Perg0014(USR_ID, Titulo, Descricao, Tipo, Arquivo, ip, valido) VALUES(" & Session("id") & ",'" & title & "','" & descr & "','" & spec & "','" & arq & "','" & ip & "','" & 1 & "')"
		Conexao.Execute "INSERT INTO Eventos(USR_ID, EVN_Email, EVN_Desc, EVN_Tipo) VALUES (" & Session("id") & ",'" & ex & "','" & msg & "','Promoção Seu Talento')"

' Adiciono os pontos pela pergunta valida - depois posso retirar este ponto se a pergunta não for (providenciar)
		Set Pontos = Server.CreateObject("ADODB.Recordset")
		'Pontos.CursorType = adOpenKeyset
		'Pontos.LockType = adLockOptimistic
		Pontos.Open "SELECT * FROM UserDados WHERE USR_ID = " & Session("id"), Conexao
			pTotl = Pontos("USD_Total") + 50
			pPerg = Pontos("USD_Pergunta") + 50
			Conexao.Execute "UPDATE UserDados SET USD_TOTAL = " & pTotl & ", USD_Pergunta = " & pPerg & " WHERE USR_ID = " & Session("id")
		Pontos.Close
		Set Pontos = Nothing

		RS_Max.Close
		Set RS_Max = Nothing

		Response.Redirect "http://www.aggora.com.br/sabio/1/promo/sabio06.asp?ok=1"
		Response.End
	End If

End If
%>
