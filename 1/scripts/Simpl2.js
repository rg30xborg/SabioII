<!--//

if ((parent.window.name).indexOf("inicial") < 0) location.href = "/help.htm";   //http://www.aggora.com.br/sabio

	var serverURL = "Sabio03.aspx", numer1 = 1, numero = '01', naipe1 = 1, naipe = 'o', dob = ' '
	var cart = troc = 1, jogo = aposm = tr1 = tr2 = tr3 = tr4 = tr5 = 0
	var p, o, k, e, r, cheiver = ' ', dobvar = dobra1 = dobra2 = dobra3 = dobra4 = dobra5 = 0
	var cx1 = 'carta', deu1 = deu2 = deu3 = deu4 = deu5 = cx1
	var fila1x = fila2x = fila3x = fila4x = fila5x = 0, lok_it = 'yes'

function muda(){
	// document.clear()
	// dadosb.dataz.width = 0
    dadosb.action = "Sabio02.aspx";      //http://www.aggora.com.br/sabio/1/sorte/tema2/
	dadosb.dataz.value = dados;  dados = 0
	dadosb.salax.value = salas;  salas = 0
	dadosb.submit()
}

function mudaA(){
	// document.clear()
	// dadosb.dataz.width = 0
    dadosb.action = "Sabio02.aspx";         //http://www.aggora.com.br/sabio/1/sorte/tema2a/
	dadosb.dataz.value = dados;  dados = 0
	dadosb.salax.value = salas;  salas = 0
	dadosb.submit()
}

function Aviso2(){
	//if((this.location.href).indexOf("http://www.aggora.com.br") < 0) location.href = "http://www.aggora.com.br/sabio/help.htm"
	//else{	// window.defaultStatus = 'RG 3.0 - Sabich�o Web [POKER 1]'
        NCalc.innerText = " ";
        Reg16.innerText = "Defina o valor da Aposta Padr�o";
        top.frames.super1.Ponto.innerText = cred;
	//}
}

function alocar1(sndAction, sndObj) {
    var sound = document.getElementById(sndObj);
    sound.play();
}

function myPrepGo(){
    Reg11.src = Reg12.src = Reg13.src = Reg14.src = Reg15.src = '/_Library/carta.gif';
    tr1 = tr2 = tr3 = tr4 = tr5 = 0;
    document.getElementById("HFco0").value = "P";
    document.getElementById("HFco1").value = "R";
    document.getElementById("HFco2").value = "E";
    document.getElementById("HFco3").value = "M";
    document.getElementById("HFco4").value = "I";
    document.getElementById("HFco5").value = "O";
    document.getElementById("HFco6").value = "S";
    document.getElementById("HFco7").value = "S";
    document.getElementById("HFco8").value = "S";
}

function myBackCart1(co){
	//if(co[7] == 'yes') alocar1('play','somregis')
	cred = parseInt(co[0],10)
	if(cred < aposm && cred != 0){aposm = cred
        alert('RG POKER WEB ALERTA:\n\nAposta ajustada para o limite de Pontos dispon�vel')
    }
    if (cred != 0) {
        //obj.click();
        //return false;
        //setTimeout("var co = RSExecute(serverURL,'Method5',aposm,myFirstBack,errorCallBack,'RSExecute')",120)

        setTimeout(function () {
            myFirstBack1(co)
        }, 600);

    }
    else {
        cart = 1, troc = 1
        Reg21.style.visibility = "hidden";    //Reg21.src = '/_Library/bottv.gif';
        //Reg22.src = '/_Library/botjkb.gif'
		Reg16.innerText = 'Pontos corrente esgotado !!'
        if (confirm('RG POKER WEB ALERTA:\n\nPontos esgotado. Deseja sair desta Sala ?') == true)
            location.href = "Sabio01.asp?Err=1";
        return false;
    }
} 

