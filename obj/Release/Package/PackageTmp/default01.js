<!--//

	var sorte = 2 //Math.round(Math.random()) + 1
	//if(ScriptEngineMajorVersion() >= 5) 
    if (WinSab != null) WinSab.close(); 
    WinSab=window.open("1/sabichao" + sorte + ".html", "WinSab", "fullscreen=1");   //http://www.aggora.com.br/sabio/

    var AbreWin;
    function AbreJan(i, j, k) {
        if (AbreWin != null) AbreWin.close();
        str1 = "1/sorte/passa/sabio" + i; //http://www.aggora.com.br/sabio/
        str2 = "top=0,left=0,scrollbars=1,width=" + j + ",height=" + k;
        AbreWin = window.open(str1, "AbreWin", str2);
    }

    var WinSab;
    function myWin() {
        //if (WinSab != null) WinSab.close(); WinSab=window.open(this.href, '', 'fullscreen');
        if (WinSab != null) WinSab.close();
        sorte = 2;
        str1 = "1/sabichao" + sorte + ".html"
        str2 = "fullscren=1";
        WinSab = window.open(str1, "WinSab", str2);
    }

    function mOvr(src, clrOver) {
        if (!src.contains(event.fromElement)) {
            //src.style.cursor = 'hand'
            src.bgColor = clrOver
        }
    }

    function mOut(src, clrIn) {
        if (!src.contains(event.toElement)) {
            //src.style.cursor = 'default'
            src.bgColor = clrIn
        }
    }
    
    function click_me() {
        if (event.button > 1) alert("RG 3.0 - Informação (º_º):\n\nOpss - Utilize somente o botão esquerdo do mouse")
    }
    
    function errorCallBack(msg, url, line) {
        alert("RG 3.0 - ERRO: (" + msg + ")\n\n" +
            "Prováveis Causa:\n" +
            "1 - A conexão Internet teve problemas ou foi interrompida.\n" +
            "2 - A conexão Internet esteve ociosa por mais de 20 minutos.\n" +
            "3 - Acesse www.java.com/pt_BR e instale o plug-in Java da SUN.\n" +
            "Dicas de Correção:\n" +
            "1a - Clique em [Control] acima, tecle [F5] e tente novamente.\n" +
            "2a - Navegue exclusivamente pelos botões do \"Sabichão Web\".\n" +
            "Se o problema persistir contate-nos via E-mail.");
        return true;
    }

    var ieBlink = true; //(document.all)?true:false; var cBlink = 0;
    var cBlink = 0;
    var obj = document.getElementsByTagName('blink');
    function doBlink() {
        cBlink++;
        if (ieBlink && cBlink > 50 && cBlink < 150) {
            for (i = 0; i < obj.length; i++) { tag = obj[i]; tag.style.visibility = (tag.style.visibility == 'hidden' || cBlink >= 149) ? 'visible' : 'hidden'; }
        }
        else
            clearInterval(doBlink);
    }

    onerror = errorCallBack;
    document.onmousedown = click_me;

//-->