<!--//

var inicial = cart = cht = cod = 0, valor = 50
var rodrol = apost = aposl = "", serverURL = "sabio02.asp", chute = "Atщ 5 Palpites:"

function OnCarg(){
	if((this.location.href).indexOf("http://www.aggora.com.br") < 0) location.href = "http://www.aggora.com.br/sabio/help.htm"
	else{	NCalc.innerText = " "; rodrol = "ok"; botao.src = "../images/cont001.gif" }
}

function Tinicial(){
	cht = 0; valor = 50; NValr1.innerText = valor
	var t = new Date(); inicial = (t.getHours() * 3600) + (t.getMinutes() * 60) + t.getSeconds()
	cart = 1; Tempos.innerText = "cronometrando ..."; NTabl.style.visibility = ""
	Resposta.value = ""; Resposta.focus(); if(cod == 1) NFig2.src = fig; if(cod == 2) NFig1.src = fig
}

function StartRGQuizWeb(){
	if(rodrol == "ok"){ rodrol = ""; botao.src = "../images/bot0pg.gif"
		var co = RSExecute(serverURL,"Method2",myFirstBack,errorCallBack)
	}
	else{	if(cart == 1){
			cart = 0; letra = Resposta.value.toUpperCase()
			if(letra == "" || letra == " "){
				Resposta.focus(); Resposta.select()
                alert("RG 3.0 - Solicitaчуo (К_К):\n\nSua Resposta deve ser preenchida!")
				cart = 1; return false
			}
			else{	cht += 1; chute += "\n" + cht + "/5 " + letra; NValr2.innerText = chute
				if(letra == apost || letra == aposl){
					if(cod < 2) NFig1.src = "sabio02.gif"; else NFig2.src = "sabio05.gif"
					botao.src = "../images/bot0pg.gif"
					var co = RSExecute(serverURL,"Method1",valor,myBackCart,errorCallBack)
				}
				else{	valor -= 10; NValr1.innerText = valor
					if(cod < 2) NFig1.src = "sabio01.gif"; else NFig2.src = "sabio04.gif"
					if(valor == 0){
						Resposta.value = "OK = " + apost; botao.src = "../images/bot0pg.gif"
						var co = RSExecute(serverURL,"Method1",valor,myBackCart,errorCallBack)
					}
					else{	Resposta.focus(); Resposta.select(); cart = 1; botao.src = "../images/resp001.gif" }
				}
			}
		}
	}
}

function myBackCart(co){
	cox = co.return_value[0]
	if(cox == "ok"){
		Salas.innerText = co.return_value[1]
		top.frames.super1.Ponto.innerText = co.return_value[2]
		som = "document.somcerto"
	}
	else	som = "document.somerro"

	Consc.innerText = co.return_value[3]
	var t = new Date(); var final = (t.getHours() * 3600) + (t.getMinutes() * 60) + t.getSeconds(); final -= inicial
	Tempos.innerText = (Math.ceil(final / 60) - 1) + "min:" + (final % 60) + "seg."
	botao.src = "../images/cont001.gif"; rodrol = "ok"
	if(eval(som) != null){ if (eval(som + ".Filename")) eval(som + ".play()") }
} 

function myFirstBack(co){
	cox = co.return_value[0]
	if(cox == "xo") location.href = "http://www.aggora.com.br/sabio/1/tema"+co.return_value[2]+"/Sabio03.aspx?ptSala="+co.return_value[1]
	else{	chute = "Atщ 5 Palpites:"; NValr2.innerText = chute; cod = co.return_value[3]
		if(cod < 2){ NFig2.src = "sabio06.gif"; NFig1.src = "sabio00.gif" }
		else{ NFig1.src = "sabio06.gif"; NFig2.src = "sabio03.gif" }
		botao.src = "/_Library/bottv.gif"; NPerg.innerText  = co.return_value[0]
		apost = co.return_value[1]; aposl = co.return_value[2]
		fig = "images/" + co.return_value[4]
		Tinicial()
	}
} 

function errorCallBack(co){
	alert("RG 3.0 - ERRO:\n\n" +
		"Provсveis Causa:\n" + 
		"1 - A conexуo Internet teve problemas ou foi interrompida.\n" + 
		"2 - A conexуo Internet esteve ociosa por mais de 20 minutos.\n" +
		"3 - Acesse www.java.com/pt_BR e instale o plug-in Java da SUN.\n" +
		"Dicas de Correчуo:\n" + 
		"1a - Recarregue o Site e tente novamente (F5).\n" + 
		"2a - Navegue exclusivamente pelos botѕes do \"Sabichуo Web\".\n" +
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
    if (event.button > 1) alert("RG 3.0 - Informaчуo (К_К):\n\nOpss - Utilize somente o botуo esquerdo do mouse")
}
	document.onmousedown = click_me

//-->