function myFirstBack1(co) {
    if (OqueFaz = 3) {
        p = co[1]; Reg11.src = '/_Library/' + p + '.gif'
        o = co[2]; Reg12.src = '/_Library/' + o + '.gif'
        k = co[3]; Reg13.src = '/_Library/' + k + '.gif'
        e = co[4]; Reg14.src = '/_Library/' + e + '.gif'
        r = co[5]; Reg15.src = '/_Library/' + r + '.gif'
        cheiver = (' ' + p + ' ' + o + ' ' + k + ' ' + e + ' ' + r);
        Reg11.title = Reg12.title = Reg13.title = Reg14.title = Reg15.title = "Descartar carta"
        Reg16.innerText = 'Descarte e click em [Trocar/Manter] Cartas'; Reg17.innerText = co[6]
        Reg18.innerText = co[8]; top.frames.super1.Ponto.innerText = co[0]
        troc = 0;
        //Reg22.src = '/_Library/botjkb.gif'
        Reg22.style.visibility = "hidden";      //Reg21.src = '/_Library/bottv.gif'
        Reg20.style.visibility = "";            //Reg20.src = '/_Library/botmt.gif';
        if (co[7] == 'yes') alocar1('play', 'somsorte')
    }
} 

function mySecondBack1(co){
    var p1 = co[1]; if(p1 != 'no') {Reg11.src = '/_Library/' + p1 + '.gif'; image1.style.visibility = "hidden"; Reg11.style.visibility = "" }
	var o1 = co[2]; if(o1 != 'no') {Reg12.src = '/_Library/' + o1 + '.gif'; image2.style.visibility = "hidden"; Reg12.style.visibility = ""}
	var k1 = co[3]; if(k1 != 'no') {Reg13.src = '/_Library/' + k1 + '.gif'; image3.style.visibility = "hidden"; Reg13.style.visibility = ""}
	var e1 = co[4]; if(e1 != 'no') {Reg14.src = '/_Library/' + e1 + '.gif'; image4.style.visibility = "hidden"; Reg14.style.visibility = ""}
	var r1 = co[5]; if(r1 != 'no') {Reg15.src = '/_Library/' + r1 + '.gif'; image5.style.visibility = "hidden"; Reg15.style.visibility = ""}
	Reg17.innerText = co[6]; cart = 0, troc = 1, tr1 = 0, tr2 = 0, tr3 = 0, tr4 = 0, tr5 = 0
	if(co[7] == 'yes'){
		dobra1 = 1; dobvar = 1; cheiver += (' ( ' + p1 + ' ' + o1 + ' ' + k1 + ' ' + e1 + ' ' + r1 + ' )')
		Reg19.style.visibility = "" // cheiver Se preferir mostrar o jogo todo
        Reg11.title = Reg12.title = Reg13.title = Reg14.title = Reg15.title = ""; Bronctno()
    }
    else {
        cheiver = ' '; Reg16.innerText = 'Click em Iniciar/Creditar'
        Reg11.title = Reg12.title = Reg13.title = Reg14.title = Reg15.title = "clique em Iniciar/Creditar"; jogo = 0
    }
    //Reg22.src = '/_Library/botjkb.gif'
    Reg22.style.visibility = "hidden";  //Reg20.src = '/_Library/bottv.gif';
    cart = 0;   Reg21.style.visibility = "";        //Reg21.src = '/_Library/botcr.gif'
} 

function Broncyes(){
	Reg16.innerText = 'Click em Iniciar/Creditar'; Reg17.innerText = 'Perde Dobra. Sorry.'
	alocar1('play','somcapit')
}

function Bronctno(){
	Reg16.innerText = 'Apostar para Dobrar ou Iniciar/Creditar'
	Reg31.src = ('/_Library/' + deu5 + '.gif'); Reg30.src = ('/_Library/' + deu4 + '.gif')
	Reg29.src = ('/_Library/' + deu3 + '.gif'); Reg28.src = ('/_Library/' + deu2 + '.gif')
	Reg27.src = ('/_Library/' + deu1 + '.gif'); Reg26.src = '/_Library/botck.gif'
	Reg24.src = '/_Library/botmn.gif'; Reg25.src = '/_Library/botmm.gif'
	f6.src = '/_Library/' + numero + naipe + '.gif'; alocar1('play','sominici')
}

