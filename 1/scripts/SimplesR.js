<!--//

function OnCarg() {
    NCalc.innerText = " "
}

function cancelA(){
	history.back()
}

function isEmpty(s){
	return ((s == null) || (s.length == 0))
}

function checkField(s){
	if ((s.indexOf("\'")>=0) || (s.indexOf("\"")>=0) || (s.indexOf("*")>=0) || (s.indexOf("?")>=0) || (s.indexOf("\\")>=0) || (s.indexOf("/")>=0) || (s.indexOf(":")>=0) || (s.indexOf("<")>=0) || (s.indexOf(">")>=0) || (s.indexOf("|")>=0)) {	
		return false
	}
	return true
}

function warnInvalid (theField, s, EmptyOK){
	theField.focus()
	theField.select()
		if (EmptyOK) {
			alert("RG 3.0 - DADOS INCORRETOS:\n\nO campo "+s+" cont�m caracteres inv�lidos !\nOs caracteres \' \" * ? \\ / : < > | n�o s�o aceitos pelo sistema.")
		} else {
			alert("RG 3.0 - DADOS INCOMPLETOS:\n\nO campo "+s+" deve ser preenchido !\nOs caracteres \' \" * ? \\ / : < > | n�o s�o aceitos pelo sistema.")
	}
	return false
}

function verifica (){
	if (!checkField(Cads.nome_cliente.value) || isEmpty(Cads.nome_cliente.value)) {
		warnInvalid (Cads.nome_cliente, 'Nome', false);
		return false }
	if (!isEmpty(Cads.rua_cliente.value) && !checkField(Cads.rua_cliente.value)){
		warnInvalid (Cads.rua_cliente, 'Endere�o', true)
		return false }
	if (!isEmpty(Cads.bairro_cliente.value) && !checkField(Cads.bairro_cliente.value)){
		warnInvalid (Cads.bairro_cliente, 'Bairro', true)
		return false }
	if (!checkField(Cads.cidade_cliente.value) || isEmpty(Cads.cidade_cliente.value)) {
		warnInvalid (Cads.cidade_cliente, 'Cidade', false);
		return false }
	if (!isEmpty(Cads.cep_cliente.value) && !checkField(Cads.cep_cliente.value)){
		warnInvalid (Cads.cep_cliente, 'Cep', true)
		return false }
	if (!isEmpty(Cads.fone_cliente.value) && !checkField(Cads.fone_cliente.value)){
		warnInvalid (Cads.fone_cliente, 'Telefone', true)
		return false }
	if (!checkField(Cads.email_cliente.value) || isEmpty(Cads.email_cliente.value)) {
		warnInvalid (Cads.email_cliente, 'Email', false);
		return false }
	if ((Cads.email_cliente.value).indexOf("@") < 0 || (Cads.email_cliente.value).length < 10 || (Cads.email_cliente.value).indexOf(" ") >= 0) {
		alert('RG 3.0 - INFORMA��O:\n\nO Endere�o E-mail informado est� incorreto !')
		return false }
	if (!checkField(Cads.senha_cliente.value) || isEmpty(Cads.senha_cliente.value)) {
		warnInvalid (Cads.senha_cliente, 'Senha', false);
		return false }
	if ((Cads.senha_cliente.value).length < 6){
        alert('RG 3.0 - Solicita��o (�_�):\n\nUtilize uma Senha com um m�nimo de 6 caracteres!')
		return false }
	if (!checkField(Cads.senha_cliente1.value) || isEmpty(Cads.senha_cliente1.value)) {
		warnInvalid (Cads.senha_cliente1, 'Confirma��o de Senha', false);
		return false }
	if (Cads.senha_cliente1.value != Cads.senha_cliente.value) {
		alert('RG 3.0 - DADOS INCORRETOS:\n\nConfirma��o de Senha diferente da Senha')
		return false }

	return true
}

function Corresp1(num){
	CC["m" + num].checked ? Cads["c" + num].value = 1 : Cads["c" + num].value = 0
}

function click_me(){
    if (event.button > 1) alert("RG 3.0 - Informa��o (�_�):\n\nOps - Utilize somente o bot�o esquerdo do mouse")
}

    document.onmousedown = click_me

//-->
