<!--//

if((parent.window.name).indexOf("inicial") < 0) location.href = "http://www.aggora.com.br/sabio/help.htm"

function muda(){
	// document.clear()
	// dadosb.dataz.width = 0
	dadosb.action = "http://www.aggora.com.br/sabio/1/sorte/tema4/sabio02.asp"
	dadosb.dataz.value = dados;  dados = 0
	dadosb.salax.value = salas;  salas = 0
	dadosb.submit()
}

function mudaA(){
	// document.clear()
	// dadosb.dataz.width = 0
	dadosb.action = "http://www.aggora.com.br/sabio/1/sorte/tema4a/sabio02.asp"
	dadosb.dataz.value = dados;  dados = 0
	dadosb.salax.value = salas;  salas = 0
	dadosb.submit()
}

var serverURL = "Sabio03.aspx", n = 7, txtWeb = 'Pule: ', z = 6, cart = troc = 1, jogo = gparc = aposs = aposm = 0
var pFicha = new Array(0,0,0,0,0,0), Pyh, Pxh, Fx, Fy

function Aviso2(){
	if((this.location.href).indexOf("http://www.aggora.com.br") < 0) location.href = "http://www.aggora.com.br/sabio/help.htm"
	else{	// window.defaultStatus = 'RG 3.0 - Sabich�o Web [DADOS 1]'
		NCalc.innerText = " "; Reg16.innerText = "Para apostar click na Ficha e depois no Tabuleiro"
	}
}

function alocar1(sndAction,sndObj){ sndObj = "document." + sndObj
	if (eval(sndObj) != null){
		if (eval(sndObj + ".Filename")) eval(sndObj + ((sndAction == 'stop') ? '.stop()' : '.play()'))}
}

function StartMove(vezF){
	if(jogo == 0){
		n = vezF;
		if(pFicha[n] == 0){
			for(i = 0; i < 6; i ++){ F1(i).style.visibility = "hidden"}
			Ficha(n).adjustX = event.clientX; Fy = event.clientY; Fx = event.clientX
			switch(n){
				case 0 : Fx -= 100; break
				case 1 : Fx -= 155; break
				case 2 : Fx -= 210; break
				case 3 : Fx -= 365; break
				case 4 : Fx -= 420; break
				case 5 : Fx -= 475; break}
			F1(n).style.visibility = ""; pFicha[n] = 1
		} else {
			for(i = 0; i < 6; i ++){ F1(i).style.visibility = "hidden"}
			Ficha(n).style.left = 0; Ficha(n).style.top = 0; subGroup(n)
			pFicha[n] = 0; n = 7
		}
	}
}

function StopMove(){
	if(n < 7 && jogo == 0){
		F1(n).style.visibility = "hidden"
		var Px = event.clientX, Py = event.clientY
		if(Py < Fy + 140){ Phy = Fy + 125
			if(Px < Fx + 95){ Ficha(n).style.left = Fx + 40 - Ficha(n).adjustX; Ficha(n).style.top = Phy - (n * 8) - Fy; addGroup(n,'Md')}
			else 	if(Px < Fx + 158){ Ficha(n).style.left = Fx + 125 - Ficha(n).adjustX; Ficha(n).style.top = Phy - (n * 7) - Fy; addGroup(n,'Su')}
				else 	if(Px < Fx + 221){ Ficha(n).style.left = Fx + 188 - Ficha(n).adjustX; Ficha(n).style.top = Phy - (n * 7) - Fy; addGroup(n,'Sd')}
					else 	if(Px < Fx + 285){ Ficha(n).style.left = Fx + 253 - Ficha(n).adjustX; Ficha(n).style.top = Phy - (n * 7) - Fy; addGroup(n,'St')}
						else 	if(Px < Fx + 349){ Ficha(n).style.left = Fx + 318 - Ficha(n).adjustX; Ficha(n).style.top = Phy - (n * 7) - Fy; addGroup(n,'Sq')}
							else 	if(Px < Fx + 412){ Ficha(n).style.left = Fx + 384 - Ficha(n).adjustX; Ficha(n).style.top = Phy - (n * 7) - Fy; addGroup(n,'Sc')}
								else 	if(Px < Fx + 475){ Ficha(n).style.left = Fx + 448 - Ficha(n).adjustX; Ficha(n).style.top = Phy - (n * 7) - Fy; addGroup(n,'Ss')}
									else{ Ficha(n).style.left = Fx + 530 - Ficha(n).adjustX; Ficha(n).style.top = Phy - (n * 8) - Fy; addGroup(n,'Md')}
		} else { Phy = Fy + 225
			if(Px < Fx + 84){ Ficha(n).style.left = Fx + 30 - Ficha(n).adjustX; Ficha(n).style.top = Phy - (n * 8) - Fy; addGroup(n,'Mo')}
			else 	if(Px < Fx + 485){ Ficha(n).style.left = Fx + 147 + (n * 55) - Ficha(n).adjustX; Ficha(n).style.top = Phy - Fy; addGroup(n,'Lm')}
				else { Ficha(n).style.left = Fx + 540 - Ficha(n).adjustX; Ficha(n).style.top = Phy - (n * 8) - Fy; addGroup(n,'Mo')}
		}
		n = 7
	}
}

