<!--//

function addFavor1(){
	window.external.AddFavorite("http://www.aggora.com.br/sabio", "SABICH�O - Um desafio aos seus Conhecimentos")
}

function Aviso2(){
	//if((this.location.href).IndexOf("aggora") < 0) location.href = "http://www.aggora.com.br/sabio/help.htm"
    //else {
        NCalc.innerText = " "; Reg16.innerText = "RG SABICH�O WEB - Borg, todos os direitos reservados"
		init()
		starter()
	//}
}

function alocar1(sndAction,sndObj){ sndObj = "document." + sndObj
	if (eval(sndObj) != null){
		if (eval(sndObj + ".Filename")) eval(sndObj + ((sndAction == 'stop') ? '.stop()' : '.play()'))}
}

	var gImageOffset, gStartButtonPressed, pman_timerID = pcontrol_timerID = null, pman_timerINT = 300
	var pman_acti = pman_ptnflg = pman_myX = pman_myY = pman_myPOS = pman_score = pman_ofno = 0
	var pman_bluewait = pman_blueacti = pman_URAflag = pcontrol_inkey = pman_acno = pman_enno = 0
	var pman_blueflag = pman_URAWAZA = 1, pman_myPTN = 4, pman_myPOSold = 313, pman_remain = 157
	var pcontrol_timerINT = 20, gScoreCleared = true, pcontrol_tkey = "1"
	var pman_bonus = 100, tenkey_value = CTRL_value = ""
	var pman_tmps = new Array(20), pman_icons = new Array(20), pman_mapd = new Array(420), pman_oldDOT = new Array(5)
	var pman_enewait = new Array(5), pman_eneacti = new Array(5), pman_eneX = new Array(5)
	var pman_eneY = new Array(5), pman_enePOS = new Array(5), pman_enePOSold = new Array(5)
            
	pman_icons[0] = new Image(); pman_icons[0].src = "bl0.gif"
	pman_icons[1] = new Image(); pman_icons[1].src = "bl2.gif"
	pman_icons[2] = new Image(); pman_icons[2].src = "dots.gif"
	pman_icons[3] = new Image(); pman_icons[3].src = "dotl.gif"
	pman_icons[4] = new Image(); pman_icons[4].src = "pman0.gif"
	pman_icons[5] = new Image(); pman_icons[5].src = "pman1.gif"
	pman_icons[6] = new Image(); pman_icons[6].src = "pman2.gif"
	pman_icons[7] = new Image(); pman_icons[7].src = "pman3.gif"
	pman_icons[8] = new Image(); pman_icons[8].src = "pman4.gif"
	pman_icons[9] = new Image(); pman_icons[9].src = "bl1.gif"
	pman_icons[10]= new Image(); pman_icons[10].src= "enemy1.gif"
	pman_icons[11]= new Image(); pman_icons[11].src= "enemy2.gif"
	pman_icons[12]= new Image(); pman_icons[12].src= "enemy3.gif"
	pman_icons[13]= new Image(); pman_icons[13].src= "enemy4.gif"
	pman_icons[14]= new Image(); pman_icons[14].src= "enemy5.gif"

	pcontrol_systm = ""
	pcontrol_ver = navigator.appVersion
	pcontrol_Nv = pcontrol_ver.charAt(0)
	pcontrol_len = pcontrol_ver.length

	for(pcontrol_iln = 0; pcontrol_iln < pcontrol_len; pcontrol_iln++)
		if(pcontrol_ver.charAt(pcontrol_iln) == "(") break

	pcontrol_systm = pcontrol_ver.charAt(pcontrol_iln+1).toUpperCase()

	if (pcontrol_systm != "C"){
		if (pcontrol_Nv >= 4){
			document.onkeydown = keyDown
			document.captureEvents(Event.KEYDOWN)
		}
	}

