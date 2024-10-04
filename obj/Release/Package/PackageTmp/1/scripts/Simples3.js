<!--//

var inicial = cart = 0, rodrol = apost = "", serverURL = "sabio02.asp"

function OnCarg(){
	//if((this.location.href).indexOf("http://www.aggora.com.br") < 0) location.href = "http://www.aggora.com.br/sabio/help.htm"
    //else {
    NCalc.innerText = " "; rodrol = "ok";
    //botao.src = "../images/cont001.gif"
    //}
}

function Tinicial(){
	var t = new Date(); inicial = (t.getHours() * 3600) + (t.getMinutes() * 60) + t.getSeconds()
    cart = 1;
    //obj.src = "../images/resp001.gif";
    Tempos.innerText = "cronometrando ...";
    NTabl.style.visibility = ""; NFig1.src = "images/sabio01.gif";
}

function onImage(num){
	if(cart == 1){
        for (var i = 1; i < 6; i++) document.images["n" + i].src = "../images/happy0.gif";
        document.images["n" + num].src = "../images/happy3.gif";
	}
	switch(num){
        case 1: apost = "a"; break;
        case 2: apost = "b"; break;
        case 3: apost = "c"; break;
        case 4: apost = "d"; break;
        case 5: apost = "e"; break;
    }
    document.getElementById("HFApost").value = apost;
}

function StartRGQuizWeb1(obj){
    if (rodrol == "ok") {
        rodrol = ""; NFig2.src = "images/sabio05.gif"; Tempo.innerText = "?!?"
        obj.src = "../images/bot0pg.gif"
        OqueFaz = 2;
        return true;
		//var co = RSExecute(serverURL,"Method2",myFirstBack,errorCallBack)
	}
    else {
        if (cart == 1) {
			if(apost == ""){
                alert("RG 3.0 - Solicitaчуo (К_К):\n\nUma das resposta deve ser marcada para responder")
				return false
			}
            cart = 0;
            obj.src = "../images/bot0pg.gif"
			var t = new Date(); var final = (t.getHours() * 3600) + (t.getMinutes() * 60) + t.getSeconds(); final -= inicial
            final = parseInt(final.toString(), 10); NFig1.src = "images/sabio00.gif";
			Tempo.innerText = (final < 10 ? "0" + final : final)
            NFig2.src = (final == 25 ? "images/sabio04.gif" : (final < 25 ? "images/sabio03.gif" : "images/sabio02.gif"))
            OqueFaz = 4;
            return true;
			//var co = RSExecute(serverURL,"Method1",apost,final,myBackCart,errorCallBack)
		}
	}
}

function PlaySound(soundObj) {
    var sound = document.getElementById(soundObj);
    sound.play();
}

function myBackCart1(obj, co){
	cox = co[0]
	if(cox == "ok"){
		document.images["n" + co[1]].src = "../images/happy1.gif"
		Salas.innerText = co[2]
		top.frames.super1.Ponto.innerText = co[3]
		som = "somcerto"
	}
	else{
		document.images["n" + co[1]].src = "../images/happy2.gif"
		som = "somerro"
	}

	Consc.innerText = co[4]
    var t = new Date(); var final = (t.getHours() * 3600) + (t.getMinutes() * 60) + t.getSeconds(); final -= inicial
    document.getElementById("HFTempo").value = final;
	Tempos.innerText = (Math.ceil(final / 60) - 1) + "min:" + (final % 60) + "seg."
    obj.src = "../images/cont001.gif";
    rodrol = "ok"
    PlaySound(som)
} 

function myFirstBack1(obj, co){
	cox = co[0]
    if (cox == "xo") location.href = "Sabio03.aspxx?ptSala=" + co[1];  //"http://www.aggora.com.br/sabio/1/tema"+co.return_value[2]+
    else {
        NPerg.innerText = co[0];
        NResp1.innerText = co[1];
        NResp2.innerText = co[2];
        NResp3.innerText = co[3];
        NResp4.innerText = co[4];
        NResp5.innerText = co[5];
		for(var i = 1; i < 6; i++){
            document.images["n" + i].src = "../images/happy3.gif"; Resposta[i - 1].checked = false; //Resposta[i - 1].status = 0; 
        }
        obj.src = "../images/resp001.gif";
        apost = ""; Tinicial()
        OqueFaz = 1;
        //document.getElementById("<%=HFPCert.ClientID %>").Value = "0";
        PlaySound('somregis');
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
    //document.onmousedown = click_me

//-->