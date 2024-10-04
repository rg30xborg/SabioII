<%@ LANGUAGE=VBSCRIPT %>
<%
	Response.Expires = 0

If Session("IPUserSab") = "" Or Session("mail") = "" Then
	Response.Redirect "http://www.aggora.com.br/sabio/1/sabio12.asp"
	Response.End
Else
	ref = Request("ref")

' Numero de perguntas no banco de dados na Sala e o ("hoje") é para computar o dia na Sala
	Set Conexao = Server.CreateObject("ADODB.Connection")
	'SQLServer =>  'Conexao.Open "Provider=SQLOLEDB.1;SERVER=187.45.196.225;DATABASE=aggora1;UID=aggora1;PWD=dade02;"
	Conexao.Open "DRIVER={MySQL ODBC 5.3 ANSI Driver};SERVER=187.45.196.225;PORT=3306;DATABASE=aggora1;USER=aggora1;PASSWORD=dade02;OPTION=3;"


	Set Clicks = Server.CreateObject("ADODB.Recordset")
	'Clicks.CursorType = adOpenKeyset
	'Clicks.LockType = adLockOptimistic
	Clicks.Open "SELECT * FROM Patrocinio WHERE PAT_Cod = " & ref, Conexao
		Lref = Clicks("PAT_Link")
		Eref = Clicks("PAT_Nome")
		clik = Clicks("PAT_Click") + 1
		Conexao.Execute "UPDATE Patrocinio SET PAT_Click = " & clik & " WHERE PAT_Cod = " & ref
	Clicks.Close
	Set Clicks = Nothing

	Set Bonus = Server.CreateObject("ADODB.Recordset")
	'Bonus.CursorType = adOpenKeyset
	'Bonus.LockType = adLockOptimistic
	Bonus.Open "SELECT USD_Total, USD_1em FROM UserDados WHERE USR_ID = " & Session("id"), Conexao
	text = Bonus("USD_1em")
	pClik = Mid(text, (inStr(text, "Clik:") + 5))			'cPerg:1Sala:0Data:28/05/2008Qtde:1Clik:no
	If pClik = "no" Then
		text = Left(text, (inStr(text, "Clik:") - 1))
		pAnt = Left(text, (inStr(text, "Sala:") + 4))
		pSala = Mid(text, (inStr(text, "Sala:") + 5))
		pSala = Left(pSala, (inStr(pSala, "Data:") - 1))
		pSala = cInt(pSala) + 100
		pPos = Mid(text, inStr(text, "Data:"))
		pRest = pAnt + cStr(pSala) + pPos
		pRest = pRest & "Clik:ok"
		pTotl = Bonus("USD_Total") + 100
		msg = Session("IPUserSab") & " voce faturou 100 PONTOS EXTRAS por seu Clique no Banner da (" & Eref & "). Nota! - Prêmio disponível apenas uma vez por dia."

		Conexao.Execute "UPDATE UserDados SET USD_1em = '" & pRest & "', USD_Total = " & pTotl & " WHERE USR_ID = " & Session("id") 	
		Conexao.Execute "INSERT INTO Eventos (USR_ID, EVN_Email, EVN_Desc, EVN_Tipo) VALUES (" & Session("id") & ",'" & Session("mail") & "','" & msg & "','Clique Premiado')"
	End If
	Bonus.Close
	Set Bonus = Nothing

	Conexao.Close
	Set Conexao = Nothing
	Response.Redirect Lref
	Response.End
End If
%>