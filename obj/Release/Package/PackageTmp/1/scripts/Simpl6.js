<!--//

if((parent.window.name).indexOf("inicial") < 0) location.href = "http://www.aggora.com.br/sabio/help.htm"

function muda(){
	// document.clear()
	// dadosb.dataz.width = 0
	dadosb.action = "http://www.aggora.com.br/sabio/1/sorte/tema6/sabio02.asp"
	dadosb.dataz.value = dados;  dados = 0
	dadosb.salax.value = salas;  salas = 0
	dadosb.submit()
}

function mudaA(){
	// document.clear()
	// dadosb.dataz.width = 0
	dadosb.action = "http://www.aggora.com.br/sabio/1/sorte/tema6a/sabio02.asp"
	dadosb.dataz.value = dados;  dados = 0
	dadosb.salax.value = salas;  salas = 0
	dadosb.submit()
}

	var serverURL = "Sabio03.aspx", tstmilhar = '+0123456789' + unescape('%0A%0D'), tipo = 1, pSala
	var testclickg = ' 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35'
	var tstcl = testclickd = testclickt = testclickg, aposg0 = aposd0 = apost0 = aposn0 = premio = numcok = nummok = ''
	var apossg = apossd = aposst = apossn = jogo = gparc = pulex = checPl = 0, cart = troc = tabul = resumo = 1
	var num1, num2, num3, num0, puleg = 'G:0pts', puled = 'DG:0pts', pulet = 'TG:0pts', txtWeb = premio = ''
	var pulem = 'N:0pts', puleq = 'DD:0pts', puler = 'TD:0pts', pulep = 'PS:0pts'
	var bicho = new Array("Avestruz (01 a 04)", "Aguia (05 a 08)", "Burro (09 a 12)", "Borboleta (13 a 16)",
			"Cachorro (17 a 20)", "Cabra (21 a 24)", "Carneiro (25 a 28)", "Camelo (29 a 32)",
			"Cobra (33 a 36)", "Coelho (37 a 40)", "Cavalo (41 a 44)", "Elefante (45 a 48)",
			"Galo (49 a 52)", "Gato (53 a 56)", "Jacaré (57 a 60)", "Leão (61 a 64)", "Macaco (65 a 68)",
			"Porco (69 a 72)", "Pavão (73 a 76)", "Peru (77 a 80)", "Touro (81 a 84)", "Tigre (85 a 88)",
			"Urso (89 a 92)", "Veado (93 a 96)", "Vaca (97 a 99 + 00)")

function puleTot(){
	pulex = parseInt(puleg.substr(2),10) + parseInt(puled.substr(3),10) + parseInt(pulet.substr(3),10)
		+ parseInt(pulem.substr(2),10) + parseInt(puleq.substr(3),10) + parseInt(puler.substr(3),10)
		+ parseInt(pulep.substr(3),10)
	return pulex
}

function nesTipo(){
	alert("RG 3.0 - INFORMAÇÃO:\n\nAlternativas de [ Remeter Apostas ] não disponíveis no momento - Aguarde...")
	Reg39.value = "1"
}

function resMostr(){
	if(resumo == 0){resumo = 1; Reg15.innerText = "Ativar RESUMO"; Reg16.innerText = "RESUMO DE APOSTAS DESATIVADO"}
	else {resumo = 0; Reg15.innerText = "Desativar RESUMO"; Reg16.innerText = "RESUMO DE APOSTAS ATIVADO"}
	alocar1('play','somclick')
}

function Aviso2(){
	if((this.location.href).indexOf("http://www.aggora.com.br") < 0) location.href = "http://www.aggora.com.br/sabio/help.htm"
	else{	// window.defaultStatus = 'RG 3.0 - Sabichão Web [ZOO.EIRA 1]'
		Reg17.innerText = "GS - Paga 16:1"
		NCalc.innerText = " "; Reg16.innerText = "Para Apostar: 1-Clique no Tipo; 2-Anote o Palpite; 3-Defina o Valor."
	}
}

function alocar1(sndAction,sndObj){ sndObj = "document." + sndObj
	if (eval(sndObj) != null){
		if (eval(sndObj + ".Filename")) eval(sndObj + ((sndAction == 'stop') ? '.stop()' : '.play()'))}
}

