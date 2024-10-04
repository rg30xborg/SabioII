<%@ LANGUAGE=VBSCRIPT %>
<%
	Response.Expires = 0

	If inStr(Request.ServerVariables("HTTP_HOST"), "www.aggora.com.br") = 0 Then
		Response.Redirect "http://www.aggora.com.br/sabio/help.htm"
		Response.End
	End If

	If Session("xdemo") <> "demo01" Then
		Response.Redirect "http://www.aggora.com.br/sabio/1/sabio12.asp"
		Response.End
	End if

	RSDispatch

	Function LeSala(Conexao)
		Set UsuarioDados = Server.CreateObject("ADODB.Recordset")
		UsuarioDados.Open "SELECT USD_Total, USD_1gm, USD_2gm FROM UserDados WHERE USR_ID = " & Session("id"), Conexao
			txt0 = UsuarioDados("USD_2gm")
			pSala = UsuarioDados("USD_1gm")
			pTotl = UsuarioDados("USD_Total")
		Usuariodados.Close
		Set UsuarioDados = Nothing
	End Function

	Function GravaSala(Conexao)
		Conexao.Execute "UPDATE UserDados SET USD_Total = " & pTotl & ", USD_1gm = " & pSala & ",  USD_2gm = '" & txt1 & "' WHERE USR_ID = " & Session("id")
	End Function

	Function GravaStr(Conexao, str)
		Conexao.Execute "UPDATE UserDados SET USD_2gm = '" & str & "' WHERE USR_ID = " & Session("id")
	End Function
%>

<SCRIPT RUNAT=SERVER Language=JScript>

function RSDispatch(vtable,methodname)
{
	if (typeof(methodname) != 'string')
	{
		var methodtype = Request.QueryString('_mtype') + '';
		if (methodtype != 'execute')
			return false;
		methodname = Request.QueryString('_method') + '';
		if (methodname == '' || methodname == 'undefined')
			return false;
	}

	var dispatchVTbl = null;
	if (typeof(vtable) == 'object')
		dispatchVTbl = vtable;
	else if (typeof(public_description) == 'object')
		dispatchVTbl = public_description;
	if (dispatchVTbl == null)
		return false;

	var strResponse = '<METHOD VERSION="1.0.8044">'
	if (methodname == 'GetServerProxy') 
	{ 
		strResponse += Return(GetServerProxy(dispatchVTbl));
	}
	else
	{
		if (typeof(dispatchVTbl[methodname]) == 'function')
		{	// validate function is in dispatchVTbl
			var params = '';
			var pcount = Request.QueryString('pcount');
			for (var i=0; i < pcount; i++)
			{	// extract parameter values
				var param = Request.QueryString('p'+i);
				params += '"' + param + '"';
				if (i < pcount-1)
					params += ',';
			}

			var dispatch = 'dispatchVTbl.' + methodname + '(' + params + ')';
			//Response.write(dispatch);	// USED FOR DEBUG
			// validated against dispatchVTbl, safe to eval on the server
			var r = eval(dispatch); 
			strResponse += Return(r);
		}
		else
		{
			var strError = '<RETURN_VALUE TYPE=ERROR>';
			strError += escape(methodname + ' : not a public function');
			strError += '</RETURN_VALUE>';
			strResponse += strError;
		}
	}
	strResponse += '</METHOD>';
	
	Response.Write(strResponse);
	return true;
}

function Return(x)
{
	var returnType = typeof(x);
	if (returnType == 'object' || returnType == 'number' || returnType == 'boolean')
		return '<RETURN_VALUE TYPE=EVAL_OBJECT>' + escape(uneval(x)) + '</RETURN_VALUE>';
	else
		return '<RETURN_VALUE TYPE=SIMPLE>' + escape(x) + '</RETURN_VALUE>';
}

function GetServerProxy(pd)
{
	if (!unevalInitialized)
	{
		initUneval();
		unevalInitialized = true;
	}

	var o = new Object;
	for (var name in pd)
	{
		if (typeof(pd[name]) == 'function' && pd.__isPublicMember(name))
		{
			o[name] = Function('return 0;');
		}
	}
	return o;
}

var unevalInitialized;
var unevalNextIdentifier;
function unevalGetNextID()
{
	return '_o' + unevalNextID++;
}

function uneval(obj)
{
	if (!unevalInitialized)
	{
		initUneval();
		unevalInitialized = true;
	}
	unevalNextID = 0;
	var s = 'var undefined;' + unevalDecl(obj) + unevalInst(obj);
	unevalClear(obj);
	return s;
}

