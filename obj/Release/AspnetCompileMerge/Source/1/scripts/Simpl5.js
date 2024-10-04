<!--//

if((parent.window.name).indexOf("inicial") < 0) location.href = "http://www.aggora.com.br/sabio/help.htm"

function muda(){
	// document.clear()
	// dadosb.dataz.width = 0
	dadosb.action = "http://www.aggora.com.br/sabio/1/sorte/tema5/sabio02.asp"
	dadosb.dataz.value = dados;  dados = 0
	dadosb.salax.value = salas;  salas = 0
	dadosb.submit()
}

function mudaA(){
	// document.clear()
	// dadosb.dataz.width = 0
	dadosb.action = "http://www.aggora.com.br/sabio/1/sorte/tema5a/sabio02.asp"
	dadosb.dataz.value = dados;  dados = 0
	dadosb.salax.value = salas;  salas = 0
	dadosb.submit()
}

	var serverURL = "Sabio03.aspx", tstck = ' 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57';
	var cart=1, apos=1, aposm=1, girrol, exislen, tstcl=tstck, troc=1, jogo=0, rodrol, gparc=0, aposs=0, num, rodbonus;
	var apost, rodrolx, librol

function Aviso2(){
	if((this.location.href).indexOf("http://www.aggora.com.br") < 0) location.href = "http://www.aggora.com.br/sabio/help.htm"
	else{	// window.defaultStatus = 'RG 3.0 - Sabichão Web [ROLETA 1]'
		NCalc.innerText = " "; Reg16.innerText = "Jogo Pronto - Anote até 10 palpites"
	}
}


function alocar1(sndAction,sndObj){ sndObj = "document." + sndObj
	if (eval(sndObj) != null){
		if (eval(sndObj + ".Filename")) eval(sndObj + ((sndAction == 'stop') ? '.stop()' : '.play()'))}
}

function onTab(){
	if(jogo == 0) Reg00.style.visibility = ""
}

function offTab(){
	if(jogo == 0) Reg00.style.visibility = "hidden"
}

function onImage(num){
	if(aposs == 0) document.images['n' + num].src = '/_Library/' + num + (num > 46 ? 'sb.gif' : 'b.gif')
}

function offImage(num){
	if(aposs == 0) document.images['n' + num].src = '/_Library/' + num + (num > 46 ? 's.gif' : '.gif')
}

function clicImage(num){
	if(jogo == 0){
		var clickexis = tstck.indexOf(' ' + num);
		exislen = tstck.length;
		if(clickexis >= 0){
			if(aposs < 10){ aposs ++
				if(aposs == 1){ cart = 0; Reg21.src = '/_Library/botrr.gif'}
				document.images['n' + num].src = '/_Library/' + num + (num > 46 ? 'sb.gif' : 'b.gif')
				if(clickexis == 0) tstck = tstck.substring(3,exislen)
				if(clickexis == (exislen - 3)) tstck = tstck.substring(0,(exislen - 3))
				if(clickexis != 0 && clickexis != (exislen - 3)){
					var exisa = tstck.substring(0,clickexis)
					var exisb = tstck.substring((clickexis + 3),exislen)
					tstck = (exisa + exisb)}}
			else alert("RG 3.0 - ALERTA:\n\n10 Palpites já estão anotados, para substituir remova antes um dos Palpites anotados.")
		}
		else { aposs --; tstck = (' ' + num + tstck);
			if(aposs == 0){ cart = 1; Reg21.src = "/_Library/bottv.gif"}
			document.images['n' + num].src = '/_Library/' + num + (num > 46 ? 's.gif' : '.gif')
		}
		exislen = tstck.length
		Reg16.innerText = (aposs + ' apostas de ' + aposm + ' Anotadas = ' + (aposm * aposs) + ' Pontos')
	}
}

function StartRGRoletWeb(){
	if(cart == 0){cart = 1; Reg16.innerText = 'Confirmando apostas ...'; apost = aposs * aposm
		Reg21.src = '/_Library/bottg.gif'; Reg22.src = '/_Library/botpg.gif'
		var co = RSExecute(serverURL,"Method8",apost,myBackCart,errorCallBack)}
	else {
		if(rodrol == 0 && librol == 'ok'){rodrol = 'x'; girrol = (rodrolx * 100) + 3700
			alocar1('play','somsorte')
 			Reg33.src = '/_Library/Rolspfix.gif'; Reg21.src = '/_Library/bottg.gif'
			Reg34.src = '/_Library/Rolbxani.gif'; setTimeout("sorteiob()",girrol)}
	}
}

function myBackCart(co){
	cox = co.return_value[0]; Reg16.innerText = (aposs + ' apostas de ' + aposm + ' Registradas = ' + (aposm * aposs) + ' Pontos')
	if(cox == 'ok'){Reg21.src = '/_Library/botrr.gif'; Reg22.src = '/_Library/botjkb.gif'; cart = 0 
		alert('RG ROLETA WEB ALERTA\n\nApostas [ ' + Math.abs(cred - apost) + ' Pontos ] acima do Total de Pontos.\nAjuste e tente novamente....              Grato.')
	}
	else {troc = 1; jogo = 1
		if(cox == 'yes')
			var co = RSExecute(serverURL,"Method9",aposm,apost,tstck,myFirstBack,errorCallBack,"RSExecute")
		if(cox == 'no'){
			jogo = 2; Reg21.src = '/_Library/bottv.gif'
			Reg16.innerText = 'Pontos corrente esgotado !!'; Reg22.src = '/_Library/botjkb.gif'
			if(confirm('RG ROLETA WEB ALERTA:\n\nPontos esgotado. Deseja sair desta Sala ?') == true)
				location.href="http://www.aggora.com.br/sabio/1/sorte/sabio02.asp?Err=1"}
	}
} 