function onImage(num){
	if(apossg == 0 && apossd == 0 && aposst == 0) document.images['n' + num].src = '/_Library/' + num + 'b.gif'
	if(jogo == 0) Reg15.innerText = bicho[num - 11]
}

function offImage(num){
	if(apossg == 0 && apossd == 0 && aposst == 0) document.images['n' + num].src = '/_Library/' + num + '.gif'
	if(jogo == 0) Reg15.innerText = "Resultados"
}

function onTab(){
	if(jogo == 0) Reg00.style.visibility = ""
}

function offTab(){
	if(jogo == 0) Reg00.style.visibility = "hidden"
}

function clicImage(num){
  if(jogo == 0){
    if(tabul == 1){
	var clickexis = testclickg.indexOf(' ' + num)
	var exislen = testclickg.length
	if(clickexis >= 0){apossg ++
		document.images['n' + num].src = '/_Library/' + num + 'b.gif'
		if(clickexis == 0)testclickg = testclickg.substring(3,exislen)
		if(clickexis == (exislen - 3))testclickg = testclickg.substring(0,(exislen - 3))
		if(clickexis != 0 && clickexis != (exislen - 3)){
		var exisa = testclickg.substring(0,clickexis)
		var exisb = testclickg.substring((clickexis + 3),exislen)
		testclickg = (exisa + exisb)}}
	if(clickexis < 0){apossg --
		testclickg = (' ' + num + testclickg)
		document.images['n' + num].src = '/_Library/' + num + '.gif'}
	puleg = 'G:' + (aposg0 * apossg) + 'pts'
	Reg16.innerText = 'Total = ' + puleTot() + ' Pontos - ' + apossg + puleg
    }

    if(tabul == 2){
	var clickexis = testclickd.indexOf(' ' + num)
	var exislen = testclickd.length
 	if(apossd == 2 && clickexis >= 0) 
	alert("RG 3.0 - INFORMAÇÃO:\n\nDuque de Grupo - 2 palpites Ok!\nPara substituir remova antes um palpite anotado")
	if(clickexis >= 0 && apossd < 2){apossd ++
		document.images['n' + num].src = '/_Library/' + num + 'b.gif'
		if(clickexis == 0)testclickd = testclickd.substring(3,exislen)
		if(clickexis == (exislen - 3))testclickd = testclickd.substring(0,(exislen - 3))
		if(clickexis != 0 && clickexis != (exislen - 3)){
		var exisa = testclickd.substring(0,clickexis)
		var exisb = testclickd.substring((clickexis + 3),exislen)
		testclickd = (exisa + exisb)}}
	if(clickexis < 0){apossd --
		testclickd = (' ' + num + testclickd)
		document.images['n' + num].src = '/_Library/' + num + '.gif'}
	if(aposd0 != '' && apossd > 1) puled = 'DG:' + aposd0 + 'pts'; else puled = 'DG:0pts'
	Reg16.innerText = 'Total = ' + puleTot() + ' Pontos - ' + puled
    }

    if(tabul == 3){
	var clickexis = testclickt.indexOf(' ' + num)
	var exislen = testclickt.length
	if(aposst == 3 && clickexis >= 0)
	alert("RG 3.0 - INFORMAÇÃO:\n\nTerno de Grupo - 3 palpites Ok!\nPara substituir remova antes um palpite anotado")
	if(clickexis >= 0 && aposst < 3){aposst ++
		document.images['n' + num].src = '/_Library/' + num + 'b.gif'
		if(clickexis == 0)testclickt = testclickt.substring(3,exislen)
		if(clickexis == (exislen - 3))testclickt = testclickt.substring(0,(exislen - 3))
		if(clickexis != 0 && clickexis != (exislen - 3)){
		var exisa = testclickt.substring(0,clickexis)
		var exisb = testclickt.substring((clickexis + 3),exislen)
		testclickt = (exisa + exisb)}}
	if(clickexis < 0){aposst --
		testclickt = (' ' + num + testclickt)
		document.images['n' + num].src = '/_Library/' + num + '.gif'}
	if(apost0 != '' && aposst > 2) pulet = 'TG:' + apost0 + 'pts'; else pulet = 'TG:0pts'
	Reg16.innerText = 'Total = ' + puleTot() + ' Pontos - ' + pulet
    }

	if(apossg == 1 || apossd == 1 || aposst == 1) Reg15.src = '/_Library/Rolficha.jpg'
	libTecl()

  }
}