function unevalDecl(obj)
{
	var s = '';
	switch (typeof(obj))
	{
		case 'undefined':
		case 'boolean':
		case 'number':
		case 'string':
			break;

		default:
			if (null != obj && !obj.__mark && 'string' != typeof(obj.__decl))
				{
				obj.__mark = true;
				obj.__decl = unevalGetNextID();
				s = obj.__unevalDecl();
				delete obj.__mark;
				}
			break;
	}
	return s;
}

function unevalInst(obj)
{
	var s = '';
	switch (typeof(obj))
	{
		case 'undefined':
			s = 'undefined';
			break;
		case 'boolean':
		case 'number':
			s = String(obj);
			break;
		case 'string':
			s = unevalString(obj);
			break;

		default:
			if (null == obj)
				s = 'null';
			else if (obj.__mark)
				s = '"ERROR: Cycle in uneval graph."';
			else
				{
				obj.__mark = true;
				s = obj.__unevalInst();
				delete obj.__mark;
				}
			break;
	}
	return s;
}

function unevalClear(obj)
{
	switch (typeof(obj))
	{
		case 'undefined':
		case 'boolean':
		case 'number':
		case 'string':
			break;

		default:
			if (null != obj && !obj.__mark && 'string' == typeof(obj.__decl))
			{
				obj.__mark = true;
				obj.__unevalClear();
				delete obj.__mark;
			}
			break;
	}
	return ;
}

function unevalDoNothing() 
{	}

function unevalConvertToString(obj)
{	return String(obj);		}

