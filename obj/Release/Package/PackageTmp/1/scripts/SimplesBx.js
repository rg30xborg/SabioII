<!--//

if((parent.window.name).indexOf("inicial") < 0) location.href = "http://www.aggora.com.br/sabio/help.htm"

function MM_timelinePlay(tmLnName, myID){
	var i, j, tmLn, props, keyFrm, sprite, numKeyFr, firstKeyFr, propNum, theObj, firstTime=false
	if (document.MM_Time == null) MM_initTimelines()
	tmLn = document.MM_Time[tmLnName]
	if(myID == null) { myID = ++tmLn.ID; firstTime = true }
	if(myID == tmLn.ID){
		setTimeout('MM_timelinePlay("'+tmLnName+'",'+myID+')',tmLn.delay)
		fNew = ++ tmLn.curFrame
		for(i = 0; i < tmLn.length; i++){
			sprite = tmLn[i]
			if(sprite.charAt(0) == 's'){
				if(sprite.obj){
					numKeyFr = sprite.keyFrames.length
					firstKeyFr = sprite.keyFrames[0]
					if(fNew >= firstKeyFr && fNew <= sprite.keyFrames[numKeyFr-1]){
						keyFrm=1
						for(j = 0; j < sprite.values.length; j++){
							props = sprite.values[j]
							if(numKeyFr != props.length){
								if(props.prop2 == null)
									sprite.obj[props.prop] = props[fNew-firstKeyFr]
								else
									sprite.obj[props.prop2][props.prop] = props[fNew-firstKeyFr]
							}
							else{
								while(keyFrm<numKeyFr && fNew >= sprite.keyFrames[keyFrm])
									keyFrm++
								if(firstTime || fNew == sprite.keyFrames[keyFrm-1]){
									if(props.prop2 == null) sprite.obj[props.prop] = props[keyFrm-1]
									else sprite.obj[props.prop2][props.prop] = props[keyFrm-1]
								}
							}
						}
					}
				}
			}
			else if(sprite.charAt(0) == 'b' && fNew == sprite.frame) eval(sprite.value)
			if(fNew > tmLn.lastFrame) tmLn.ID = 0
		}
	}
}

function MM_findObj(n, d){
	var p, i, x
	if(!d) d = document
	if((p = n.indexOf("?")) > 0 && parent.frames.length){
		d = parent.frames[n.substring(p+1)].document; n = n.substring(0,p)
	}
	if(!(x = d[n]) && d.all) x = d.all[n]
	for(i = 0; !x && i < d.forms.length; i++) x = d.forms[i][n]
	for(i = 0; !x && d.layers && i < d.layers.length; i++) x = MM_findObj(n,d.layers[i].document)
	return x
}

function MM_showHideLayers(){
	var i, p, v, obj, args = MM_showHideLayers.arguments
	for(i = 0; i < (args.length - 2); i += 3)
		if((obj = MM_findObj(args[i])) != null){
			v = args[i + 2]
			if(obj.style){
				obj = obj.style
				v = (v == 'show') ? 'visible' : (v = 'hide') ? 'hidden' : v
			}
			obj.visibility = v
		}
}

function MM_timelineGoto(tmLnName, fNew, numGotos){
	var i, j, tmLn, props, keyFrm, sprite, numKeyFr, firstKeyFr, lastKeyFr, propNum, theObj
	if(document.MM_Time == null) MM_initTimelines()
	tmLn = document.MM_Time[tmLnName]
	if(numGotos != null)
		if(tmLn.gotoCount == null) tmLn.gotoCount = 1
		else if(tmLn.gotoCount++ >= numGotos) {tmLn.gotoCount = 0; return}
	jmpFwd = (fNew > tmLn.curFrame)
	for(i = 0; i < tmLn.length; i++){
		sprite = (jmpFwd)? tmLn[i] : tmLn[(tmLn.length-1)-i]
		if(sprite.charAt(0) == "s"){
			numKeyFr = sprite.keyFrames.length
			firstKeyFr = sprite.keyFrames[0]
			lastKeyFr = sprite.keyFrames[numKeyFr - 1]
			if((jmpFwd && fNew < firstKeyFr) || (!jmpFwd && lastKeyFr < fNew)) continue
			for(keyFrm = 1; keyFrm < numKeyFr && fNew >= sprite.keyFrames[keyFrm]; keyFrm++)
				for(j = 0; j < sprite.values.length; j++){
					props = sprite.values[j]
					if(numKeyFr == props.length) propNum = keyFrm-1
					else propNum = Math.min(Math.max(0,fNew-firstKeyFr),props.length-1)
					if(sprite.obj != null){
						if(props.prop2 == null) sprite.obj[props.prop] = props[propNum]
						else sprite.obj[props.prop2][props.prop] = props[propNum]
					}
				}
 		} else if(sprite.charAt(0) == 'b' && fNew == sprite.frame) eval(sprite.value)
	}
	tmLn.curFrame = fNew;
	if(tmLn.ID == 0) eval('MM_timelinePlay(tmLnName)')
}

