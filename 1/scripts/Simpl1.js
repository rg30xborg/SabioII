<!--//

if ((parent.window.name).indexOf("inicial") < 0) location.href = "/help.htm";   //http://www.aggora.com.br/sabio

function muda(){
	// document.clear()
	// dadosb.dataz.width = 0
	
    dadosb.action = "Sabio02.aspx";      //http://www.aggora.com.br/sabio/1/sorte/tema1/
	dadosb.dataz.value = dados;  dados = 0
	dadosb.salax.value = salas;  salas = 0
	dadosb.submit()
}

function mudaA(){
	// document.clear()
	// dadosb.dataz.width = 0
    dadosb.action = "Sabio02.aspx";      //http://www.aggora.com.br/sabio/1/sorte/tema1a/
	dadosb.dataz.value = dados;  dados = 0
	dadosb.salax.value = salas;  salas = 0
	dadosb.submit()
}

	var serverURL = "Sabio03.aspx", puleC = "", winner, cart = troc = 1, jogo = gparc = pareOk = puleV = fatAp = snd = 0
	var vanT  = new Array(), pasS  = new Array()

function Aviso2(){
	// if((this.location.href).indexOf("http://www.aggora.com.br") < 0) location.href = "http://www.aggora.com.br/sabio/help.htm"
    // else {
        for (i = 0; i < 8; i++) Bet0[i].value = "?"
		// window.defaultStatus = 'RG 3.0 - Sabichão Web [JOKEY 1]'
        NCalc.innerText = " ";
        Reg16.innerText = "Para iniciar adquira o Prognóstico do Páreo (click [Preparar Tab.])"
	//}
}

function alocar1(sndAction,sndObj){
    var sound = document.getElementById(sndObj);
    sound.play();
}

function alocar2(sndObj) {
    var sound = document.getElementById(sndObj);
    sound.pause();
}

function addProsp() {
    if (OqueFaz == 1) {
        Reg22.src = "/_Library/botpg.gif"
        OqueFaz = 2;
        return true;
        //var co = RSExecute(serverURL,"Method0",addProspR,errorCallBack)
    }
}

function addProspR(co) {
    //Reg22.style.visibility = "hidden";
	if(co[0] == "ok"){
		var d = new Date(), s = parseInt(d.getSeconds(),10)
		for(i = 0; i < 8; i ++){
			vanT[i] = Math.round(Math.random() * 3) + 1
			pasS[i] = eval(10 - vanT[i]); Bet0[i].value = "1:" + vanT[i]
			if(pasS[i] == 6 && s > 45){s -= 5; pasS[i] = 10}
			if(pasS[i] == 9 && s < 15){s += 5; pasS[i] = 6}
			vanT[i] += 1
		}
		for(i = 0; i < 6; i ++) Reg01[i].style.visibility = ""
		pSala = co[2]; Reg18.innerText = pSala; cred = co[1]; top.frames.super1.Ponto.innerText = cred
		Reg16.innerText = "Faça sua Aposta (Click uma Ficha e escolha um Cavalo)"
		Reg17.innerText = "Próximo Páreo Liberado"; puleC = ""
        //Reg39.src = "/_Library/ficha00.gif"
        //Reg22.style.visibility = "hidden";
        alocar1('play', 'somregis');
	}
    else {
        jogo = 2; Reg21.src = '/_Library/bottv.gif'; //Reg22.src = '/_Library/botjkb.gif'
        Reg16.innerText = 'Pontos Total inferior ao mínimo da Sala !!';
        if (confirm('RG JOKEY CLUB ALERTA\n\nTotal de Pontos insuficiente. Deseja sair desta Sala ?') == true)
            location.href = ".../sabio01.asp?Err=1";        //http://www.aggora.com.br/sabio/1/sorte
	}
}

function selCav1(color){
	if(jogo == 0) {
		switch(color){
			case "Vermelho"	: fatAp = (vanT[0] - 1) * 10; posT = "3px";   break
            case "Verde"    : fatAp = (vanT[1] - 1) * 10; posT = "27px";  break
            case "Azul"     : fatAp = (vanT[2] - 1) * 10; posT = "51px";  break
            case "Amarelo"  : fatAp = (vanT[3] - 1) * 10; posT = "76px";  break
            case "Magenta"  : fatAp = (vanT[4] - 1) * 10; posT = "100px"; break
            case "Ciano"    : fatAp = (vanT[5] - 1) * 10; posT = "124px"; break
            case "Salmon"   : fatAp = (vanT[6] - 1) * 10; posT = "148px"; break
            case "Laranja"  : fatAp = (vanT[7] - 1) * 10; posT = "172px"; break}
		puleC = color; Reg30.style.top = posT
		if(puleV != 0) libRol()
        else {
            Reg16.innerText = "Cavalo " + puleC + " Ok! - Selecione uma Ficha"
            Reg17.innerText = "Anotando a Pule ..."
        }
	}
}

