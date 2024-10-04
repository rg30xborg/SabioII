<!--//

if ((parent.window.name).indexOf("inicial") < 0) location.href = "/help.htm";   //http://www.aggora.com.br/sabio

function addFavor1(){
	window.external.AddFavorite("http://www.aggora.com.br/sabio", "SABICHУO - Um desafio aos seus Conhecimentos")
}

function Aviso2(){
	//if((this.location.href).IndexOf("aggora") < 0) location.href = "http://www.aggora.com.br/sabio/help.htm"
    //else {
        // window.defaultStatus = 'RG JOGOS OK! [MENU]'
		NCalc.innerText = " "; Reg16.innerText = "RG SABICHУO WEB - Borg, todos os direitos reservados"
	//}
}

function alocar1(sndAction,sndObj){ sndObj = "document." + sndObj
	if (eval(sndObj) != null){
		if (eval(sndObj + ".Filename")) eval(sndObj + ((sndAction == 'stop') ? '.stop()' : '.play()'))}
}

function mOvr(src,clrOver){
	if(!src.contains(event.fromElement)){
		src.style.cursor = 'pointer'
		src.bgColor = clrOver
	}
}

function mOut(src,clrIn){
	if(!src.contains(event.toElement)){
		src.style.cursor = 'default'
		src.bgColor = clrIn
	}
}

function linkar(src)
{
	if(event.srcElement.tagName=='TD'){
        self.location = "tema" + src + (opcao[0].checked ? "/Sabio01.aspx" : "a/Sabio01.aspx");     //http://www.aggora.com.br/sabio/1/sorte/
	}
}

var AbreWin

function AbreJan(i,j,k){
	if(AbreWin != null) AbreWin.close()
    str1 = "passa/sabio" + i;                             //http://www.aggora.com.br/sabio/1/sorte/
	str2 = "top=0,left=0,scrollbars=1,width=" + j + ",height=" + k
	AbreWin = window.open(str1,"AbreWin",str2)
}

function click_me(){
    if (event.button > 1) alert("RG 3.0 - Informaчуo (К_К):\n\nOpss - Utilize somente o botуo esquerdo do mouse")
}
	document.onmousedown = click_me
//-->