function MM_initTimelines() {
	
	var ns = navigator.appName == "Netscape"
	document.MM_Time = new Array(1)
	document.MM_Time[0] = new Array(3)
	document.MM_Time["Timeline1"] = document.MM_Time[0]
	document.MM_Time[0].MM_Name = "Timeline1"
	document.MM_Time[0].fps = 15

	document.MM_Time[0][0] = new String("sprite")
	document.MM_Time[0][0].slot = 1
	if(ns) document.MM_Time[0][0].obj = document["INV002"]
	else document.MM_Time[0][0].obj = document.all ? document.all["INV002"] : null
	document.MM_Time[0][0].keyFrames = new Array(30, 54)
	document.MM_Time[0][0].values = new Array(3)
//	document.MM_Time[0][0].values[0] = new Array(690,690,690,690,690,690,690,690,690,690,690,690,629,586,506,445,384,323,262,201,140,79,18,-43,-104,-165)
	document.MM_Time[0][0].values[0] = new Array(-165,-104,-43,18,79,140,201,262,323,384,445,506,568,629,690,690,690,690,690,690,690,690,690,690,690,690)
	document.MM_Time[0][0].values[0].prop = "left"; k = 20
	document.MM_Time[0][0].values[1] = new Array(k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k)
	document.MM_Time[0][0].values[1].prop = "top"
	if(!ns){ document.MM_Time[0][0].values[0].prop2 = "style"; document.MM_Time[0][0].values[1].prop2 = "style" }

	document.MM_Time[0][0].values[2] = new Array("inherit","visible")
	document.MM_Time[0][0].values[2].prop = "visibility"
	if(!ns) document.MM_Time[0][0].values[2].prop2 = "style"
	document.MM_Time[0][1] = new String("behavior")
	document.MM_Time[0][1].frame = 54
	document.MM_Time[0][1].value = "MM_showHideLayers('INV002','','hide')"
	document.MM_Time[0][2] = new String("behavior")
	document.MM_Time[0][2].frame = 87
	document.MM_Time[0][2].value = "MM_timelineGoto('Timeline1','1')"
	document.MM_Time[0].lastFrame = 87
	for(i = 0; i < document.MM_Time.length; i++){
		document.MM_Time[i].ID = null
		document.MM_Time[i].curFrame = 0
		document.MM_Time[i].delay = 1000 / document.MM_Time[i].fps
	}
}

var cart = rodrol = apost = 0, serverURL = "sabio09.asp", pntos = new Array(), ptval = new Array(), pgtcs = new Array()

function OnCarg(){
	NCalc.innerText = " "; botao.src = "/_Library/bottv.gif"; if(Aposta[0]) Aposta[0].focus()
	if(pNome == ":Anonimo:") alert("RG 3.0 INFORMAÇÃO:\n\nLEMBRE-SE: DADOS CADASTRAIS INCOMPLETOS.\n - Atualize-os em: [Sua Conta] | [Meus Dados]")
}

function ConfApt(num){
	if(rodrol == 0){
		var aptLen = (Aposta["Bot" + num].value).length - 1
		var aptVal = Aposta["Bot" + num].value
		var numErr = "NO"
		for(i = aptLen; i >= 0; i --){
			aptUnt = aptVal.substr(i, 1)
			if("0123456789".indexOf(aptUnt) < 0){numErr = "OK"; break }
		}
		if(numErr == "OK"){
			Total.innerText = "Erro:(" + aptVal + ")"; pSoma.innerText = "Erro:(" + aptUnt + ")"
			Aposta["Bot" + num].value = ""
			alert("SABICHÃO WEB ALERTA:\n\nCaracter não aceito (" + aptUnt + "). Utilize apenas números nas apostas")
			RevisPt()
		}else {
			var i = 0, apostN = 0
			while(Aposta[i]){
				if(Aposta[i].value != "") apostN += parseInt(Aposta[i].value,10)
				i++}
			if(apostN <= pTotal){
				apost = apostN
				pSoma.innerText = apost; Total.innerText = (pTotal - apostN)
				if(apost > 0){ botao.src = "images/cont001.gif"; cart = 1 }
				else{ botao.src = "/_Library/bottv.gif"; cart = 0 }
			}else {
			Total.innerText = "Erro:(" + (pTotal - apostN) + ")"; pSoma.innerText = "Erro:(" + Aposta["Bot" + num].value + ")"
			Aposta["Bot" + num].value = ""
			alert("SABICHÃO WEB ALERTA:\n\nAposta recusada, extrapolado o limite de Pontos Disponível em:(" + (apostN - pTotal) + ")\nRedimensione suas apostas e tente novamente...")
			RevisPt()
			}
		}
	}else alert("SABICHÃO WEB ALERTA:\n\nAguarde por favor, Processando suas Apostas....")
}

