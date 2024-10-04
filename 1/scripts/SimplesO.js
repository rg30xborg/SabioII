<!--//

	var txt0 = 1;

function Abertura(){
	if(txt0 < 5){
		if(txt0 == 4){
			abert.innerText = "... O SITE VAI PROCURAR CONTEкDO NO INTERNAUTA.";
			txt0 ++; setTimeout("Abertura()", 5000);
		}
		if(txt0 == 3){
			abert.innerText = "... MAS AGORA ...";
			txt0 ++; setTimeout("Abertura()", 2500);
		}
		if(txt0 == 2){
			abert.innerText = "TODO INTERNAUTA PROCURA CONTEкDO EM UM SITE ...";
			txt0 ++; setTimeout("Abertura()", 5000);
		}
		if(txt0 == 1){
			abert.innerText = "DICA: TECLE F11 PARA TELA CHEIA";
			txt0 ++; setTimeout("Abertura()", 5000);
		}
	}
    else location.href = "Sabio01.aspx";  //http://www.aggora.com.br/sabio/1/
}

function click_me(){
	if (event.button > 1) 
        alert("RG 3.0 - Informaчуo (К_К):\n\nOpss - Utilize somente o botуo esquerdo do mouse");
}
	document.onmousedown = click_me;

//-->