<!--//

if((parent.window.name).indexOf("inicial") < 0) location.href = "http://www.aggora.com.br/sabio/help.htm"

function muda(){
	location.href = "http://www.aggora.com.br/sabio/1/sorte/tema7/sabio02.asp"
}

function mudaA(){
	location.href = "http://www.aggora.com.br/sabio/1/sorte/tema7a/sabio02.asp"
}

	var serverURL = "Sabio03.aspx", aposm = 1, jogo = cart = apost = pts = pcs = gparc = 0, txtWeb = pJogo = pMaxm = ""

function Aviso2(){
	if((this.location.href).indexOf("http://www.aggora.com.br") < 0) location.href = "http://www.aggora.com.br/sabio/help.htm"
	else{	// window.defaultStatus = "RG 3.0 - Sabich�o Web [ESPORTIVA 1]"
		NCalc.innerText = " "; Reg16.innerText = "Jogo dispon�vel para aposta de Ter�a a S�bado(~15:00) - Um volante por Sabich�o."
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

function StartRGLoterWeb(){
	if(cart == 0){
		cart = jogo = 1, apost = aposm, Reg21.src = '/_Library/bottv.gif'
		txtWeb = pMaxm + "#" + apost
		for(var i = 11; i < 24; i++){
			if(eval("g" + i + "a").value == ""){
				alert("RG ESPORTIVA WEB ALERTA\n\nPara enviar o Volante todos os Jogos devem ter placar")
				eval("g" + i + "a").focus(); break }
			else txtWeb += ":" + i + "a" + eval("g" + i + "a").value
			if(eval("g" + i + "b").value == ""){
				alert("RG ESPORTIVA WEB ALERTA\n\nPara enviar o Volante todos os Jogos devem ter placar")
				eval("g" + i + "b").focus(); break }
			else txtWeb += "x" + i + "b" + eval("g" + i + "b").value }
		if(i == 24){ Reg21.src = '/_Library/bottg.gif'
			Reg16.innerText = 'Confirmando aposta ...'; Reg22.src = '/_Library/botpg.gif'
			var co = RSExecute(serverURL,"Method8",apost,pJogo,pts,pcs,myBackCart,errorCallBack) }
		else{ 	txtWeb = ''; cart = jogo = apost = 0, Reg21.src = '/_Library/botcr.gif'}
	}
}

function myBackCart(co){
	pts = pcs = 0; cox = co.return_value[0]
	if(cox == 'ok'){
		Reg21.src = '/_Library/botcr.gif'; Reg22.src = '/_Library/botjkb.gif'; cart = jogo = apost = 0
		alert('RG LOTERIAS WEB ALERTA\n\nAposta [ ' + Math.abs(cred - (apost * 13)) + ' Pontos ] acima do Total dispon�vel.\nAjuste e tente novamente....              Grato.')
	}
	else{	Reg21.src = '/_Library/bottv.gif'
		if(cox == 'yes'){
			gparc = co.return_value[1]
			if(gparc > 0){
				top.frames.super1.Ponto.innerText = co.return_value[2]; Reg18.innerText = co.return_value[3]
				Reg16.innerText = 'Cr�dito Faturado - Registrando 13 Placares ...'
			} else Reg16.innerText = 'Registrando 13 Placares ...'

			for(var i = 11; i < 24; i++) eval("f" + i).src = "lot1.gif"
			var co = RSExecute(serverURL,"Method9",txtWeb,myFirstBack,errorCallBack,"RSExecute")
		}
		if(cox == 'no'){
			jogo = 2
			Reg16.innerText = 'Total de Pontos esgotado !!'; Reg22.src = '/_Library/botjkb.gif'
			if(confirm('RG LOTERIAS WEB ALERTA\n\nTotal de Pontos esgotado. Deseja sair desta Sala ?') == true)
				location.href="http://www.aggora.com.br/sabio/1/sorte/sabio02.asp?Err=1"
		}
	}
} 

function myFirstBack(co){
	Reg16.innerText = 'Volante(' + apost + 'x13) OK! - Confira este Volante aqui em Tempo Real a partir de S�bado'
	Reg17.innerText = ((gparc > 0) ? "Cr�dito Anterior Faturado " + gparc + " PONTOS" : "Placar e 13 Pontos")
	for(i = 11; i < 24; i++){
		eval("s" + i + "a").innerText = parseInt(txtWeb.substr(txtWeb.indexOf(":"+i+"a") + 4), 10)
		eval("s" + i + "b").innerText = parseInt(txtWeb.substr(txtWeb.indexOf("x"+i+"b") + 4), 10)
	}
	cred = 0; top.frames.super1.Ponto.innerText = co.return_value[0]; Reg18.innerText = co.return_value[1]
	Reg22.src = '/_Library/botjkb.gif'
	if(gparc > 0) alocar1('play','somregis'); else alocar1('play','somsorte')
}

function ProssRGLoteraWeb(){ location.href = "http://www.aggora.com.br/sabio/1/sorte/tema7a/sabio02.asp" }

function ProssRGLoteriWeb(){ location.href = "http://www.aggora.com.br/sabio/1/sorte/tema7/sabio02.asp" }

function instrui(){
	alert("RG 3.0 - INSTRU��ES :\n"
	+ "1 - Opcional: Escolha o valor da Aposta padr�o.\n"
	+ "     O valor total ser� = Aposta padr�o x 13.\n"
	+ "2 - No volante anote seus 13 placares.\n"
	+ "3 - Click em: [Iniciar/Creditar].\n"
	+ "     Aguarde a aposta ser confirmada e\n"
	+ "     se existir creditos eles ser�o compensados.\n"
	+ "4 - Pronto! Seu jogo est� concluido.\n"
	+ "5 - Ai � s� aguardar e torcer.   Boa Sorte....\n\n"
	+ "RG 3.0 - APOSTA CORRENTE = " + aposm  + " PAGA:\n"
	+ (aposm * 2000) + " se 13 Pontos (� importa o placar).\n"
	+ (aposm * 100) + " se Placar Exato (para cada Jogo).\n"
	+ "Pr�mio n�o cumulativo - Vale apenas o Maior")
}
function selBet1(j){
	if(jogo == 0){
		if(j * 13 > cred){var apsM = cred - (j * 13)
			alert("RG 3.0 - ALERTA\n\nAposta recusada - Valor " + apsM + " acima do Total de Pontos Atual!")
			Reg16.innerText = "Aposta recusada - Valor " + apsM + " acima do Total de Pontos Atual!" }
		else{	aposm = j; Reg17.innerText = "Aposta " + aposm + "x13=" + (aposm * 13) + " Pontos Ok!"
			for(var i = 11; i < 24; i++){
				if(eval("g" + i + "a").value == "") break
				if(eval("g" + i + "b").value == "") break }
			if(i == 24) Reg16.innerText = "Volante OK! Clique [Iniciar/Creditar]"
			else Reg16.innerText = "Aposta OK! Anote no Jogo Corrente seus 13 Placares"
		}
	alocar1('play','somclick')
	}
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

function regras1(){ Reg22.src = "/_Library/botrk.gif"}

function regras2(){ Reg22.src = "/_Library/botjkb.gif"}

function click_me(){
    if (event.button > 1) alert("RG 3.0 - Informa��o (�_�):\n\nOpss - Utilize somente o bot�o esquerdo do mouse")
}

	onerror = errorCallBack
	document.onmousedown = click_me
//-->