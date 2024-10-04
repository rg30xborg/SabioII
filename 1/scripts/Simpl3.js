<!--//

if((parent.window.name).indexOf("inicial") < 0) location.href = "http://www.aggora.com.br/sabio/help.htm"

function muda(){
	// document.clear()
	// dadosb.dataz.width = 0
	dadosb.action = "http://www.aggora.com.br/sabio/1/sorte/tema3/sabio02.asp"
	dadosb.dataz.value = dados;  dados = 0
	dadosb.salax.value = salas;  salas = 0
	dadosb.submit()
}

function mudaA(){
	// document.clear()
	// dadosb.dataz.width = 0
	dadosb.action = "http://www.aggora.com.br/sabio/1/sorte/tema3a/sabio02.asp"
	dadosb.dataz.value = dados;  dados = 0
	dadosb.salax.value = salas;  salas = 0
	dadosb.submit()
}

function mudaB(){
	dadosc.action = "http://www.aggora.com.br/sabio/1/sorte/tema0/sabio02.asp"
	//dadosc.dataz.value = dados;  dados = 0
	//dadosc.salax.value = salas;  salas = 0
	//dadosc.salay.value = premio;  premio = 0
	dadosc.submit()
}

	var serverURL = "Sabio03.aspx", tstck = ' 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70';
	var cart = apos = aposm = troc = resumo = 1, jogo = gparc = aposs = 0, tstcl = tstck;
	var apost, rodrolx, librol, rodrol, num, rodbonus, exislen
	var num1, num0, txtWeb = premio = ''

function Aviso2(){
	if((this.location.href).indexOf("http://www.aggora.com.br") < 0) location.href = "http://www.aggora.com.br/sabio/help.htm"
	else{	// window.defaultStatus = 'RG 3.0 - Sabichão Web [GIGA SENNA 1]'
		NCalc.innerText = " "; Reg16.innerText = "Jogo Pronto - Anote suas Dezenas"
	}
}


function alocar1(sndAction,sndObj){ sndObj = "document." + sndObj
	if (eval(sndObj) != null){
		if (eval(sndObj + ".Filename")) eval(sndObj + ((sndAction == 'stop') ? '.stop()' : '.play()'))}
}

function nesTipo(){
	alert("RG 3.0 - INFORMAÇÃO:\n\nRegistrar aposta para [ Sorteio pela CEF ] não disponíveis no momento - Em breve...")
	Reg39.value = "1"
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
			if(aposs < 15){ aposs ++
				if(aposs == 15){ cart = 0; Reg21.src = '/_Library/botrr.gif'
					Reg16.innerText = 'Cartela OK! - Clique [Rodar Roleta]'}
				document.images['n' + num].src = '/_Library/' + num + (num > 46 ? 'gb.gif' : 'b.gif')
				if(clickexis == 0) tstck = tstck.substring(3,exislen)
				if(clickexis == (exislen - 3)) tstck = tstck.substring(0,(exislen - 3))
				if(clickexis != 0 && clickexis != (exislen - 3)){
					var exisa = tstck.substring(0,clickexis)
					var exisb = tstck.substring((clickexis + 3),exislen)
					tstck = (exisa + exisb)}}
			else alert("RG 3.0 - ALERTA:\n\n15 Palpites já estão anotados, para substituir remova antes um dos Palpites anotados.")
		else { aposs --; tstck = (' ' + num + tstck)
			if(aposs == 14){ cart = 1; Reg21.src = "/_Library/bottv.gif"}
			document.images['n' + num].src = '/_Library/' + num + (num < 20 || num > 46 ? 'g.gif' : '.gif')}
		exislen = tstck.length
		if(aposs < 15) Reg16.innerText = aposs + ' Palpites Anotados (Faltam: ' + (15 - aposs) + ' )'
    }
}

function StartRGSennaWeb(){
	if(cart == 0){
		cart = jogo = 1, apost = aposm, Reg21.src = '/_Library/bottv.gif'
		var grpsim = ''; for(i = 11; i < 71; i ++){ if(tstck.indexOf(' ' + i) < 0) grpsim += (i < 20 ? ' 0' : ' ') + (i - 10)}
		var txtinfo = 'RG 3.0 - RESUMO DE APOSTAS (' + Reg39.value + '):\n\n15 Dezenas em:' + grpsim + '\n\nVALOR DA CARTELA-APOSTA ............. ' + apost + ' Pontos' + '\nConfirma sua Aposta ?'
		txtWeb = 'V:' + Reg39.value + 'G:' + grpsim + '#A:' + apost

    		if((resumo == 0 ? confirm(txtinfo) == true : resumo == 1)){Reg21.src = '/_Library/bottg.gif'
			Reg16.innerText = 'Confirmando aposta ...'; Reg22.src = '/_Library/botpg.gif'
			var co = RSExecute(serverURL,"Method8",apost,myBackCart,errorCallBack)
		}
		else { cart = jogo = 0, Reg21.src = '/_Library/botrr.gif'}
	}
}

function myBackCart(co){
	cox = co.return_value[0]
	if(cox == 'ok'){
		Reg21.src = '/_Library/botrr.gif'; Reg22.src = '/_Library/botjkb.gif'; cart = jogo = 0
		alert('RG GIGA-SENNA WEB ALERTA\n\nAposta [ ' + Math.abs(cred - apost) + ' Pontos ] acima do Total disponível.\nAjuste e tente novamente....              Grato.')
	}
	else {Reg16.innerText = '15 Palpites Registrados - Cartela de ' + aposm + ' Pontos'
		if(cox == 'yes')
			var co = RSExecute(serverURL,"Method9",txtWeb,myFirstBack,errorCallBack,"RSExecute")
		if(cox == 'no'){
			jogo = 2; Reg21.src = '/_Library/bottv.gif'
			Reg16.innerText = 'Total de Pontos esgotado !!'; Reg22.src = '/_Library/botjkb.gif'
			if(confirm('RG GIGA-SENNA ALERTA\n\nTotal de Pontos esgotado. Deseja sair desta Sala ?') == true)
				location.href="http://www.aggora.com.br/sabio/1/sorte/sabio02.asp?Err=1"
		}
	}
} 

	placar = new Array(); grupo = new Array()

