<!--//

if ((parent.window.name).indexOf("inicial") < 0) location.href = "/help.htm"             //http://www.aggora.com.br/sabio

function OnCarg(){
    NCalc.innerText = " ";
    formProm.botao.src = "../images/cont000.gif";
    formProm.nome_indicado.focus();
}

function isEmpty(s){
	return ((s == null) || (s.length == 0));
}

function checkField(s){
	if ((s.indexOf("\'")>=0) || (s.indexOf("\"")>=0) || (s.indexOf("*")>=0) || (s.indexOf("?")>=0) || (s.indexOf("\\")>=0) || (s.indexOf("/")>=0) || (s.indexOf(":")>=0) || (s.indexOf("<")>=0) || (s.indexOf(">")>=0) || (s.indexOf("|")>=0)) {	
		return false;
	}
	return true
}

function warnInvalid(theField, s, EmptyOK){
	theField.focus()
	theField.select()
		if (EmptyOK) {
			alert("RG 3.0 - DADOS INCORRETOS:\n\nO campo "+s+" cont�m caracteres inv�lidos !\nOs caracteres \' \" * ? \\ / : < > | n�o s�o aceitos pelo sistema.")
		} else {
			alert("RG 3.0 - DADOS INCOMPLETOS:\n\nO campo "+s+" deve ser preenchido !\nOs caracteres \' \" * ? \\ / : < > | n�o s�o aceitos pelo sistema.")
	}
	return false
}

function verifica(){
	if (!checkField(formProm.nome_indicado.value) || isEmpty(formProm.nome_indicado.value)) {
		warnInvalid (formProm.nome_indicado, 'Amigo(a) (Nome)', false)
		return false }
	if (!checkField(formProm.email_indicado.value) || isEmpty(formProm.email_indicado.value)) {
		warnInvalid (formProm.email_indicado, 'E-mail', false)
		return false }
	if ((formProm.email_indicado.value).indexOf("@") < 0 || (formProm.email_indicado.value).length < 10 || (formProm.email_indicado.value).indexOf(" ") >= 0) {
		alert('RG 3.0 - ALERTA:\n\nO Endere�o E-mail informado est� incorreto !')
		return false }
    formProm.action = "Sabio02.aspx"; formProm.submit();     //http://www.aggora.com.br/sabio/1/promo/
}

function onBotao(){
	formProm.botao.src = "../images/cont000.gif"
}

function ofBotao(){
	formProm.botao.src = "../images/cont001.gif"
}

function click_me(){
    if (event.button > 1) alert("RG 3.0 - Informa��o (�_�):\n\nOpss - Utilize somente o bot�o esquerdo do mouse")
}
	document.onmousedown=click_me

//-->