function selBet1(j){
	if(jogo == 0){
		puleV = j
        if (puleV > cred) {
            Reg00.style.visibility = "hidden"; puleV = ""; cart = 1; Reg21.style.visibility = "hidden"; //Reg21.src = "/_Library/bottv.gif"
			alert("RG 3.0 - ALERTA\n\nAposta recusada - Valor acima do Total de Pontos Atual!")
            Reg16.innerText = "Aposta recusada - Valor acima do Total de Pontos Atual!"
        }
        else
            if (puleC != "") libRol()
            else {
                Reg16.innerText = "Aposta " + puleV + " pontos Ok! - Selecione um Cavalo"
                Reg17.innerText = "Anotando a Pule ..."
            }
	}
}

function libRol(){
    //Reg39.style.visibility = "hidden";
    Reg30.style.visibility = ""; Reg00.style.visibility = ""
	Reg16.innerText = "Pule Vencedor: Cavalo " + puleC + " - " + puleV + " pontos (Paga: " + (fatAp * puleV) + " pontos)"
    Reg21.style.visibility = "";    //Reg21.src = "/_Library/botrr.gif";
    Reg17.innerText = "Pule Ok! Clique [Rodar Roleta]"; cart = 0
}

function startCor1(){
	if(cart == 0){
        cart = jogo = pareOk = 1; Reg21.style.visibility = "hidden"; //Reg21.src = "/_Library/bottv.gif"
        document.getElementById("HFApost").value = puleV;
        OqueFaz = 4;
        return true;
        //var co = RSExecute(serverURL, "Method1", puleV, myBackCart, errorCallBack)
    }
}

function myBackCart(co){
	if(co[0] == 'ok'){
		pSala = co[2]; Reg18.innerText = pSala; cred = co[1]; top.frames.super1.Ponto.innerText = cred
        Reg00.style.visibility = "hidden"; Reg17.innerText = "Páreo em disputa, aguarde ...";
        alocar1('play','somrolar');
		Reg31.src = Reg32.src = Reg33.src = Reg34.src = Reg35.src = Reg36.src = Reg37.src = Reg38.src = "/_Library/Jok00a.gif"
		startCor2()
	}
    else {
        alert("RG 3.0 - ALERTA\n\nAposta recusada - Valor acima do Total de Pontos Atual!")
		Reg16.innerText = "Aposta recusada - Valor acima do Total de Pontos Atual!"
	}

}

function startCor2(){
    var i = Math.floor(Math.random() * 8)
    //  Reg16.innerText = "Saiu o: " + i + " pasS: " + pasS;
	switch(i){
        case 0: Cav01.style.left = parseInt(Cav01.style.left) + pasS[0] + "px";
            if (parseInt(Cav01.style.left) >= 558) { Cav01.style.left = "557px"; winner = "Vermelho"; pareOk = 0}
		break

        case 1: Cav02.style.left = parseInt(Cav02.style.left) + pasS[1] + "px";
            if (parseInt(Cav02.style.left) >= 558) { Cav02.style.left = "557px"; winner = "Verde"; pareOk = 0}
		break

        case 2: Cav03.style.left = parseInt(Cav03.style.left) + pasS[2] + "px";
            if (parseInt(Cav03.style.left) >= 558) { Cav03.style.left = "557px"; winner = "Azul"; pareOk = 0}
		break

        case 3: Cav04.style.left = parseInt(Cav04.style.left) + pasS[3] + "px";
            if (parseInt(Cav04.style.left) >= 558) { Cav04.style.left = "557px"; winner = "Amarelo"; pareOk = 0}
		break

        case 4: Cav05.style.left = parseInt(Cav05.style.left) + pasS[4] + "px";
            if (parseInt(Cav05.style.left) >= 558) { Cav05.style.left = "557px"; winner = "Magenta"; pareOk = 0}
		break

        case 5: Cav06.style.left = parseInt(Cav06.style.left) + pasS[5] + "px";
		    if (parseInt(Cav06.style.left) >= 558) { Cav06.style.left = "557px"; winner = "Ciano"; pareOk = 0}
		break

        case 6: Cav07.style.left = parseInt(Cav07.style.left) + pasS[6] + "px";
            if (parseInt(Cav07.style.left) >= 558) { Cav07.style.left = "557px"; winner = "Salmon"; pareOk = 0}
		break

        case 7: Cav08.style.left = parseInt(Cav08.style.left) + pasS[7] + "px";
            if (parseInt(Cav08.style.left) >= 558) { Cav08.style.left = "557px"; winner = "Laranja"; pareOk = 0}
		break
	}
	if(pareOk) setTimeout("startCor2()", 67); else checkGrp1()
}