function filaOk1(){
    if (fila1x == 4) {
        fila1x = 0; image1.style.visibility = "hidden"; image1.title = "N�O Descartar carta"
		image1.src = '/_Library/carta.gif'; Reg17.innerText = p
        cart = 0;
        Reg21.src = '/_Library/botcr.gif';
        if (lok_it == 'yes')
            Broncyes();
        else {
            dobra2 = 1; Bronctno()
        }
	}
    if (fila1x == 3) {
        fila1x = 4; image1.src = '/_Library/cartaC.gif'
    }
    if (fila1x == 2) {
        fila1x = 3; image1.src = '/_Library/cartaB.gif'
        Reg22.style.visibility = "hidden";
    }
    if (fila1x == 1) {
        fila1x = 2; image1.src = '/_Library/cartaA.gif'
		Reg16.innerText = 'Tr�s clicks na 1� Carta = Filar'; image1.title = "1� Carta da Dobra"
        Reg17.innerText = 'Palpite = ' + (dob == 'x1' ? (numero + naipe) : (dob == '>' ? 'Maior que 7' : 'Menor que 7'))
	}
}

function myThirdBack1(co){
 	image1.style.visibility = ""
	var p2 = co[0]; Reg11.src = '/_Library/' + p2 + '.gif'
	lok_it = co[2]; deu5 = deu4;deu4 = deu3;deu3 = deu2;deu2 = deu1;deu1 = p2
    p = co[1]; fila1x = 1;
    Reg21.src = '/_Library/botdr.gif'; Reg21.style.visibility = "";
    filaOk1();
}

function filaOk2(){
    if (fila2x == 4) {
        fila2x = 0; image2.style.visibility = "hidden"; image2.title = "N�O Descartar carta"
		image2.src = '/_Library/carta.gif'; Reg17.innerText = o
        cart = 0;
        Reg21.src = '/_Library/botcr.gif';
        if (lok_it == 'yes')
            Broncyes();
        else {
            dobra3 = 1; Bronctno()
        }
	}
    if (fila2x == 3) {
        fila2x = 4; image2.src = '/_Library/cartaC.gif'
    }
    if (fila2x == 2) {
        fila2x = 3; image2.src = '/_Library/cartaB.gif'
        Reg22.style.visibility = "hidden";
    }
    if (fila2x == 1) {
        fila2x = 2; image2.src = '/_Library/cartaA.gif'
		Reg16.innerText = 'Tr�s clicks na 2� Carta = Filar'; image2.title = "2� Carta da Dobra"
        Reg17.innerText = 'Palpite = ' + (dob == 'x1' ? (numero + naipe) : (dob == '>' ? 'Maior que 7' : 'Menor que 7'))
	}
}

function myFourthBack1(co){
 	image2.style.visibility = ""
	var o2 = co[0];Reg12.src = '/_Library/' + o2 + '.gif'
	lok_it = co[2]; deu5 = deu4; deu4 = deu3; deu3 = deu2; deu2 = deu1; deu1 = o2
    o = co[1]; fila2x = 1;
    Reg21.src = '/_Library/botdr.gif'; Reg21.style.visibility = "";
    filaOk2()
}

function filaOk3(){
    if (fila3x == 4) {
        fila3x = 0; image3.style.visibility = "hidden"; image3.title = "N�O Descartar carta"
		image3.src = '/_Library/carta.gif'; Reg17.innerText = k
        cart = 0;
        Reg21.src = '/_Library/botcr.gif';
        if (lok_it == 'yes')
            Broncyes();
        else {
            dobra4 = 1; Bronctno()
        }
	}
    if (fila3x == 3) {
        fila3x = 4; image3.src = '/_Library/cartaC.gif'
    }
    if (fila3x == 2) {
        fila3x = 3; image3.src = '/_Library/cartaB.gif'
        Reg22.style.visibility = "hidden";
    }
    if (fila3x == 1) {
        fila3x = 2; image3.src = '/_Library/cartaA.gif'
		Reg16.innerText = 'Tr�s clicks na 3� Carta = Filar'; image3.title = "3� Carta da Dobra"
        Reg17.innerText = 'Palpite = ' + (dob == 'x1' ? (numero + naipe) : (dob == '>' ? 'Maior que 7' : 'Menor que 7'))
	}
}

