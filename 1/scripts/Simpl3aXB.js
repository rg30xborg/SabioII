<!--//

if((parent.window.name).indexOf("inicial") < 0) location.href = "http://www.aggora.com.br/sabio/help.htm"

function mudaB(){
	dadosc.action = "http://www.aggora.com.br/sabio/1/sorte/tema0/sabio02.asp"
	//dadosc.dataz.value = dados;  dados = 0
	//dadosc.salax.value = salas;  salas = 0
	//dadosc.salay.value = premio;  premio = 0
	dadosc.submit()
}

	var serverURL = "sabio03.asp", tstck = ' 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70';
	var cart = apos = aposm = troc = 1, jogo = gparc = aposs = resumo = 0, dezenas = 10, tstcl = tstck;
	var apost, rodrolx, librol, rodrol, num, rodbonus, exislen
	var num1, num0, txtWeb = premio = ''
	placar = new Array(); grupo = new Array()

function Aviso2(){
	if((this.location.href).indexOf("http://www.aggora.com.br") < 0) location.href = "http://www.aggora.com.br/sabio/help.htm"
	else{	// window.defaultStatus = 'RG 3.0 - Sabichão Web [GIGA SENNA 1]'
		NCalc.innerText = " "; Reg16.innerText = "Escolha quantas dezenas terá sua Aposta - Confira os pontos para esta seleção."
	}
}


function alocar1(sndAction,sndObj){ sndObj = "document." + sndObj
	if (eval(sndObj) != null){
		if (eval(sndObj + ".Filename")) eval(sndObj + ((sndAction == 'stop') ? '.stop()' : '.play()'))}
}

function nesTipo(){
	alert("RG 3.0 - INFORMAÇÃO:\n\nRegistrar aposta para [ Sorteio pela CEF ] não disponíveis no momento - Em breve...")
	//Reg39.value = '1'
}

function resMostr(){
	if(resumo == 0){resumo = 1; Reg32.alt = "Ativar RESUMO DE APOSTAS"; Reg16.innerText = "RESUMO DESATIVADO"}
	else {resumo = 0; Reg32.alt = "Desativar RESUMO DE APOSTAS"; Reg16.innerText = "RESUMO ATIVADO"}
	alocar1('play','somclick')
}

function onImage(num){
	if(aposs == 0) document.images['n' + num].src = '/_Library/' + num + (num > 46 ? 'gb.gif' : 'b.gif')
}

function offImage(num){
	if(aposs == 0) document.images['n' + num].src = '/_Library/' + num + (num < 20 || num > 46 ? 'g.gif' : '.gif')
}

function onTab(){
	if(jogo == 0) Reg00.style.visibility = ""
}

function offTab(){
	if(jogo == 0) Reg00.style.visibility = "hidden"
}

function clicImage(num){
	if(jogo == 0){
		var clickexis = tstck.indexOf(' ' + num);
		exislen = tstck.length;
		if(clickexis >= 0)
			if(aposs < dezenas){ aposs ++
				if(aposs == dezenas){ cart = 0; Reg20.src = '/_Library/botaps.gif'; Reg21.src = '/_Library/botloc.gif'
					Reg16.innerText = 'Cartela OK! - Clique [Simular Aposta] ou [Enviar Aposta]'
					SML.style.visibility = "visible"}
				document.images['n' + num].src = '/_Library/' + num + (num > 46 ? 'gb.gif' : 'b.gif')
				if(clickexis == 0) tstck = tstck.substring(3,exislen)
				if(clickexis == (exislen - 3)) tstck = tstck.substring(0,(exislen - 3))
				if(clickexis != 0 && clickexis != (exislen - 3)){
					var exisa = tstck.substring(0,clickexis)
					var exisb = tstck.substring((clickexis + 3),exislen)
					tstck = (exisa + exisb)}}
			else alert("RG 3.0 - ALERTA:\n\n" + dezenas + " Palpites já estão anotados, para substituir remova antes um dos Palpites anotados.")
		else { aposs --; tstck = (' ' + num + tstck)
			if(aposs == (dezenas-1)){ cart = 1; Reg20.src = "/_Library/bottv.gif"; Reg21.src = "/_Library/bottv.gif"}
			document.images['n' + num].src = '/_Library/' + num + (num < 20 || num > 46 ? 'g.gif' : '.gif')}
		exislen = tstck.length
		if(aposs < dezenas) Reg16.innerText = aposs + ' Palpites Anotados (Faltam: ' + (dezenas - aposs) + ' )'
    }
}

