<!--//

if((parent.window.name).indexOf("inicial") < 0) location.href = "http://www.aggora.com.br/sabio/help.htm"

function muda(){
	// document.clear()
	// dadosb.dataz.width = 0
	
	dadosb.action = "http://www.aggora.com.br/sabio/1/sorte/tema1/sabio02.asp"
	dadosb.dataz.value = dados;  dados = 0
	dadosb.salax.value = salas;  salas = 0
	dadosb.submit()
}

function mudaA(){
	// document.clear()
	// dadosb.dataz.width = 0
	dadosb.action = "http://www.aggora.com.br/sabio/1/sorte/tema1a/sabio02.asp"
	dadosb.dataz.value = dados;  dados = 0
	dadosb.salax.value = salas;  salas = 0
	dadosb.submit()
}

	var serverURL = "Sabio03.aspx", puleC = "", winner, cart = troc = 1, jogo = gparc = pareOk = puleV = fatAp = 0
	var vanT  = new Array(), pasS  = new Array()

function Aviso2(){
	if((this.location.href).indexOf("http://www.aggora.com.br") < 0) location.href = "http://www.aggora.com.br/sabio/help.htm"
	else{	for(i = 0; i < 8; i ++) Bet0(i).value = "?"
		// window.defaultStatus = 'RG 3.0 - Sabich�o Web [JOKEY 1]'
		NCalc.innerText = " "; Reg16.innerText = "Para iniciar adquira o Progn�stico do P�reo (click na ficha acima)"
	}
}

function alocar1(sndAction,sndObj){ sndObj = "document." + sndObj
	if (eval(sndObj) != null){
		if (eval(sndObj + ".Filename")) eval(sndObj + ((sndAction == 'stop') ? '.stop()' : '.play()'))}
}

function addProsp(){
	Reg39.style.visibility = "hidden"; Reg22.src = "/_Library/botpg.gif"
	var co = RSExecute(serverURL,"Method0",addProspR,errorCallBack)
}

function addProspR(co){
	if(co.return_value[0] == "ok"){
		var d = new Date(), s = parseInt(d.getSeconds(),10)
		for(i = 0; i < 8; i ++){
			vanT[i] = Math.round(Math.random() * 3) + 1
			pasS[i] = eval(10 - vanT[i]); Bet0(i).value = "1:" + vanT[i]
			if(pasS[i] == 6 && s > 45){s -= 5; pasS[i] = 10}
			if(pasS[i] == 9 && s < 15){s += 5; pasS[i] = 6}
			vanT[i] += 1
		}
		for(i = 0; i < 6; i ++) Reg01(i).style.visibility = ""
		pSala -= 1; Reg18.innerText = pSala; cred -= 1; top.frames.super1.Ponto.innerText = cred
		Reg16.innerText = "Fa�a sua Aposta (Click uma Ficha e escolha um Cavalo)"
		Reg17.innerText = "Pr�ximo P�reo Liberado"; puleC = ""
		Reg22.src = "/_Library/botjkb.gif"
	}
	else{	jogo = 2; Reg21.src = '/_Library/bottv.gif'
		Reg16.innerText = 'Pontos Total inferior ao m�nimo da Sala !!'; Reg22.src = '/_Library/botjkb.gif'
		if(confirm('RG JOKEY CLUB ALERTA\n\nTotal de Pontos insuficiente. Deseja sair desta Sala ?') == true)
			location.href="http://www.aggora.com.br/sabio/1/sorte/sabio02.asp?Err=1"

	}
}

function selCav1(color){
	if(jogo == 0) {
		switch(color){
			case "Vermelho"	: fatAp = (vanT[0] -1) * 10; posT = 3;   break
			case "Verde"	: fatAp = (vanT[1] -1) * 10; posT = 27;  break
			case "Azul"		: fatAp = (vanT[2] -1) * 10; posT = 51;  break
			case "Amarelo"	: fatAp = (vanT[3] -1) * 10; posT = 76;  break
			case "Magenta"	: fatAp = (vanT[4] -1) * 10; posT = 100; break
			case "Ciano"	: fatAp = (vanT[5] -1) * 10; posT = 124; break
			case "Salmon"	: fatAp = (vanT[6] -1) * 10; posT = 148; break
			case "Laranja"	: fatAp = (vanT[7] -1) * 10; posT = 172; break}
		puleC = color; Reg30.style.top = posT
		if(puleV != 0) libRol()
		else{	Reg16.innerText = "Cavalo " + puleC + " Ok! - Selecione uma Ficha"
			Reg17.innerText = "Anotando a Pule ..."}
	}
}