function myFifthBack1(co){
 	image3.style.visibility = ""
	k2 = co[0];Reg13.src = '/_Library/' + k2 + '.gif'
	lok_it = co[2]; deu5 = deu4; deu4 = deu3; deu3 = deu2; deu2 = deu1; deu1 = k2
    k = co[1]; fila3x = 1;
    Reg21.src = '/_Library/botdr.gif'; Reg21.style.visibility = "";
    filaOk3()
}

function filaOk4(){
    if (fila4x == 4) {
        fila4x = 0; image4.style.visibility = "hidden"; image4.title = "N�O Descartar carta"
		image4.src = '/_Library/carta.gif'; Reg17.innerText = e
        cart = 0;
        Reg21.src = '/_Library/botcr.gif';
        if (lok_it == 'yes') Broncyes(); else {
            dobra5 = 1; Bronctno()
        }
	}
    if (fila4x == 3) {
        fila4x = 4; image4.src = '/_Library/cartaC.gif'
    }
    if (fila4x == 2) {
        fila4x = 3; image4.src = '/_Library/cartaB.gif'
        Reg22.style.visibility = "hidden";
    }
    if (fila4x == 1) {
        fila4x = 2; image4.src = '/_Library/cartaA.gif'
		Reg16.innerText = 'Tr�s clicks na 4� Carta = Filar'; image4.title = "4� Carta da Dobra"
        Reg17.innerText = 'Palpite = ' + (dob == 'x1' ? (numero + naipe) : (dob == '>' ? 'Maior que 7' : 'Menor que 7'))
	}
}

function mySixthBack1(co){
 	image4.style.visibility = ""
	var e2 = co[0];Reg14.src = '/_Library/' + e2 + '.gif'
	lok_it = co[2]; deu5 = deu4; deu4 = deu3; deu3 = deu2; deu2 = deu1; deu1 = e2
    e = co[1]; fila4x = 1;
    Reg21.src = '/_Library/botdr.gif'; Reg21.style.visibility = "";
    filaOk4()
}

function filaOk5(){
    if (fila5x == 4) {
        fila5x = 0; image5.style.visibility = "hidden"; image5.title = "N�O Descartar carta"
		image5.src = '/_Library/carta.gif'; Reg17.innerText = r
        cart = 0;
        Reg21.src = '/_Library/botcr.gif';
        if (lok_it == 'yes') {
            Broncyes(); alert('Ok!!!!, Voc� tentou, ...')
        }
        else {
            Bronctno(); Reg26.src = '/_Library/botcv.gif'
			Reg24.src = '/_Library/botmv.gif'; Reg25.src = '/_Library/botmv.gif'
            alert('wall!!, Isto foi U�timo.')
        }
		Reg16.innerText = 'Click em Iniciar/Creditar'
	}
    if (fila5x == 3) {
        fila5x = 4; image5.src = '/_Library/cartaC.gif'
    }
    if (fila5x == 2) {
        fila5x = 3; image5.src = '/_Library/cartaB.gif'
        Reg22.style.visibility = "hidden";
    }
    if (fila5x == 1) {
        fila5x = 2; image5.src = '/_Library/cartaA.gif'
		Reg16.innerText = 'Tr�s clicks na 5� Carta = Filar'; image5.title = "5� Carta da Dobra"
        Reg17.innerText = 'Palpite = ' + (dob == 'x1' ? (numero + naipe) : (dob == '>' ? 'Maior que 7' : 'Menor que 7'))
	}
}

function mySeventhBack1(co){
 	image5.style.visibility = ""
	var r2 = co[0];Reg15.src = '/_Library/' + r2 + '.gif'
	lok_it = co[2]; deu5 = deu4; deu4 = deu3; deu3 = deu2; deu2 = deu1; deu1 = r2
    r = co[1]; fila5x = 1;
    Reg21.src = '/_Library/botdr.gif'; Reg21.style.visibility = "";
    filaOk5()
}

