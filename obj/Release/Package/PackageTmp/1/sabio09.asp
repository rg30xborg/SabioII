<%@ LANGUAGE=VBSCRIPT %>
<%
	Response.Expires = 0

'                   If inStr(Request.ServerVariables("HTTP_HOST"), "www.aggora.com.br") = 0 Then
'                   	Response.Redirect "http://www.aggora.com.br/sabio/help.htm"
'                   	Response.End
'                   Else
	If Session("IPUserSab") = "" Or Session("mail") = "" Then
		Response.Redirect "sabio12.asp"         'http://www.aggora.com.br/sabio/1/
		Response.End
	End If

	RSDispatch

	Function TotAposta(Conexao, prem, apt)
		Set ApostasPremio = Server.CreateObject("ADODB.Recordset")
		'ApostasPremio.CursorType = adOpenKeyset
		'ApostasPremio.LockType = adLockOptimistic
		ApostasPremio.Open "SELECT USA_Apostas FROM Premios_Apostas WHERE PRE_Cod = " & prem & " And USR_ID = " & Session("id"), Conexao
			If Not ApostasPremio.EOF Then
				text1 = ApostasPremio("USA_Apostas") + apt
				Conexao.Execute "UPDATE Premios_Apostas SET USA_Apostas = " & text1 & " WHERE PRE_Cod = " & prem & " And USR_ID = " & Session("id")
			Else
				Conexao.Execute "INSERT INTO Premios_Apostas(PRE_Cod, USR_ID, USA_Apostas) VALUES(" & prem & "," & Session("id") & "," & apt & ")"
			End If
		ApostasPremio.Close
		Set ApostasPremio = Nothing
		Set Premio = Server.CreateObject("ADODB.Recordset")
		Premio.Open "SELECT PRE_Apostas FROM Premios WHERE PRE_Cod = " & prem, Conexao
			text2 = Premio("PRE_Apostas")
		Premio.Close
		Set Premio = Nothing
	End Function

	Function LeTot(Conexao)
		Set UsuarioDados = Server.CreateObject("ADODB.Recordset")
		UsuarioDados.Open "SELECT USD_Total FROM UserDados WHERE USR_ID = " & Session("id"), Conexao
			pTotl = UsuarioDados("USD_Total")
		Usuariodados.Close
		Set UsuarioDados = Nothing
	End Function
'                   End If
%>

<SCRIPT RUNAT=SERVER Language=JScript>

function RSDispatch(vtable,methodname){

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

function Return(x){
	var returnType = typeof(x);
	if (returnType == 'object' || returnType == 'number' || returnType == 'boolean')
		return '<RETURN_VALUE TYPE=EVAL_OBJECT>' + escape(uneval(x)) + '</RETURN_VALUE>';
	else
		return '<RETURN_VALUE TYPE=SIMPLE>' + escape(x) + '</RETURN_VALUE>';
}

function GetServerProxy(pd){
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
function unevalGetNextID(){
	return '_o' + unevalNextID++;
}

function uneval(obj){
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

function unevalDecl(obj){
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

function unevalInst(obj){
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

function unevalClear(obj){
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

function unevalDoNothing() {	}

function unevalConvertToString(obj){	return String(obj);		}

function unevalString(str){	return '"' + str.replace(/([^\\])'/g,'$1\\"') + '"'; 	}

function initUneval(){
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

}	// end of initUneval

function Description(){
	this.Method1 = Method1
}

	public_description = new Description()

function Method1(botoes){

	var Conexao = Server.CreateObject("ADODB.Connection")
	var str = '"DRIVER={MySQL ODBC 5.3 ANSI Driver};SERVER=aggora1.mysql.dbaas.com.br;PORT=3306;DATABASE=aggora1;USER=aggora1;PASSWORD=dade02;OPTION=3;"
		  '	"Provider=SQLOLEDB.1;SERVER=186.202.148.130;DATABASE=aggora1;UID=aggora1;PWD=dade02;"
	Conexao.Open(str)

	pPule = parseInt(botoes.substr(botoes.indexOf(" ||:") + 4), 10)

	// var arcptot = "C:\\Sabichao\\Users\\" + Session("mail") + ".tot"
	// var f, fs = new ActiveXObject("Scripting.FileSystemObject")
	// f = fs.OpenTextFile(arcptot, 1, false); text0 = f.ReadLine(); f.Close()
	// pTotl = parseInt(text0.substr(text0.indexOf("Totl:") + 5), 10)

	pTotl = 0
	LeTot(Conexao)

	var apTotl = 0, premios = new Array(), apostas = new Array()
	var j = 1
	for(i = pPule; i > 0; i--){
		botoes = botoes.substr(botoes.indexOf("#") + 1)
		premios[j] = parseInt(botoes, 10)
		k = parseInt(botoes.substr(botoes.indexOf(":") + 1), 10)
		apostas[j] = k, apTotl += k; j++
	}

	if(apTotl > pTotl){
		Conexao.Close()
		return new Array("no")
	} else {
		//pCosc = parseInt(text0, 10)
		//text0 = pCosc + "Totl:" + (pTotl - apTotl)
		//f = fs.CreateTextFile(arcptot, true); f.Write(text0); f.Close()  			//diminue os pontos do user

		//pTotl -= apTotl
		//GravaTot(Conexao, pTotl, apTotl)  //Grava total e apostas em UserDados (fazer em trigger para cada aposta individual)

		//var arcparc = "C:\\Sabichao\\Users\\" + Session("mail") + ".apt"
		//if(fs.FileExists(arcparc) == true){
		//	f = fs.OpenTextFile(arcparc, 1, false); text3 = f.ReadLine(); f.Close()
		//	text3 = parseInt(text3, 10) + apTotl}
		//else text3 = apTotl
		//f = fs.CreateTextFile(arcparc, true); f.Write(text3); f.Close()			//aumenta total apostas do user

		var myFirst = new Array(); myFirst[0] = "ok"
		for(i = 1; i <= pPule; i++){								//para cada premio que teve aposta
			//var arcparc = "C:\\Sabichao\\Premios\\" + Session("mail") + "." + premios[i]
			//if(fs.FileExists(arcparc) == true){
			//	f = fs.OpenTextFile(arcparc, 1, false); text1 = f.ReadLine(); f.Close()
			//	text1 = parseInt(text1, 10) + apostas[i]}
			//else text1 = apostas[i]
			//f = fs.CreateTextFile(arcparc, true); f.Write(text1); f.Close()		//aumenta aposta do user no premio

			text1 = apostas[i]				//Total de apostas do user
			text2 = 0					//Total de apostas do premio
			TotAposta(Conexao, premios[i], apostas[i])

			// var arcparc = "C:\\Sabichao\\Premios\\Premio." + premios[i]
			// f = fs.OpenTextFile(arcparc, 1, false); text2 = f.ReadLine(); f.Close()
			// text2 = parseInt(text2, 10) + apostas[i]
			// f = fs.CreateTextFile(arcparc, true); f.Write(text2); f.Close()		//aumenta total de apostas no premio

			myFirst[i] = Math.round(text2/text1)
		}
		Conexao.Close()
		return myFirst
	}
}

</SCRIPT>