function keyDown(DnEvents){
	var k
	if(pcontrol_systm != "C" && pcontrol_Nv >= 4){
		k = DnEvents.which
		if(k == 38 || k == 56) keyscan(2)	//'8' up
		if(k == 40 || k == 50) keyscan(4)	//'2' down
		if(k == 37 || k == 52) keyscan(1)	//'4' left
		if(k == 39 || k == 54) keyscan(3)	//'6' right
	}
	else{
		k = document.Script.event.keyCode
		//if (k == 38 || k == 104) keyscan(2)
		//if (k == 40 || k == 98)  keyscan(4)
		//if (k == 37 || k == 100) keyscan(1)
		//if (k == 39 || k == 102) keyscan(3)
		if (k == 38 || k == 87) keyscan(2) //'8' up
		if (k == 40 || k == 88)  keyscan(4) //'2' down
		if (k == 37 || k == 65) keyscan(1) //'4' left
		if (k == 39 || k == 68) keyscan(3) //'6' right
	}
}

function intSTOP(){
	clearTimeout(pcontrol_timerID)
}

function starter(){
	Reg21.style.visibility = "hidden"
	gStartButtonPressed = true
	if(false == gScoreCleared){
		tenkey_value=""
		intSTOP()
		Reg16.innerText = "0 blz" // Click START
		gScoreCleared = true
	}
	CTRL_value = "11"
}

function keyscan(kscan){
	var tmpvalue = CTRL_value
	if(gScoreCleared){
		pcontrol_tkey = ""
		tenkey_value = ""
		gScoreCleared = false
		pcontrol_timerID = setTimeout("interval1()", pcontrol_timerINT)
		tmpvalue = "11"
	}
	pcontrol_inkey = kscan
	if(false == gScoreCleared){
		if (tmpvalue != "0") CTRL_value = pcontrol_inkey
	}
}

function restarter(){
	CTRL_value = "0"
	tmpacti = "0"
	readstyle()
	PARAset()
}

function init(){
	PARAset()
	starter()
}

function PARAset(){
	pman_score = 0
	pman_remain = 157
	pman_myX = 9
	pman_myY = 16
	pman_myPOSold = 313
	pman_ptnflg = 0
	pman_enewait[1] = 0
	pman_enewait[2] = 10
	pman_enewait[3] = 20
	pman_enewait[4] = 30
	pman_eneacti[1] = 1
	pman_eneacti[2] = 2
	pman_eneacti[3] = 1
	pman_eneacti[4] = 2
	pman_eneX[1] = 9
	pman_eneY[1] = 8
	pman_eneX[2] = 8
	pman_eneY[2] = 10
	pman_eneX[3] = 9
	pman_eneY[3] = 10
	pman_eneX[4] = 10
	pman_eneY[4] = 10
	pman_enePOSold[1] = 161
	pman_enePOSold[2] = 198
	pman_enePOSold[3] = 199
	pman_enePOSold[4] = 200
	pman_oldDOT[1] = 0
	pman_oldDOT[2] = 0
	pman_oldDOT[3] = 0
	pman_oldDOT[4] = 0
	pman_bluewait = 0
	pman_blueflag = 1
	pman_blueacti = 0
	pman_bonus = 100
	pman_URAWAZA = 1
	pman_URAflag = 0
}


