<!--//

var inicial = cart = 0, rodrol = apost = "", serverURL = "sabio02.asp"

function OnCarg(){
	if((this.location.href).indexOf("http://www.aggora.com.br") < 0) location.href = "http://www.aggora.com.br/sabio/help.htm"
	else{	NCalc.innerText = " "; rodrol = "ok"; botao.src = "../images/cont001.gif" }
}

function Tinicial(){
	var t = new Date(); inicial = (t.getHours() * 3600) + (t.getMinutes() * 60) + t.getSeconds()
	cart = 1; botao.src = "../images/resp001.gif"; Tempos.innerText = "cronometrando ..."
	NTabl.style.visibility = ""; NFig1.src = "sabio01.gif"
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
	if(rodrol == "ok"){ rodrol = ""; NFig2.src = "sabio05.gif"; Tempo.innerText = "?!?"
		botao.src = "../images/bot0pg.gif"
		var co = RSExecute(serverURL,"Method2",myFirstBack,errorCallBack)
	}
	else{	if(cart == 1){
			if(apost == ""){
                alert("RG 3.0 - Solicita��o (�_�):\n\nUma das resposta deve ser marcada para responder")
				return false
			}
			cart = 0; botao.src = "../images/bot0pg.gif"
			var t = new Date(); var final = (t.getHours() * 3600) + (t.getMinutes() * 60) + t.getSeconds(); final -= inicial
			final = parseInt(final.toString(),10); NFig1.src = "sabio00.gif"
			Tempo.innerText = (final < 10 ? "0" + final : final)
			NFig2.src = (final == 25 ? "sabio04.gif" : (final < 25 ? "sabio03.gif" : "sabio02.gif"))
			var co = RSExecute(serverURL,"Method1",apost,final,myBackCart,errorCallBack)
		}
	}
}

function myBackCart(co){
	cox = co.return_value[0]
	if(cox == "ok"){
		document.images["n" + co.return_value[1]].src = "../images/happy1.gif"
		Salas.innerText = co.return_value[2]
		top.frames.super1.Ponto.innerText = co.return_value[3]
		som = "document.somcerto"
	}
	else{
		document.images["n" + co.return_value[1]].src = "../images/happy2.gif"
		som = "document.somerro"
	}

	Consc.innerText = co.return_value[4]
	var t = new Date(); var final = (t.getHours() * 3600) + (t.getMinutes() * 60) + t.getSeconds(); final -= inicial
	Tempos.innerText = (Math.ceil(final / 60) - 1) + "min:" + (final % 60) + "seg."
	botao.src = "../images/cont001.gif"; rodrol = "ok"
	if(eval(som) != null){ if (eval(som + ".Filename")) eval(som + ".play()") }
} 

function myFirstBack(co){
	cox = co.return_value[0]
	if(cox == "xo") location.href = "http://www.aggora.com.br/sabio/1/tema"+co.return_value[2]+"/Sabio03.aspx?ptSala="+co.return_value[1]
	else{	NPerg.innerText  = co.return_value[0]
		NResp1.innerText = co.return_value[1]
		NResp2.innerText = co.return_value[2]
		NResp3.innerText = co.return_value[3]
		NResp4.innerText = co.return_value[4]
		NResp5.innerText = co.return_value[5]
		for(var i = 1; i < 6; i++){
			document.images["n" + i].src = "../images/happy3.gif"; Resposta(i - 1).status = 0
		}
		apost = ""; Tinicial()
	}
} 

function errorCallBack(co){
	alert("RG 3.0 - ERRO:\n\n" +
		"Prov�veis Causa:\n" + 
		"1 - A conex�o Internet teve problemas ou foi interrompida.\n" + 
		"2 - A conex�o Internet esteve ociosa por mais de 20 minutos.\n" +
		"3 - Acesse www.java.com/pt_BR e instale o plug-in Java da SUN.\n" +
		"Dicas de Corre��o:\n" + 
		"1a - Recarregue o Site e tente novamente (F5).\n" + 
		"2a - Navegue exclusivamente pelos bot�es do \"Sabich�o Web\".\n" +
		"Se o problema persistir contate-nos via E-mail.")
}

function onBotao(){
	if(cart == 1) botao.src = "../images/resp000.gif"
	if(rodrol == "ok") botao.src = "../images/cont000.gif"
}

function ofBotao(){
	if(cart == 1) botao.src = "../images/resp001.gif"
	if(rodrol == "ok") botao.src = "../images/cont001.gif"
}

function click_me(){
    if (event.button > 1) alert("RG 3.0 - Informa��o (�_�):\n\nOpss - Utilize somente o bot�o esquerdo do mouse")
}
	document.onmousedown = click_me

//-->