function selBet1(j){
	if(jogo == 0){
		puleV = j
		if(puleV > cred){ Reg00.style.visibility = "hidden"; puleV = ""; cart = 1; Reg21.src = "/_Library/bottv.gif"
			alert("RG 3.0 - ALERTA\n\nAposta recusada - Valor acima do Total de Pontos Atual!")
			Reg16.innerText = "Aposta recusada - Valor acima do Total de Pontos Atual!"}
		else	if(puleC != "") libRol()
			else{	Reg16.innerText = "Aposta " + puleV + " pontos Ok! - Selecione um Cavalo"
				Reg17.innerText = "Anotando a Pule ..." }
	}
}

function libRol(){
	Reg30.style.visibility = ""; Reg00.style.visibility = ""
	Reg16.innerText = "Pule Vencedor: Cavalo " + puleC + " - " + puleV + " pontos (Paga: " + (fatAp * puleV) + " pontos)"
	Reg21.src = "/_Library/botrr.gif"; Reg17.innerText = "Pule Ok! Clique [Rodar Roleta]"; cart = 0
}

function startCor1(){
	if(cart == 0){
		cart = jogo = pareOk = 1; Reg21.src = "/_Library/bottv.gif"
		var co = RSExecute(serverURL,"Method1",puleV,myBackCart,errorCallBack)}
}

function myBackCart(co){
	if(co.return_value[0] == 'ok'){
		pSala -= puleV; Reg18.innerText = pSala; cred -= puleV; top.frames.super1.Ponto.innerText = cred
		Reg00.style.visibility = "hidden"; Reg17.innerText = "P�reo em disputa, aguarde ..."; alocar1('play','somrolar')
		Reg31.src = Reg32.src = Reg33.src = Reg34.src = Reg35.src = Reg36.src = Reg37.src = Reg38.src = "/_Library/Jok00a.gif"
		startCor2()
	}
	else{	alert("RG 3.0 - ALERTA\n\nAposta recusada - Valor acima do Total de Pontos Atual!")
		Reg16.innerText = "Aposta recusada - Valor acima do Total de Pontos Atual!"
	}

}

function startCor2(){
	var i = Math.floor(Math.random() * 8)
	switch(i){
		case 0 : Cav01.style.left = parseInt(Cav01.style.left) + pasS[0]
		if(parseInt(Cav01.style.left) >= 558){ Cav01.style.left = 557; winner = "Vermelho"; pareOk = 0}
		break

		case 1 : Cav02.style.left = parseInt(Cav02.style.left) + pasS[1]
		if(parseInt(Cav02.style.left) >= 558){ Cav02.style.left = 557; winner = "Verde"; pareOk = 0}
		break

		case 2 : Cav03.style.left = parseInt(Cav03.style.left) + pasS[2]
		if(parseInt(Cav03.style.left) >= 558){ Cav03.style.left = 557; winner = "Azul"; pareOk = 0}
		break

		case 3 : Cav04.style.left = parseInt(Cav04.style.left) + pasS[3]
		if(parseInt(Cav04.style.left) >= 558){ Cav04.style.left = 557; winner = "Amarelo"; pareOk = 0}
		break

		case 4 : Cav05.style.left = parseInt(Cav05.style.left) + pasS[4]
		if(parseInt(Cav05.style.left) >= 558){ Cav05.style.left = 557; winner = "Magenta"; pareOk = 0}
		break

		case 5 : Cav06.style.left = parseInt(Cav06.style.left) + pasS[5]
		if(parseInt(Cav06.style.left) >= 558){ Cav06.style.left = 557; winner = "Ciano"; pareOk = 0}
		break

		case 6 : Cav07.style.left = parseInt(Cav07.style.left) + pasS[6]
		if(parseInt(Cav07.style.left) >= 558){ Cav07.style.left = 557; winner = "Salmon"; pareOk = 0}
		break

		case 7 : Cav08.style.left = parseInt(Cav08.style.left) + pasS[7]
		if(parseInt(Cav08.style.left) >= 558){ Cav08.style.left = 557; winner = "Laranja"; pareOk = 0}
		break
	}
	if(pareOk) setTimeout("startCor2()", 67); else checkGrp1()
}

