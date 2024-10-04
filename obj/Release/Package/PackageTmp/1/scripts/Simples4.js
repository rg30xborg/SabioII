<!--//

var inicial = cart = aposl = 0, rodrol = apost = "", serverURL = "sabio02.asp", valor = 30, fig = 0

function OnCarg(){
	//if((this.location.href).indexOf("http://www.aggora.com.br") < 0) location.href = "http://www.aggora.com.br/sabio/help.htm"
    //else {
    NCalc.innerText = " "; rodrol = "ok";
    //botao.src = "../images/cont001.gif"
    //}
}

function Tinicial(obj){
	fig = 0; valor = 30; NValr1.innerText = valor; NFig1.src = "images/sabio07.gif"
	var t = new Date(); inicial = (t.getHours() * 3600) + (t.getMinutes() * 60) + t.getSeconds()
    cart = 1;
    obj.src = "/_Library/bottv.gif";
    //botao.src = "/_Library/bottv.gif";
    Tempos.innerText = "cronometrando ..."
}

//function Tinicial() {
//    fig = 0; valor = 30; NValr1.innerText = valor; NFig1.src = "images/sabio07.gif"
//    var t = new Date(); inicial = (t.getHours() * 3600) + (t.getMinutes() * 60) + t.getSeconds()
//    cart = 1;
//    botao.src = "/_Library/bottv.gif";
//    Tempos.innerText = "cronometrando ..."
//}

function onImage(letra, orig){
	if(cart == 1){
		eval(orig).innerText = ""
		if(letra == "") letra = " "
		if(apost.indexOf(letra) >= 0){
			while(apost.indexOf(letra) >= 0){
				var pos = apost.indexOf(letra)
				if(pos == 0) apost = "*" + apost.substr(1)
				else	if(pos == apost.length - 1) apost = apost.substr(0,pos) + "*"
					else apost = apost.substr(0,pos) + "*" + apost.substr(pos + 1)
				eval("Vl" + (pos + 1)).innerHTML = "&nbsp;" + letra + "&nbsp;"
				aposl -= 1
			}
		}
        else {
            fig += 1; valor -= 5;
            if (valor >= 0) { NValr1.innerText = valor; NFig1.src = "images/sabio0" + fig + ".gif" }
        }
		if(aposl == 0){
            cart = 0;
            document.getElementById("IBbotao").src = "../images/bot0pg.gif";
            OqueFaz = 4;
            document.getElementById("IBbotao").click();
            //return true;
			//var co = RSExecute(serverURL,"Method1",valor,myBackCart,errorCallBack)
            //Chamo aki a funcao 2
		}
	}
}

//function StartRGQuizWeb(){
//	if(rodrol == "ok"){ rodrol = ""; botao.src = "../images/bot0pg.gif"
//		var co = RSExecute(serverURL,"Method2",myFirstBack,errorCallBack)
//	}
//}

function StartRGQuizWeb1(obj) {
    if (rodrol == "ok") {
        rodrol = "";
        obj.src = "../images/bot0pg.gif";
        OqueFaz = 2;
        return true;
        //var co = RSExecute(serverURL, "Method2", myFirstBack, errorCallBack)
    }
    else
        if (OqueFaz == 4) {
            document.getElementById("HFPCert").value = "1";
            document.getElementById("HFApost").value = valor;
            return true;
        }
        else {
            alert("RG 3.0 - Informação (º_º):\n\nOpss - Tempo de Execução não disponivel!!!");
            return false;
        }
}

function PlaySound(soundObj) {
    var sound = document.getElementById(soundObj);
    sound.play();
}

function myBackCart1(obj, co){
    cox = co[0];
    if (cox == "ok") {
        Salas.innerText = co[1];
        top.frames.super1.Ponto.innerText = co[2];
        som = "somcerto";
    }
    else
        som = "somerro";

    Consc.innerText = co[3];
	var t = new Date(); var final = (t.getHours() * 3600) + (t.getMinutes() * 60) + t.getSeconds(); final -= inicial
	Tempos.innerText = (Math.ceil(final / 60) - 1) + "min:" + (final % 60) + "seg."
    obj.src = "../images/cont001.gif"; rodrol = "ok";
    PlaySound(som);
}

function myFirstBack1(obj, co) {
    cox = co[0]
    if (cox == "xo") location.href = "Sabio03.aspx?ptSala=" + co[1];   //"http://www.aggora.com.br/sabio/1/tema" + co.return_value[2] + 
    else {
        NPerg.innerText = co[0]
        apost = co[1]; aposl = apost.length;
        HTML = "";
        for (var i = 1, j = aposl + 1; i < j; i++) HTML += "<span ID=Vl" + i + ">&nbsp;_ </span>";
        NResp1.innerHTML = HTML;
        HTML = "";
        for (var i = 65; i < 91; i++) {
            var j = String.fromCharCode(i), k = i - 64
            if (i == 73 || i == 84) HTML = HTML + "<p>";
            HTML += "<span ID=Ch" + k + " onClick=onImage('" + j + "','Ch" + k + "')>&nbsp;" + j + "&nbsp;</span>";
        }
        HTML += "<span ID=Ch27 onClick=onImage('-','Ch27')>&nbsp;[-]&nbsp;</span>";
        HTML += "<span ID=Ch28 onClick=onImage('','Ch28')>&nbsp;[ESPAÇO]&nbsp;</span>";
        NResp2.innerHTML = HTML;
        Tinicial(obj);
    }
} 

//function myFirstBack(co){
//	cox = co.return_value[0]
//	if(cox == "xo") location.href = "http://www.aggora.com.br/sabio/1/tema"+co.return_value[2]+"/Sabio03.aspx?ptSala="+co.return_value[1]
//	else{	NPerg.innerText  = co.return_value[0]
//		apost = co.return_value[1]; aposl = apost.length
//		HTML = ""
//		for(var i = 1, j = aposl + 1; i < j; i++) HTML += "<span ID=Vl" + i + ">&nbsp;_ </span>"
//		NResp1.innerHTML = HTML
//		HTML = ""
//		for(var i = 65; i < 91; i ++){
//			var j = String.fromCharCode(i), k = i - 64
//			if(i == 73 || i == 84) HTML = HTML + "<p>"
//			HTML += "<span ID=Ch" + k + " onClick=onImage('" + j + "','Ch" + k + "')>&nbsp;" + j + "&nbsp;</span>"
//		}
//		HTML += "<span ID=Ch27 onClick=onImage('-','Ch27')>&nbsp;[-]&nbsp;</span>"
//		HTML += "<span ID=Ch28 onClick=onImage('','Ch28')>&nbsp;[ESPAÇO]&nbsp;</span>"
//		NResp2.innerHTML = HTML
//		Tinicial()
//	}
//} 

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

//function onBotao(){
//	if(rodrol == "ok") botao.src = "../images/cont000.gif"
//}

//function ofBotao(){
//	if(rodrol == "ok") botao.src = "../images/cont001.gif"
//}

function onBotao1(obj) {
    if (rodrol == "ok") obj.src = "../images/cont000.gif"
}

function ofBotao1(obj) {
    if (rodrol == "ok") obj.src = "../images/cont001.gif"
}

function click_me(){
    if (event.button > 1) alert("RG 3.0 - Informação (º_º):\n\nOpss - Utilize somente o botão esquerdo do mouse")
}

    onerror = errorCallBack
    document.onmousedown = click_me

//-->