function interval1(){    
	tmpacti = CTRL_value
	clearTimeout(pman_timerID)
	pman_timerID = setTimeout("interval1()", pman_timerINT)
	if(tmpacti == "11"){
		tmpURA = Reg16.innerText
		pman_URAWAZA = 1
		pman_URAflag = 0
		if(tmpURA == "EASY") pman_URAWAZA = 4
		if(tmpURA == "EASIEST") pman_URAWAZA = 2
		if(pman_score == 0 || !gStartButtonPressed){
			CTRL_value = "1"
			tmpacti = "1"
		}
		else{
			gStartButtonPressed = false;
			restarter()
		}
	}
	if(tmpacti != "0"){
		pman_blueflag = 1
		if(pman_bluewait > 0){
			pman_bluewait = pman_bluewait - 1
			pman_blueflag=-1
		}
		else pman_blueacti = 0
		if(tmpacti == "1"){
			tmppos = pman_myY * 19 + pman_myX - 1
			if(pman_mapd[tmppos] != 1) pman_acti = 1
			if (pman_myX == 0) pman_acti = 1
		}
		if(tmpacti == 3){
			tmppos = pman_myY * 19 + pman_myX + 1
			if(pman_mapd[tmppos] != 1) pman_acti = 3
			if(pman_myX == 18) pman_acti = 3
		}
		if(tmpacti == 2){
			tmppos = pman_myY * 19 - 19 + pman_myX
			if (pman_mapd[tmppos] != 1) pman_acti = 2
		}
		if(tmpacti == 4){
			tmppos = pman_myY * 19 + 19 + pman_myX
			if(pman_mapd[tmppos] != 1) pman_acti = 4
		}
		if(pman_acti == 1){
			tmppos = pman_myY * 19 + pman_myX - 1
			if(pman_mapd[tmppos] != 1) pman_myX = pman_myX - 1
			else{
				if(pman_myX == 0) pman_myX = 18
				else{
					if(pman_mapd[tmppos-18] != 1){
						pman_acti = 2
						tenkey_value = "8"
					}
					else{
						pman_acti = 4
						tenkey_value = "2"
					}
				}
			}
		}
		if(pman_acti == 3){
			tmppos = pman_myY * 19 + pman_myX + 1
			if(pman_mapd[tmppos] != 1) pman_myX = pman_myX + 1
			else{
				if(pman_myX == 18) pman_myX = 0
				else{
					if(pman_mapd[tmppos-20] != 1){
						pman_acti = 2
						tenkey_value = "8"
					}
					else{
						pman_acti=4
						tenkey_value="2"
					}
				}
			}
		}
		if(pman_acti == 2){
			tmppos = pman_myY * 19 - 19 + pman_myX
			if(pman_mapd[tmppos] != 1) pman_myY = pman_myY - 1
			else{
				if(pman_mapd[tmppos+18] != 1){
					pman_acti = 1
					pman_myX = pman_myX - 1
					tenkey_value = "4"
				}
				else{
					pman_acti=3
					pman_myX=pman_myX+1
					tenkey_value="6"
				}
			}
		}
		if(pman_acti == 4){
			tmppos = pman_myY * 19 + 19 + pman_myX
			if(pman_mapd[tmppos] != 1) pman_myY = pman_myY + 1
			else{
				if(pman_mapd[tmppos-20] != 1){
					pman_acti = 1
					pman_myX = pman_myX - 1
					tenkey_value = "4"
				}
				else{
					pman_acti = 3
					pman_myX = pman_myX + 1
					tenkey_value = "6"
				}
			}
		}
		pman_myPOS = pman_myY * 19 + pman_myX
		pman_ptnflg = pman_ptnflg + 1
		pman_myPTN = 4
		if(pman_ptnflg == 2) pman_ptnflg = 0
		else pman_myPTN = 4 + pman_acti

		tmpURAflag = 1
		pman_URAflag = pman_URAflag + 1
		if(pman_URAflag >= pman_URAWAZA){
			tmpURAflag = 0
			pman_URAflag = 0
		}
		if(pman_URAWAZA == 1) tmpURAflag = 1
		if(pman_blueflag == -1){
			pman_blueacti = pman_blueacti + 1
			if(pman_blueacti == 2) pman_blueacti = 0
		}
		for(ij = 1; ij < 5; ij++){
			pman_enno = ij
			if(pman_blueacti !=1) if(tmpURAflag == 1) calenemy()
			pman_enePOS[ij] = pman_eneY[ij] * 19 + pman_eneX[ij]
		}
		if(pman_mapd[pman_myPOS] == 2){
			pman_mapd[pman_myPOS] = 0
			pman_remain = pman_remain - 1
			pman_score = pman_score + 10
		}
		if(pman_mapd[pman_myPOS] == 3){
			pman_mapd[pman_myPOS] = 0
			pman_remain = pman_remain - 1
			pman_bluewait = 30
			pman_blueacti = 0
			pman_bonus = 100
			pman_score = pman_score + 50
		}

		Reg16.innerText = pman_score + " blz"
		for(iz = 1; iz < 5; iz++){
			if(pman_enePOSold[iz] == pman_myPOS)
				if (pman_enePOS[iz] == pman_myPOSold) pman_enePOS[iz] = pman_myPOS
			if(pman_enePOS[iz] == pman_myPOS){
				if (pman_blueflag == 1){
					CTRL_value = "0"; Reg21.style.visibility = ""
					if( navigator.appName == "Netscape" ) Reg16.innerText = pman_score + " blz. Fim de Jogo!"
					else Reg16.innerText = "Total : " + pman_score + " blz. Fim de Jogo!"
				}
				else{
					pman_enewait[iz] = 5
					pman_enePOS[iz] = 199
					pman_eneX[iz] = 9
					pman_eneY[iz] = 10
					pman_eneacti[iz] = 1
					pman_score = pman_score + pman_bonus
					pman_bonus = pman_bonus * 2
					Reg16.innerText = pman_score + " blz"
				}
			}
		}
		if(pman_remain == 0){
			CTRL_value = "0"
			Reg16.innerText = pman_score + " blz OK"
		}
		SetIcon(0,pman_myPOSold)
		for(ij = 1; ij < 5; ij++) SetIcon(pman_oldDOT[ij],pman_enePOSold[ij])
		pman_mapd[pman_myPOS] = 0
		SetIcon(pman_myPTN,pman_myPOS)
		pman_myPOSold = pman_myPOS
		for(ij = 1; ij < 5; ij++){
			tmpenePOS=pman_enePOS[ij]
			pman_oldDOT[ij] = pman_mapd[tmpenePOS]
			tmpenePTN = 14
			if(pman_bluewait == 0) tmpenePTN = 9 + ij
			if(pman_bluewait == 2) tmpenePTN = 9 + ij
			if(pman_bluewait == 4) tmpenePTN = 9 + ij
			if(pman_bluewait == 6) tmpenePTN = 9 + ij
			if(pman_bluewait == 8) tmpenePTN = 9 + ij
			if(pman_bluewait == 10) tmpenePTN = 9 + ij
			SetIcon(tmpenePTN,tmpenePOS)
			pman_enePOSold[ij] = pman_enePOS[ij]
		}
	}
}

