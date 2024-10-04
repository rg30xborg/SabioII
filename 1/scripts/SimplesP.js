<!--//

if ((parent.window.name).indexOf("inicial") < 0) location.href = "/help.htm";   //http://www.aggora.com.br/sabio

var inicial = cart = 0, rodrol = apost = empresa = "", serverURL = "sabio02.asp"

function OnCarg(){
	//if((this.location.href).indexOf("http://www.aggora.com.br") < 0) location.href = "http://www.aggora.com.br/sabio/help.htm"
    //else {
        NCalc.innerText = " "
        cart = 1;
        //botao.src = "../images/resp001.gif"
	//}
}

function onImage(num){
	if(cart == 1){
		for(var i = 1; i < 4; i++) document.images["n" + i].src = "../images/happy0.gif"
		document.images["n" + num].src = "../images/happy3.gif"
	}
	switch(num){
        case 1: apost = "a"; break;
        case 2: apost = "b"; break;
        case 3: apost = "c"; break;
    }
    document.getElementById("HFApost").value = apost;
}

function PlaySound(soundObj) {
    var sound = document.getElementById(soundObj);
    sound.play();
}

function StartRGQuizWeb1(obj){
	if(cart == 1){
		if(apost == ""){
            alert("RG 3.0 - Solicitaчуo (К_К):\n\nUma das resposta deve ser marcada para responder");
            return false;
		}
        cart = 0;
        obj.src = "../images/bot0pg.gif";
		//var co = RSExecute(serverURL,"Method1",apost,myBackCart,errorCallBack)
        OqueFaz = 2;
        return true;
	}
    else {
        if (rodrol == "ok") {
            rodrol = "";
            obj.src = "../images/bot0pg.gif";
			//var co = RSExecute(serverURL,"Method2",myFirstBack,errorCallBack)
            OqueFaz = 4;
            return true;
		}
	}
}

function myBackCart1(obj, co){
    cox = co[0];
	if(cox == "ok"){
        document.images["n" + co[1]].src = "../images/happy1.gif";
        som = "somcerto";
        obj.src = "../images/cont001.gif";
        rodrol = "ok";
        PlaySound(som)
	}
} 

function myFirstBack1(obj, co){
    cox = co[0];
	if(cox == "xo"){
        top.frames.super1.Ponto.innerText = co[3];
        location.href = "Sabio03.aspx?ptSala=" + co[1] + "&cTema=" + co[2] + "&cData=" + co[4];     //
	}
    else {
        NPerg.innerText = co[0];
        NResp1.innerText = co[1];
        NResp2.innerText = co[2];
        NResp3.innerText = co[3];
		for(var i = 1; i < 4; i++){
            document.images["n" + i].src = "../images/happy3.gif"; Resposta[i - 1].checked = false; //Resposta(i - 1).status = 0
		}
        apost = ""; cart = 1;
        obj.src = "../images/resp001.gif";
	}
} 

function errorCallBack(co){
	alert("RG 3.0 - ERRO:\n\n" +
		"Provсveis Causa:\n" + 
		"1 - A conexуo Internet teve problemas ou foi interrompida.\n" + 
		"2 - A conexуo Internet esteve ociosa por mais de 20 minutos.\n" +
		"3 - Acesse www.java.com/pt_BR e instale o plug-in Java da SUN.\n" +
		"Dicas de Correчуo:\n" + 
		"1a - Recarregue o Site e tente novamente (F5).\n" + 
		"2a - Navegue exclusivamente pelos botѕes do \"Sabichуo Web\".\n" +
		"Se o problema persistir contate-nos via E-mail.")
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

	document.onmousedown = click_me

//-->