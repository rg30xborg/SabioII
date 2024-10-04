<!--//

function addFavor1(){
	window.external.AddFavorite("http://www.aggora.com.br/sabio", "SABICHÃO - Um desafio aos seus Conhecimentos")
}

	var ship = [[[1,5], [1,2,5], [1,2,3,5], [1,2,3,4,5]], [[6,10], [6,7,10], [6,7,8,10], [6,7,8,9,10]]]
	var dead = [[[201,203], [201,202,203], [201,202,202,203], [201,202,202,202,203]], [[204,206], [204,205,206], [204,205,205,206], [204,205,205,205,206]]]
	var shiptypes = [["SUBMARINO",2,2],["DESTRÓIER",3,2],[ "CRUZADOR",4,1],[ "ENCOURAÇADO",5,1]]
	var HTM = '<table width=100%><tr><td bgcolor=#000080 style="color:#FFFF00;font-size:10pt">COMPUTER: <b><span ID=G1>Você inicia - CLIQUE NA FROTA INIMIGA.</span></b></td></tr></table>'
	HTM = HTM + '<table width=100%><tr><td bgcolor=#0588C0 style="color:#FFFFFF;font-size:10pt"><b>VOCÊ FALTA DESTRUIR:</b> [<b><span id=n5>6</span></b>]</td></tr>'
	HTM = HTM + '<tr align=center><td nowrap>[<span id=n1>2</span>]<img src="batt301.gif" align=absmiddle> [<span id=n2>2</span>]<img src="batt302.gif" align=absmiddle> '
	HTM = HTM + '[<span id=n3>1</span>]<img src="batt303.gif" align=absmiddle> [<span id=n4>1</span>]<img src="batt304.gif" align=absmiddle></td></tr></table>'
	var gridx = 8, gridy = 8, nv1 = nv2 = nv3 = nv4 = nv5 = 1
	var player = [], computer = [], playersships = [], computersships = []
	var playerlives = 0, computerlives = 0, playflag = false

	var preloaded = []

function Aviso2(){
	//if((this.location.href).indexOf("www.aggora.com.br") < 0) location.href = "http://www.aggora.com.br/sabio/help.htm"
    //else {
        NCalc.innerText = " "; init()
    //}
}

function imagePreload(){
	var i, ids = [1,2,3,4,5,6,7,8,9,10,100,101,102,103,201,202,203,204,205,206,301,302,303,304]
	for(i = 0; i < ids.length; ++i){
		var img = new Image, name = "batt" + ids[i] + ".gif"
		img.src = name
		preloaded[i] = img
	}
}

function setupPlayer(ispc){
	var y, x
	grid = []
	for(y = 0; y < gridx; ++y){
		grid[y] = []
		for(x = 0; x < gridx; ++x) grid[y][x] = [100,-1,0]
	}

	var shipno = 0
	var s
	for(s = shiptypes.length - 1; s >= 0; --s){
		var i
		for(i = 0; i < shiptypes[s][2]; ++i){
			var d = Math.floor(Math.random() * 2)
			var len = shiptypes[s][1], lx = gridx, ly = gridy, dx = 0, dy = 0
			if(d == 0){
				lx = gridx - len
				dx = 1
			}
			else{
				ly = gridy - len
				dy = 1
			}
			var x, y, ok
			do{
				y = Math.floor(Math.random() * ly)
				x = Math.floor(Math.random() * lx)
				var j, cx = x, cy = y
				ok = true
				for(j = 0; j < len; ++j){
					if(grid[cy][cx][0] < 100){
						ok = false
						break
					}
					cx += dx
					cy += dy
				}
			} while(!ok)
			var j, cx = x, cy = y
			for(j = 0; j < len; ++j){
				grid[cy][cx][0] = ship[d][s][j]
				grid[cy][cx][1] = shipno
				grid[cy][cx][2] = dead[d][s][j]
				cx += dx
				cy += dy
			}
			if(ispc){
				computersships[shipno] = [s,shiptypes[s][1]]
				computerlives++
			}
			else{
				playersships[shipno] = [s,shiptypes[s][1]]
				playerlives++
			}
			shipno++
		}
	}
	return grid
}

function setImage(y,x,id,ispc) {
	if (ispc){
		computer[y][x][0] = id
		document.images["pc" + y + "_" + x].src = "batt" + id + ".gif"
	}
	else {
		player[y][x][0] = id
		document.images["ply" + y + "_" + x].src = "batt" + id + ".gif"
  	}
}

function showGrid(ispc){
	var y, x
	for(y = 0; y < gridy; ++y){
		for(x = 0; x < gridx; ++x){
			if(ispc) HTML = HTML + '<img name="pc'+y+'_'+x+'" src="batt100.gif" width=25 height=25 border=1 style="cursor:hand;border-color:#FFFFFF" onClick="gridClick('+y+','+x+')">'
			else HTML = HTML + '<img name="ply'+y+'_'+x+'" src="batt'+player[y][x][0]+'.gif" width=25 height=25 border=1 style="border-color:#FFFF00">'
		}
		HTML = HTML + '<br>'
	}
}