function unevalString(str) 
{	return '"' + str.replace(/([^\\])'/g,'$1\\"') + '"'; 	}

function initUneval()
{
	// instrinsic objects
	Object.__unevalDecl = unevalDoNothing;
	Object.__unevalInst = function () { return 'Object'; }
	Object.__unevalClear = unevalDoNothing;

	Boolean.__unevalDecl = unevalDoNothing;
	Boolean.__unevalInst = function () { return 'Boolean'; }
	Boolean.__unevalClear = unevalDoNothing;

	Number.__unevalDecl = unevalDoNothing;
	Number.__unevalInst = function () { return 'Number'; }
	Number.__unevalClear = unevalDoNothing;

	String.__unevalDecl = unevalDoNothing;
	String.__unevalInst = function () { return 'String'; }
	String.__unevalClear = unevalDoNothing;

	Date.__unevalDecl = unevalDoNothing;
	Date.__unevalInst = function () { return 'Date'; }
	Date.__unevalClear = unevalDoNothing;

	Function.__unevalDecl = unevalDoNothing;
	Function.__unevalInst = function () { return 'Function'; }
	Function.__unevalClear = unevalDoNothing;

	Array.__unevalDecl = unevalDoNothing;
	Array.__unevalInst = function () { return 'Array'; }
	Array.__unevalClear = unevalDoNothing;

	// object members
	Object.prototype.__enumMembers = function(retval,func)
	{
		var isPublicMember = this.__isPublicMember;
		if ('object' == typeof(this.__unevalProperties))
		{
			var unevalProperties = this.__unevalProperties;
			var length = unevalProperties.length;
			for (var i = 0; i < length; i++)
			{
				if (isPublicMember(unevalProperties[i]))
					func(retval, this, unevalProperties[i]);
			}
		}
		else
		{
			for (var i in this)
			{
				if (isPublicMember(i))
					func(retval, this, i);
			}
		}
	}

	Object.prototype.__unevalDeclMember = function (retval, obj, member)
	{
		retval.otherDecl += unevalDecl(obj[member]);
		retval.myDecl += obj.__decl + '[' + unevalString(member) + ']=' + unevalInst(obj[member]) + ';';
	}

	Object.prototype.__unevalDecl = function()
	{
		var retval = { otherDecl:'', myDecl:'' };
		this.__enumMembers(retval, this.__unevalDeclMember);
		return retval.otherDecl + 'var ' + this.__decl + '=' + this.__unevalConstructor() + ';' + retval.myDecl;
	}

	Object.prototype.__unevalInst = function ()
	{	return this.__decl;		}

	Object.prototype.__unevalClearMember = function(retval, obj, member)
	{	unevalClear(obj[member]);	}

	Object.prototype.__unevalClear = function()
	{
		delete this.__decl;
		this.__enumMembers(null, this.__unevalClearMember);
	}

	Object.prototype.__isPublicMember = function(member)
	{	return '__' != member.substr(0,2);		}

	Object.prototype.__unevalConstructor = function ()
	{	return 'new Object';		}

	// overrides for simple types
	Boolean.prototype.__unevalConstructor = function()
	{	return 'new Boolean(' + String(this) + ')';	}
	Number.prototype.__unevalConstructor = function()
	{	return 'new Number(' + String(this) + ')';	}
	String.prototype.__unevalConstructor = function()
	{	return 'new String(' + unevalString(this) + ')';	}
	Date.prototype.__unevalConstructor = function()
	{	return 'new Date(Date.parse("' + String(this) + '"))';	}

	// overrides for function
	Function.prototype.__unevalDecl = function()
	{	return String(this).replace(/function ([^\(]*)/,'function ' + this.__decl);	}

	// overrides for array
	Array.prototype.__unevalDecl = function()
	{
		var decl = this.__decl;
		var r = '';    
		var s = 'var ' +  decl + '= new Array(' + this.length + ');';
		var length = this.length;
		for (var i = 0; i < length; i++)
		{
			r += unevalDecl(this[i]);
			s += decl + '[' + i + ']=' + unevalInst(this[i]) + ';';
		}
		return r + s;
	}

}

function Description(){
	this.Method4 = Method4; this.Method5 = Method5
	this.Method6 = Method6; this.Method7 = Method7; this.Method8 = Method8
}

	public_description = new Description()

	myCarts= new Array();
	myCarts[0]  = "01o"; myCarts[1]  = "02o"; myCarts[2]  = "03o"; myCarts[3]  = "04o"
	myCarts[4]  = "05o"; myCarts[5]  = "06o"; myCarts[6]  = "07o"; myCarts[7]  = "08o"
	myCarts[8]  = "09o"; myCarts[9]  = "10o"; myCarts[10] = "11o"; myCarts[11] = "12o"
	myCarts[12] = "13o"; myCarts[13] = "01c"; myCarts[14] = "02c"; myCarts[15] = "03c"
	myCarts[16] = "04c"; myCarts[17] = "05c"; myCarts[18] = "06c"; myCarts[19] = "07c"
	myCarts[20] = "08c"; myCarts[21] = "09c"; myCarts[22] = "10c"; myCarts[23] = "11c"
	myCarts[24] = "12c"; myCarts[25] = "13c"; myCarts[26] = "01p"; myCarts[27] = "02p"
	myCarts[28] = "03p"; myCarts[29] = "04p"; myCarts[30] = "05p"; myCarts[31] = "06p"
	myCarts[32] = "07p"; myCarts[33] = "08p"; myCarts[34] = "09p"; myCarts[35] = "10p"
	myCarts[36] = "11p"; myCarts[37] = "12p"; myCarts[38] = "13p"; myCarts[39] = "01e"
	myCarts[40] = "02e"; myCarts[41] = "03e"; myCarts[42] = "04e"; myCarts[43] = "05e"
	myCarts[44] = "06e"; myCarts[45] = "07e"; myCarts[46] = "08e"; myCarts[47] = "09e"
	myCarts[48] = "10e"; myCarts[49] = "11e"; myCarts[50] = "12e"; myCarts[51] = "13e"
	myCarts[52] = "carta";

	var arcsala = "C:\\Sabichao\\Divers\\" + Session("mail") + ".1gm"
	var arcparc = "C:\\Sabichao\\Divers\\" + Session("mail") + ".2gm"
	var arcptot = "C:\\Sabichao\\Users\\" + Session("mail") + ".tot"
	var f, fs = new ActiveXObject("Scripting.FileSystemObject")

function Method4()
{
	//f = fs.OpenTextFile(arcparc, 1, false); txt1 = f.ReadLine(); f.Close()

	var Conexao = Server.CreateObject("ADODB.Connection")
	var str = "DRIVER={MySQL ODBC 5.3 ANSI Driver};SERVER=aggora1.mysql.dbaas.com.br;PORT=3306;DATABASE=aggora1;USER=aggora1;PASSWORD=dade02;OPTION=3;"
	Conexao.Open(str)

	txt0 = ""; pTotl = 0; pSala = 0
	LeSala(Conexao)

	txt1 = txt0
	if(txt0 != 'new'){
		gparc = parseInt(txt1,10); cred = parseInt(txt1.substring(txt1.indexOf("!") + 1),10)
	}
	else{
		//f = fs.OpenTextFile(arcptot, 1, false); text0 = f.ReadLine(); f.Close()
		gparc = 0; cred = pTotl
	}
	somreg = 'no'
	if(gparc > 0){
		cred += gparc; somreg = 'yes'
		//f = fs.OpenTextFile(arcsala, 1, false); var pSala = f.ReadLine(); f.Close()
		pSala += gparc
		//f = fs.CreateTextFile(arcsala, true); f.Write(pSala); f.Close()
	}
	txt1 = cred + ""
	GravaSala(Conexao)
	//f = fs.CreateTextFile(arcparc, true); f.Write(cred); f.Close()

	Conexao.Close
	return new Array(somreg, cred)
}

function Method5(aposm)
{
	//f = fs.OpenTextFile(arcparc, 1, false); var cred = parseInt(f.ReadLine(),10); f.Close()

	var Conexao = Server.CreateObject("ADODB.Connection")
	var str = "DRIVER={MySQL ODBC 5.3 ANSI Driver};SERVER=aggora1.mysql.dbaas.com.br;PORT=3306;DATABASE=aggora1;USER=aggora1;PASSWORD=dade02;OPTION=3;"
	Conexao.Open(str)

	txt0 = ""; pTotl = 0; pSala = 0; txt1 = ""
	LeSala(Conexao)

	var cred = parseInt(txt0, 10);

    if(cred > 0){
	    var myFirst = new Array();
	    (aposm < 11) ? apos = aposm : apos = 10;
	    if(apos > cred) apos = cred; cred -= apos;
        
	    pTotl = cred
	    pSala = pSala - apos
	    myFirst[0] = cred
        
	    p = Math.round(Math.random()* 51)
	    myFirst[1] = myCarts[p];
	    num1=parseInt(myCarts[p].substring(0,2),10);
	    nai1=myCarts[p].substring(2,3);
        
	    o = Math.round(Math.random()* 51)
	    while(o == p){
	    o = Math.round(Math.random()* 51)}
	    myFirst[2] = myCarts[o];
	    num2=parseInt(myCarts[o].substring(0,2),10);nai2=myCarts[o].substring(2,3);
        
	    k = Math.round(Math.random()* 51)
	    while(k == p || k == o){
	    k = Math.round(Math.random()* 51)}
	    myFirst[3] = myCarts[k];
	    num3=parseInt(myCarts[k].substring(0,2),10);nai3=myCarts[k].substring(2,3);
        
	    e = Math.round(Math.random()* 51)
	    while(e == p || e == o || e == k){
	    e = Math.round(Math.random()* 51)}
	    myFirst[4] = myCarts[e];
	    num4=parseInt(myCarts[e].substring(0,2),10);nai4=myCarts[e].substring(2,3);
        
	    r = Math.round(Math.random()* 51)
	    while(r == p || r == o || r == k || r == e){
	    r = Math.round(Math.random()* 51)}
	    myFirst[5] = myCarts[r];
	    num5=parseInt(myCarts[r].substring(0,2),10);nai5=myCarts[r].substring(2,3);
        
	    jogo = 0;
	    if(num1 == num2)jogo ++;if(num1 == num3)jogo ++;if(num1 == num4)jogo ++;if(num1 == num5)jogo ++;
	    if(num2 == num3)jogo ++;if(num2 == num4)jogo ++;if(num2 == num5)jogo ++;
	    if(num3 == num4)jogo ++;if(num3 == num5)jogo ++;
	    if(num4 == num5)jogo ++;
        
        if (jogo == 0) {
             seq0 = 0;
	         seq1 = Math.min(num1,num2);
	         seq1 = Math.min(seq1,num3);
	         seq1 = Math.min(seq1,num4);
	         seq1 = Math.min(seq1,num5);
		     if(seq1 == 1){
		     seq2 = Math.max(num1,num2);
		     seq2 = Math.max(seq2,num3);
		     seq2 = Math.max(seq2,num4);
		     seq2 = Math.max(seq2,num5);
		     	if(seq2 == 13)seq1 = 10;
		     	else seq1 = 2;
		     }
	         else seq1 ++;
	         if(seq1 == num1 || seq1 == num2 || seq1 == num3 || seq1 == num4 || seq1 == num5){seq0 ++;seq1 ++;}
	         if(seq1 == num1 || seq1 == num2 || seq1 == num3 || seq1 == num4 || seq1 == num5){seq0 ++;seq1 ++;}
	         if(seq1 == num1 || seq1 == num2 || seq1 == num3 || seq1 == num4 || seq1 == num5){seq0 ++;seq1 ++;}
	         if(seq1 == num1 || seq1 == num2 || seq1 == num3 || seq1 == num4 || seq1 == num5)seq0 ++;
	         if(seq0 == 4 && nai1 == nai2 && nai2 == nai3 && nai3 == nai4 && nai4 == nai5)jogo = 150;
	         else {
	         	if(nai1 == nai2 && nai2 == nai3 && nai3 == nai4 && nai4 == nai5)jogo = 10;
	         	else {
                     if (seq0 == 4) jogo = 5;
                 }
             }
	    }
        
	    if(jogo == 0)myFirst[6]   = 'Nada - Parcial'
	    if(jogo == 1)myFirst[6]   = 'Uma dupla - Parcial'
	    if(jogo == 2)myFirst[6]   = 'Duas duplas - Parcial'
	    if(jogo == 3)myFirst[6]   = 'Trinca - Parcial'
	    if(jogo == 4)myFirst[6]   = 'Fulla - Parcial'
	    if(jogo == 5)myFirst[6]   = 'Sequência - Parcial'
	    if(jogo == 6)myFirst[6]   = 'Quadra - Parcial'
	    if(jogo == 10)myFirst[6]  = 'Flash - Parcial'
	    if(jogo == 150)myFirst[6] = 'Street Flash - Parcial'
	    ((jogo >= 2) ? myFirst[7] = 'yes' : myFirst[7] = 'no')
	    myFirst[8] = pSala

	    txt1 = '?' + apos + '!' + cred + '#' + 610509 + ':' + ' ' + (p+10) + ' ' + (o+10) + ' ' + (k+10) + ' ' + (e+10) + ' ' + (r+10)
        
	    GravaSala(Conexao)
	    Conexao.Close
	    return myFirst
    }
    Conexao.Close
}

function Method6(tr1,tr2,tr3,tr4,tr5)
{
	//f = fs.OpenTextFile(arcparc, 1, false); var txt1 = f.ReadAll(); f.Close()

	var Conexao = Server.CreateObject("ADODB.Connection")
	var str = "DRIVER={MySQL ODBC 5.3 ANSI Driver};SERVER=aggora1.mysql.dbaas.com.br;PORT=3306;DATABASE=aggora1;USER=aggora1;PASSWORD=dade02;OPTION=3;"
	Conexao.Open(str)

	txt0 = ""; pTotl = 0; pSala = 0
	LeSala(Conexao)

	txt1 = txt0
	cred = parseInt(txt1.substring(txt1.indexOf("!") + 1),10)

    if(cred >= 0){
	var i = txt1.indexOf(":") + 1
	p = parseInt(txt1.substring(i,i+=3),10) - 10
	o = parseInt(txt1.substring(i,i+=3),10) - 10
	k = parseInt(txt1.substring(i,i+=3),10) - 10
	e = parseInt(txt1.substring(i,i+=3),10) - 10
	r = parseInt(txt1.substring(i,i+=3),10) - 10
	apos = parseInt(txt1.substring(1,3),10)

	var mySecond = new Array(1)
	if(tr1 == 1){
		p1 = Math.round(Math.random()* 51)
		while(p1 == p || p1 == o || p1 == k || p1 == e || p1 == r){
		p1 = Math.round(Math.random()* 51)}} else {p1 = p}
		mySecond[1] = myCarts[p1]
		num1 = parseInt(myCarts[p1].substring(0,2),10);nai1 = myCarts[p1].substring(2,3)
		
	if(tr2 == 1){
		o1 = Math.round(Math.random()* 51)
		while(o1 == p || o1 == o || o1 == k || o1 == e || o1 == r || o1 == p1){
		o1 = Math.round(Math.random()* 51)}} else {o1 = o}
		mySecond[2] = myCarts[o1]
		num2 = parseInt(myCarts[o1].substring(0,2),10);nai2 = myCarts[o1].substring(2,3)
		
	if(tr3 == 1){
		k1 = Math.round(Math.random()* 51)
		while(k1 == p || k1 == o || k1 == k || k1 == e || k1 == r || k1 == p1 || k1 == o1){
		k1 = Math.round(Math.random()* 51)}} else {k1 = k}
		mySecond[3] = myCarts[k1]
		num3 = parseInt(myCarts[k1].substring(0,2),10);nai3 = myCarts[k1].substring(2,3)
		
	if(tr4 == 1){
		e1 = Math.round(Math.random()* 51)
		while(e1 == p || e1 == o || e1 == k || e1 == e || e1 == r || e1 == p1 || e1 == o1 
		|| e1 == k1){
		e1 = Math.round(Math.random()* 51)}} else {e1 = e}
		mySecond[4] = myCarts[e1]
		num4 = parseInt(myCarts[e1].substring(0,2),10);nai4 = myCarts[e1].substring(2,3)
		
	if(tr5 == 1){
		r1 = Math.round(Math.random()* 51)
		while(r1 == p || r1 == o || r1 == k || r1 == e || r1 == r || r1 == p1 || r1 == o1 
		|| r1 == k1 || r1 == e1){
		r1 = Math.round(Math.random()* 51)}} else {r1 = r}
		mySecond[5] = myCarts[r1]
		num5 = parseInt(myCarts[r1].substring(0,2),10);nai5 = myCarts[r1].substring(2,3)
		
	jogo = 0
	if(num1 == num2)jogo ++;if(num1 == num3)jogo ++;if(num1 == num4)jogo ++;if(num1 == num5)jogo ++
	if(num2 == num3)jogo ++;if(num2 == num4)jogo ++;if(num2 == num5)jogo ++
	if(num3 == num4)jogo ++;if(num3 == num5)jogo ++
	if(num4 == num5)jogo ++

	if(jogo == 0){seq0 = 0
		seq1 = Math.min(num1,num2)
		seq1 = Math.min(seq1,num3)
		seq1 = Math.min(seq1,num4)
		seq1 = Math.min(seq1,num5)
		if(seq1 == 1){
			seq2 = Math.max(num1,num2)
			seq2 = Math.max(seq2,num3)
			seq2 = Math.max(seq2,num4)
			seq2 = Math.max(seq2,num5)
				if(seq2 == 13)seq1 = 10
			      else seq1 = 2
		}
	else seq1 ++
	if(seq1 == num1 || seq1 == num2 || seq1 == num3 || seq1 == num4 || seq1 == num5){seq0 ++;seq1 ++}
	if(seq1 == num1 || seq1 == num2 || seq1 == num3 || seq1 == num4 || seq1 == num5){seq0 ++;seq1 ++}
	if(seq1 == num1 || seq1 == num2 || seq1 == num3 || seq1 == num4 || seq1 == num5){seq0 ++;seq1 ++}
	if(seq1 == num1 || seq1 == num2 || seq1 == num3 || seq1 == num4 || seq1 == num5)seq0 ++
	if(seq0 == 4 && nai1 == nai2 && nai2 == nai3 && nai3 == nai4 && nai4 == nai5)jogo=150
	else {
		if(nai1 == nai2 && nai2 == nai3 && nai3 == nai4 && nai4 == nai5)jogo=10
		else {
			if(seq0 == 4)jogo=5}}
	}

	sorte = 1;
	if(num1 == 1 || num2 == 1 || num3 == 1 || num4 == 1 || num5 == 1)sorte = 2
	
	if(jogo == 0) mySecond[6]   = 'Nada - Final'
	if(jogo == 1) mySecond[6]   = 'Uma dupla - Não Ganha'; var gparc = 0
	if(jogo == 2){mySecond[6]   = 'Duas duplas - Ganha ' + apos * 2; gparc = (apos * 2)}
	if(jogo == 3){mySecond[6]   = 'Trinca - Ganha ' + apos * 3; gparc = (apos * 3)}
	if(jogo == 4){mySecond[6]   = 'Fulla - Ganha ' + (apos * 10 * sorte); gparc = (apos * 10 * sorte)}
	if(jogo == 5){mySecond[6]   = 'Sequência - Ganha ' + apos * 5; gparc = (apos * 5)}
	if(jogo == 6){mySecond[6]   = 'Quadra - Ganha ' + (apos * 60 * sorte); gparc = (apos * 60 * sorte)}
	if(jogo == 10){mySecond[6]  = 'Flash - Ganha ' + apos * 6; gparc = (apos * 6)}
	if(jogo == 150){mySecond[6] = 'Street Flash - Ganha ' + (apos * 150 * sorte); gparc = (apos * 150 * sorte)}
	((jogo >= 2) ? mySecond[7] = 'yes' : mySecond[7] = 'no')

	//f = fs.OpenTextFile(arcparc, 2, false)
	//f.Write(gparc + '-' + txt1 + ':: ' + (p1+10) + ' ' + (o1+10) + ' ' + (k1+10) + ' ' + (e1+10) + ' ' + (r1+10))
	//f.Close();
	txt1 = gparc + '-' + txt1 + ':: ' + (p1+10) + ' ' + (o1+10) + ' ' + (k1+10) + ' ' + (e1+10) + ' ' + (r1+10)

	GravaSala(Conexao)
	Conexao.Close
	return mySecond
   }
   Conexao.Close
}

function Method7(dob,numero,naipe)
{
	//f = fs.OpenTextFile(arcparc, 1, false); var txt1 = f.ReadAll(); f.Close()

	var Conexao = Server.CreateObject("ADODB.Connection")
	var str = "DRIVER={MySQL ODBC 5.3 ANSI Driver};SERVER=aggora1.mysql.dbaas.com.br;PORT=3306;DATABASE=aggora1;USER=aggora1;PASSWORD=dade02;OPTION=3;"
	Conexao.Open(str)

	txt0 = ""; pTotl = 0; pSala = 0
	LeSala(Conexao)

	txt1 = txt0
	gparc = parseInt(txt1,10)

   if(gparc > 0){
	var i = txt1.indexOf(":") + 1
	p = parseInt(txt1.substring(i,i+=3),10) - 10
	o = parseInt(txt1.substring(i,i+=3),10) - 10
	k = parseInt(txt1.substring(i,i+=3),10) - 10
	e = parseInt(txt1.substring(i,i+=3),10) - 10
	r = parseInt(txt1.substring(i,i+=3),10) - 10
	p1 = parseInt(txt1.substring(i+=2,i+=3),10) - 10
	o1 = parseInt(txt1.substring(i,i+=3),10) - 10
	k1 = parseInt(txt1.substring(i,i+=3),10) - 10
	e1 = parseInt(txt1.substring(i,i+=3),10) - 10
	r1 = parseInt(txt1.substring(i,i+=3),10) - 10
	p2 = 52,o2 = 52,k2 = 52,e2 = 52

	var myThirt = new Array()

	i = txt1.indexOf("::: "); myThirt[3] = 'indice=' + i
       if (i > 0) {
        txt2 = txt1.substring(i + 3); len = txt2.length
		myThirt[4] = 'txt2=' + txt2; myThirt[5] = 'len=' + len
		p2 = parseInt(txt2.substring(i=0,i+=3),10) - 10;myThirt[6] = 'p2=' + p2
		if(len > 3){o2 = parseInt(txt2.substring(i,i+=3),10) - 10;myThirt[7] = 'o2=' + o2}
		if(len > 6){k2 = parseInt(txt2.substring(i,i+=3),10) - 10;myThirt[8] = 'k2=' + k2}
		if(len > 9){e2 = parseInt(txt2.substring(i,i+=3),10) - 10;myThirt[9] = 'e2=' + e2}
	}

	xx2 = Math.round(Math.random()* 51)
	while(xx2 == p || xx2 == o || xx2 == k || xx2 == e || xx2 == r || xx2 == p1 || xx2 == o1 
	|| xx2 == k1 || xx2 == e1 || xx2 == r1 || xx2 == p2 || xx2 == o2 || xx2 == k2 || xx2 == e2){
	xx2 = Math.round(Math.random()* 51)}

	myThirt[0] = myCarts[xx2]
	num = myCarts[xx2].substring(0,2);nai = myCarts[xx2].substring(2,3)

	if(dob != 'x1'){
		if (num == 7){
			myThirt[1] = 'Sete é Neutra - Mantém ' + gparc
		}
		else {
			if((dob == '<' && num < 7)||(dob == '>' && num > 7)) {
				gparc = (gparc * 2); myThirt[1] = 'Ganha dobra - ' + gparc
			}
			else {
				gparc = 0; myThirt[1] = 'Perde cheia - ZERO'
			}
		}
	}
	else {  sorte=1
		if(nai == naipe) sorte *= 2
		if(num == numero) sorte *= 4
		if(num == numero && nai == naipe) sorte=10
			if(sorte >= 2){gparc *= sorte; myThirt[1] = 'Ganha cheia - ' + gparc}
			else {gparc = 0; myThirt[1] = 'Perde cheia - ZERO'}
	}

	((gparc == 0) ? myThirt[2] = 'yes' : myThirt[2] = 'no')

	var str = gparc + '-' + txt1 + (txt0.indexOf("::: ") < 0 ? '::: ' : ' ') + (xx2+10)

	GravaStr(Conexao, str)
	Conexao.Close
	return myThirt
   }
   Conexao.Close
}

function Method8(dob,numero,naipe)
{
	//f = fs.OpenTextFile(arcparc, 1, false); var txt1 = f.ReadAll(); f.Close()

	var Conexao = Server.CreateObject("ADODB.Connection")
	var str = "DRIVER={MySQL ODBC 5.3 ANSI Driver};SERVER=aggora1.mysql.dbaas.com.br;PORT=3306;DATABASE=aggora1;USER=aggora1;PASSWORD=dade02;OPTION=3;"
	Conexao.Open(str)

	txt0 = ""; pTotl = 0; pSala = 0
	LeSala(Conexao)

	txt1 = txt0
	gparc = parseInt(txt1,10)

   if(gparc > 0){
	var i = txt1.indexOf(":") + 1
	p = parseInt(txt1.substring(i,i+=3),10) - 10
	o = parseInt(txt1.substring(i,i+=3),10) - 10
	k = parseInt(txt1.substring(i,i+=3),10) - 10
	e = parseInt(txt1.substring(i,i+=3),10) - 10
	r = parseInt(txt1.substring(i,i+=3),10) - 10
	p1 = parseInt(txt1.substring(i+=2,i+=3),10) - 10
	o1 = parseInt(txt1.substring(i,i+=3),10) - 10
	k1 = parseInt(txt1.substring(i,i+=3),10) - 10
	e1 = parseInt(txt1.substring(i,i+=3),10) - 10
	r1 = parseInt(txt1.substring(i,i+=3),10) - 10
	p2 = 52,o2 = 52,k2 = 52,e2 = 52

	var myThirt = new Array()

	i = txt1.indexOf("::: "); myThirt[3] = 'indice=' + i
	if(i > 0){txt2 = txt1.substring(i+3);len = txt2.length
		myThirt[4] = 'txt2=' + txt2; myThirt[5] = 'len=' + len
		p2 = parseInt(txt2.substring(i=0,i+=3),10) - 10;myThirt[6] = 'p2=' + p2
		if(len > 3){o2 = parseInt(txt2.substring(i,i+=3),10) - 10;myThirt[7] = 'o2=' + o2}
		if(len > 6){k2 = parseInt(txt2.substring(i,i+=3),10) - 10;myThirt[8] = 'k2=' + k2}
		if(len > 9){e2 = parseInt(txt2.substring(i,i+=3),10) - 10;myThirt[9] = 'e2=' + e2}
	}

	xx2 = Math.round(Math.random()* 51)
	while(xx2 == p || xx2 == o || xx2 == k || xx2 == e || xx2 == r || xx2 == p1 || xx2 == o1 
	|| xx2 == k1 || xx2 == e1 || xx2 == r1 || xx2 == p2 || xx2 == o2 || xx2 == k2 || xx2 == e2){
	xx2 = Math.round(Math.random()* 51)}

	myThirt[0] = myCarts[xx2]
	num = myCarts[xx2].substring(0,2);nai = myCarts[xx2].substring(2,3)

	if(dob != 'x1'){
		if (num == 7){
			myThirt[1] = 'Sete é Neutra - Mantém ' + gparc
		}
		else {
			if((dob == '<' && num < 7)||(dob == '>' && num > 7)) {
				gparc = (gparc * 2); myThirt[1] = 'Ganha dobra - ' + gparc
			}
			else {
				gparc = 0; myThirt[1] = 'Perde cheia - ZERO'
			}
		}
	}
	else {  sorte=1
		if(nai == naipe) sorte *= 2
		if(num == numero) sorte *= 4
		if(num == numero && nai == naipe) sorte=10
			if(sorte >= 2){gparc *= sorte; myThirt[1] = 'Ganha cheia - ' + gparc}
			else {gparc = 0; myThirt[1] = 'Perde cheia - ZERO'}
	}

	((gparc == 0) ? myThirt[2] = 'yes' : myThirt[2] = 'no')

	var str = gparc + '-' + txt1 + (txt0.indexOf("::: ") < 0 ? '::: ' : ' ') + (xx2+10)

	GravaStr(Conexao, str)
	Conexao.Close
	return myThirt
   }
   Conexao.Close
}

</SCRIPT>