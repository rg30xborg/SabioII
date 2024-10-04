<!--//

function menu1c1(){
	Py3.style.visibility = 'hidden'; Py2.style.visibility = '';
}

function menu1b1(){
	Py2.style.visibility = 'hidden'; Py1.style.visibility = '';
}

function menu1b2(){
	Py2.style.visibility = 'hidden'; Py3.style.visibility = '';
}

function menu1a1(){
	Py1.style.visibility = 'hidden'; Py2.style.visibility = '';
}

function menu1(){
	document.getElementById('Rot1').style.backgroundImage = 'images/bt1a.gif';
	document.getElementById('Rot2').style.backgroundImage = 'images/bt1.gif';
	document.getElementById('Rot3').style.backgroundImage = 'images/bt1.gif';
	//Rot1.background = 'images/bt1a.gif'; Rot2.background = 'images/bt1.gif'; Rot3.background = 'images/bt1.gif';
	Ly1.style.visibility = Ly2.style.visibility = 'hidden'; Ly0.style.visibility = '';
}

function menu2(){
	document.getElementById('Rot2').style.backgroundImage = 'images/bt1a.gif';
	document.getElementById('Rot1').style.backgroundImage = 'images/bt1.gif';
	document.getElementById('Rot3').style.backgroundImage = 'images/bt1.gif';
	//Rot2.background = 'images/bt1a.gif'; Rot3.background = 'images/bt1.gif'; Rot1.background = 'images/bt1.gif';
	Ly0.style.visibility = Ly2.style.visibility = 'hidden'; Ly1.style.visibility = '';
}

function menu3(){
	document.getElementById('Rot3').style.backgroundImage = 'images/bt1a.gif';
	document.getElementById('Rot2').style.backgroundImage = 'images/bt1.gif';
	document.getElementById('Rot1').style.backgroundImage = 'images/bt1.gif';
	//Rot3.background = 'images/bt1a.gif'; Rot2.background = 'images/bt1.gif'; Rot1.background = 'images/bt1.gif'
	Ly0.style.visibility = Ly1.style.visibility = 'hidden'; Ly2.style.visibility = '';
}

function linkar(src)
{
    if (event.srcElement.tagName == 'TD') parent.main.location.href = src;                              //'http://www.aggora.com.br/sabio/1/' + 
}

function linka(src)
{
    if (event.srcElement.tagName == 'TD') parent.main.location.href = 'tema' + src + '/Sabio01.aspx'     //http://www.aggora.com.br/sabio/1/
}

if(top.frames.super1.LogOK) top.frames.super1.LogOK.style.visibility = ''

function click_me(){
    if (event.button > 1) alert("RG 3.0 - Informação (º_º):\n\nOpss - Utilize somente o botão esquerdo do mouse");
}
	document.onmousedown = click_me;
//-->