function StartRGPokerWeb1(){
    if (cart == 0) {
        cart = jogo = 1, dobra1 = dobra2 = dobra3 = dobra4 = dobra5 = 0
        Reg21.style.visibility = "hidden";      //Reg21.src = '/_Library/bottg.gif';
        Reg22.style.visibility = "";            //Reg22.src = '/_Library/botpg.gif'
		if(dobvar == 1){
			f6.src = '/_Library/' + numero + naipe + '.gif'
			Reg31.src = Reg30.src = Reg29.src = Reg28.src = Reg27.src = '/_Library/carta.gif'
			Reg24.src = Reg25.src = '/_Library/botmv.gif'; Reg26.src = '/_Library/botcv.gif'
            Reg19.style.visibility = "hidden"; dobvar = 0
        }
        myPrepGo(); Reg16.innerText = 'Embaralhando Cartas ...';
        document.getElementById("HFApost").value = aposm;
        OqueFaz = 2;
        return true;
		//var co = RSExecute(serverURL,"Method4",myBackCart,errorCallBack)
	}
}

function ProssRGPokerWeb1(){
    if (troc == 0) {
        troc = 1
        Reg20.style.visibility = "hidden";      //Reg20.src = '/_Library/bottg.gif';
        Reg22.style.visibility = "";            //Reg22.src = '/_Library/botpg.gif'
        document.getElementById("HFco1").value = tr1;
        document.getElementById("HFco2").value = tr2;
        document.getElementById("HFco3").value = tr3;
        document.getElementById("HFco4").value = tr4;
        document.getElementById("HFco5").value = tr5;
        OqueFaz = 4;
        return true;
		//var co = RSExecute(serverURL,"Method6",tr1,tr2,tr3,tr4,tr5,mySecondBack,errorCallBack)
	}
}

function seltip1() {
    if (troc == 0) {
        //rotImg1.filters.item[0].Apply(); rotImg1.filters.item[0].transition = 23
        if (tr1 == 0) {
            tr1 = 1; Reg11.style.visibility = "hidden"; image1.style.visibility = ""
        }
        else {
            tr1 = 0; image1.style.visibility = "hidden"; Reg11.style.visibility = ""
        }
        //rotImg1.filters[0].Play(0.2)
    }
	if(troc == 1 && fila1x > 0 && fila1x < 5) filaOk1()
}

function seltip2(){
	if(troc == 0){
		//rotImg2.filters.item[0].Apply(); rotImg2.filters.item[0].transition = 23
        if (tr2 == 0) {
            tr2 = 1; Reg12.style.visibility = "hidden"; image2.style.visibility = ""
        }
        else {
            tr2 = 0; image2.style.visibility = "hidden"; Reg12.style.visibility = ""
        }
        //rotImg2.filters[0].Play(0.2)
    }
	if(troc == 1 && fila2x > 0 && fila2x < 5) filaOk2()
}

function seltip3(){
	if(troc == 0){
		//rotImg3.filters.item[0].Apply(); rotImg3.filters.item[0].transition = 23
        if (tr3 == 0) {
            tr3 = 1; Reg13.style.visibility = "hidden"; image3.style.visibility = ""
        }
        else {
            tr3 = 0; image3.style.visibility = "hidden"; Reg13.style.visibility = ""
        }
        //rotImg3.filters[0].Play(0.2)
    }
	if(troc == 1 && fila3x > 0 && fila3x < 5) filaOk3()
}

function seltip4(){
	if(troc == 0){
		//rotImg4.filters.item[0].Apply(); rotImg4.filters.item[0].transition = 23
        if (tr4 == 0) {
            tr4 = 1; Reg14.style.visibility = "hidden"; image4.style.visibility = ""
        }
        else {
            tr4 = 0; image4.style.visibility = "hidden"; Reg14.style.visibility = ""
        }
        //rotImg4.filters[0].Play(0.2)
    }
	if(troc == 1 && fila4x > 0 && fila4x < 5) filaOk4()
}

function seltip5(){
    if(troc == 0){
	    //rotImg5.filters.item(0).Apply(); rotImg5.filters.item(0).transition = 23
        if (tr5 == 0) {
            tr5 = 1; Reg15.style.visibility = "hidden"; image5.style.visibility = ""
        }
        else {
            tr5 = 0; image5.style.visibility = "hidden"; Reg15.style.visibility = ""
        }
        //rotImg5.filters[0].Play(0.2)
    }
	if(troc == 1 && fila5x > 0 && fila5x < 5) filaOk5()
}

