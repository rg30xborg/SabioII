<!--//

function Envia1(j){
	
 	nome = j.Contato.value
	empresa = j.Empr.value
 	mail = j.E_mail.value
	fone = j.Fone.value
	if(j.Cntt[0].checked && fone == ''){
		alert("RG 3.0 - DADOS INCOMPLETOS:\n\nVoc� optou por entrarmos em contato por Telefone\ne n�o marcou o DDD e N�mero na op��o [4]\n\n... Acrescente-o e ap�s isto tente novamente.      Grato.")
		return false
	}
	if(j.Cntt[1].checked && mail == ''){
		alert("RG 3.0 - DADOS INCOMPLETOS:\n\nVoc� optou por entrarmos em contato por E-mail\ne n�o marcou o Endere�o na op��o [2]\n\n... Acrescente-o e ap�s isto tente novamente.      Grato.")
		return false
	}
	if(nome != '' && mail != '' && mail.indexOf("@") > 0 && empresa != ''){
		// j.botao.src = "images/bot0pg.gif"
		alert('Caro ' + nome + '.\n\nA RG 3.0 agradece sua remessa e retornaremos seu contato\n' + ((j.Cntt[0].checked) ?  'por telefone no n�mero: ' + fone : 'por E-mail no endere�o: ' + mail))
		return true
	}
	else{ alert("RG 3.0 - DADOS INCOMPLETOS:\nVerifique uma das op��es do Formul�rio:\n\n1 - Nome = " 
		+ nome + "\n2 - E-mail = " + (mail.indexOf("@") < 0 ? mail + " - (Prov�vel Endere�o Incorreto)" : mail) +  "\n3 - Empresa = " + empresa + ".\n\n... Ap�s isto tente novamente.      Grato.")
		return false
	}
}

function click_me(){
    if (event.button > 1) alert("RG 3.0 - Informa��o (�_�):\n\nOpss - Utilize somente o bot�o esquerdo do mouse")
}
	document.onmousedown=click_me

//-->