function Method9(txtWeb)
{
	apost = parseInt(txtWeb.substr((txtWeb.indexOf('#A:') + 3)),10)

   	if(cred > 0 && (cred - apost) >= 0){

		var myFirst = new Array(); myFirst[0] = cred
		var rodst6 = Math.round(Math.random() * 59) + 1
		rodst6 += ''; if(rodst6.length == 1) rodst6 = '0' + rodst6; myFirst[6] = rodst6
		var rodst5 = Math.round(Math.random() * 59) + 1
		while(rodst5 == rodst6) rodst5 = Math.round(Math.random() * 59) + 1
		rodst5 += ''; if(rodst5.length == 1) rodst5 = '0' + rodst5; myFirst[5] = rodst5
		var rodst4 = Math.round(Math.random() * 59) + 1
		while(rodst4 == rodst5 || rodst4 == rodst6) rodst4 = Math.round(Math.random() * 59) + 1
		rodst4 += ''; if(rodst4.length == 1) rodst4 = '0' + rodst4; myFirst[4] = rodst4
		var rodst3 = Math.round(Math.random() * 59) + 1
		while(rodst3 == rodst4 || rodst3 == rodst5 || rodst3 == rodst6) rodst3 = Math.round(Math.random() * 59) + 1
		rodst3 += ''; if(rodst3.length == 1) rodst3 = '0' + rodst3; myFirst[3] = rodst3
		var rodst2 = Math.round(Math.random() * 59) + 1
		while(rodst2 == rodst3 || rodst2 == rodst4 || rodst2 == rodst5 || rodst2 == rodst6)
			rodst2 = Math.round(Math.random() * 59) + 1
		rodst2 += ''; if(rodst2.length == 1) rodst2 = '0' + rodst2; myFirst[2] = rodst2
		var rodst1 = Math.round(Math.random() * 59) + 1
		while(rodst1 == rodst2 || rodst1 == rodst3 || rodst1 == rodst4 || rodst1 == rodst5 || rodst1 == rodst6)
			rodst1 = Math.round(Math.random() * 59) + 1
		rodst1 += ''; if(rodst1.length == 1) rodst1 = '0' + rodst1; myFirst[1] = rodst1
		txtWeb = txtWeb.substring(txtWeb.indexOf('G:') + 2, txtWeb.indexOf('#A:')); gparc = 0
		for(stvar = 6; stvar > 0; stvar --)
			if(txtWeb.indexOf(myFirst[stvar]) >= 0){ gparc ++; myFirst[stvar + 6] = 'v' } else myFirst[stvar + 6] = 'x'
		myFirst[14] = ''
		if (gparc > 0){
			if(gparc == 6){ gparc = 10; myFirst[14] = ' <b>SENNA</b>'}
			else if(gparc == 5){ gparc = apost * 50 / 100; myFirst[14] = ' <b>QUINNA</b>'}
				else if(gparc == 4){ gparc = apost * 20 / 100; myFirst[14] = ' <b>QUADRRA</b>'}
					else if(gparc == 1){ gparc = apost; myFirst[14] = ' <b>BIT-SENNA</b>'}
						else gparc = 0
		}
		myFirst[13] = gparc
		myFirst[15] = cred
		myFirst[16] = 0
		return myFirst
	}
}

function StartRGSennaWeb(){
	if(cart == 0){
		cart = jogo = 1, apost = aposm, Reg21.src = '/_Library/bottv.gif'
		var grpsim = ''; for(i = 11; i < 71; i ++){ if(tstck.indexOf(' ' + i) < 0) grpsim += (i < 20 ? ' 0' : ' ') + (i - 10)}
		var txtinfo = 'RG 3.0 - RESUMO DE APOSTAS (' + '1' + '):\n\nSuas ' + dezenas + ' dezenas são:' + grpsim + '\nValor da Aposta: ' + apost + ' Pontos. - Confirma sua Aposta ?'
		txtWeb = 'V:' + '1' + 'G:' + grpsim + '#A:' + apost
    		if((resumo == 0 ? confirm(txtinfo) == true : resumo == 1)){
			Reg20.src = '/_Library/bottv.gif'
			Reg21.src = '/_Library/bottg.gif'
			Reg22.src = '/_Library/botpg.gif'
			Reg16.innerText = dezenas + ' Palpites Registrados - Cartela de ' + aposm + ' Pontos'
			var co = Method9(txtWeb)
			myFirstBack(co)
		}
		else { 
			cart = jogo = 0; Reg21.src = '/_Library/botloc.gif'
		}
	}
	else
		if(troc == 0){
			troc = 1; Reg20.src = '/_Library/botaps.gif'
			if(gparc > 0){ alocar1('play','somregis'); gparc = 0}
			else alocar1('play','somclick')
			tstck = tstcl, apost = aposs = 0, premio = ''
			for(var num = 70; num > 10; num --) offImage(num)
			for(stvar = 1;stvar < 7; stvar ++){
				document.images['rol0' + stvar].src = '/_Library/00.jpg'
				document.images['rol1' + stvar].src = '/_Library/00.jpg'
				document.images['rol4' + stvar].src = '/_Library/' + stvar + 'p.gif'}
			Reg17.innerText = 'Faça sua aposta'; Reg16.innerText = 'Cartela Pronta - Apostas Ok!'
			Reg32.src = '/_Library/Senspani.gif'; jogo = 0; SML.style.visibility = "hidden"
			Reg21.src = '/_Library/bottv.gif'; Reg20.src = '/_Library/bottv.gif'
		}
}

