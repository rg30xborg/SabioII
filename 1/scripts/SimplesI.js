<!--//

function isEmpty(s){
	return ((s == null) || (s.length == 0))
}

function checkField(s){
	if ((s.indexOf("\'")>=0) || (s.indexOf("\"")>=0) || (s.indexOf(" ")>=0) || (s.indexOf("*")>=0) || (s.indexOf("?")>=0) || (s.indexOf("\\")>=0) || (s.indexOf("/")>=0) || (s.indexOf(":")>=0) || (s.indexOf("<")>=0) || (s.indexOf(">")>=0) || (s.indexOf("|")>=0)) {	
		return false
	}
	return true
}

function warnInvalid (theField, s, EmptyOK){
	theField.focus()
	theField.select()
		if (EmptyOK) {
			alert("RG 3.0 - DADOS INCORRETOS:\n\nO campo "+s+" contém caracteres inválidos !\nOs caracteres \' \" * ? \\ / : < > | e espaço não são aceitos pelo sistema.")
		} else {
			alert("RG 3.0 - DADOS INCOMPLETOS:\n\nO campo "+s+" deve ser preenchido !\nOs caracteres \' \" * ? \\ / : < > | e espaço não são aceitos pelo sistema.")
	}
	return false
}

function verifica(){
	if (!checkField(logonForm.userlogon.value) || isEmpty(logonForm.userlogon.value)) {
		warnInvalid (logonForm.userlogon, 'Seu Email', false)
		return false }
	if ((logonForm.userlogon.value).indexOf("@") < 0 || (logonForm.userlogon.value).length < 10) {
		alert('RG 3.0 - INFORMAÇÃO:\n\nO Endereço E-mail informado está incorreto !')
		return false }
	if (!checkField(logonForm.userpassw.value) || isEmpty(logonForm.userpassw.value)) {
		warnInvalid (logonForm.userpassw, 'Uma Senha', false)
		return false }
	if ((logonForm.userpassw.value).length < 6){
        alert('RG 3.0 - Solicitação (º_º):\n\nUtilize uma Senha com um mínimo de 6 caracteres!')
		return false }
	return true
}


	var x, y, step = 10, flag = 0
	var message = "Renovado "
	message = message.split("")

	var xpos=new Array()
	for (i=0;i<=message.length-1;i++) {
		xpos[i]=-50
	}

	var ypos=new Array()
	for (i=0;i<=message.length-1;i++) {
		ypos[i]=-50
	}

function handlerMM(e){
	x = (document.layers) ? e.pageX : document.body.scrollLeft+event.clientX
	y = (document.layers) ? e.pageY : document.body.scrollTop+event.clientY + 40
	flag=1
}

function makesnake() {
	if (flag==1 && document.all) {
    		for (i=message.length-1; i>=1; i--) {
   			xpos[i]=xpos[i-1]+step
			ypos[i]=ypos[i-1]
    		}
		xpos[0]=x+step
		ypos[0]=y
	
		for (i=0; i<message.length-1; i++) {
    			var thisspan = eval("span"+(i)+".style")
    			thisspan.posLeft=xpos[i]
			thisspan.posTop=ypos[i]
    		}
	}
	else if (flag==1 && document.layers) {
  	  	for (i=message.length-1; i>=1; i--) {
   			xpos[i]=xpos[i-1]+step
			ypos[i]=ypos[i-1]
    		}
		xpos[0]=x+step
		ypos[0]=y
	
		for (i=0; i<message.length-1; i++) {
    			var thisspan = eval("document.span"+i)
    			thisspan.left=xpos[i]
			thisspan.top=ypos[i]
    		}
	}
	var timer=setTimeout("makesnake()",10)
}

function noFoco(){
	if(logonForm.userlogon.value == "") logonForm.userlogon.focus()
	else logonForm.userpassw.focus()
}

function IniciaL(){
	for (i = 0; i <= message.length-1; i++) {
		document.write("<span id='span"+i+"' class='spanstyle'>")
		document.write(message[i])
		document.write("</span>")}

	if (document.layers){
		document.captureEvents(Event.MOUSEMOVE)}
}

function click_me(){
    if (event.button > 1) alert("RG 3.0 - Informação (º_º):\n\nOpss - Utilize somente o botão esquerdo do mouse")
}
	document.onmousedown=click_me
	document.onmousemove = handlerMM

//-->