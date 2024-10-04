<%@ LANGUAGE=VBSCRIPT %>
<%
'server-side ASP code to check for configuration
If Not IsArray(Session("client_config")) Then
   'no config details stored in session so look in request
   strConfig = Request.Form("txtConfig")
   If Len(strConfig) = 0 Then
      'no config information supplied so include code to get it
      strThisPage = Request.ServerVariables("SCRIPT_NAME")
%>
      <IE:CLIENTCAPS STYLE="behavior:url(#default#clientCaps)" ID="xmlClientCaps" />
      <FORM ACTION="<%= strThisPage %>" METHOD="POST">
      <INPUT TYPE="HIDDEN" NAME="txtConfig" VALUE="unknown|unknown">
      <INPUT TYPE="IMAGE" SRC="Config.gif" BORDER="0">
      </FORM>

      <SCRIPT LANGUAGE="VBScript">
      'check browser version, only try and get values if it's IE5 
      If InStr(Navigator.AppName, "Microsoft") _
      And InStr(Navigator.AppVersion, "5.") Then
         'build up configuration string

	Set objCCaps = document.all("xmlClientCaps")
	strConfig = "screen width|" & objCCaps.width & "|" _
          & "screen height|" & objCCaps.height & "|" _
          & "available screen width|" & objCCaps.availWidth & "|" _
          & "available screen height|" & objCCaps.availHeight & "|" _
          & "screen color depth |" & objCCaps.colorDepth & "|" _
          & "screen buffer color depth |" & objCCaps.bufferDepth & "|" _
          & "cookies enabled|" & objCCaps.cookieEnabled & "|" _
          & "Java(tm) enabled|" & objCCaps.javaEnabled & "|" _
          & "client platform|" & objCCaps.platform & "|" _
          & "CPU class|" & objCCaps.cpuClass & "|" _
          & "network connection type|" & objCCaps.connectionType & "|" _
          & "default system language|" & objCCaps.systemLanguage & "|" _
          & "current user language|" & objCCaps.userLanguage & "|"
	strConfig = strConfig & "DHTML data binding installed|" _
          & objCCaps.isComponentInstalled("{333C7BC4-460F-11D0-BC04-0080C7055A83}", "clsid") & "|" _
          & "Java(tm) virtual machine available|" _
          & objCCaps.isComponentInstalled("MSJava", "progid") & "|" _
          & "MPEG display capability|" _
          & objCCaps.isComponentInstalled("video/mpeg", "mimetype") & "|" _
          & "Microsoft NetMeeting installed|" _
          & objCCaps.isComponentInstalled("{44BBA842-CC51-11CF-AAFA-00AA00B6015B}", "componentid") & "|" _
          & "Microsoft Wallet installed|" _
          & objCCaps.isComponentInstalled("application/x-mswallet", "mimetype") & "|" _
          & "ActiveMovie version installed|" _
          & objCCaps.getComponentVersion("{05589fa1-c356-11ce-bf01-00aa0055595a}", "clsid") & "|" _
          & "Direct Animation version installed|" _
          & objCCaps.getComponentVersion("{183C259A-0480-11D1-87EA-00C04FC29D46}", "clsid") & "|"
	intConfigLen = Len(strConfig)
	If intConfigLen > 0 Then strConfig = Left(strConfig, intConfigLen - 1)

      End If
'if we got any values, update the HIDDEN control
      If Len(strConfig) Then Document.Forms(0).Elements(0).Value = strConfig
      </SCRIPT>

      <SCRIPT LANGUAGE="JavaScript">
      document.forms[0].submit();// submit the form to reload the page
      </SCRIPT>
      </BODY>
      </HTML>

<%
      Response.End

	Else
'found values in request so put then into session as an array
      arrConfig = Split(strConfig, "|")
      intConfigCount = UBound(arrConfig)
      Session("client_config") = arrConfig
	End If

'	If Not IsArray(Session("client_config")) Then

	Else
		'array exists in session, so get it into local variable
		arrConfig = Session("client_config")
		intConfigCount = UBound(arrConfig)
	End If
%>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>RG 3.0 - Componentes Instalados</title></head>
<body bgcolor="#FFFFFF" scroll="auto" style="font-family: Verdana, Arial; font-size: 9pt">
<div align="center"><center><a name="Topo"><H3>Navegador-Cliente</a></H3>
<SCRIPT LANGUAGE="VBScript"> document.write navigator.appName & "<BR>" & navigator.appVersion </SCRIPT>
<H3>Informações da Configuração</H3>
<p align="left">
<%
	For intLoop = 0 To intConfigCount Step 2
		Response.Write arrConfig(intLoop) & " = <b>" & arrConfig(intLoop + 1) & "</b><BR>"
	Next
%>
</p><p>Cookies e Java(tm) enabled = <font color="blue">Ajuste <b>Verdadeiro</b></font> p/ este Site</p>

<SCRIPT RUNAT="SERVER" LANGUAGE="JScript">
function showJSVersion() {
  response.write('<tr><td> - Server JScript:</td><td align=center>');
  response.write(ScriptEngineMajorVersion() + '.' + ScriptEngineMinorVersion());
  response.write('</td><td align=center>'); response.write(ScriptEngineBuildVersion()); response.write('</td></tr>');
}
</SCRIPT>
<SCRIPT RUNAT="SERVER" LANGUAGE="VBScript">
Sub showVBVersion()
  Response.Write "<tr><td> - Server VBScript:</td><td align=center>"
  Response.Write ScriptEngineMajorVersion & "." & ScriptEngineMinorVersion
  Response.Write "</td><td align=center>"
  Response.Write ScriptEngineBuildVersion
  Response.Write "</td></tr>"
End Sub
</SCRIPT>
<table border="1" width="90%" style="font-family: Verdana, Arial; font-size: 9pt">
 <tr align="center">
  <td><B>Script Engine</B></td>
  <td><B>Version</B></td>
  <td><B>Build</B></td>
 </tr>
 <% showVBVersion %>
 <% showJSVersion %>
<SCRIPT LANGUAGE="VBScript">
<!--
  document.write "<tr><td> - Browser VBScript:</td><td align=center>"
  document.write ScriptEngineMajorVersion & "." & ScriptEngineMinorVersion
  document.write "</td><td align=center>"
  document.write ScriptEngineBuildVersion
  document.write "</td></tr>"
'-->
</SCRIPT>
<SCRIPT LANGUAGE="JScript">
<!--
  document.write('<tr><td> - Browser JScript:</td><td align=center>');
  document.write(ScriptEngineMajorVersion() + '.' + ScriptEngineMinorVersion());
  document.write('</td><td align=center>'); document.write(ScriptEngineBuildVersion()); document.write('</td></tr>')
//-->
</SCRIPT>
</table>

<p>Browser (VB/J)Script = <font color="blue"><b>5.0 ou Superior</b></font> p/ este Site</p>

<form><input TYPE="button" VALUE="Fecha Dicas" ONCLICK="window.close('/_Library/Config.asp')"></form>
<table border="1" width="90%" style="font-size: 9pt; color: red">
  <tr align="center">
    <td width="45%"><a href="#Topo">Topo</a></td>
    <td width="10%"><img src="http://borg1/ball3.gif" border="0" hspace="5" width="13" height="13"></td>
    <td width="45%"><a href onClick="history.back()">Retornar</a></td>
  </tr>
</table>

</center></div>
</BODY></HTML>
