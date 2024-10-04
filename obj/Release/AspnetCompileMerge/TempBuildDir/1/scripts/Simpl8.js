<!--//

if((parent.window.name).indexOf("inicial") < 0) location.href = "http://www.aggora.com.br/sabio/help.htm"

function muda(){
	location.href = "http://www.aggora.com.br/sabio/1/sorte/tema8/Sabio02.aspx"
}

function mudaA(){
	location.href = "http://www.aggora.com.br/sabio/1/sorte/tema8a/Sabio02.aspx"
}

	var Plts = new Array()
	var AbreWin, serverURL = "Sabio03.aspx", aposm = 1, jogo = cart = apost = pts = gparc = 0, txtWeb = pJogo = pMaxm = ""

function Aviso2(){
	if((this.location.href).indexOf("http://www.aggora.com.br") < 0) location.href = "http://www.aggora.com.br/sabio/help.htm"
	else{	NCalc.innerText = " "
		Reg16.innerText = "Aposta disponível até 1 hora antes da corrida - Uma aposta por Sabichão."
	}
}

function alocar1(sndAction,sndObj){ sndObj = "document." + sndObj
	if (eval(sndObj) != null){
		if (eval(sndObj + ".Filename")) eval(sndObj + ((sndAction == 'stop') ? '.stop()' : '.play()'))}
}

function onTab(){
	if(jogo == 0) Reg00.style.visibility = "hidden"
}

function offTab(){
	if(jogo == 0) Reg00.style.visibility = ""
}

function StartRGPodioWeb(){
	if(cart == 0){
		cart = jogo = 1, apost = aposm, Reg21.src = '/_Library/bottv.gif'
		txtWeb = pMaxm + "#" + apost
		if(Pos1.value == 0 || Pos2.value == 0 || Pos3.value == 0){
			txtWeb = ''; cart = jogo = apost = 0, Reg21.src = '/_Library/botcr.gif'
			alert("RG PODIUM ALERTA\n\nPara registrar o seu Podio nenhuma posição pode estar sem piloto.")
		} else {
			if(Pos1.value != Pos2.value && Pos2.value != Pos3.value && Pos3.value != Pos1.value){
				txtWeb += ":1a" + Pos1.value + ":2a" + Pos2.value + ":3a" + Pos3.value
				Reg21.src = '/_Library/bottg.gif'
				Reg16.innerText = 'Confirmando aposta ...'; Reg22.src = '/_Library/botpg.gif'
				var co = RSExecute(serverURL,"Method8",apost,pJogo,pts,myBackCart,errorCallBack)
			}
			else {
				txtWeb = ''; cart = jogo = apost = 0, Reg21.src = '/_Library/botcr.gif'
				alert("RG PODIUM ALERTA\n\nPara registrar o seu Podio nenhuma posição pode estar repetida.")
			}
		}
	}
}

function myBackCart(co){
	pts = pcs = 0; cox = co.return_value[0]
	if(cox == 'ok'){
		Reg21.src = '/_Library/botcr.gif'; Reg22.src = '/_Library/botjkb.gif'; cart = jogo = apost = 0
		alert('RG PODIUM ALERTA\n\nAposta [ ' + Math.abs(cred - (apost * 3)) + ' Pontos ] acima do Total disponível.\nAjuste e tente novamente....              Grato.')
	}
	else{	Reg21.src = '/_Library/bottv.gif'
		if(cox == 'yes'){
			gparc = co.return_value[1]
			if(gparc > 0){
				top.frames.super1.Ponto.innerText = co.return_value[2]; Reg18.innerText = co.return_value[3]
				Reg16.innerText = 'Crédito Faturado - Registrando Pódio ...'
			} else Reg16.innerText = 'Registrando Pódio ...'

			for(var i = 1; i < 4; i++) eval("f" + i).src = "lot1.gif"
			var co = RSExecute(serverURL,"Method9",txtWeb,myFirstBack,errorCallBack,"RSExecute")
		}
		if(cox == 'no'){
			jogo = 2
			Reg16.innerText = 'Total de Pontos esgotado !!'; Reg22.src = '/_Library/botjkb.gif'
			if(confirm('RG PODIUM ALERTA\n\nTotal de Pontos esgotado. Deseja sair desta Sala ?') == true)
				location.href="http://www.aggora.com.br/sabio/1/sorte/Sabio02.aspx?Err=1"
		}
	}
} 

function AbreJan(i,j,k){
	if(AbreWin != null) AbreWin.close()
	str1 = "http://www.aggora.com.br/sabio/1/sorte/Sabio03.aspx?CodE=" + i + "&CodP=" + j + "&CodC=" + (k ? k : 2)
	AbreWin = window.open(str1,"AbreWin","top=0,left=0,scrollbars=1,width=380,height=310")
}

