<%@ LANGUAGE=VBSCRIPT %>
<%
	Response.Expires = 0

If inStr(Request.ServerVariables("HTTP_HOST"), "www.aggora.com.br") = 0 Then
	Response.Redirect "http://www.aggora.com.br/sabio/help.htm"
	Response.End
Else
	If Session("IPUserSab") = "" Or Session("mail") = "" Then
		Response.Redirect "http://www.aggora.com.br/sabio/1/sabio12.asp"
		Response.End
	End If

	RSDispatch

	Function NewResposta(newIDPerg, Conexao)
		Set Perguntas = Server.CreateObject("ADODB.Recordset")
		Perguntas.Open "SELECT aa,bb,cc FROM Perfil WHERE Codigo = " & newIDPerg, Conexao
			resp0 = Perguntas("aa") & Perguntas("bb") & Perguntas("cc")
		Perguntas.Close
		Set Perguntas = Nothing
	End Function

	Function NewPergunta(IDPerg, Conexao)
		Set Perguntas = Server.CreateObject("ADODB.Recordset")
		Perguntas.Open "SELECT * FROM Perfil P, PerfilTema T WHERE T.TPR_Cod = P.TPR_Cod And P.Codigo = " & IDPerg, Conexao
			perg1 = Perguntas("Pergunta")
			resp1 = Perguntas("a")
			resp2 = Perguntas("b")
			resp3 = Perguntas("c")
			tema1 = Perguntas("Tema")
		Perguntas.Close
		Set Perguntas = Nothing
	End Function

	Function Le1pf(Conexao)
		Set UsuarioDados = Server.CreateObject("ADODB.Recordset")
		UsuarioDados.Open "SELECT USD_Total, USD_Consec, USD_1pf FROM UserDados WHERE USR_ID = " & Session("id"), Conexao
			text0 = UsuarioDados("USD_1pf")
			pCosc = UsuarioDados("USD_Consec")
			pTotl = UsuarioDados("USD_Total")
		Usuariodados.Close
		Set UsuarioDados = Nothing
	End Function

	Function Grava1pf(Conexao)
		Conexao.Execute "UPDATE UserDados SET USD_Total = " & pTotl & ", USD_Consec = " & pCosc & ",  USD_1pf = '" & text1 & "' WHERE USR_ID = " & Session("id")
	End Function

	Function Grava1pfG(Conexao)
		Conexao.Execute "UPDATE UserDados SET USD_Total = " & pTotl & " WHERE USR_ID = " & Session("id")
	End Function

End If
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

}	// end of initUneval

function Description()
{
	this.Method1 = Method1; this.Method2 = Method2;
}

public_description = new Description()

	// var arcparc = "c:\\Sabichao\\Divers\\" + Session("mail") + ".1pf"
	// var f, fs = new ActiveXObject("Scripting.FileSystemObject")

function Method1(apost){

	// f = fs.OpenTextFile(arcparc, 1, false); f.ReadLine(); f.Close()

	var Conexao = Server.CreateObject("ADODB.Connection")
	var str = "Provider=SQLOLEDB.1;SERVER=186.202.148.146;DATABASE=aggora1;UID=aggora1;PWD=dade02;"
	Conexao.Open(str)

	text0 = ""; pTotl = 0; pCosc = 0;
	Le1pf(Conexao)

	IDResp = text0.substr(0, 3)
	switch(apost){
		case "a" : imagem = 1; pSala = parseInt(text0.substr(0,1),10); break
		case "b" : imagem = 2; pSala = parseInt(text0.substr(1,1),10); break
		case "c" : imagem = 3; pSala = parseInt(text0.substr(2,1),10); break }

	pSala += parseInt(text0.substr(text0.indexOf("Sala:") + 5), 10)
	sQtde = parseInt(text0.substr(text0.indexOf("Qtde:") + 5), 10) + 1
	pClik = text0.substr(text0.indexOf("Clik:")) + "#R:" + apost + " "
	newIDPerg = parseInt(text0.substr(8), 10) + 1

	resp0 = "000"

	if(newIDPerg > Session("Dados")) newIDPerg = 1
	NewResposta(newIDPerg, Conexao)

	text1 = resp0 + "Perg:" + newIDPerg + "Sala:" + pSala + "Data:" + Session("Hoje") + "Qtde:" + sQtde + pClik
	//f = fs.CreateTextFile(arcparc, true); f.Write(text1); f.Close()

	Grava1pf(Conexao)

	Conexao.Close()
	return new Array("ok",imagem)
}

function Method2(){

	// f = fs.OpenTextFile(arcparc, 1, false); text1 = f.ReadLine(); f.Close()

	var Conexao = Server.CreateObject("ADODB.Connection")
	var str = "Provider=SQLOLEDB.1;SERVER=186.202.148.146;DATABASE=aggora1;UID=aggora1;PWD=dade02;"
	Conexao.Open(str)

	text0 = ""; pTotl = 0; pCosc = 0;
	Le1pf(Conexao)

	IDPerg = parseInt(text0.substr(8),10)
	sQtde = parseInt(text0.substr(text0.indexOf("Qtde:") + 5), 10)

	if(sQtde > Session("DiaP") || IDPerg > Session("Dados")){
		pSala = parseInt(text0.substr(text0.indexOf("Sala:") + 5), 10)
		pClik = parseInt(text0.substr(text0.indexOf("Clik:") + 5), 10)
		pData = text0.substr(text0.indexOf("Data:") + 5, (text0.indexOf("Qtde:") - (text0.indexOf("Data:")+5)))

		//var arcptot = "C:\\Sabichao\\Users\\" + Session("mail") + ".tot"
		//f = fs.OpenTextFile(arcptot, 1, false); text0 = f.ReadLine(); f.Close()
		//pCosc = parseInt(text0, 10)
		//pTotl = parseInt(text0.substr(text0.indexOf("Totl:") + 5), 10) + 200
		//text0 = pCosc + "Totl:" + pTotl
		//f = fs.CreateTextFile(arcptot, true); f.Write(text0); f.Close()
		
		pTotl = pTotl + 200

		//Grava1pf(Conexao)

		//var arcgerl = "C:\\Sabichao\\Visitas\\Perfil.1"
		//if(fs.FileExists(arcgerl) == false){
		//	f = fs.CreateTextFile(arcgerl, true); f.WriteLine(Session("mail") + " Final: " + text1); f.Close()
		//}
		//else {
		//	f = fs.GetFile(arcgerl); var ts = f.OpenAsTextStream(8)
		//	ts.WriteLine(Session("mail") + " Final: " + text1); ts.Close()
		//}

		Grava1pfG(Conexao)

		Conexao.Execute("Insert Into PerfilGeral(USR_ID, PFG_Usuarios) values(" + Session("id") + ",'" + text0 + "')", Conexao)

		Conexao.Close()
		return new Array("xo", pSala, pClik, pTotl, pData)
	}
	else{ perg1 = resp1 = resp2 = resp3 = tema1 = ""
		NewPergunta(IDPerg, Conexao)
		Conexao.Close()
		return new Array(perg1,resp1,resp2,resp3,tema1)
	}
}

</SCRIPT>
