<!--//

function Envia1(j){
	
 	nome = j.Contato.value
	empresa = j.Empr.value
 	mail = j.E_mail.value
	fone = j.Fone.value
	if(j.Cntt[0].checked && fone == ''){
		alert("RG 3.0 - DADOS INCOMPLETOS:\n\nVocê optou por entrarmos em contato por Telefone\ne não marcou o DDD e Número na opção [4]\n\n... Acrescente-o e após isto tente novamente.      Grato.")
		return false
	}
	if(j.Cntt[1].checked && mail == ''){
		alert("RG 3.0 - DADOS INCOMPLETOS:\n\nVocê optou por entrarmos em contato por E-mail\ne não marcou o Endereço na opção [2]\n\n... Acrescente-o e após isto tente novamente.      Grato.")
		return false
	}
	if(nome != '' && mail != '' && mail.indexOf("@") > 0 && empresa != ''){
		// j.botao.src = "images/bot0pg.gif"
		alert('Caro ' + nome + '.\n\nA RG 3.0 agradece sua remessa e retornaremos seu contato\n' + ((j.Cntt[0].checked) ?  'por telefone no número: ' + fone : 'por E-mail no endereço: ' + mail))
		return true
	}
	else{ alert("RG 3.0 - DADOS INCOMPLETOS:\nVerifique uma das opções do Formulário:\n\n1 - Nome = " 
		+ nome + "\n2 - E-mail = " + (mail.indexOf("@") < 0 ? mail + " - (Provável Endereço Incorreto)" : mail) +  "\n3 - Empresa = " + empresa + ".\n\n... Após isto tente novamente.      Grato.")
		return false
	}
}

function click_me(){
    if (event.button > 1) alert("RG 3.0 - Informação (º_º):\n\nOpss - Utilize somente o botão esquerdo do mouse")
}
	document.onmousedown=click_me

//-->