function addGroup(valor,tipo){
	txtWeb += ' ' + (valor + 1) + tipo; aposm += (valor == 5 ? (valor + 5) : (valor + 1))
	aposs ++; if(aposs == 1){ cart = 0; Reg21.src = '/_Library/botrr.gif'}
	Reg16.innerText = aposs + ' apostas Anotadas: ' + aposm + ' Pontos'
}

function subGroup(valor){
	var i = ' ' + (valor + 1), j = txtWeb.indexOf(i)
	if(j >= 0){
		aposs --; if(aposs == 0){ cart = 1; Reg21.src = '/_Library/bottv.gif'}
		txtWeb = txtWeb.substring(0,j) + txtWeb.substr(j + 4)
		aposm -= (valor == 5 ? (valor + 5) : (valor + 1))
		Reg16.innerText = aposs + ' apostas Anotadas: ' + aposm + ' Pontos'
	}
}

function StartRGDadosWeb(){
	if(cart == 0){
		cart = jogo = 1, apost = aposm, Reg21.src = '/_Library/bottg.gif'
		Reg16.innerText = 'Confirmando apostas ...'; Reg22.src = '/_Library/botpg.gif'
		var co = RSExecute(serverURL,"Method10",apost,myBackCart,errorCallBack)
	}
}

function myBackCart(co){
	cox = co.return_value[0]
	if(cox == 'ok'){
		Reg21.src = '/_Library/botrr.gif'; Reg22.src = '/_Library/botjkb.gif'; cart = jogo = 0 
		alert('RG DADOS WEB ALERTA\n\nApostas [ ' + Math.abs(cred - apost) + ' Pontos ] acima do Total Atual dispon�vel.\nAjuste e tente novamente....              Grato.')
	}
	else {Reg16.innerText = aposs + ' apostas Registradas: ' + aposm + ' Pontos'
		if(cox == 'yes')
			var co = RSExecute(serverURL,"Method11",txtWeb,myFirstBack,errorCallBack,"RSExecute")
		if(cox == 'no'){
			jogo = 2; Reg21.src = '/_Library/bottv.gif'
			Reg16.innerText = 'Total de Pontos Esgotado !!'; Reg22.src = '/_Library/botjkb.gif'
			if(confirm('RG DADOS ALERTA\n\nTotal de Pontos  esgotado. Deseja sair da Sala ?') == true)
				location.href="http://www.aggora.com.br/sabio/1/sorte/sabio02.asp?Err=1"
		}
	}
} 

	placar = new Array()