function myFirstBack(co){
	cred = co.return_value[0]; for(stvar = 6; stvar > 0; stvar --){
		placar[stvar] = co.return_value[stvar]; grupo[stvar] = co.return_value[stvar + 6]}
	gparc = co.return_value[13]; premio = co.return_value[14]; pSala = co.return_value[16]
	Reg18.innerText = co.return_value[15]; top.frames.super1.Ponto.innerText = co.return_value[0]
 	Reg22.src = '/_Library/botjkb.gif'; Reg32.src = '/_Library/Zoospfix.gif'
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
	if(gparc > 0){
		alocar1('play','sominici'); Reg17.innerText = 'Prêmio ' + gparc + ' Pontos ' + premio
		Reg00.style.visibility = ""; Reg20.src = '/_Library/botcg.gif'}
	else {
		alocar1('play','somcapit'); Reg17.innerText = ' Cartela sem prêmios.'
		Reg20.src = '/_Library/botlt.gif'}
	troc = 0; Reg16.innerText = "Rodada Ok! - Clique [Liberar Tab.]"
}

function ProssRGSennaWeb(){
	if(troc == 0){
		troc = 1; Reg20.src = '/_Library/bottv.gif'
		if(gparc > 0){ cred = cred + gparc
			Reg18.innerText = pSala; top.frames.super1.Ponto.innerText = cred
			alocar1('play','somregis'); gparc = 0}
		else alocar1('play','somclick')
		tstck = tstcl, apost = aposs = 0, premio = ''
		for(var num = 70; num > 10; num --) offImage(num)
		for(stvar = 1;stvar < 7; stvar ++){
			document.images['rol0' + stvar].src = '/_Library/00.jpg'
			document.images['rol1' + stvar].src = '/_Library/00.jpg'
			document.images['rol4' + stvar].src = '/_Library/' + stvar + 'p.gif'}
		Reg17.innerText = 'Faça suas apostas'; Reg16.innerText = 'Cartela Pronta - Apostas Ok!'
		Reg32.src = '/_Library/Senspani.gif'; jogo = 0
	}
}

function selBet1(j){
	if(jogo == 0){
		if(j > cred){var apsM = cred - j
			alert("RG 3.0 - ALERTA\n\nAposta recusada - Valor " + apsM + " acima do Total de Pontos Atual!")
			Reg16.innerText = "Aposta recusada - Valor " + apsM + " acima do Total de Pontos Atual!"
			Reg17.innerText = "Re-Iniciando...! Defina o valor da Aposta Padrão" }
		else{	aposm = j; Reg17.innerText = "Aposta " + aposm + " pontos Ok!"
			if(cart == 0) Reg16.innerText = "Aposta OK! Clique [Iniciar/Creditar]"
		}
	alocar1('play','somclick')
	}
}

function instrui(){
	alert("RG 3.0 - INSTRUÇÕES :\n"
	+ "1 - Opcional: Escolha o valor da Cartela de Aposta.\n"
	+ "2 - Sobre a Cartela marque seus 15 Palpites.\n"
	+ "     Na Banca acompanhe o número de Palpites anotados\n"
	+ "3 - Click em: [Rodar Roleta].\n"
	+ "     Aguarde o Resultado do Sorteio e Confira os números\n"
	+ "4 - Clique em: [Creditar/Liberar] limpa a Cartela.\n"
	+ "5 - Reinicie os Palpites,     Boa Sorte....\n\n"
	+ "RG 3.0 - APOSTA CORRENTE = " + aposm  + " PAGA:\n"
	+ (aposm * 1000) + " se Senna (6 dezenas certas).\n"
	+ (aposm * 350) + " se Quina (5 dezenas certas).\n"
	+ (aposm * 50)  + " se Quadra (4 dezenas certas).\n"
	+ (aposm * 6)  + " se Giga-Senna (só 1º dezena certa).\n"
	+ aposm   + " se Byte-Senna (1º dezena certa).\n"
	+ "Prêmio não cumulativo - Vale apenas o Maior")
}

function errorCallBack(msg,url,line){
	Reg22.src = "/_Library/botjkb.gif"
	alert("RG 3.0 - ERRO: (" + msg + ")\n\n" +
		"Prováveis Causa:\n" + 
		"1 - A conexão Internet teve problemas ou foi interrompida.\n" + 
		"2 - A conexão Internet esteve ociosa por mais de 20 minutos.\n" +
		"3 - Acesse www.java.com/pt_BR e instale o plug-in Java da SUN.\n" +
		"Dicas de Correção:\n" + 
		"1a - Clique em [Control] acima, tecle [F5] e tente novamente.\n" + 
		"2a - Navegue exclusivamente pelos botões do \"Sabichão Web\".\n" +
		"Se o problema persistir contate-nos via E-mail.")
	return true
}

function regras1(){ if(jogo == 0 || troc == 0) Reg22.src = "/_Library/botrk.gif"}

function regras2(){ if(jogo == 0 || troc == 0) Reg22.src = "/_Library/botjkb.gif"}

function click_me(){
    if (event.button > 1) alert("RG 3.0 - Informação (º_º):\n\nOpss - Utilize somente o botão esquerdo do mouse")
}

	onerror = errorCallBack
	document.onmousedown = click_me
//-->