function gridClick(y,x){
	if(playflag){
		if(computer[y][x][0] < 100){
			setImage(y,x,103,true)
			var shipno = computer[y][x][1]
			if(--computersships[shipno][1] == 0){
				sinkShip(computer, shipno, true)
				det = shiptypes[computersships[shipno][0]][0]
				G1.innerText = "AI! - VOCÊ DETONOU O MEU " + det + "!"
				if(det == "SUBMARINO"){ nv1--; n1.innerText = nv1 }
				else{	if(det == "DESTRÓIER"){ nv2--; n2.innerText = nv2 }
					else{ if(det == "CRUZADOR"){ nv3--; n3.innerText = nv3 }
						else {nv4 --; n4.innerText = nv4 }
					}
				}
				nv5--; n5.innerText = nv5
				if(--computerlives == 0){
					Reg21.style.visibility = ""
					G1.innerText = "OK, VOCÊ VENCEU! PARABÉNS ALMIRANTE"
					Reg16.innerText =  "Combate Concluído - Para re-iniciar clique em: [DE NOVO]"
					playflag = false
				}
			}
			if(playflag) computerMove()
		}
		else if(computer[y][x][0] == 100){
			setImage(y,x,102,true)
			computerMove()
		}
	}
}

function computerMove(){
	var x, y, pass
	var sx, sy
	var selected = false

	for(pass = 0; pass < 2; ++pass){
		for(y = 0; y < gridy && !selected; ++y){
			for(x = 0; x < gridx && !selected; ++x){
				if(player[y][x][0] == 103){
					sx = x; sy = y
					var nup = (y > 0 && player[y-1][x][0] <= 100)
					var ndn = (y < gridy - 1 && player[y+1][x][0] <= 100)
					var nlt = (x > 0 && player[y][x-1][0] <= 100)
					var nrt = (x < gridx - 1 && player[y][x+1][0] <= 100)
					if(pass == 0){
						var yup = (y > 0 && player[y-1][x][0] == 103)
						var ydn = (y < gridy - 1 && player[y+1][x][0] == 103)
						var ylt = (x > 0 && player[y][x-1][0] == 103)
						var yrt = (x < gridx - 1 && player[y][x+1][0] == 103)
						if(nlt && yrt){ sx = x - 1; selected = true }
						else 	if(nrt && ylt){ sx = x + 1; selected = true }
							else 	if(nup && ydn){ sy = y - 1; selected = true }
								else if(ndn && yup){ sy = y + 1; selected = true }
					}
					else{	if(nlt){ sx = x - 1; selected = true }
						else 	if(nrt){ sx = x + 1; selected = true }
							else 	if(nup){ sy = y - 1; selected = true }
								else 	if(ndn){ sy = y + 1; selected = true }
					}
				}
			}
		}
	}
	if(!selected){
		do{
			sy = Math.floor(Math.random() * gridy)
			sx = Math.floor(Math.random() * gridx / 2) * 2 + sy % 2
		} while(player[sy][sx][0] > 100)
	}
	if(player[sy][sx][0] < 100){
		setImage(sy, sx, 103, false)
		var shipno = player[sy][sx][1]
		if(--playersships[shipno][1] == 0){
			sinkShip(player, shipno, false)
			G1.innerText = "AHÁ! - DETONEI SEU " + shiptypes[playersships[shipno][0]][0] + "!"
			if(--playerlives == 0){
				knowYourEnemy()
				Reg21.style.visibility = ""
				G1.innerText = "AHÁ! - EU VENCI! MELHOR SORTE NA PRÖXIMA"
				Reg16.innerText =  "Combate Concluído - Para re-iniciar clique em: [DE NOVO]"
				playflag = false
			}
		}
	}
	else setImage(sy, sx, 102, false)
}

function sinkShip(grid,shipno,ispc){
	var y, x
	for(y = 0; y < gridx; ++y){
		for(x = 0; x < gridx; ++x){
			if(grid[y][x][1] == shipno)
				if(ispc) setImage(y,x,computer[y][x][2],true)
				else setImage(y,x,player[y][x][2],false)
		}
	}
}

function knowYourEnemy(){
	var y, x
	for(y = 0; y < gridx; ++y){
		for(x = 0; x < gridx; ++x){
			if(computer[y][x][0] == 103) setImage(y,x,computer[y][x][2],true)
			else if(computer[y][x][0] < 100) setImage(y,x,computer[y][x][0],true)
		}
	}
}

function init(){
	Reg21.style.visibility = "hidden"
	Reg16.innerText = "RG SABICHÃO WEB - Borg, todos os direitos reservados"
	playerlives = 0, computerlives = 0, nv1 = nv2 = 2, nv3 = nv4 = 1, nv5 = 6
	player = setupPlayer(false)
	computer = setupPlayer(true)
	HTML = "<table width=442><tr align=center><td width=216><p class='heading'>Sua Frota</p></td><td width=10> </td><td width=216><p class='heading'>Frota Inimiga</p></td></tr><tr><td>"
	showGrid(false)
	HTML = HTML + "</td><td width=10> </td><td>"
	showGrid(true)
	HTML = HTML + "</td></tr></table><p> </p>"
	HTML = HTML + HTM
	Campo.innerHTML = HTML
	playflag = true
}

function click_me(){
    if (event.button > 1) alert("RG 3.0 - Informação (º_º):\n\nOpss - Utilize somente o botão esquerdo do mouse")
}
	document.onmousedown = click_me
//-->