function libTecl(){
	if(pulem == 'N:0pts' && puleg == 'G:0pts' && puled == 'DG:0pts' && pulet == 'TG:0pts' &&
		puleq == 'DD:0pts' && puler == 'TD:0pts' && pulep == 'PS:0pts')
		{cart = 1; Reg21.src = '/_Library/bottv.gif'}
	else	{cart = 0; Reg21.src = '/_Library/botrr.gif'}
}

function recapts(){
    if(tabul == 1){
	for (var num = 35; num > 10; num --){
		(testclickg.indexOf(' ' + num) < 0 ? 
		document.images['n' + num].src = '/_Library/' + num + 'b.gif' :
		document.images['n' + num].src = '/_Library/' + num + '.gif')}
		Reg16.innerText = 'Total = ' + puleTot() + ' Pontos - ' + apossg + puleg}

    if(tabul == 2){
	for (var num = 35; num > 10; num --){
		(testclickd.indexOf(' ' + num) < 0 ? 
		document.images['n' + num].src = '/_Library/' + num + 'b.gif' :
		document.images['n' + num].src = '/_Library/' + num + '.gif')}
		Reg16.innerText = 'Total = ' + puleTot() + ' Pontos - ' + puled}

    if(tabul == 3){
	for (var num = 35; num > 10; num --){
		(testclickt.indexOf(' ' + num) < 0 ? 
		document.images['n' + num].src = '/_Library/' + num + 'b.gif' :
		document.images['n' + num].src = '/_Library/' + num + '.gif')}
		Reg16.innerText = 'Total = ' + puleTot() + ' Pontos - ' + pulet}
}

function StartRGBICHOWeb(){
    if(cart == 0){
	cart = 1, jogo = 1, Reg21.src = '/_Library/bottv.gif'; Reg00.style.visibility = "hidden"

	grpsim = ''; for(i = 11; i <= 35; i ++){ if(testclickg.indexOf(' ' + i) < 0) grpsim += ' ' + (i - 10)}
	grdsim = ''; for(i = 11; i <= 35; i ++){ if(testclickd.indexOf(' ' + i) < 0) grdsim += ' ' + (i - 10)}
	grtsim = ''; for(i = 11; i <= 35; i ++){ if(testclickt.indexOf(' ' + i) < 0) grtsim += ' ' + (i - 10)}

	var txtinfo = 'RG 3.0 - RESUMO DE APOSTAS (' + Reg39.value + '):\n\n'
	txtWeb = 'W:' + Reg39.value
	if(pulem != 'N:0pts'){
		var i = ii = j = jj = c = cc = m = mm = '';
		for(i = 1; i < 6; i ++){ if(eval('Nb1' + i).checked){ j += ' ' + i + 'º'; jj += 1} else jj += 0}
		if (Nb1(0).checked){ i = 'Seco e ('; ii = 1} else {i = '('; ii = 0}
		if (Na1(0).checked){ c = ''; cc = 1} else {c = 'Combinada'; cc = 0}
		if (Na2(0).checked){ m = ''; mm = 1} 
			else if(Na2(1).checked){ m = 'Combinada'; mm = 0} else {m = '/ Centena'; mm = 2}
		txtinfo += apossn + pulem + '  Sorteio ' + i + j + ' ) nº em:\n'
			+ '   Centena(s) ' + c + ' ( ' + numcok + ' )\n' + '   Milhar(es)   ' + m + ' ( ' + nummok + ' )\n'
		txtWeb += ' !1!' + aposn0 + pulem + ii + jj + cc + mm + (numcok == '' ? '' : 'C' + numcok)
			+ (nummok == '' ? 'c' : 'cM' + nummok + 'm')}
	if(puleq != 'DD:0pts'){
		txtinfo += puleq + ' Duque de Dezena ( ' + Nc1.value + ' e ' + Nc2.value + ' )\n'
		txtWeb += ' !2!' + puleq + '#' + Nc1.value + Nc2.value}
	if(puler != 'TD:0pts'){
		txtinfo += puler + ' Terno de Dezena ( ' + Nd1.value + ' e ' + Nd2.value + ' e ' + Nd3.value + ' )\n'
		txtWeb += '!3!' + puler + '#' + Nd1.value + Nd2.value + Nd3.value}
	if(pulep != 'PS:0pts'){
		var i, ii = ''
		if(Ne1(0).checked){ i = ' Passe Vai'; ii = 1}
			else if(Ne1(1).checked){ i = ' Passe Vai-e-Vem'; ii = 0} else { i = ' Dupla Seca'; ii = 2}
		txtinfo += pulep + i + ' ( ' + Nf1.value + ' e ' + Nf2.value + ' )\n'
		txtWeb += ' !4!' + pulep + ii + '#' + Nf1.value + 'e' + Nf2.value}
	if(puleg != 'G:0pts'){
		var i = ii = j = jj = ''
		for(i = 1; i < 6; i ++){ if(eval('Nb2' + i).checked){ j += ' ' + i + 'º'; jj += 1} else jj += 0}
		if (Nb2(0).checked){ i = 'Seco e ('; ii = 1} else {i = '('; ii = 0}
		txtinfo += apossg + puleg + '  Sorteio ' + i + j + ' ) nº em:\n' + '   Grupo(s) ( ' + grpsim + ' )\n'
		txtWeb += ' !5!' + aposg0 + puleg + ii + jj + '#' + grpsim}
	if(puled != 'DG:0pts'){
		var i = ii = ''; if (Gd1(0).checked){ i = 'Seco '; ii = 1} else ii = 0
		txtinfo += puled + ' Duque de Grupo ' + i + '( ' + grdsim + ' )\n'
		txtWeb += ' !6!' + puled + ii + '#' + grdsim}
	if(pulet != 'TG:0pts'){
		var i = ii = ''; if (Gt1(0).checked){ i = 'Seco '; ii = 1} else ii = 0
		txtinfo += pulet + ' Terno de Grupo ' + i + '( ' + grtsim + ' )\n'
		txtWeb += ' !7!' + pulet + ii + '#' + grtsim}

	checPl = puleTot()
	txtinfo += '\nVALOR TOTAL DE APOSTAS NA RODADA ......... ' + checPl + ' Pontos' + '\nConfirma sua Pule ?'
	txtWeb += ' !0!' + checPl

      if((resumo == 0 ? confirm(txtinfo) == true : resumo == 1)){ Reg21.src = '/_Library/bottg.gif'
		Reg16.innerText = 'Confirmando apostas ...'; Reg22.src = '/_Library/botpg.gif'
		var co = RSExecute(serverURL,"Method8",checPl,myBackCart,errorCallBack)
      }
      else { cart = 0, jogo = 0, Reg21.src = '/_Library/botrr.gif'}
    }
}

