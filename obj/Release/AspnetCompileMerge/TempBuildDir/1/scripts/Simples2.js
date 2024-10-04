<!--//

var inicial = cart = 0, rodrol = apost = "", serverURL = "sabio02.asp"

function OnCarg(){
	//if((this.location.href).indexOf("http://www.aggora.com.br") < 0) location.href = "http://www.aggora.com.br/sabio/help.htm"
    //else {
        NCalc.innerText = " "
		Tinicial()
	//}
}

function Tinicial(){
    var t = new Date(); inicial = (t.getHours() * 3600) + (t.getMinutes() * 60) + t.getSeconds();
    cart = 1;
    //botao.src = "../images/resp001.gif";
    //var IBbotao = document.getElementById("<%=IBbotao.ClientID %>");
    //IBbotao.src = "../images/resp001.gif";
    Tempos.innerText = "cronometrando ...";
}

function onImage(num) {
    if (cart == 1) {
        for (var i = 1; i < 6; i++) document.images["n" + i].src = "../images/happy0.gif"
        document.images["n" + num].src = "../images/happy3.gif"
    }
    switch (num) {
        case 1: apost = "a"; break
        case 2: apost = "b"; break
        case 3: apost = "c"; break
        case 4: apost = "d"; break
        case 5: apost = "e"; break
    }
    document.getElementById("HFApost").value = apost;
    //Only for Debug
    //NPerg.innerHTML = document.getElementById("HFApost").value;
}

//function StartRGQuizWeb(){
//	if(cart == 1){
//		if(apost == ""){
//			alert("RG 3.0 - SOLICITAÇÃO:\n\nUma das resposta deve ser marcada para responder")
//			return false
//		}
//		cart = 0; botao.src = "../images/bot0pg.gif"
//		var co = RSExecute(serverURL,"Method1",apost,myBackCart,errorCallBack)
//	}
//	else{	if(rodrol == "ok"){ rodrol = ""
//			botao.src = "../images/bot0pg.gif"
//			var co = RSExecute(serverURL,"Method2",myFirstBack,errorCallBack)
//		}
//	}
//}

function StartRGQuizWeb1(obj){
    if (cart == 1) {
        if (apost == "") {
            alert("RG 3.0 - Solicitação (º_º):\n\nUma das resposta deve ser marcada para responder");
            return false;
        }
        cart = 0; obj.src = "../images/bot0pg.gif";
        OqueFaz = 2;
        return true;
    }
    else {
        if (rodrol == "ok") {
            rodrol = "";
            obj.src = "../images/bot0pg.gif";
            OqueFaz = 4;
            return true;
        }
    }
}

function PlaySound(soundObj) {
    var sound = document.getElementById(soundObj);
    sound.play();
}

function myBackCart1(obj, co) {
    //NResp3.innerText = "DADE O FERA!!!  " + co; //co[0] + co[1] + co[2] + co[3] + co[4] + co[5] + co[6];
    cox = co[0];
    if (cox == "ok") {
        document.images["n" + co[1]].src = "../images/happy1.gif"
        Salas.innerText = co[2]
        top.frames.super1.Ponto.innerText = co[3]
        som = "somcerto";           //document.
    }
    else {
        document.images["n" + co[1]].src = "../images/happy2.gif"
        som = "somerro";           //document.
    }
    
    Consc.innerText = co[4]
    var t = new Date(); var final = (t.getHours() * 3600) + (t.getMinutes() * 60) + t.getSeconds(); final -= inicial
    Tempos.innerText = (Math.ceil(final / 60) - 1) + "min:" + (final % 60) + "seg."
    obj.src = "../images/cont001.gif";
    rodrol = "ok"
    PlaySound(som);
}

function myFirstBack1(obj, co) {
    //NResp3.innerText = "DADE O FERA 2!!!  " + co; //co[0] + co[1] + co[2] + co[3] + co[4] + co[5] + co[6];
    cox = co[0]
    if (cox == "xo") location.href = "Sabio03.aspx?ptSala=" + co[1];       //"http://www.aggora.com.br/sabio/1/tema" + co.return_value[2] + "/"
    else {
        NPerg.innerText = co[0]
        NFigr.src = "images/" + co[6]
        NResp1.innerText = co[1]
        NResp2.innerText = co[2]
        NResp3.innerText = co[3]
        NResp4.innerText = co[4]
        NResp5.innerText = co[5]
        for (var i = 1; i < 6; i++) {
            document.images["n" + i].src = "../images/happy3.gif"; Resposta[i - 1].checked = false; //Resposta[i - 1].status = 0; 
        }
        obj.src = "../images/resp001.gif";
        apost = ""; Tinicial();
        OqueFaz = 1;
        //document.getElementById("<%=HFPCert.ClientID %>").Value = "0";
        PlaySound('somregis');
    }
} 

//function myBackCart(co){
//	cox = co.return_value[0]
//	if(cox == "ok"){
//		document.images["n" + co.return_value[1]].src = "../images/happy1.gif"
//		Salas.innerText = co.return_value[2]
//		top.frames.super1.Ponto.innerText = co.return_value[3]
//		som = "document.somcerto"
//	}
//	else{
//		document.images["n" + co.return_value[1]].src = "../images/happy2.gif"
//		som = "document.somerro"
//	}

//	Consc.innerText = co.return_value[4]
//	var t = new Date(); var final = (t.getHours() * 3600) + (t.getMinutes() * 60) + t.getSeconds(); final -= inicial
//	Tempos.innerText = (Math.ceil(final / 60) - 1) + "min:" + (final % 60) + "seg."
//	botao.src = "../images/cont001.gif"; rodrol = "ok"
//	if(eval(som) != null){ if (eval(som + ".Filename")) eval(som + ".play()") }
//}

//function myFirstBack(co){
//	cox = co.return_value[0]
//	if(cox == "xo") location.href = "http://www.aggora.com.br/sabio/1/tema"+co.return_value[2]+"/Sabio03.aspx?ptSala="+co.return_value[1]
//	else{	NPerg.innerText  = co.return_value[0]
//		NFigr.src = "images/" + co.return_value[6]
//		NResp1.innerText = co.return_value[1]
//		NResp2.innerText = co.return_value[2]
//		NResp3.innerText = co.return_value[3]
//		NResp4.innerText = co.return_value[4]
//		NResp5.innerText = co.return_value[5]
//		for(var i = 1; i < 6; i++){
//			document.images["n" + i].src = "../images/happy3.gif"; Resposta(i - 1).status = 0
//		}
//		apost = ""; Tinicial()
//	}
//} 

function errorCallBack(msg){
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
//	if(cart == 1) botao.src = "../images/resp000.gif"
//	if(rodrol == "ok") botao.src = "../images/cont000.gif"
//}

//function ofBotao(){
//	if(cart == 1) botao.src = "../images/resp001.gif"
//	if(rodrol == "ok") botao.src = "../images/cont001.gif"
//}

function onBotao1(obj) {
    if (cart == 1) obj.src = "../images/resp000.gif"
    if (rodrol == "ok") obj.src = "../images/cont000.gif"
}

function ofBotao1(obj) {
    if (cart == 1) obj.src = "../images/resp001.gif"
    if (rodrol == "ok") obj.src = "../images/cont001.gif"
}

function click_me(){
    if (event.button > 1) alert("RG 3.0 - Informação (º_º):\n\nOpss - Utilize somente o botão esquerdo do mouse")
}

    onerror = errorCallBack
	document.onmousedown = click_me

//-->