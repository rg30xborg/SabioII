<!--//

function Aniqu1(){
	setTimeout("parent.window.close()", 3000)
}

function addFavor1(){
	window.external.AddFavorite("http://www.aggora.com.br/sabio", "SABICH�O - Um desafio aos seus Conhecimentos")
}

function Ddhoje(){
	var months=new Array(13)
	months[1]="Janeiro"
	months[2]="Fevereiro"
	months[3]="Mar&ccedil;o"
	months[4]="Abril"
	months[5]="Maio"
	months[6]="Junho"
	months[7]="Julho"
	months[8]="Agosto"
	months[9]="Setembro"
	months[10]="Outubro"
	months[11]="Novembro"
	months[12]="Dezembro"
	var time=new Date()
	var lmonth=months[time.getMonth() + 1]
	var date=time.getDate()
	var year=time.getYear()
	if(year < 2000) year = year + 1900
	document.write(date  + " de " + lmonth + " de " + year)
}

function click_me(){
    if (event.button > 1) alert("RG 3.0 - Informa��o (�_�):\n\nOpss - Utilize somente o bot�o esquerdo do mouse")
}
	document.onmousedown=click_me

//-->