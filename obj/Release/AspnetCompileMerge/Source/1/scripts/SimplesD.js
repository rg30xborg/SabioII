<!--//

if ((parent.window.name).indexOf("inicial") < 0) location.href = "/help.htm"             //http://www.aggora.com.br/sabio

var inicial = cart = 0, rodrol = apost = "", serverURL = "sabio02.asp", contD = 0

function OnCarg(){
	//if((this.location.href).indexOf("http://www.aggora.com.br") < 0) location.href = "http://www.aggora.com.br/sabio/help.htm"
    //else {
        NCalc.innerText = " "
		top.frames.super1.Ponto.innerText = 0
		top.frames.super1.USerID.innerText = "Visitante " + IDUsuario
		Tinicial()
	//}
}

function Tinicial(){
	contD ++
	if(contD == 5){
		if(confirm("SABICHÃO WEB INFORMAÇÃO:\n\nEstá é uma versão MINI-DEMO da Sala\ne não inclue grande parte dos recursos do Site.\n\nDeseja conhecer a versão TOTAL ?") == true) parent.location.href = "http://www.aggora.com.br/sabio/1/Sabio01.aspx"
		else contD = 0 }
	var t = new Date(); inicial = (t.getHours() * 3600) + (t.getMinutes() * 60) + t.getSeconds()
	cart = 1; botao.src = "../images/resp001.gif"; Tempos.innerText = "cronometrando ..."

}

function onImage(num){
	if(cart == 1){
		for(var i = 1; i < 6; i++) document.images["n" + i].src = "../images/happy0.gif"
		document.images["n" + num].src = "../images/happy3.gif"
	}
	switch(num){
		case 1 : apost = "a"; break
		case 2 : apost = "b"; break
		case 3 : apost = "c"; break
		case 4 : apost = "d"; break
		case 5 : apost = "e"; break
	}
}

function StartRGQuizWeb(){
	if(cart == 1){
		if(apost == ""){
            alert("RG 3.0 - Solicitação (º_º):\n\nUma das resposta deve ser marcada para responder")
			return false
		}
		cart = 0; apost = nPerg0 + ":" + apost
		var co = RSExecute(serverURL,"Method1",apost,myBackCart,errorCallBack)
	}
	else{	if(rodrol == "ok"){ rodrol = ""
			botao.src = "../images/bot0pg.gif"
			var co = RSExecute(serverURL,"Method2",myFirstBack,errorCallBack)
		}
	}
}

function myBackCart(co){
	cox = co.return_value[0]
	if(cox == "ok"){
		document.images["n" + co.return_value[1]].src = "../images/happy1.gif"
		Salas.innerText = parseInt(eval(Salas.innerText), 10) + co.return_value[2]
		top.frames.super1.Ponto.innerText = parseInt(eval(top.frames.super1.Ponto.innerText), 10) + co.return_value[3]
		Consc.innerText = parseInt(eval(Consc.innerText), 10) + co.return_value[4]
		som = "document.somcerto"
	}
	else{
		Consc.innerText = 0
		document.images["n" + co.return_value[1]].src = "../images/happy2.gif"
		som = "document.somerro"
	}

	var t = new Date(); var final = (t.getHours() * 3600) + (t.getMinutes() * 60) + t.getSeconds(); final -= inicial
	Tempos.innerText = (Math.ceil(final / 60) - 1) + "min:" + (final % 60) + "seg."
	botao.src = "../images/cont001.gif"; rodrol = "ok"
	if(eval(som) != null){ if (eval(som + ".Filename")) eval(som + ".play()") }
} 

function myFirstBack(co){
	cox = co.return_value[0]
	NPerg.innerText  = co.return_value[0]
	NResp1.innerText = co.return_value[1]
	NResp2.innerText = co.return_value[2]
	NResp3.innerText = co.return_value[3]
	NResp4.innerText = co.return_value[4]
	NResp5.innerText = co.return_value[5]
	nPerg0 = co.return_value[6]
	for(var i = 1; i < 6; i++){
		document.images["n" + i].src = "../images/happy3.gif"; Resposta(i - 1).status = 0
	}
	apost = ""; Tinicial()
} 

function errorCallBack(co){
	alert("RG 3.0 - ERRO:\n\n  Prováveis Causa:\n" +
		"1 - A conexão Internet teve problemas ou foi interrompida.\n" + 
		"2 - A conexão Internet esteve ociosa por mais de 20 minutos.\n" +
		"  Dicas de Correção.\n" + 
		"Digite: http://www.aggora.com.br/sabio e tecle [Enter].\n\n" + 
		"  Se o problema persistir contate-nos via E-mail.")
}

function onBotao(){
	if(cart == 1) botao.src = "../images/resp000.gif"
	if(rodrol == "ok") botao.src = "../images/cont000.gif"
}

function ofBotao(){
	if(cart == 1) botao.src = "../images/resp001.gif"
	if(rodrol == "ok") botao.src = "../images/cont001.gif"
}

function Desistir(){
	if(confirm("SABICHÃO WEB INFORMA:\n\nOs iténs do menu não estão abilitados na versão DEMO, .\nDeseja entrar no Jogo em sua versão TOTAL ?") == true) parent.location.href = "http://www.aggora.com.br/sabio/1/Sabio01.aspx"
}

function click_me(){
    if (event.button > 1) alert("RG 3.0 - Informação (º_º):\n\nOpss - Utilize somente o botão esquerdo do mouse")
}
	document.onmousedown = click_me

//-->