function selBet1(j){
	if(jogo == 0){
		aposm = j
        if (aposm > cred) {
            var apsM = cred - aposm; aposm = 0; cart = 1;
            Reg21.style.visibility = "hidden";      //Reg21.src = "/_Library/bottv.gif"
			alert("RG 3.0 - ALERTA\n\nAposta recusada - Valor " + apsM + " acima do Total de Pontos Atual!")
			Reg16.innerText = "Aposta recusada - Valor " + apsM + " acima do Total de Pontos Atual!"
			Reg17.innerText = "Re-Iniciando...! Defina o valor da Aposta Padr�o" }
        else {
            Reg17.innerText = "Aposta " + aposm + " pontos Ok!"
			if(cart == 1){
				Reg16.innerText = "Aposta OK! Clique [Iniciar/Creditar]"
                //Reg00.style.visibility = "hidden";
                Reg21.style.visibility = "";        //Reg21.src = "/_Library/botcr.gif";
                cart = 0
            }
        }
	}
}

function cheia(){
	f6.src = '/_Library/' + numero + naipe + '.gif'
}

function adinum(){
	if(fila1x == 0 && fila2x == 0 && fila3x == 0 && fila4x == 0 && fila5x == 0){
		if(numer1 < 13)numer1 ++; else numer1 = 1; if(numer1 <= 9)numero = '0' + numer1; else numero = numer1; cheia()
	}
}

function subnum(){
	if(fila1x == 0 && fila2x == 0 && fila3x == 0 && fila4x == 0 && fila5x == 0){
		if(numer1 > 1)numer1 --; else numer1 = 13; if(numer1 <= 9)numero = '0' + numer1; else numero = numer1; cheia()
	}
}

function adinai(){
	if(fila1x == 0 && fila2x == 0 && fila3x == 0 && fila4x == 0 && fila5x == 0){
		if(naipe1 < 4)naipe1 ++; else naipe1 = 1
		if(naipe1 == 1)naipe = 'o'; if(naipe1 == 2)naipe = 'c'; if(naipe1 == 3)naipe = 'p'; if(naipe1 == 4)naipe = 'e'
		cheia()
	}
}

function subnai(){
	if(fila1x == 0 && fila2x == 0 && fila3x == 0 && fila4x == 0 && fila5x == 0){
		if(naipe1 > 1)naipe1 --; else naipe1 = 4
		if(naipe1 == 1)naipe = 'o'; if(naipe1 == 2)naipe = 'c'; if(naipe1 == 3)naipe = 'p'; if(naipe1 == 4)naipe = 'e'
		cheia()
	}
}

function instrui(){
	alert("RG 3.0 - INSTRU��ES :\n"
	+ "1 - Opcional: Escolha o valor da Aposta padr�o.\n"
	+ "2 - Click em: Iniciar Partida.\n"
	+ "3 - Opcional: Descarte carta(s) indesejada(s).\n"
	+ "4 - Click em: Trocar Cartas.\n"
	+ "5 - Opcional se ganhou: Dobras +/-7 ou Cheia.\n"
	+ "6 - Click em: Iniciar/Creditar   Boa Sorte....\n\n"
	+ "RG 3.0 - APOSTA CORRENTE = " + aposm + " PAGA:\n"
	+ (aposm * 300) + " se Royal Street Flash.\n"
	+ (aposm * 150) + " se Street Flash.\n"
	+ (aposm * 60)  + " se Quadra (*).\n"
	+ (aposm * 10)  + " se Fulla (*).\n"
	+ (aposm * 6)   + " se Flash.\n"
	+ (aposm * 5)   + " se Sequ�ncia.\n"
	+ (aposm * 3)   + " se Trinca.\n"
	+ (aposm * 2)   + " se Duas Duplas.\n"
	+ "(*) Dobra o valor na presen�a de (As)." )
}