function myFirstBack(co){
	cred = co[0]; 
	for(stvar = 6; stvar > 0; stvar --){
		placar[stvar] = co[stvar]; grupo[stvar] = co[stvar + 6]}
	gparc = co[13]; premio = co[14]; pSala = co[16]
	Reg18.innerText = co[15]; top.frames.super1.Ponto.innerText = co[0]
 	Reg22.src = '/_Library/botgsc.gif'; Reg32.src = '/_Library/Zoospfix.gif'
	alocar1('play','somsorte')
	rol06.src = '/_Library/Zoogirar.gif'; rol16.src = '/_Library/Zoogirar.gif';

	stvar = 6; rodst1 = placar[stvar]
	var rodst0 = parseInt(rodst1.substr(0,1),10); var rodst1 = parseInt(rodst1.substr(1,1),10)
	num0 = '/_Library/' + rodst0 + '.jpg'; num1 = '/_Library/' + rodst1 + '.jpg'
	setTimeout('sort0(stvar)', (2000 + (rodst0 * 200))); setTimeout('sort1(stvar)', (4000 + (rodst1 * 200)))
}

function sort0(n){document.images['rol0' + n].src = num0}

function sort1(n){document.images['rol1' + n].src = num1; setTimeout('coleta()',200)}

function coleta(){
	document.images['rol4' + stvar].src = '/_Library/botsn' + grupo[stvar] + '.gif'
	Reg17.innerText = stvar + 'º Dezena - ' + placar[stvar] + ' [' + grupo[stvar] + ']';
    if(stvar > 1){
	stvar --; rodst1 = placar[stvar]
	var rodst0 = parseInt(rodst1.substr(0,1),10); var rodst1 = parseInt(rodst1.substr(1,1),10)
	num0 = '/_Library/' + rodst0 + '.jpg'; num1 = '/_Library/' + rodst1 + '.jpg'
	alocar1('play','somsorte');
	document.images['rol0' + stvar].src = '/_Library/Zoogirar.gif';
	document.images['rol1' + stvar].src = '/_Library/Zoogirar.gif';
	setTimeout('sort0(stvar)', (2000 + (rodst0 * 200)));
	setTimeout('sort1(stvar)', (4000 + (rodst1 * 200)));
    }
    else {alocar1('play','somsorte'); setTimeout('checkgroup()',2000);}
}

function checkgroup(){
	Reg21.src = '/_Library/bottv.gif'
	if(gparc > 0){ alocar1('play','sominici'); Reg17.innerHTML = 'Prêmio ' + (gparc == 10 ? pPremio : (gparc + ' Pontos -')) + premio
		Reg00.style.visibility = ""
	}
	else{ alocar1('play','somcapit'); Reg17.innerText = ' Cartela sem prêmios.' }
	troc = 0; Reg16.innerText = "Rodada Ok! - Clique [Liberar Tab.] ou [Enviar Aposta]"
	Reg21.src = '/_Library/botlt.gif'; Reg20.src = '/_Library/botaps.gif'
}

function ProssRGSennaWeb(){  //SE FUNCIONAR ESTA FUNÇÂO E DEVERA SER TRANSFORMADA PARA ENVIAR A APOSTA
	if(cart == 0 || troc == 0)){
		cart = jogo = troc = 1; apost = aposm;
		var grpsim = ''; for(i = 11; i < 71; i ++){ if(tstck.indexOf(' ' + i) < 0) grpsim += (i < 20 ? ' 0' : ' ') + (i - 10)}
		var txtinfo = 'RG 3.0 - RESUMO DE APOSTAS (' + '1' + '):\n\nSuas ' + dezenas + ' dezenas são:' + grpsim + '\nValor da Aposta: ' + apost + ' Pontos. - Confirma sua Aposta ?'
		txtWeb = 'V:' + '1' + 'G:' + grpsim + '#A:' + apost
    		if((resumo == 0 ? confirm(txtinfo) == true : resumo == 1)){
			Reg20.src = '/_Library/bottv.gif'
			Reg21.src = '/_Library/bottv.gif'
			Reg22.src = '/_Library/botpg.gif'
			Reg16.innerText = dezenas + ' Palpites Registrados - Cartela de ' + aposm + ' Pontos - Enviando para Registro...'
			//var co = Method9(txtWeb)
			//myFirstBack(co)
		}
		else { 
			cart = jogo = troc = 0;
		}
	}
}