function myBackCart(co){
	cox = co.return_value[0]; Reg16.innerText = 'Pule Registrada = ' + checPl + ' Pontos'
	if(cox == 'ok'){
		Reg21.src = '/_Library/botrr.gif'; Reg22.src = '/_Library/botjkb.gif'; cart = jogo = 0 
		alert('RG ZOO.EIRA WEB ALERTA\n\nApostas [ ' + Math.abs(cred - checPl) + ' Pontos ] acima do Crédito Atual disponível.\nAjuste e tente novamente....              Grato.')
	}
	else {if(cox == 'yes')
			var co = RSExecute(serverURL,"Method9",txtWeb,myFirstBack,errorCallBack,"RSExecute")
		if(cox == 'no'){
			jogo = 2; Reg21.src = '/_Library/bottv.gif'; Reg22.src = '/_Library/botjkb.gif'
			Reg16.innerText = 'Total de Pontos Esgotado !!'
			if(confirm('RG POKER WEB ALERTA:\n\nTotal de Pontos Esgotado. Deseja sair desta Sala ?') == true)
				location.href="http://www.aggora.com.br/sabio/1/sorte/sabio02.asp?Err=1"
		}
	}
} 

	placar = new Array(); grupo = new Array()

function myFirstBack(co){
	cred = co.return_value[0]; for(stvar = 5; stvar > 0; stvar --){
		placar[stvar] = co.return_value[stvar]; grupo[stvar] = co.return_value[stvar + 5]}
	gparc = co.return_value[11]; premio = co.return_value[12]; pSala = co.return_value[14]
	Reg18.innerText = co.return_value[13]; top.frames.super1.Ponto.innerText = cred
 	Reg22.src = '/_Library/botjkb.gif'; Reg15.innerText = "Sorteando ..."
	alocar1('play','somsorte')
	rol05.src = '/_Library/Zoogirar.gif'; rol15.src = '/_Library/Zoogirar.gif';
	rol25.src = '/_Library/Zoogirar.gif'; rol35.src = '/_Library/Zoogirar.gif';

	stvar = 5; rodst3 = placar[stvar]
	var rodst0 = parseInt(rodst3.substr(0,1),10); var rodst1 = parseInt(rodst3.substr(1,1),10)
	var rodst2 = parseInt(rodst3.substr(2,1),10); var rodst3 = parseInt(rodst3.substr(3,1),10)
	num0 = '/_Library/' + rodst0 + '.jpg'; num1 = '/_Library/' + rodst1 + '.jpg'
	num2 = '/_Library/' + rodst2 + '.jpg'; num3 = '/_Library/' + rodst3 + '.jpg'

	setTimeout('sort0(stvar)', (2000 + (rodst0 * 200))); setTimeout('sort1(stvar)', (4000 + (rodst1 * 200)))
	setTimeout('sort2(stvar)', (6000 + (rodst2 * 200))); setTimeout('sort3(stvar)', (8000 + (rodst3 * 200)))
}