function SetIcon(flag, position){
	document.images[position + gImageOffset].src = pman_icons[flag].src
}

function readstyle(){
	for(id = 0; id < 22; id++){
		for(ie = 0; ie < 19; ie++){
			ig = pman_tmps[id].charAt(ie)
			ih = id * 19 + ie
			if(ig == "0") pman_mapd[ih] = 0
			if(ig == "1") pman_mapd[ih] = 1
			if(ig == "2") pman_mapd[ih] = 2
			if(ig == "3") pman_mapd[ih] = 3
			SetIcon (pman_mapd[ih],ih);
		}
	}
	SetIcon(9,180)  // 180 = 9*19 + 9
	SetIcon(10,161) // 161 = 8*19 + 9
	SetIcon(11,198) // 198 = 10*19 + 8
	SetIcon(12,199) // 199 = 10*19 + 9
	SetIcon(13,200) // 200 = 10*19 + 10
	SetIcon(5,313)  // 313 = 16*19 + 9
}


function calenemy(){
	if(pman_enewait[pman_enno] >= 1){
		if(pman_enewait[pman_enno] == 1){
			SetIcon(pman_oldDOT[pman_enno],pman_enePOSold[pman_enno])
			pman_eneX[pman_enno] = 9
			pman_eneY[pman_enno] = 8
		}
		pman_enewait[pman_enno] = pman_enewait[pman_enno] - 1
	}
	else{
		if(pman_enno == 1) enetype1()
		if(pman_enno == 2) enetype2()
		if(pman_enno == 3) enetype3()
		if(pman_enno == 4) enetype4()
	}
}

function offsetcal(pman_acno){
	if(pman_acno == 1) pman_ofno = -1
	if(pman_acno == 2) pman_ofno = -19
	if(pman_acno == 3) pman_ofno = 1
	if(pman_acno == 4) pman_ofno = 19
}

