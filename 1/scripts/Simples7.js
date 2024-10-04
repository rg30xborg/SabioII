<!--//

function onBotao(){ document.botao.src = "../images/cont000.gif" }

function ofBotao() { document.botao.src = "../images/cont001.gif" }

function PlaySound(soundObj) {
    var sound = document.getElementById(soundObj);
    sound.play();
}

function Aviso2(som,num){
	if(eval("parent.frames.left.t" + num)) eval("parent.frames.left.t" + num).innerText = (num < 10 ? "0" + num : num)
	if(eval("parent.frames.left.d" + num)) eval("parent.frames.left.d" + num).style.backgroundImage = "url(/sabio/1/images/menu03.gif)"
    PlaySound(som);
}

function click_me(){
    if (event.button > 1) alert("RG 3.0 - Informação (º_º):\n\nOpss - Utilize somente o botão esquerdo do mouse")
}

	document.onmousedown=click_me

//-->