function selBet1(j, d, c){
	if(jogo == 0){
		if(j > cred){var apsM = cred - j
			alert("RG 3.0 - ALERTA\n\nAposta recusada - Valor " + apsM + " acima do Total de Pontos Atual!")
			Reg16.innerText = "Aposta recusada - Valor " + apsM + " acima do Total de Pontos Atual!"
			Reg17.innerText = "Re-Iniciando...! Defina o valor da Aposta Padrão"
			volante.style.visibility = "hidden"; SML.style.visibility = "hidden" }
		else{	aposm = j; Reg17.innerText = "Aposta " + dezenas + " Dezenas - (" + aposm + ") Pontos Ok!"
			dezenas = d; Dezs.innerText = d.toString()
			volante.style.visibility = "visible"
			dStr = "Voce optou por uma aposta de " + d + " Dezenas\n"
			cStr = "Suas Chances: " + c + "\n"
			jStr = "Para esta aposta serão descontados " + j + " Pontos de sua pontuação"
			Reg16.innerText = "Voce optou por uma aposta de " + d + " Dezenas! (" + j + ") Pontos"
			alert("RG 3.0 INFORMA\n\n" + dStr + cStr + jStr)
			if(cart == 0) Reg16.innerText = "Aposta OK! Clique [Iniciar/Creditar]"
		}
	alocar1('play','somclick')
	}
}

function instrui(){
	alert("RG 3.0 - INSTRUÇÕES :\n"
	+ "1 - Escolha quantas dezenas terá sua Aposta.\n"
	+ "2 - Sobre a Cartela marque seus Palpites.\n"
	+ "     Na Banca acompanhe o número de Palpites anotados\n"
	+ "3 - Click em: [Registrar Aposta].\n"
	+ "     Pronto você já está participando do sorteio do Prêmio\n"
	+ "4 - Havendo mais de um gahador o valor do Prêmio será dividido.\n"
	+ "5 - Acumule pontos e participe quantas vezes quizer. Boa Sorte!\n\n"
	+ "RG 3.0 - CHANCES POR APOSTAS:\n"
	+ "10 Dezenas -> quadra: 1:195; quina: 1:3.973; sena: 1:238.399\n"
	+ "11 Dezenas -> quadra: 1:129; quina: 1:2.211; sena: 1:108.363\n"
	+ "12 Dezenas -> quadra: 1:90; quina: 1:1.317; sena: 1:54.182\n"
	+ "13 Dezenas -> quadra: 1:65; quina: 1:828; sena: 1:29.175\n"
	+ "14 Dezenas -> quadra: 1:48; quina: 1:544; sena: 1:16.671\n"
	+ "15 Dezenas -> quadra: 1:37; quina: 1:370; sena: 1:10.003\n"
	+ "Prêmio não cumulativo - Vale apenas o Maior")
}

function errorCallBack(msg,url,line){
	Reg22.src = "/_Library/botjkb.gif"
	alert("RG 3.0 - ERRO: (" + msg + ")\n\n" +
		"Prováveis Causa:\n" + 
		"1 - A conexão Internet teve problemas ou foi interrompida.\n" + 
		"2 - A conexão Internet esteve ociosa por mais de 20 minutos.\n" +
		"Dicas de Correção:\n" + 
		"1a - Clique em [Home] menu superior, tecle Ctrl+[F5] e tente novamente.\n" + 
		"2a - Navegue exclusivamente pelos botões do \"Sabichão Web\".\n" +
		"Se o problema persistir contate-nos via E-mail.")
	return true
}

function regras1(){ if(jogo == 0 || troc == 0) Reg22.src = "/_Library/botrk.gif"}

function regras2(){ if(jogo == 0 || troc == 0) Reg22.src = "/_Library/botgsc.gif"}

function click_me(){
	if (event.button > 1) alert("RG 3.0 - Informação\n\nOpss - Utilize somente o botão esquerdo do mouse")
}

	onerror = errorCallBack
	document.onmousedown = click_me
//-->