function sort0(n){document.images['rol0' + n].src = num0}

function sort1(n){document.images['rol1' + n].src = num1}

function sort2(n){document.images['rol2' + n].src = num2}

function sort3(n){document.images['rol3' + n].src = num3; setTimeout('coleta()',200)}

function coleta(){
	Reg15.innerText = bicho[(grupo[stvar] - 1)]
	document.images['rol4' + stvar].src = '/_Library/' + (grupo[stvar] + 10) + '.gif'
	Reg17.innerText = stvar + 'º Premio - ' + placar[stvar] + ' [' + grupo[stvar] + ']';
    if(stvar > 1){
	stvar --; rodst3 = placar[stvar]
	var rodst0 = parseInt(rodst3.substr(0,1),10); var rodst1 = parseInt(rodst3.substr(1,1),10)
	var rodst2 = parseInt(rodst3.substr(2,1),10); var rodst3 = parseInt(rodst3.substr(3,1),10)
	num0 = '/_Library/' + rodst0 + '.jpg'; num1 = '/_Library/' + rodst1 + '.jpg'
	num2 = '/_Library/' + rodst2 + '.jpg'; num3 = '/_Library/' + rodst3 + '.jpg'
	alocar1('play','somsorte');
	document.images['rol0' + stvar].src = '/_Library/Zoogirar.gif';
	document.images['rol1' + stvar].src = '/_Library/Zoogirar.gif';
	document.images['rol2' + stvar].src = '/_Library/Zoogirar.gif';
	document.images['rol3' + stvar].src = '/_Library/Zoogirar.gif';
	setTimeout('sort0(stvar)', (2000 + (rodst0 * 200)));
	setTimeout('sort1(stvar)', (4000 + (rodst1 * 200)));
	setTimeout('sort2(stvar)', (6000 + (rodst2 * 200)));
	setTimeout('sort3(stvar)', (8000 + (rodst3 * 200)));
    }
    else {alocar1('play','somsorte'); setTimeout('checkgroup()',2000);}
}

function checkgroup(){
	Reg21.src = '/_Library/bottv.gif'
	if(gparc > 0){
		Reg17.innerText = 'Prêmios ' + gparc + ' Pontos' + premio; Reg16.innerText = "Ok! - Clique [Creditar]"
		Reg00.style.visibility = ""; Reg20.src = '/_Library/botcg.gif'; alocar1('play','sominici') }
	else {
		gparc = 0; Reg17.innerText = ' Nenhuma aposta premiada.'; Reg16.innerText = "Ok! - Clique [Liberar Tab.]"
		Reg20.src = '/_Library/botlt.gif'; alocar1('play','somcapit') }
	troc = 0
}

