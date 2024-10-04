<!--//

var ieBlink = true; //(document.all)?true:false;
function doBlink() {
    if (ieBlink) {
        obj = document.getElementsByTagName('blink');
        for (i = 0; i < obj.length; i++) { tag = obj[i]; tag.style.visibility = (tag.style.visibility == 'hidden') ? 'visible' : 'hidden'; }
    }
}

var AbreWin;
function AbreJan(i, j, k) {
    if (AbreWin != null) AbreWin.close();
    str1 = "sorte/passa/Sabio" + i; //http://www.aggora.com.br/sabio/
    str2 = "top=0,left=0,scrollbars=1,width=" + j + ",height=" + k;
    AbreWin = window.open(str1, "AbreWin", str2);
}

function linkar(obj){
	if(event.srcElement.tagName=='TD'){
        URL = 'Sabio18.aspx?ID=' + obj       //http://www.aggora.com.br/sabio/1/
		location.href = URL
	}
}

function linka(obj){
	if(event.srcElement.tagName=='TD'){
        URL = 'Sabio' + obj + '.aspx'        //http://www.aggora.com.br/sabio/1/
		location.href = URL
	}
}

function isEmpty(s){
	return ((s == null) || (s.length == 0))
}

function checkField(s){
	if ((s.indexOf("\'")>=0) || (s.indexOf("\"")>=0) || (s.indexOf(" ")>=0) || (s.indexOf("*")>=0) || (s.indexOf("?")>=0) || (s.indexOf("\\")>=0) || (s.indexOf("/")>=0) || (s.indexOf(":")>=0) || (s.indexOf("<")>=0) || (s.indexOf(">")>=0) || (s.indexOf("|")>=0)) {	
		return false
	}
	return true
}

function warnInvalid (theField, s, EmptyOK){
	theField.focus()
	theField.select()
		if (EmptyOK) {
			alert("RG 3.0 - DADOS INCORRETOS:\n\nO campo "+s+" contém caracteres inválidos !\nOs caracteres \' \" * ? \\ / : < > | e espaço não são aceitos pelo sistema.")
		} else {
			alert("RG 3.0 - DADOS INCOMPLETOS:\n\nO campo "+s+" deve ser preenchido !\nOs caracteres \' \" * ? \\ / : < > | e espaço não são aceitos pelo sistema.")
	}
	return false
}

function verifica(){
	if (!checkField(logonForm.userlogon.value) || isEmpty(logonForm.userlogon.value)) {
		warnInvalid (logonForm.userlogon, 'Seu Email', false)
		return false }
	if ((logonForm.userlogon.value).indexOf("@") < 0 || (logonForm.userlogon.value).length < 10) {
		alert('RG 3.0 - ALERTA:\n\nO Endereço E-mail informado está incorreto !')
		return false }
	if (!checkField(logonForm.userpassw.value) || isEmpty(logonForm.userpassw.value)) {
		warnInvalid (logonForm.userpassw, 'Uma Senha', false)
		return false }
	if ((logonForm.userpassw.value).length < 6){
        alert('RG 3.0 - Solicitação (º_º):\n\nUtilize uma Senha com um mínimo de 6 caracteres!')
		return false }
	return true
}

function verificaNEW() {
    if (!checkField(logonForm.userlogon.value) || isEmpty(logonForm.userlogon.value)) {
        warnInvalid(logonForm.userlogon, 'Seu Log-in (E-mail Completo)', false)
        return false
    }
    if ((logonForm.userlogon.value).indexOf("@") < 0 || (logonForm.userlogon.value).length < 10) {
        alert('RG 3.0 - ALERTA:\n\nO Endereço E-mail informado está incorreto !')
        return false
    }
    if (!checkField(logonForm.userpassw.value) || isEmpty(logonForm.userpassw.value)) {
        warnInvalid(logonForm.userpassw, 'Uma Senha', false)
        return false
    }
    if ((logonForm.userpassw.value).length < 6) {
        alert('RG 3.0 - Solicitação (º_º):\n\nUtilize uma Senha com um mínimo de 6 caracteres!')
        return false
    }
    return true;
}


function Help1() {
    alert("SABICHÃO WEB - AJUDA:\n\n  COMO APOSTAR:\n" +
        "1 - Escolha o PRÊMIO e clique no Botão [ Apostar ] correspondente.\n" +
        "     Voce será direcionado para Sala de Aposta RG Giga-Senna Web,\n" +
        "     aí lá, você preenche uma Cartela da Senna com 10 a 15 dezenas.\n" +
        "     Nesta Sala você poderá Simular ou Registrar sua aposta.\n\n" +
        "2 - Distribua seus PONTOS como desejar entre os PRÊMIOS.\n" +
        "     A apuração é a realizada pela Mega Sena (CEF). Boa Sorte!\n\n" +
        "3 - Maiores detalhes confira o texto no final desta página.")
    return false
}

function click_me(){
    if (event.button > 1) alert("RG 3.0 - Informação (º_º):\n\nOpss - Utilize somente o botão esquerdo do mouse")
}
	document.onmousedown=click_me

//-->