function checkGrp1(){
	alocar1('stop','somrolar')
	Reg31.src = Reg32.src = Reg33.src = Reg34.src = Reg35.src = Reg36.src = Reg37.src = Reg38.src = "/_Library/Jok00.gif"
	if(winner == puleC){
		gparc = puleV * fatAp
		Reg17.innerText = "1�: Cavalo " + winner + " - Ganha " + gparc
		Reg20.src = "/_Library/botcg.gif"; Reg00.style.visibility = ""
		alocar1('play','sominici')}   
	else {
		Reg17.innerText = "1�: Cavalo " + winner + " - Sorry !"
		Reg20.src = "/_Library/botlt.gif"; alocar1('play','somcapit')}

	troc = 0
}

function ajustIni(){
	if(troc == 0){
		troc = 1, puleC = "", puleV = fatAp = 0; Reg20.src = "/_Library/bottv.gif"
		if(gparc > 0){pSala += gparc; cred += gparc
			RSExecute(serverURL,"Method2",gparc,ajustIniR,errorCallBack,"RSExecute")
			Reg18.innerText = pSala; top.frames.super1.Ponto.innerText = cred
			alocar1('play','somregis')
		}
		Cav01.style.left = Cav02.style.left = Cav03.style.left = Cav04.style.left = 33
		Cav05.style.left = Cav06.style.left = Cav07.style.left = Cav08.style.left = 33
		for(i = 0; i < 8; i ++) Bet0(i).value = "?"
		Reg30.style.visibility = Reg00.style.visibility = "hidden"
		for(i = 0; i < 6; i ++) Reg01(i).style.visibility = "hidden"
		Reg39.style.visibility = ""

		Reg16.innerText = "Adquira o Progn�stico para o Pr�ximo P�reo"; jogo = 0

		if(cred < 2){
			jogo = 2; Reg39.style.visibility = "hidden"
			Reg16.innerText = "Pontos Total inferior ao m�nimo da Sala"
			if(confirm("RG Jokey Club ALERTA:\n\nPontos Total inferior ao m�nimo da Sala!\nDeseja sair desta Sala ?") == true)
				location.href = "http://www.aggora.com.br/sabio/1/sorte/sabio02.asp?Err=1" }
	}
}

function ajustIniR(){
	gparc = 0
}

function instrui(){
	alert("RG 3.0 - INSTRU��ES :\n"
	+ "1 - Adquira o progn�stico com chances da cada Cavalo.\n"
	+ "     Clique simples na ficha do centro libera o P�reo\n"
	+ "2 - Clique novamente em uma ficha para definir o valor da aposta.\n"
	+ "3 - Clique em um Cavalo para definir o palpite para Vencedor.\n"
	+ "4 - Click em: [Rodar Roleta] para iniciar o P�reo.\n"
	+ "5 - Clique em: [Creditar/Liberar] prepara o pr�ximo P�reo.\n"
	+ "6 - Reinicie o P�reo,     Boa Sorte....\n\n"
	+ "RG 3.0 - APOSTAS :\n"
	+ "     O Pr�mio � pago pela chance do Cavalo * 10\n"
	+ "A - Cavalo Barbada 1:1 ________ Paga 10:1 pontos\n"
	+ "B - Cavalo Favorito 1:2 _______ Paga 20:1 pontos\n"
	+ "C - Cavalo Surpreza 1:3 _______ Paga 30:1 pontos\n"
	+ "D - Cavalo Azar�o 1:4 _________ Paga 40:1 pontos")
}

function errorCallBack(msg,url,line){
	Reg22.src = "/_Library/botjkb.gif"
	alert("RG 3.0 - ERRO: (" + msg + ")\n\n" +
		"Prov�veis Causa:\n" + 
		"1 - A conex�o Internet teve problemas ou foi interrompida.\n" + 
		"2 - A conex�o Internet esteve ociosa por mais de 20 minutos.\n" +
		"3 - Acesse www.java.com/pt_BR e instale o plug-in Java da SUN.\n" +
		"Dicas de Corre��o:\n" + 
		"1a - Clique em [Control] acima, tecle [F5] e tente novamente.\n" + 
		"2a - Navegue exclusivamente pelos bot�es do \"Sabich�o Web\".\n" +
		"Se o problema persistir contate-nos via E-mail.")
	return true
}

function regras1(){ if(jogo == 0 || troc == 0) Reg22.src = "/_Library/botrk.gif"}

function regras2(){ if(jogo == 0 || troc == 0) Reg22.src = "/_Library/botjkb.gif"}

function click_me(){
    if (event.button > 1) alert("RG 3.0 - Informa��o (�_�):\n\nOpss - Utilize somente o bot�o esquerdo do mouse")
}

	//onerror = errorCallBack
	//document.onmousedown = click_me
//-->