function checkGrp1() {
    alocar2('somrolar'); gparc = 0;
	Reg31.src = Reg32.src = Reg33.src = Reg34.src = Reg35.src = Reg36.src = Reg37.src = Reg38.src = "/_Library/Jok00.gif"
	if(winner == puleC){
		gparc = puleV * fatAp
		Reg17.innerText = "1º: Cavalo " + winner + " - Ganha " + gparc
		Reg20.src = "/_Library/botcg.gif"; Reg00.style.visibility = ""
        alocar1('play', 'sominici')
    } 
    else {
	    	Reg17.innerText = "1º: Cavalo " + winner + " - Sorry !"
            Reg20.src = "/_Library/botlt.gif"; alocar1('play', 'somcapit')
    }
    Reg20.style.visibility = "";
	troc = 0
}

function ajustIni() {
    if (troc == 0) {
        troc = 1, puleC = "", puleV = fatAp = 0; Reg20.style.visibility = "hidden";   //Reg20.src = "/_Library/bottv.gif"
        if (parseInt(gparc) > 0) {
            document.getElementById("HFApost").value = gparc;
            document.getElementById("HFPCert").value = "2";
            OqueFaz = 6;
            return true;
            //RSExecute(serverURL,"Method2",gparc,ajustIniR,errorCallBack,"RSExecute")
        }
        else {
            ajustIniR();
            return false;
        }
	}
}

function ajustIniR() {
    if (parseInt(gparc) > 0) {
        pSala = parseInt(pSala) + parseInt(gparc); cred = parseInt(cred) + parseInt(gparc)
        Reg18.innerText = pSala; top.frames.super1.Ponto.innerText = cred
        alocar1('play', 'somregis')
    }
    Cav01.style.left = Cav02.style.left = Cav03.style.left = Cav04.style.left = "33px";
    Cav05.style.left = Cav06.style.left = Cav07.style.left = Cav08.style.left = "33px";
    for (i = 0; i < 8; i++) Bet0[i].value = "?"
    Reg30.style.visibility = Reg00.style.visibility = "hidden"
    for (i = 0; i < 6; i++) Reg01[i].style.visibility = "hidden"
    Reg22.src = "/_Library/botpt.gif"; Reg22.style.visibility = "";
    Reg16.innerText = "Adquira o Prognóstico para o Próximo Páreo"; jogo = 0

    if (cred < 2) {
        jogo = 2; Reg22.style.visibility = "hidden"
        Reg16.innerText = "Pontos Total inferior ao mínimo da Sala"
        if (confirm("RG Jokey Club ALERTA:\n\nPontos Total inferior ao mínimo da Sala!\nDeseja sair desta Sala ?") == true)
            location.href = "sabio02.asp?Err=1";        //http://www.aggora.com.br/sabio/1/sorte/
    }
    gparc = 0; OqueFaz = 1;
    document.getElementById("HFApost").value = "0";
    document.getElementById("HFPCert").value = "0";
}

function instrui(){
	alert("RG 3.0 - INSTRUÇÕES :\n"
	+ "1 - Adquira o prognóstico com chances da cada Cavalo.\n"
	+ "     Clique simples em [Preparar Tab] libera o Páreo\n"
	+ "2 - Clique novamente em uma ficha para definir o valor da aposta.\n"
	+ "3 - Clique em um Cavalo para definir o palpite para Vencedor.\n"
	+ "4 - Click em: [Rodar Roleta] para iniciar o Páreo.\n"
	+ "5 - Clique em: [Creditar/Liberar] prepara o próximo Páreo.\n"
	+ "6 - Reinicie o Páreo,     Boa Sorte....\n\n"
	+ "RG 3.0 - APOSTAS :\n"
	+ "     O Prêmio é pago pela chance do Cavalo * 10\n"
	+ "A - Cavalo Barbada 1:1 ________ Paga 10:1 pontos\n"
	+ "B - Cavalo Favorito 1:2 _______ Paga 20:1 pontos\n"
	+ "C - Cavalo Surpreza 1:3 _______ Paga 30:1 pontos\n"
	+ "D - Cavalo Azarão 1:4 _________ Paga 40:1 pontos")
}

function errorCallBack(msg) {
    alert("RG 3.0 - ERRO: (" + msg + ")\n\n" +
        "Prováveis Causa:\n" +
        "1 - A conexão Internet teve problemas ou foi interrompida.\n" +
        "2 - A conexão Internet esteve ociosa por mais de 20 minutos.\n" +
        "Dicas de Correção:\n" +
        "1a - Recarregue o Site e tente novamente (Ctrl + F5).\n" +
        "2a - Navegue exclusivamente pelos botões do \"Sabichão Web\".\n" +
        "Se o problema persistir contate-nos via E-mail.");
    return true;
}

function regras1() { if (jogo == 0 || troc == 0) Reg39.src = "/_Library/ficha0.gif"}

function regras2() { if (jogo == 0 || troc == 0) Reg39.src = "/_Library/ficha00.gif"}

function click_me(){
    if (event.button > 1) alert("RG 3.0 - Informação (º_º):\n\nOpss - Utilize somente o botão esquerdo do mouse")
}

	onerror = errorCallBack
	document.onmousedown = click_me
//-->