<!--//

	lys = new Array()
	lys[-1] = new Array("fechar")
	lys[0] = new Array("salas", 140, "-")
	lys[1] = new Array("opcs", 70, "-")
	for(i = -1; i < lys.length; i++){
		n = lys[i][0]
		eval(n + "=new Image()")
		eval(n + ".src='images/bt_" + n + ".gif'")
	}

function ly(id, d){
	if(!d) d = document
	if(!(obj = d[id]) && d.all) obj = d.all[id]
	// for(i = 0; !obj && d.layers && i < d.layers.length; i++) obj = ly(id, d.layers[i].document)
	return obj
}

function af9(af6, dir, h){
	//pTop = "ly" + (af6-1) + ".style.pixelTop"
	pTop = "ly('ly'" + af6 + ").style.pixelTop"
	if(dir) eval(pTop + dir + "=" + 7)
	else return eval(pTop)
	setTimeout("af7(" + af6 + ")", 10)
}

function af7(af6){
	p = lys[af6 - 1]; h = (p[2] == "+") ? 0 : p[1]
	af10 = Math.abs(af9(af6)) != h
	if(af10) af9(af6, p[2], h)
	else {af11 = eval(((p[2] == "-") ? p[0] : "fechar") + ".src")
		ly('seta' + af6).src = af11
		p[2] = (p[2] == "-") ? "+" : "-" }
}

function mOvr(src,clrOver){
	if(!src.contains(event.fromElement)) src.bgColor = clrOver
}

function mOut(src,clrIn){
	if(!src.contains(event.toElement)) src.bgColor = clrIn
}

function linka(src){
	if(event.srcElement.tagName=='TD') parent.main.location.href = 'http://www.aggora.com.br/sabio/1/' + src
}

function linkar(src){
	if(event.srcElement.tagName=='TD') parent.main.location.href = 'http://www.aggora.com.br/sabio/1/tema' + src + '/sabio01.asp'
}

function menu1c(){
	Py3.style.visibility = 'hidden'; Py2.style.visibility = ''
}

function menu1b(){
	Py2.style.visibility = 'hidden'; Py1.style.visibility = ''
}

function menu2b(){
	Py2.style.visibility = 'hidden'; Py3.style.visibility = ''
}

function menu1a(){
	Py1.style.visibility = 'hidden'; Py2.style.visibility = ''
}

if(top.frames.super1.LogOK) top.frames.super1.LogOK.style.visibility = ''

function click_me(){
    if (event.button > 1) alert("RG 3.0 - Informa��o (�_�):\n\nOpss - Utilize somente o bot�o esquerdo do mouse")
}
	document.onmousedown = click_me
//-->