function ProssRGBICHOWeb()
{
    if(troc == 0){
	troc = 1; Reg20.src = '/_Library/bottv.gif'
	if(gparc > 0){
		cred = cred + gparc
		Reg18.innerText = pSala ; top.frames.super1.Ponto.innerText = cred
		alocar1('play','somregis'); gparc = 0}
	else alocar1('play','somclick')

	testclickg = testclickd = testclickt = tstcl;
	aposn0 = aposg0 = aposd0 = apost0 = apossg = apossd = aposst = apossq = apossr = apossp = 0
	pulem = 'N:0pts'; puleq = 'DD:0pts'; puler = 'TD:0pts'; pulep = 'PS:0pts'
	Reg09.innerText = Reg03.innerText = Reg04.innerText = Reg05.innerText = "Sem Apostas"
	puleg = 'G:0pts'; puled = 'DG:0pts'; pulet = 'TG:0pts'
	Reg06.innerText = Reg07.innerText = Reg08.innerText = "Sem Apostas"; premio = ""

	for (var num = 35; num > 10; num --){ offImage(num)}
	for(stvar = 1;stvar < 6; stvar ++){
		document.images['rol0' + stvar].src = '/_Library/00.jpg'
		document.images['rol1' + stvar].src = '/_Library/00.jpg'
		document.images['rol2' + stvar].src = '/_Library/00.jpg'
		document.images['rol3' + stvar].src = '/_Library/00.jpg'
		document.images['rol4' + stvar].src = '/_Library/' + stvar + 'p.gif'}

	Reg17.innerText = 'Façam suas apostas'; Reg16.innerText = 'Ok!!. Apostas Liberadas'
	Reg15.innerText = "Resultados"; jogo = 0; pulex = 0
    }
}

function confApt(){
	if(puleg == 'G:0pts')  {aposg0 = 0; Reg06.innerText = "Sem Apostas"}
	if(puled == 'DG:0pts') {aposd0 = 0; Reg07.innerText = "Sem Apostas"}
	if(pulet == 'TG:0pts') {apost0 = 0; Reg08.innerText = "Sem Apostas"}
	if(pulem == 'N:0pts')  {aposn0 = 0; Reg09.innerText = "Sem Apostas"}
}

function mdaptGpf(n){
	tipo = tabul = n; document.n10.src = '/_Library/botgp' + n + '.gif'
	if(n == 1){ Aposta.innerText = "Grupo Simples"; if(jogo == 0) Reg17.innerText = "GS - Paga 16:1" }
	else 	if(n == 2){ Aposta.innerText = "Duque Grupo"; if(jogo == 0) Reg17.innerText = "DG - Paga 18:1" }
		else{ Aposta.innerText = "Terno Grupo"; if(jogo == 0) Reg17.innerText = "TG - Paga 500:1" }
	recapts()
}

function mdaptGpg(n){
	tipo = n
	if(n == 4){ Aposta.innerText = "Duque Dezena"; if(jogo == 0) Reg17.innerText = "DD - Paga 500:1" }
	else 	if(n == 5){ Aposta.innerText = "Terno Dezena"; if(jogo == 0) Reg17.innerText = "TD - Paga 2000:1" }
		else{ Aposta.innerText = "Passes e Dupla"; if(jogo == 0) Reg17.innerText = "PV-140:1 | VV-70:1 | DS-200:1" }
}

function mdaptGph(){
	if(tipo < 7){
		Reg20a.style.visibility = "hidden"; Reg20b.style.visibility = ""
		tipo = 7; Reg19a.style.visibility = Reg19b.style.visibility = "hidden"; Reg19c.style.visibility = ""
		Aposta.innerText = "Números Mil/Cent"; if(jogo == 0) Reg17.innerText = "C-500:1 | Cc-83:1 | M-3000:1 | Mm-125:1" }
}

function mdaptGpi(){
	if(tipo < 4 || tipo > 6){
		Reg20a.style.visibility = "hidden"; Reg20b.style.visibility = ""
		Reg19a.style.visibility = Reg19c.style.visibility = "hidden"; Reg19b.style.visibility = ""
		if(G2(0).checked) mdaptGpg(4)
		else 	if(G2(1).checked) mdaptGpg(5)
			else mdaptGpg(6)
	}
}

function mdaptGpj(){
	if(tipo > 3){
		Reg19b.style.visibility = Reg19c.style.visibility = "hidden"; Reg19a.style.visibility = ""
		Reg20b.style.visibility = "hidden"; Reg20a.style.visibility = ""
		if(G1(0).checked) mdaptGpf(1)
		else 	if(G1(1).checked) mdaptGpf(2)
			else mdaptGpf(3)
	}
}

