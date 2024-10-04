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
		UsuarioDados.Open "SELECT USD_Total, USD_1gm FROM UserDados WHERE USR_ID = " & Session("id"), Conexao
			pSala = UsuarioDados("USD_1gm")
			pTotl = UsuarioDados("USD_Total")
		Usuariodados.Close
		Set UsuarioDados = Nothing
	End Function

	Function GravaSala(Conexao)
		Conexao.Execute "UPDATE UserDados SET USD_Total = " & pTotl & ", USD_1gm = " & pSala & " WHERE USR_ID = " & Session("id")
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
	this.Method0 = Method0; this.Method1 = Method1; this.Method2 = Method2
}

	public_description = new Description()

function Method0()
{
	var Conexao = Server.CreateObject("ADODB.Connection")
	str = "DRIVER={MySQL ODBC 5.3 ANSI Driver};SERVER=187.45.196.225;PORT=3306;DATABASE=aggora1;USER=aggora1;PASSWORD=dade02;OPTION=3;"
	Conexao.Open(str)

	pTotl = 0; pSala = 0
	LeSala(Conexao)

	if(pTotl > 1 && Session("xdemo") == "demo01"){
		pTotl -= 1
		pSala -= 1

		GravaSala(Conexao)
		Conexao.Close
		return new Array("ok")
	}
	else {
		Conexao.Close
		return new Array("no")
	}
}

function Method1(apost)
{
	apost = parseInt(apost,10)

	var Conexao = Server.CreateObject("ADODB.Connection")
	str = "DRIVER={MySQL ODBC 5.3 ANSI Driver};SERVER=187.45.196.225;PORT=3306;DATABASE=aggora1;USER=aggora1;PASSWORD=dade02;OPTION=3;"
	Conexao.Open(str)

	pTotl = 0; pSala = 0
	LeSala(Conexao)

	if(pTotl >= apost && Session("xdemo") == "demo01"){
		pTotl -= apost
		pSala -= apost
		Session("livCav") = 1

		GravaSala(Conexao)
		Conexao.Close
		return new Array("ok")
	}
	else {
		Conexao.Close
		return new Array("no")
	}
}

function Method2(gparc)
{
	gparc = parseInt(gparc,10)

	var Conexao = Server.CreateObject("ADODB.Connection")
	str = "DRIVER={MySQL ODBC 5.3 ANSI Driver};SERVER=187.45.196.225;PORT=3306;DATABASE=aggora1;USER=aggora1;PASSWORD=dade02;OPTION=3;"
	Conexao.Open(str)

	pTotl = 0; pSala = 0
	LeSala(Conexao)

	if(Session("xdemo") == "demo01" && gparc < 401 && Session("livCav") == 1){
		Session("livCav") = null
		pTotl += gparc
		pSala =+ gparc

		GravaSala(Conexao)
		Conexao.Close
	}
	else Conexao.Close
}

</SCRIPT>