function RevisPt(){
		var i = 0
		while(Aposta[i]){
			if(Aposta[i].value != "") apost += parseInt(Aposta[i].value,10)
			i++}
		pSoma.innerText = apost; Total.innerText = (pTotal - apost)
		Aposta[i-1].focus()
		if(apost > 0){ botao.src = "images/cont001.gif"; cart = 1 }
		else{ botao.src = "/_Library/bottv.gif"; cart = 0 }
		return false
		
}

function StartRGQuizWeb(){
	if(cart == 1){
		cart = 0, rodrol = 1, pTotal -= apost, apost = 0
		botao.src = "images/bot0pg.gif"; var i = j = 0
		var botoes = new Array(); pntos = new Array(), ptval = new Array(), pgtcs = new Array()
		while(Aposta[i]){
			if(Aposta[i].value != "" && Aposta[i].value != "0"){
				var num = (Aposta[i].name).substr(3), val = parseInt(Aposta[i].value,10)
				botoes[j] = " #" + num + ":" + val
				pntos[j] = "Pts" + num
				pgtcs[j] = "Pgs" + num
 				ptval[j] = val; j++
			}
			botoes[j] = " ||:" + j; i++
		}
		//var co = RSExecute(serverURL, "Method1", botoes, myBackCart, errorCallBack)
		alert("Funcionalidade nao implementada - Em desenvolvimento! " + botoes)
	}
}

function myBackCart(co){
	cox = co.return_value[0]
	if(cox == "ok"){
		var i = 0
		while(Aposta(i)){
			if(eval(pntos[i])) eval(pntos[i]).innerText = (eval(pntos[i]).innerText!="Sem Apostas"?parseInt(eval(pntos[i]).innerText, 10):0) + ptval[i]
			if(eval(pgtcs[i])) eval(pgtcs[i]).innerText = "1:" + co.return_value[i + 1]
			Aposta(i).value = ""; i++ }
// for debugging		pSoma.innerText = co.return_value[1]; Total.innerText = co.return_value[2]
		top.frames.super1.Ponto.innerText = pTotal
		rodrol = 0; botao.src = "/_Library/bottv.gif"
		som = "document.somregis"
	}
	else{
		som = "document.somerro"
		alert("SABICHÃO WEB - AVISO DE ERRO:\n\nPor algum motivo os pontos não puderam ser computados.\nFavor, recarregue a página e tente novamente. Grato....")
	}

	pSoma.innerText = 0 ; Aposta(0).focus()
	if(eval(som) != null){ if(eval(som + ".Filename")) eval(som + ".play()") }
} 

function errorCallBack(co){
	alert("RG 3.0 - ERRO:\n\n" +
		"Prováveis Causa:\n" + 
		"1 - A conexão Internet teve problemas ou foi interrompida.\n" + 
		"2 - A conexão Internet esteve ociosa por mais de 20 minutos.\n" +
		"3 - Acesse www.java.com/pt_BR e instale o plug-in Java da SUN.\n" +
		"Dicas de Correção:\n" + 
		"1a - Recarregue o Site e tente novamente (F5).\n" + 
		"2a - Navegue exclusivamente pelos botões do \"Sabichão Web\".\n" +
		"Se o problema persistir contate-nos via E-mail.")
}

function Help1(){
	alert("SABICHÃO WEB - AJUDA:\n\n  COMO APOSTAR:\n" +
		"1 - Escolha um dos PRÊMIOS e na caixa-texto coloque seus PONTOS.\n" +
		"     Após colocar os pontos de um clique em qualquer local da tela,\n" +
		"     ou mesmo em uma outra caixa-texto para validar a aposta.\n" +
		"     A partir de uma aposta validada, o botão de REGISTRAR estará visível.\n\n" +
		"2 - Distribua seus PONTOS da maneira que desejar entre os PRÊMIOS.\n" +
		"Isto é tudo. Boa Sorte, OK!")
		return false
}

function onBotao(){
	if(cart == 1) botao.src = "images/cont000.gif"
}

function ofBotao(){
	if(cart == 1) botao.src = "images/cont001.gif"
}

function click_me(){
    if (event.button > 1) alert("RG 3.0 - Informação (º_º):\n\nOpss - Utilize somente o botão esquerdo do mouse")
	MM_timelinePlay('Timeline1')
}
	document.onmousedown = click_me
//-->