function infodobr(){
	alert("RG 3.0 - DOBRAS:\n" +
		"(Quando dispon�vel permite aumentar o valor dos ganhos da Rodada).\n\n" +
		"1 - Dobra Maior/Menor que 7:\n" + 
		"    - Palpite certo = 2x os ganhos.\n" +
		"    - O Sete � neutro e mant�m os ganhos.\n" +
		"2 - Dobra Cheia:\n" + 
		"    - S� naipe certo = 2x os ganhos.\n" + 
		"    - S� n�mero certo = 4x os ganhos.\n" + 
		"    - N�mero e Naipe certo = 10x os ganhos.\n\n" +
		"Em qualquer caso, palpite errado = Perde os ganhos da Rodada.\n");
}

function dobrax(){
    cart = 1;
    Reg22.style.visibility = "";
    Reg26.src = '/_Library/botcv.gif'; Reg24.src = '/_Library/botmv.gif'; Reg25.src = '/_Library/botmv.gif'
    if (dobra5 == 1) {
        dobra5 = 0; myPrepGo();
        document.getElementById("HFPCert").value = "2";
        document.getElementById("HFco1").value = dob;
        document.getElementById("HFco2").value = numero;
        document.getElementById("HFco3").value = naipe;
        OqueFaz = 14
        return true;
        //var co = RSExecute(serverURL, 'Method7', dob, numero, naipe, mySeventhBack, errorCallBack, 'RSExecute')
    }
    if (dobra4 == 1) {
        dobra4 = 0; myPrepGo();
        document.getElementById("HFPCert").value = "2";
        document.getElementById("HFco1").value = dob;
        document.getElementById("HFco2").value = numero;
        document.getElementById("HFco3").value = naipe;
        OqueFaz = 12
        return true;
        //var co = RSExecute(serverURL, 'Method8', dob, numero, naipe, mySixthBack, errorCallBack, 'RSExecute')
    }
    if (dobra3 == 1) {
        dobra3 = 0; myPrepGo();
        document.getElementById("HFPCert").value = "2";
        document.getElementById("HFco1").value = dob;
        document.getElementById("HFco2").value = numero;
        document.getElementById("HFco3").value = naipe;
        OqueFaz = 10
        return true;
        //var co = RSExecute(serverURL, 'Method7', dob, numero, naipe, myFifthBack, errorCallBack, 'RSExecute')
    }
    if (dobra2 == 1) {
        dobra2 = 0; myPrepGo();
        document.getElementById("HFPCert").value = "2";
        document.getElementById("HFco1").value = dob;
        document.getElementById("HFco2").value = numero;
        document.getElementById("HFco3").value = naipe;
        OqueFaz = 8
        return true;
        //var co = RSExecute(serverURL, 'Method8', dob, numero, naipe, myFourthBack, errorCallBack, 'RSExecute')
    }
    if (dobra1 == 1) {
        dobra1 = 0; myPrepGo();
        document.getElementById("HFPCert").value = "2";
        document.getElementById("HFco1").value = dob;
        document.getElementById("HFco2").value = numero;
        document.getElementById("HFco3").value = naipe;
        OqueFaz = 6
        return true;
        //var co = RSExecute(serverURL, 'Method7', dob, numero, naipe, myThirdBack, errorCallBack, 'RSExecute')
    }
}

nDob = '>';
function dobram1(){
	if(dobra1 == 1 || dobra2 == 1 || dobra3 == 1 || dobra4 == 1 || dobra5 == 1){
        dob = nDob; if(dob == '>') f6.src='/_Library/00m.gif'; else f6.src='/_Library/00n.gif'
		dobrax()
	}
    else
        alert('GRUPO DE BOT�ES DOBRA (+/- 7) :\n\n- Dispon�veis somente quando ap�s (Trocar Cartas)\n   o resultado for maior ou igual a Duas Duplas.\n- Os bot�es liberados tem r�tulo: [ - ] ou [ + ] .')
}