function mdaptGp(j){
	aposg0 = j; Reg06.innerText = j + " Pontos/g"
	if(jogo == 0){
		if(aposg0 == ''){ testclickg = tstcl; apossg = 0; recapts()}
		//else if(resumo == 0) alert('RG 3.0 ALERTA :\n\nCada aposta no Grupo assume o novo Valor Padrão.')
		puleg = 'G:' + (aposg0 * apossg) + 'pts';
		Reg16.innerText = 'Total = ' + puleTot() + ' Pontos - ' + apossg + puleg
		libTecl()
	}
}

function mdaptDq(j){
	aposd0 = j; Reg07.innerText = j + " Pontos"
	if(jogo == 0){
		if(aposd0 == ''){ testclickd = tstcl; apossd = 0; puled = 'DG:0pts'; recapts()}
		if(aposd0 != '' && apossd > 1) puled = 'DG:' + aposd0 + 'pts'
		Reg16.innerText = 'Total = ' + puleTot() + ' Pontos - ' + puled
		libTecl()
	}
}

function mdaptTn(j){
	apost0 = j; Reg08.innerText = j + " Pontos"
	if(jogo == 0){
		if(apost0 == ''){ testclickt = tstcl; aposst = 0; pulet = 'TG:0pts'; recapts()}
		if(apost0 != '' && aposst > 2) pulet = 'TG:' + apost0 + 'pts'
		Reg16.innerText = 'Total = ' + puleTot() + ' Pontos - ' + pulet
		libTecl()
	}
}

function mdaptNb(j){
	aposn0 = j; Reg09.innerText = j + " Pontos/nº"
	if(jogo == 0){
		if(aposn0 == ''){ apossn = 0; Reg02.value = ''}
		//else if(resumo == 0) alert('RG 3.0 ALERTA :\n\nCada aposta no Número assume o novo Valor Padrão.')
		pulem = 'N:' + (apossn * aposn0) + 'pts'
		Reg16.innerText = 'Total = ' + puleTot() + ' Pontos - ' + apossn + pulem
		libTecl()
	}
}

function mdaptNbc(){
	if(jogo == 0){
		var nummil = numcok + nummok
		nummil = prompt("ADIÇÃO DE NÚMEROS: Milhar(es) e/ou Centena(s). Separe-os com [ + ]", nummil, 0)
		if(nummil){ apossn = aposc = aposm = 0; numcok = nummok = ''; var j = 1
			var lennum = nummil.length, strFin = nummil.substring(lennum - 1, lennum)
			if(strFin != unescape('%0A') && strFin != '+') {nummil += unescape('%0A'); lennum ++}
			for(var i = 0; i <= lennum; i ++){
				tstmil = nummil.substr(i, 1)
				if(tstmilhar.indexOf(tstmil) < 0){ apossn = 0; nummil = ''
					alert('RG 3.0 INSTRUÇÕES :\n\nSeus números tem um caracter [ ' + tstmil 
					+ ' ] não permitido e todos serão anulados.\nNúmeros permitidos: Milhares'
					+ ' e Centenas. Separe-os com: [ + ].'); break}
				if(tstmil == '+'){ tstmil = unescape('%0A')
					nummil = nummil.substr(0, i) + tstmil + nummil.substr(i + 1)}
				if(j < 4 && tstmil == unescape('%0A')){ apossn = 0; nummil = ''
					alert('RG 3.0 INSTRUÇÕES :\n\nUm de seus números é Dezena ou menor'
					+ ' e todos serão anulados.\nNúmeros permitidos: Milhares e Centenas.'); break}
				if(j > 5){ apossn = 0; nummil = ''
					alert('RG 3.0 INSTRUÇÕES :\n\nUm de seus números é Dezena de Milhar ou maior'
					+ ' e todos serão anulados.\nNúmeros permitidos: Milhares e Centenas.'); break}
				if(tstmil == unescape('%0A')) {apossn ++
					if(j == 5){nummok += nummil.substring(i - 4, i) + '+'; aposc ++}
					else {numcok += nummil.substring(i - 3, i) + '+'; aposm ++};j = 1}; else j ++
			}
			Reg02.value = nummil; Reg10.innerText = 'Cent.: ' + aposm; Reg11.innerText = 'Milhar: ' + aposc
		}
		else {apossn = 0; Reg02.value = ''}
		pulem = 'N:' + (apossn * aposn0) + 'pts'
		Reg16.innerText = 'Total = ' + puleTot() + ' Pontos - ' + apossn + pulem
		libTecl()
	}
}