function eneXYcal(){
	if(pman_eneacti[pman_enno] == 1) pman_eneX[pman_enno] = pman_eneX[pman_enno] - 1
	if(pman_eneacti[pman_enno] == 2) pman_eneY[pman_enno] = pman_eneY[pman_enno] - 1
	if(pman_eneacti[pman_enno] == 3) pman_eneX[pman_enno] = pman_eneX[pman_enno] + 1
	if(pman_eneacti[pman_enno] == 4) pman_eneY[pman_enno] = pman_eneY[pman_enno] + 1
}

function enetype1(){
	tmpLR = 0
	tmpeneacti1 = pman_eneacti[pman_enno] + 1
	if(tmpeneacti1 >= 5) tmpeneacti1 = tmpeneacti1 - 4
	offsetcal(tmpeneacti1)
	tmpenepos = pman_eneY[pman_enno] * 19 + pman_eneX[pman_enno] + pman_ofno
	if(pman_mapd[tmpenepos] != 1) tmpLR = 1
	tmpeneacti1 = pman_eneacti[pman_enno] + 3
	if(tmpeneacti1 >= 5) tmpeneacti1 = tmpeneacti1 - 4
	offsetcal(tmpeneacti1)
	tmpenepos = pman_eneY[pman_enno] * 19 + pman_eneX[pman_enno] + pman_ofno
	if(pman_mapd[tmpenepos] != 1)  tmpLR = 1
	if(pman_eneX[pman_enno] == 18) tmpLR = 1
	if(pman_eneX[pman_enno] == 0)  tmpLR = 1
	if(tmpLR == 1){
		pman_eneacti[pman_enno] = 0
		if(pman_myX*pman_blueflag >= pman_eneX[pman_enno]*pman_blueflag){
			tmpenepos = pman_eneY[pman_enno] * 19 + pman_eneX[pman_enno] + 1
			if(pman_mapd[tmpenepos] != 1) pman_eneacti[pman_enno] = 3
		}
		else{
			tmpenepos = pman_eneY[pman_enno] * 19 + pman_eneX[pman_enno] - 1
			if(pman_mapd[tmpenepos] != 1) pman_eneacti[pman_enno] = 1
		}
		tmpsubY = pman_myY - pman_eneY[pman_enno]
		if(tmpsubY <= 0) tmpsubY=-tmpsubY
		tmpsubX = pman_myX - pman_eneX[pman_enno]
		if(tmpsubX <= 0) tmpsubX=-tmpsubX
		tmpsubXY = tmpsubY - tmpsubX
		if(pman_eneacti[pman_enno] == 0) tmpsubXY = 1
		if(tmpsubXY*pman_blueflag >= 0){
			if(pman_myY*pman_blueflag >= pman_eneY[pman_enno]*pman_blueflag){
				tmpenepos = pman_eneY[pman_enno] * 19 + pman_eneX[pman_enno] + 19
				if(pman_mapd[tmpenepos] != 1) pman_eneacti[pman_enno] = 4
			}
			else{
				tmpenepos = pman_eneY[pman_enno] * 19 + pman_eneX[pman_enno] - 19
				if(pman_mapd[tmpenepos] != 1) pman_eneacti[pman_enno] = 2
			}
		}
		if(pman_eneacti[pman_enno] == 0){
			tmpenepos = pman_eneY[pman_enno] * 19 + pman_eneX[pman_enno] - 1
			if(pman_mapd[tmpenepos] != 1) pman_eneacti[pman_enno] = 1
			if(pman_eneacti[pman_enno] == 0){
				tmpenepos = pman_eneY[pman_enno] * 19 + pman_eneX[pman_enno] - 19
				if(pman_mapd[tmpenepos] != 1) pman_eneacti[pman_enno] = 2
				if(pman_eneacti[pman_enno] == 0){
					tmpenepos = pman_eneY[pman_enno] * 19 + pman_eneX[pman_enno] + 1
					if (pman_mapd[tmpenepos] != 1) pman_eneacti[pman_enno] = 3
					else pman_eneacti[pman_enno] = 4
				}
			}
		}
	}
	eneXYcal()
}