function myFirstBack(co){
	cred = co.return_value[0]; for(stvar = 1; stvar < 10; stvar ++) placar[stvar] = co.return_value[stvar]
	gparc = co.return_value[10]; premio = co.return_value[11]; pSala = co.return_value[13]
	Reg18.innerText = co.return_value[12]; top.frames.super1.Ponto.innerText = cred
	Reg22.src = '/_Library/botjkb.gif'; Reg17.innerText = 'Dados Rolando ...'; alocar1('play','somsorte')
	Reg31.src = '/_Library/Dadsort' + placar[1] + '.gif'
	Reg32.src = '/_Library/Dadsort' + placar[2] + '.gif'
	Reg33.src = '/_Library/Dadsort' + placar[3] + '.gif'

	setTimeout('coleta()',8000)
}

function coleta(){
	if(gparc > 0){
		if(placar[4] == 1) F1(0).style.visibility = ""
		if(placar[5] == 1) F1(1).style.visibility = ""
		if(placar[6] == 1) F1(2).style.visibility = ""
		if(placar[7] == 1) F1(3).style.visibility = ""
		if(placar[8] == 1) F1(4).style.visibility = ""
		if(placar[9] == 1) F1(5).style.visibility = ""
		Reg17.innerText = 'Pr�mios ' + gparc + ' Pontos - ' + premio; Reg20.src = '/_Library/botcg.gif'
		alocar1('play','sominici')}
	else{	Reg17.innerText = 'Rodada sem Pr�mios - Sorry !'; Reg20.src = '/_Library/botlt.gif'
		alocar1('play','somcapit')}
	Reg16.innerText = 'Dados: [' + placar[1] + '] [' + placar[2] + '] [' + placar[3] + ']   -    Soma: ' + (placar[1] + placar[2] + placar[3]) + "   -    Clique em [Liberar/Creditar]"
	Reg21.src = '/_Library/bottv.gif'; troc = 0
}

function ProssRGDadosWeb(){
	if(troc == 0){
		troc = 1; Reg20.src = '/_Library/bottv.gif'
		if(gparc > 0){ cred = cred + gparc
			Reg18.innerText = pSala; top.frames.super1.Ponto.innerText = cred
			gparc = 0; alocar1('play','somregis')}
		else alocar1('play','somclick')
		txtWeb = 'Pule: ', apost = aposs = aposm = 0, premio = ''
		for(var i = 0; i < 6; i ++){
			pFicha[i] = 0; F1(i).style.visibility = "hidden"
			Ficha(i).style.left = 0; Ficha(i).style.top = 0}
		Reg17.innerText = 'Fa�a suas apostas'; Reg16.innerText = 'Tabuleiro Pronto - Apostas Ok!'
		Reg31.src = Reg32.src = Reg33.src = '/_Library/Dadspani.gif'; jogo = 0
	}
}

function instrui(){
	alert("RG 3.0 - INSTRU��ES :\n"
	+ "1 - Click na Ficha a apostar;\n"
	+ "  1a) a Ficha ativa aprece em destaque.\n"
	+ "2 - Sobre o Tabuleiro aplique a ficha;\n"
	+ "  2a) click simples na regi�o da aposta.\n"
	+ "Repita passos 1 e 2 para outras apostas.\n"
	+ "3 - Click em: [Rodar Roleta].\n"
	+ "4 - Clique em: [Creditar/Liberar] recolhe as fichas.\n"
	+ "5 - Reinicie as apostas,     Boa Sorte....\n\n"
	+ "RG 3.0 APOSTA GANHADORAS"
	+ "\n    N�mero Seco:"
	+ "\n1:2 se Somente 1 Dado"
	+ "\n1:3 se Repeti��o de 2 Dados"
	+ "\n1:10 se Repeti��o de 3 Dados"
	+ "\n    Soma dos Tr�s Dados:"
	+ "\n1:2 se Soma ACIMA de Dez"
	+ "\n1:2 se Soma ABAIXO de Onze"
	+ "\n1:2 se Soma EXATA (ver TOTAIS no Tab.)")
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

	onerror = errorCallBack
	document.onmousedown = click_me
//-->