function mdaptDdb(j){
	aposq0 = j; Reg03.innerText = j + " Pontos"
	if(jogo == 0){
		(aposq0 == '' ? apossq = 0 : apossq = aposq0)
		puleq = 'DD:' + apossq + 'pts'
		Reg16.innerText = 'Total = ' + puleTot() + ' Pontos - ' + puleq
		libTecl()
	}
}

function mdaptTdb(j){
	aposr0 = j; Reg04.innerText = j + " Pontos"
	if(jogo == 0){
		(aposr0 == '' ? apossr = 0 : apossr = aposr0)
		puler = 'TD:' + apossr + 'pts'
		Reg16.innerText = 'Total = ' + puleTot() + ' Pontos - ' + puler
		libTecl()
	}
}

function mdaptPsb(j){
	aposp0 = j; Reg05.innerText = j + " Pontos"
	if(jogo == 0){
		(aposp0 == '' ? apossp = 0 : apossp = aposp0)
		pulep = 'PS:' + apossp + 'pts'
		Reg16.innerText = 'Total = ' + puleTot() + ' Pontos - ' + pulep
		libTecl()
	}
}

function instrui(){
	alert("RG 3.0 - INSTRUÇÕES :\n"
	+ "1 - Escolha o Modo do Sorteio: Página Web ou Loterias.\n"
	+ "2 - Faça suas apostas no Grupo, Duque, Terno ou Número.\n"
	+ "3 - Click em: [Rodar Sorteio] Web ou [Enviar Apostas] Loterias.\n"
	+ "4 - No Resumo das Apostas, confirme ou cancele sua Pule.\n"
	+ "5 - Clique em: [Creditar/Recolher] para preparar próxima rodada.\n"
	+ "6 - Reinicie as Apostas,     Boa Sorte....\n\n"
	+ "RG 3.0 - TABELA DE PRÊMIOS:\n"
	+ "Milhar (M) - 1:3.000\n"
	+ "Milhar Combinada (Mm) - 1:125\n"
	+ "Milhar e Centena (MC ) - 50%M e 50%C\n"
	+ "Centena (C) - 1:500\n"
	+ "Centena Combinada (Cc) - 1:83\n"
	+ "Duque de Dezena (DD) - 1:600\n"
	+ "Terno de Dezena (TD) - 1:2.000\n"
	+ "Passe Vai (PV) - 1:140\n"
	+ "Passe Vai-Vem (VV) - 1:70\n"
	+ "Dupla Seca (DS) - 1:200\n"
	+ "Grupo (G) - 1:16\n"
	+ "Duque de Grupo (DG) - 1:100\n"
	+ "Terno de Grupo (TG) - 1:500\n"
	+ "Prêmio relativo a aposta em um único placar ou Seco")
}

function tstNum1(n){
		for(var i = 1, j = 5; i < 6; i ++){(eval('Nb' + n + i).checked ? j ++ : j --) }
		if(j == 0) eval('Nb' + n + 1).checked = 1
}

function tstNum2(n){
	if(eval('Nb' + n)(1).checked){
		for(var i = 1, j = 5; i < 6; i ++){(eval('Nb' + n + i).checked ? j ++ : j --) }
		if(j == 0) eval('Nb' + n)(0).checked = 1}
}

function tstNum3(n){
		for(var i = 1, j = 5; i < 6; i ++){(['Nb' + n + i].checked ? j ++ : j --) }
		if(j == 0) ['Nb' + n + 1].checked = 1
}

function tstNum4(n){
	if(['Nb' + n](1).checked){
		for(var i = 1, j = 5; i < 6; i ++){(['Nb' + n + i].checked ? j ++ : j --) }
		if(j == 0) ['Nb' + n](0).checked = 1}
}

function selBet1(j){
	if(jogo == 0){
		alocar1('play','somclick')
		if(tipo == 1) mdaptGp(j)
		else 	if(tipo == 2) mdaptDq(j)
			else 	if(tipo == 3) mdaptTn(j)
				else 	if(tipo == 4) mdaptDdb(j)
					else 	if(tipo == 5) mdaptTdb(j)
						else 	if(tipo == 6) mdaptPsb(j)
							else if(tipo == 7) mdaptNb(j)
	}
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