function enetype2(){
	offsetcal(pman_eneacti[pman_enno])
	tmpenepos = pman_eneY[pman_enno] * 19 + pman_eneX[pman_enno] + pman_ofno
	if(pman_mapd[tmpenepos] == 1){
		pman_eneacti[pman_enno] = 0
		if(pman_myX*pman_blueflag >= pman_eneX[pman_enno]*pman_blueflag){
			tmpenepos = pman_eneY[pman_enno] * 19 + pman_eneX[pman_enno] + 1
			if(pman_mapd[tmpenepos] != 1) pman_eneacti[pman_enno] = 3
		}
		else{
			tmpenepos = pman_eneY[pman_enno] * 19 + pman_eneX[pman_enno] - 1
			if(pman_mapd[tmpenepos] != 1) pman_eneacti[pman_enno] = 1
		}
		tmpsubY = pman_myY - pman_eneY[pman_enno]
		if(tmpsubY <= 0) tmpsubY=-tmpsubY
		tmpsubX = pman_myX - pman_eneX[pman_enno]
		if(tmpsubX <= 0) tmpsubX=-tmpsubX
		tmpsubXY = tmpsubY - tmpsubX
		if(pman_eneacti[pman_enno] == 0) tmpsubXY = 1
		if(tmpsubXY*pman_blueflag >= 0){
			if(pman_myY*pman_blueflag >= pman_eneY[pman_enno]*pman_blueflag){
				tmpenepos = pman_eneY[pman_enno] * 19 + pman_eneX[pman_enno] + 19
				if(pman_mapd[tmpenepos] != 1) pman_eneacti[pman_enno] = 4
			}
			else{
				tmpenepos = pman_eneY[pman_enno] * 19 + pman_eneX[pman_enno] - 19
				if(pman_mapd[tmpenepos] != 1) pman_eneacti[pman_enno] = 2
			}
		}
		if(pman_eneacti[pman_enno] == 0){
			tmpenepos = pman_eneY[pman_enno] * 19 + pman_eneX[pman_enno] - 1
			if(pman_mapd[tmpenepos] != 1) pman_eneacti[pman_enno] = 1
			if (pman_eneacti[pman_enno] == 0){
				tmpenepos = pman_eneY[pman_enno] * 19 + pman_eneX[pman_enno] - 19
				if(pman_mapd[tmpenepos] != 1) pman_eneacti[pman_enno] = 2
				if(pman_eneacti[pman_enno] == 0){
					tmpenepos=pman_eneY[pman_enno]*19+pman_eneX[pman_enno]+1
					if(pman_mapd[tmpenepos] != 1) pman_eneacti[pman_enno] = 3
					else pman_eneacti[pman_enno] = 4
				}
			}
		}
	}
	eneXYcal()
}

