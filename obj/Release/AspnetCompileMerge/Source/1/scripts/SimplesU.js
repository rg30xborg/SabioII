<!--//

if((parent.window.name).indexOf("inicial") < 0) location.href = "http://www.aggora.com.br/sabio/help.htm"

function OnCarg(){
	NCalc.innerText = " "; if(Revisar.perg.value == "") Revisar.perg.focus()
}

function isEmpty(s){
	return ((s == null) || (s.length == 0));
}

function checkField(s){
	if ((s.indexOf("\'")>=0) || (s.indexOf("\"")>=0) || (s.indexOf("\\")>=0) || (s.indexOf("<")>=0) || (s.indexOf(">")>=0) || (s.indexOf("|")>=0)) {	
		return false;
	}
	return true
}

function warnInvalid (theField, s, EmptyOK){
	theField.focus()
	theField.select()
		if (EmptyOK) {
			alert("O campo "+s+" contém caracteres inválidos !\nOs caracteres \' \" \\ < > | não são aceitos pelo sistema.")
		} else {
			alert("RG 3.0 - DADOS IMCOMPLETOS:\n\nO campo [ "+s+" ] deve ser preenchido !\nOs caracteres \' \" \\ < > | não são aceitos pelo sistema.")
	}
	return false
}

function Verfica2(){
	if(!checkField(Revisar.perg.value) || isEmpty(Revisar.perg.value)){
		warnInvalid (Revisar.perg, "Pergunta", false)
		return false
	}
	if(!checkField(Revisar.res1.value) || isEmpty(Revisar.res1.value)){
		warnInvalid (Revisar.res1, "Resposta a", false)
		return false
	}
	if(!checkField(Revisar.res2.value) || isEmpty(Revisar.res2.value)){
		warnInvalid (Revisar.res2, "Resposta b", false)
		return false
	}
	if(!checkField(Revisar.res3.value) || isEmpty(Revisar.res3.value)){
		warnInvalid (Revisar.res3, "Resposta c", false)
		return false
	}
	if(!checkField(Revisar.res4.value) || isEmpty(Revisar.res4.value)){
		warnInvalid (Revisar.res4, "Resposta d", false)
		return false
	}
	if(!checkField(Revisar.res5.value) || isEmpty(Revisar.res5.value)){
		warnInvalid (Revisar.res5, "Resposta e", false)
		return false
	}
	if(!Revisar.spec[0].checked && !Revisar.spec[1].checked && !Revisar.spec[2].checked && !Revisar.spec[3].checked && !Revisar.spec[4].checked){
		alert("RG 3.0 - ATENÇÃO:\n\nVocê deve marcar qual é a única Resposta Certa")
		return false
	}
}

function Verfica1(){
	if(!checkField(Revisar.perg.value) || isEmpty(Revisar.perg.value)){
		warnInvalid (Revisar.perg, "Pergunta", false)
		return false
	}
	if(!checkField(Revisar.res1.value) || isEmpty(Revisar.res1.value)){
		warnInvalid (Revisar.res1, "Resposta a", false)
		return false
	}
	if(!checkField(Revisar.res2.value) || isEmpty(Revisar.res2.value)){
		warnInvalid (Revisar.res2, "Resposta b", false)
		return false
	}
	if(!checkField(Revisar.res3.value) || isEmpty(Revisar.res3.value)){
		warnInvalid (Revisar.res3, "Resposta c", false)
		return false
	}
	if(!checkField(Revisar.res4.value) || isEmpty(Revisar.res4.value)){
		warnInvalid (Revisar.res4, "Resposta d", false)
		return false
	}
	if(!checkField(Revisar.res5.value) || isEmpty(Revisar.res5.value)){
		warnInvalid (Revisar.res5, "Resposta e", false)
		return false
	}
	if(!Revisar.spec[0].checked && !Revisar.spec[1].checked && !Revisar.spec[2].checked && !Revisar.spec[3].checked && !Revisar.spec[4].checked){
		alert("RG 3.0 - ATENÇÃO:\n\nVocê deve marcar qual é a única Resposta Certa")
		return false
	}
	Revisar.action="http://www.aggora.com.br/sabio/1/promo/sabio04.asp"; Revisar.submit();
}

function respA(num){
	for(i = 1; i < 6; i++) eval("Revisar.res" + i).style.backgroundColor = "#FFFFFF"
 	eval("Revisar.res" + num).style.backgroundColor = "#C0F0C0"
}

function tipoA(num){
	if(num > 1 && num < 5) Revisar.arqUpLoad.style.visibility = "visible"
 	else Revisar.arqUpLoad.style.visibility = "hidden"
}

function onBotao(){
	Revisar.botao.src = "../images/cont000.gif"
}

function ofBotao(){
	Revisar.botao.src = "../images/cont001.gif"
}


function myArquivo() {
	var x = document.createElement("INPUT");
	x.setAttribute("type", "file");
	document.body.appendChild(x);
}

function VerficaARQ(){
	if(!checkField(Revisar.title.value) || isEmpty(Revisar.title.value)){
		warnInvalid (Revisar.title, "Titulo (máx. 256 caracts)", false)
		return false
	}
	if(!checkField(Revisar.descr.value) || isEmpty(Revisar.descr.value)){
		warnInvalid (Revisar.descr, "Descrição (máx. 1024 caracts)", false)
		return false
	}
	if(!Revisar.spec[0].checked && !Revisar.spec[1].checked && !Revisar.spec[2].checked && !Revisar.spec[3].checked && !Revisar.spec[4].checked){
		alert("RG 3.0 - ATENÇÃO:\n\nVocê deve marcar qual é o Tipo de Sua Criação")
		return false
	}
	Revisar.action="http://www.aggora.com.br/sabio/1/promo/sabio07.asp"; Revisar.submit();
}

function click_me(){
    if (event.button > 1) alert("RG 3.0 - Informação (º_º):\n\nHummmmm - Utilize somente o botão esquerdo do mouse")
}
	document.onmousedown=click_me
//-->