function AbreJam(fig){
	if(AbreWin != null) AbreWin.close()
	str1 = "http://www.aggora.com.br/sabio/1/sorte/Sabio04.aspx?fig=" + fig
	AbreWin = window.open(str1,"AbreWin","top=0,left=0,scrollbars=1,width=380,height=310")
}

function Capac1(i,j,k){
	if(j != 0){
		Pst = j.toString()
		Plt = Pst.substr(Pst.length -1)
		Pst = Pst.substring(0, Pst.length - 1)
		eval("Cap"+i).innerHTML = "<img width='79' height='79' src='../images/form" + Pst + "c" + Plt + ".jpg' onClick='AbreJan(" + Pst + "," + Plt + ")'>"
		if(k == 0) eval("Fig"+i).innerHTML = "<img src='lot3.gif' name='f" + i + "' onClick='AbreJan(" + Pst + "," + Plt + ")'>"
	} else {
		eval("Cap"+i).innerHTML = "<img width='79' height='79' src='../images/form1b1.gif' onClick='AbreJan(1,1)'>"
		if(k == 0) eval("Fig"+i).innerHTML = "<img src='lot0.gif' name='f" + i + "' onClick='AbreJan(1,1)'>"
	}
}

function myFirstBack(co){
	Reg16.innerText = 'Podio(' + apost + 'x3) OK! - Na Data, confira aqui o Resultado da Corrida em Tempo Real'
	Reg17.innerText = ((gparc > 0) ? "Crédito Anterior Faturado " + gparc + " PONTOS" : "2 Posições ou Pódio")
	for(i = 1; i < 4; i++){
		conf = parseInt(txtWeb.substr(txtWeb.indexOf(":"+i+"a") + 3), 10)
		eval("s"+i+"a").innerText = Plts[conf]
	}
	cred = 0; top.frames.super1.Ponto.innerText = co.return_value[0]; Reg18.innerText = co.return_value[1]
	Reg22.src = '/_Library/botjkb.gif'
	if(gparc > 0) alocar1('play','somregis'); else alocar1('play','somsorte')
}

function ProssRGPodioaWeb(){ location.href = "http://www.aggora.com.br/sabio/1/sorte/tema8a/Sabio02.aspx" }

function ProssRGPodioWeb(){ location.href = "http://www.aggora.com.br/sabio/1/sorte/tema8/Sabio02.aspx" }

function instrui(){
	alert("RG 3.0 - INSTRUÇÕES :\n"
	+ "1 - Opcional: Escolha o valor da Aposta padrão.\n"
	+ "     O valor total será = Aposta padrão x 3.\n"
	+ "2 - No podio anote seus 3 pilotos.\n"
	+ "3 - Click em: [Iniciar/Creditar].\n"
	+ "     Aguarde a aposta ser confirmada e\n"
	+ "     se existir creditos eles serão compensados.\n"
	+ "4 - Pronto! Seu podio está concluido.\n"
	+ "5 - Ai é só aguardar e torcer.   Boa Sorte....\n\n"
	+ "RG 3.0 - APOSTA CORRENTE = " + aposm  + " PAGA:\n"
	+ (aposm * 1000) + " no Pódio Completo ou\n"
	+ (aposm * 100) + " se só 2 posições certas.\n"
	+ "Prêmio não cumulativo - Vale apenas o Maior")
}

function selBet1(j){
	if(jogo == 0){
		if(j * 3 > cred){var apsM = cred - (j * 3)
			alert("RG 3.0 - ALERTA\n\nAposta recusada - Valor " + apsM + " acima do Total de Pontos Atual!")
			Reg16.innerText = "Aposta recusada - Valor " + apsM + " acima do Total de Pontos Atual!" }
		else{	aposm = j; Reg17.innerText = "Aposta " + aposm + "x3=" + (aposm * 3) + " Pontos Ok!"
			if(Pos1.value != Pos2.value && Pos2.value != Pos3.value && Pos3.value != Pos1.value)
				Reg16.innerText = "Podio do GP OK! Clique [Iniciar/Creditar]"
			else
				Reg16.innerText = "Valor OK! Anote o Podio para o GP Corrente"
		}
	alocar1('play','somclick')
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

function regras1(){ Reg22.src = "/_Library/botrk.gif"}

function regras2(){ Reg22.src = "/_Library/botjkb.gif"}

function click_me(){
    if (event.button > 1) alert("RG 3.0 - Informação (º_º):\n\nOpss - Utilize somente o botão esquerdo do mouse")
}

	onerror = errorCallBack
	document.onmousedown = click_me
//-->