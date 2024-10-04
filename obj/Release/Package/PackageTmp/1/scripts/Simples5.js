<!--//

var inicial = cart = cht = cod = 0, valor = 50
var rodrol = apost = aposl = "", serverURL = "sabio02.asp", chute = "Atщ 5 Palpites:"

function OnCarg(){
	//if((this.location.href).indexOf("http://www.aggora.com.br") < 0) location.href = "http://www.aggora.com.br/sabio/help.htm"
    //else {
    NCalc.innerText = " "; rodrol = "ok";
    //botao.src = "../images/cont001.gif"
    //}
}

function Tinicial(){
	cht = 0; valor = 50; NValr1.innerText = valor
	var t = new Date(); inicial = (t.getHours() * 3600) + (t.getMinutes() * 60) + t.getSeconds()
	cart = 1; Tempos.innerText = "cronometrando ..."; NTabl.style.visibility = ""
	Resposta.value = ""; Resposta.focus(); if(cod == 1) NFig2.src = fig; if(cod == 2) NFig1.src = fig
}

function StartRGQuizWeb1(obj){
    if (rodrol == "ok") {
        rodrol = "";
        obj.src = "../images/bot0pg.gif";
        OqueFaz = 2;
        return true;
		//var co = RSExecute(serverURL,"Method2",myFirstBack,errorCallBack)
	}
    else {
        if (cart == 1) {
            cart = 0; letra = Resposta.value.toUpperCase();
			if(letra == "" || letra == " "){
                Resposta.focus(); Resposta.select();
                alert("RG 3.0 - Solicitaчуo (К_К):\n\nSua Resposta deve ser preenchida!")
				cart = 1; return false
			}
			else{
                cht += 1; chute += "\n" + cht + "/5 " + letra; NValr2.innerText = chute
				if(letra == apost || letra == aposl){
                    if (cod < 2) NFig1.src = "images/sabio02.gif"; else NFig2.src = "images/sabio05.gif";
                    obj.src = "../images/bot0pg.gif";
                    //document.getElementById("IBbotao").src = "../images/bot0pg.gif";
                    //document.getElementById("HFPCert").value = "1";
                    document.getElementById("HFApost").value = valor;
                    OqueFaz = 4;
                    return true;
					//var co = RSExecute(serverURL,"Method1",valor,myBackCart,errorCallBack)
				}
                else {
                    valor -= 10; NValr1.innerText = valor;
                    if (cod < 2) NFig1.src = "images/sabio01.gif"; else NFig2.src = "images/sabio04.gif";
					if(valor == 0){
                        Resposta.value = "OK = " + apost;
                        obj.src = "../images/bot0pg.gif";
                        //document.getElementById("IBbotao").src = "../images/bot0pg.gif";
                        rodrol = "ok";
                        //document.getElementById("HFPCert").value = "1";
                        document.getElementById("HFApost").value = valor;
                        OqueFaz = 4;
                        return true;
						//var co = RSExecute(serverURL,"Method1",valor,myBackCart,errorCallBack)
					}
                    else {
                        Resposta.focus(); Resposta.select(); cart = 1;
                        obj.src = "../images/resp001.gif";
                    }
				}
			}
		}
	}
}

function PlaySound(soundObj) {
    var sound = document.getElementById(soundObj);
    sound.play();
}

function myBackCart1(obj, co){
    cox = co[0];
	if(cox == "ok"){
        Salas.innerText = co[1];
        top.frames.super1.Ponto.innerText = co[2];
        som = "somcerto";
        rodrol = "ok"; OqueFaz = 1;
	}
    else
        som = "somerro";

    Consc.innerText = co[3];
	var t = new Date(); var final = (t.getHours() * 3600) + (t.getMinutes() * 60) + t.getSeconds(); final -= inicial
    Tempos.innerText = (Math.ceil(final / 60) - 1) + "min:" + (final % 60) + "seg.";
    obj.src = "../images/cont001.gif";
    PlaySound(som);
} 

function myFirstBack1(obj, co) {
    cox = co[0];
    if (cox == "xo") location.href = "Sabio03.aspx?ptSala=" + co[1];   //"http://www.aggora.com.br/sabio/1/tema" + co.return_value[2] + 
    else {
        chute = "Atщ 5 Palpites:"; NValr2.innerText = chute; cod = co[3];
        if (cod < 2) { NFig2.src = "images/sabio06.gif"; NFig1.src = "images/sabio00.gif" }
        else { NFig1.src = "images/sabio06.gif"; NFig2.src = "images/sabio03.gif" }
        obj.src = "/_Library/bottv.gif"; NPerg.innerText = co[0];
        apost = co[1]; aposl = co[2];
        fig = "images/" + co[4];
        Tinicial();
    }
} 

function errorCallBack(msg) {
    alert("RG 3.0 - ERRO: (" + msg + ")\n\n" +
        "Provсveis Causa:\n" +
        "1 - A conexуo Internet teve problemas ou foi interrompida.\n" +
        "2 - A conexуo Internet esteve ociosa por mais de 20 minutos.\n" +
        "Dicas de Correчуo:\n" +
        "1a - Recarregue o Site e tente novamente (Ctrl + F5).\n" +
        "2a - Navegue exclusivamente pelos botѕes do \"Sabichуo Web\".\n" +
        "Se o problema persistir contate-nos via E-mail.");
    return true;
}

function onBotao1(obj) {
    if (cart == 1) obj.src = "../images/resp000.gif"
    if (rodrol == "ok") obj.src = "../images/cont000.gif"
}

function ofBotao1(obj) {
    if (cart == 1) obj.src = "../images/resp001.gif"
    if (rodrol == "ok") obj.src = "../images/cont001.gif"
}


function click_me(){
    if (event.button > 1) alert("RG 3.0 - Informaчуo (К_К):\n\nOpss - Utilize somente o botуo esquerdo do mouse")
}

    onerror = errorCallBack
    document.onmousedown = click_me

//-->