function myFirstBack(co){
	cred = co.return_value[0]; rodrol = co.return_value[1]; rodrolx = co.return_value[2]; gparc = co.return_value[3];
	pSala = co.return_value[5]; Reg17.innerText = 'Roleta Girando ...'
	Reg18.innerText = co.return_value[4]; top.frames.super1.Ponto.innerText = cred
 	Reg22.src = '/_Library/botjkb.gif'; girrol = (rodrol * 100) + 3700
	Reg34.src = '/_Library/Rolbxani.gif'; alocar1('play','somsorte')
	setTimeout("sorteio()", girrol)
} 

function sorteio(){
	Reg34.src = '/_Library/' + (10 + rodrol) + 'a.gif';
	if(rodrol != 0){
		Reg21.src = '/_Library/bottv.gif'
		if(gparc > 0){
			Reg00.style.visibility = ""
			Reg17.innerText = 'Jogador ganha - ' + gparc + ' Pontos';
			Reg20.src = '/_Library/botcg.gif'; alocar1('play','sominici')}
		else {Reg17.innerText = 'Nenhuma aposta em: ' + rodrol;
			Reg20.src = '/_Library/botlt.gif'; alocar1('play','somcapit')}
 		troc = 0; Reg16.innerText = "Rodada Ok! - Clique [Liberar Tab.]"}
	else {Reg33.src = '/_Library/Rolspani.gif'; Reg21.src = '/_Library/botrr.gif'
		Reg17.innerText = 'Sorte - Obtenha seu bonus ...'
		librol = 'ok'; alocar1('play','sominici')}
}

function sorteiob(){
	Reg17.innerText = 'Bonus ganha - ' + gparc + ' Pontos'; Reg20.src = '/_Library/botcb.gif'
	Reg21.src = '/_Library/bottv.gif'; Reg34.src = '/_Library/' + (10 + rodrolx) + 'a.gif'
	Reg16.innerText = "Rodada Ok! - Clique [Liberar Tab.]"; alocar1('play','sominici'); troc = 0
}

function ProssRGRoletWeb(){
    if(troc == 0){
	troc = 1; aposs = 0; jogo = 0; tstck = tstcl; rodrol = 'x'; rodrolx = 'y'; librol = 'z'
	Reg20.src = '/_Library/bottv.gif'
	for (var num = 57; num > 10; num --) offImage(num)
	Reg16.innerText = 'Fichas Recolhidas - Tabuleiro Pronto'
	Reg17.innerText = 'Faça suas apostas + [Rodar Roleta]'
	Reg34.src = '/_Library/Rolbxfix.gif'; Reg00.style.visibility = "hidden"
	if(gparc > 0){ cred += gparc; gparc = 0
	Reg18.innerText = pSala; top.frames.super1.Ponto.innerText = cred; alocar1('play','somregis')}
	else alocar1('play','somclick')
    }
}

function selBet1(j){
	if(jogo == 0){
		if(j * aposs > cred){var apsM = cred - j
			alert("RG 3.0 - ALERTA\n\nAposta recusada - Valor " + apsM + " acima do Total de Pontos Atual!")
			Reg16.innerText = "Aposta recusada - Valor " + apsM + " acima do Total de Pontos Atual!"
			Reg17.innerText = "Re-Iniciando...! Defina o valor da Aposta Padrão" }
		else{	aposm = j; Reg17.innerText = "Aposta padrão de " + aposm + " Pontos Ok!"
			if(troc != 0){
				Reg16.innerText = aposs + ' apostas de ' + aposm + ' Anotadas = ' + (aposm * aposs) + ' Pontos' }
		}
	alocar1('play','somclick')
	}
}

function instrui(){
	alert("RG 3.0 - INSTRUÇÕES :\n"
	+ "1 - Opcional: Escolha o valor da Ficha padrão.\n"
	+ "2 - Sobre o Tabuleiro deposite suas fichas.\n"
	+ "      Todas as Fichas na rodada tem valor padrão.\n"
	+ "3 - Click em: [Rodar Roleta].\n"
	+ "     Aguarde o Resultado da Roleta e Confira as apostas.\n"
	+ "4 - Clique em: [Creditar/Liberar] recolhe as fichas.\n"
	+ "5 - Reinicie os Palpites,     Boa Sorte....\n\n"
	+ "RG 3.0 - APOSTA CORRENTE = " + aposm  + " PAGA:\n"
	+ (aposm * 36) + " se Número Seco.\n"
	+ (aposm * 6) + " se Números Meia-Duzia.\n"
	+ (aposm * 3)  + " se Números Uma-Duzia.\n"
	+ (aposm * 2)  + " se Números Maior-Menor.\n"
	+ "Bonus 0 (Zero) = Nova Roleta vezes " + aposm + " Pontos")
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