function dobram2() {
    if (dobra1 == 1 || dobra2 == 1 || dobra3 == 1 || dobra4 == 1 || dobra5 == 1) {
        var testchei = (' ' + numero + naipe)
        if (cheiver.indexOf(testchei) >= 0)
            alert('RG 3.0 - INSTRU��ES :\n\n- Carta Impossivel de acontecer novamente na Rodada!\n   Selecione outra Carta, e...');
        else {
            cheiax();
        }
    }
    else
        alert('BOT�O DOBRA CHEIA :\n\n- Dispon�vel somente quando ap�s (Trocar Cartas)\n   o resultado for maior ou igual a Duas Duplas.\n- O bot�o liberado tem r�tulo: [ Cheia ] .')
}

function cheiax(){
    dob = 'x1'; cart = 1;
    Reg21.src = '/_Library/botdr.gif';
    Reg26.src = '/_Library/botcv.gif'; Reg24.src = '/_Library/botmv.gif'; Reg25.src = '/_Library/botmv.gif'
    if (dobra5 == 1) {
        dobra5 = 0; myPrepGo();
        document.getElementById("HFPCert").value = "2";
        document.getElementById("HFco1").value = dob;
        document.getElementById("HFco2").value = numero;
        document.getElementById("HFco3").value = naipe;
        OqueFaz = 14
        return true;
    //var co = RSExecute(serverURL, 'Method7', dob, numero, naipe, mySeventhBack, errorCallBack, 'RSExecute')
    }
    if (dobra4 == 1) {
        dobra4 = 0; myPrepGo();
        document.getElementById("HFPCert").value = "2";
        document.getElementById("HFco1").value = dob;
        document.getElementById("HFco2").value = numero;
        document.getElementById("HFco3").value = naipe;
        OqueFaz = 12
        return true;
    //var co = RSExecute(serverURL, 'Method8', dob, numero, naipe, mySixthBack, errorCallBack, 'RSExecute')
    }
    if (dobra3 == 1) {
        dobra3 = 0; myPrepGo();
        document.getElementById("HFPCert").value = "2";
        document.getElementById("HFco1").value = dob;
        document.getElementById("HFco2").value = numero;
        document.getElementById("HFco3").value = naipe;
        OqueFaz = 10
        return true;
    //var co = RSExecute(serverURL, 'Method7', dob, numero, naipe, myFifthBack, errorCallBack, 'RSExecute')
    }
    if (dobra2 == 1) {
        dobra2 = 0; myPrepGo();
        document.getElementById("HFPCert").value = "2";
        document.getElementById("HFco1").value = dob;
        document.getElementById("HFco2").value = numero;
        document.getElementById("HFco3").value = naipe;
        OqueFaz = 8
        return true;
    //var co = RSExecute(serverURL, 'Method8', dob, numero, naipe, myFourthBack, errorCallBack, 'RSExecute')
    }
    if (dobra1 == 1) {
        dobra1 = 0; myPrepGo();
        document.getElementById("HFPCert").value = "2";
        document.getElementById("HFco1").value = dob;
        document.getElementById("HFco2").value = numero;
        document.getElementById("HFco3").value = naipe;
        OqueFaz = 6
        return true;
    //var co = RSExecute(serverURL, 'Method7', dob, numero, naipe, myThirdBack, errorCallBack, 'RSExecute')
    }
}

function errorCallBack(msg) {
    alert("RG 3.0 - ERRO: (" + msg + ")\n\n" +
        "Prov�veis Causa:\n" +
        "1 - A conex�o Internet teve problemas ou foi interrompida.\n" +
        "2 - A conex�o Internet esteve ociosa por mais de 20 minutos.\n" +
        "Dicas de Corre��o:\n" +
        "1a - Recarregue o Site e tente novamente (Ctrl + F5).\n" +
        "2a - Navegue exclusivamente pelos bot�es do \"Sabich�o Web\".\n" +
        "Se o problema persistir contate-nos via E-mail.");
    return true;
}

function regras1() { if (jogo == 0) Reg00.src = "/_Library/ficha0.gif"}

function regras2() { if (jogo == 0) Reg00.src = "/_Library/ficha00.gif"}

function click_me(){
    if (event.button > 1) alert("RG 3.0 - Informa��o (�_�):\n\nOpss - Utilize somente o bot�o esquerdo do mouse")
}

	onerror = errorCallBack
	document.onmousedown = click_me

//-->