function enetype3(){
	tmpeneacti1 = pman_eneacti[pman_enno] + 1
	if(tmpeneacti1 >= 5) tmpeneacti1 = tmpeneacti1 - 4
	tmptmpacti = pman_eneacti[pman_enno]
	pman_eneacti[pman_enno] = 0
	turncheck()
	if(pman_eneacti[pman_enno] == 0){
		tmpeneacti1 = pman_eneacti[pman_enno] + 3
		if(tmpeneacti1 >= 5) tmpeneacti1 = tmpeneacti1 - 4
		turncheck()
	}
	if(pman_eneacti[pman_enno] == 0){
		pman_eneacti[pman_enno]=tmptmpacti
		offsetcal(pman_eneacti[pman_enno])
		tmpenepos = pman_eneY[pman_enno] * 19 + pman_eneX[pman_enno] + pman_ofno
		if(pman_mapd[tmpenepos] == 1){
			pman_eneacti[pman_enno] = 0
			if(pman_myX*pman_blueflag >= pman_eneX[pman_enno]*pman_blueflag){
				tmpenepos = pman_eneY[pman_enno] * 19 + pman_eneX[pman_enno] + 1
				if(pman_mapd[tmpenepos] != 1) pman_eneacti[pman_enno] = 3
			}
			else{
				tmpenepos = pman_eneY[pman_enno] * 19 + pman_eneX[pman_enno] - 1
				if(pman_mapd[tmpenepos] != 1) pman_eneacti[pman_enno] = 1
			}
			tmpsubY = pman_myY - pman_eneY[pman_enno]
			if(tmpsubY <= 0) tmpsubY=-tmpsubY
			tmpsubX = pman_myX - pman_eneX[pman_enno]
			if(tmpsubX <= 0) tmpsubX=-tmpsubX
			tmpsubXY = tmpsubY - tmpsubX
			if(pman_eneacti[pman_enno] == 0) tmpsubXY = 1
			if(tmpsubXY*pman_blueflag >= 0){
				if(pman_myY*pman_blueflag >= pman_eneY[pman_enno]*pman_blueflag){
					tmpenepos = pman_eneY[pman_enno] * 19 + pman_eneX[pman_enno] + 19
					if(pman_mapd[tmpenepos] != 1) pman_eneacti[pman_enno] = 4
				}
				else{
					tmpenepos = pman_eneY[pman_enno] * 19 + pman_eneX[pman_enno] - 19
					if(pman_mapd[tmpenepos] != 1) pman_eneacti[pman_enno] = 2
				}
			}
			if(pman_eneacti[pman_enno] == 0){
				tmpenepos = pman_eneY[pman_enno] * 19 + pman_eneX[pman_enno] - 1
				if(pman_mapd[tmpenepos] != 1) pman_eneacti[pman_enno] = 1
				if(pman_eneacti[pman_enno] == 0){
					tmpenepos = pman_eneY[pman_enno] * 19 + pman_eneX[pman_enno] - 19
					if(pman_mapd[tmpenepos] != 1) pman_eneacti[pman_enno] = 2
					if(pman_eneacti[pman_enno] == 0){
						tmpenepos = pman_eneY[pman_enno] * 19 + pman_eneX[pman_enno] + 1
						if(pman_mapd[tmpenepos] != 1) pman_eneacti[pman_enno] = 3
                                    else pman_eneacti[pman_enno] = 4
					}
				}
			}
		}
	}
	eneXYcal()
}

function enetype4(){
	pman_eneacti[pman_enno] = 0
	if(pman_myX*pman_blueflag >= pman_eneX[pman_enno]*pman_blueflag){
		tmpenepos = pman_eneY[pman_enno] * 19 + pman_eneX[pman_enno] + 1
		if(pman_mapd[tmpenepos] != 1) pman_eneacti[pman_enno] = 3
	}
	else{
		tmpenepos = pman_eneY[pman_enno] * 19 + pman_eneX[pman_enno] - 1
		if(pman_mapd[tmpenepos] != 1) pman_eneacti[pman_enno] = 1
	}
	tmpsubY = pman_myY - pman_eneY[pman_enno]
	if(tmpsubY <= 0) tmpsubY=-tmpsubY
	tmpsubX = pman_myX - pman_eneX[pman_enno]
	if(tmpsubX <= 0) tmpsubX=-tmpsubX
	tmpsubXY = tmpsubY - tmpsubX
	if(pman_eneacti[pman_enno] == 0) tmpsubXY = 1
	if(tmpsubXY*pman_blueflag >= 0){
		if(pman_myY*pman_blueflag >= pman_eneY[pman_enno]*pman_blueflag){
			tmpenepos = pman_eneY[pman_enno] * 19 + pman_eneX[pman_enno] + 19
			if(pman_mapd[tmpenepos] != 1) pman_eneacti[pman_enno] = 4
		}
		else{
			tmpenepos = pman_eneY[pman_enno] * 19 + pman_eneX[pman_enno] - 19
			if(pman_mapd[tmpenepos] != 1) pman_eneacti[pman_enno] = 2
		}
	}
	if(pman_eneacti[pman_enno] == 0){
		tmpenepos = pman_eneY[pman_enno] * 19 + pman_eneX[pman_enno] - 1
		if(pman_mapd[tmpenepos] != 1) pman_eneacti[pman_enno] = 1
		if(pman_eneacti[pman_enno] == 0){
			tmpenepos = pman_eneY[pman_enno] * 19 + pman_eneX[pman_enno] - 19
			if(pman_mapd[tmpenepos] != 1) pman_eneacti[pman_enno] = 2
			if(pman_eneacti[pman_enno] == 0){
				tmpenepos = pman_eneY[pman_enno] * 19 + pman_eneX[pman_enno] + 1
				if(pman_mapd[tmpenepos] != 1) pman_eneacti[pman_enno] = 3
				else pman_eneacti[pman_enno] = 4
			}
		}
	}
	eneXYcal()
}

function turncheck(){
	if(tmpeneacti1 == 1)
		if(pman_myX*pman_blueflag < pman_eneX[pman_enno]*pman_blueflag){
			tmpenepos = pman_eneY[pman_enno] * 19 + pman_eneX[pman_enno] - 1
			if(pman_mapd[tmpenepos] != 1) pman_eneacti[pman_enno] = 1
		}
	if(tmpeneacti1 == 3)
		if(pman_myX*pman_blueflag > pman_eneX[pman_enno]*pman_blueflag){
			tmpenepos = pman_eneY[pman_enno] * 19 + pman_eneX[pman_enno] + 1
			if(pman_mapd[tmpenepos] != 1) pman_eneacti[pman_enno] = 3
		}
	if(tmpeneacti1 == 2)
		if(pman_myY*pman_blueflag < pman_eneY[pman_enno]*pman_blueflag){
			tmpenepos = pman_eneY[pman_enno] * 19 + pman_eneX[pman_enno] - 19
			if(pman_mapd[tmpenepos] != 1) pman_eneacti[pman_enno] = 2
		}
	if(tmpeneacti1 == 4)
		if(pman_myY*pman_blueflag < pman_eneY[pman_enno]*pman_blueflag){
			tmpenepos = pman_eneY[pman_enno] * 19 + pman_eneX[pman_enno] + 19
			if(pman_mapd[tmpenepos] != 1) pman_eneacti[pman_enno] = 4
		}
}

function preConad(){
	gImageOffset = document.images.length
}

function esCrita(){
	document.write("<PRE><CENTER>")
	for(iad = 0; iad < 22; iad++){
		for(iac = 0; iac < 19; iac++) document.write("<img src='bl0.gif'>")
		document.write("<BR>")}
	document.write("</CENTER></PRE>")

	pman_tmps[0] = "1111111111111111111"
	pman_tmps[1] = "1222222221222222221"
	pman_tmps[2] = "1211211121211121121"
	pman_tmps[3] = "1311211121211121131"
	pman_tmps[4] = "1222222222222222221"
	pman_tmps[5] = "1211212111112121121"
	pman_tmps[6] = "1222212221222122221"
	pman_tmps[7] = "1111211101011121111"
	pman_tmps[8] = "1111210000000121111"
	pman_tmps[9] = "1111210111110121111"
	pman_tmps[10]= "0000200100010020000"
	pman_tmps[11]= "1111210111110121111"
	pman_tmps[12]= "1111210000000121111"
	pman_tmps[13]= "1111210111110121111"
	pman_tmps[14]= "1222222221222222221"
	pman_tmps[15]= "1211211121211121121"
	pman_tmps[16]= "1321222222222221231"
	pman_tmps[17]= "1121212111112121211"
	pman_tmps[18]= "1222212221222122221"
	pman_tmps[19]= "1211111121211111121"
	pman_tmps[20]= "1222222222222222221"
	pman_tmps[21]= "1111111111111111111"

	pcontrol_ver=navigator.appVersion
	pcontrol_len=pcontrol_ver.length
	for(pcontrol_iln = 0; pcontrol_iln < pcontrol_len; pcontrol_iln++)
		if(pcontrol_ver.charAt(pcontrol_iln) == "(") break

	pcontrol_systm = pcontrol_ver.charAt(pcontrol_iln+1).toUpperCase()
	readstyle()
}

function click_me(){
    if (event.button > 1) alert("RG 3.0 - Informa��o (�_�):\n\nOpss - Utilize somente o bot�o esquerdo do mouse")
}
	document.onmousedown = click_me
//-->