
    function RSEnableRemoteScripting(codebase)
	{
		MSRS = new _MSRS_Object();
		if (typeof(codebase) == 'undefined')
		{	// assume applet is in _ScriptLibrary directory off the webroot
			var secondSlash, path;
			codebase = '';
			if ((secondSlash = (path = window.location.pathname).indexOf('/',1)) != -1)
				codebase = path.substring(0,secondSlash);
			codebase += '/_ScriptLibrary';
		}
		document.write('<' + 'APPLET name=RSAspProxyApplet codebase=' + codebase + ' code=RSProxy.class height=0 width=0></APPLET>');	
	}

	function RSExecute(url,method)
	{
		var cb, ecb, context;
		var params = new Array;
		var pn = 0;
		var len = RSExecute.arguments.length;
		for (var i=2; i < len; i++)
			params[pn++] = RSExecute.arguments[i];
		
		return MSRS.invokeMethod(url,method,params);
	}

	function RSGetASPObject(url)
	{
		var cb, ecb, context;
		var params = new Array;
		var request = MSRS.startRequest(url,'GetServerProxy',params,cb,ecb,context);
		//alert(request.data);	// USED FOR DEBUG
		if (request.status == MSRS_COMPLETED)
		{
			var server = request.return_value;
			if (typeof(Function) == 'function')
			{
				for (var name in server)
					server[name] = Function('return MSRS.invokeMethod(this.location,"' +  name + '",this.' + name + '.arguments);');
			}
			else
			{	// JavaScript 1.0 does not support Function  ( IE3.0 )
				for (var name in server)
					server[name] = eval('function t(p0,p1,p2,p3,p4,p5,p6,p7,p8,p9,pA,pB,pC,pD,pE,pF) { return MSRS.invokeMethod(this.location,"' + name + '",this.' + name + '.arguments);} t');
			}
			server.location = url;
			return server;
		}
		alert('Failed to create ASP object for : ' + url);
		return null;
	}

	function RSCallObject(cb,ecb,context)
	{
		this.id = MSRS.nextRequestID++;
		this.status = MSRS_PENDING;
		this.message = '';
		this.data = '';
		this.return_value = '';
		
		this.callback = cb;
		this.error_callback = ecb;
		this.context = context;

		this.wait = RSCallObject_wait;
		this.cancel = RSCallObject_cancel;

		MSRS.requestList[this.id] = this;
	}

    function RSCallObject_wait()
	{
		if (this.status != MSRS_PENDING)
			return;
		while (true)
		{	// wait synchronously for response
			if (MSRS.rsapplet.waitForResponse())
			{
				if (MSRS.rsapplet.hasResponse())
				{
					var rid = MSRS.rsapplet.getRequestID();
					MSRS.handleResponse(rid);
					// DO NOT CHANGE THIS CODE
					// Solves Java to Script discrepancies between IE3 and Navigator
					var strrid = String(rid);
					if (strrid == null)
						strrid = rid;
					if (strrid == this.id)	
						break;				// this response completed			
				}
			}
			else
			{
				this.status = MSRS_FAIL;
				this.message = 'Request not handled.'
				break;
			}
		}
	}

    function RSCallObject_cancel()
	{
		if (this.status == MSRS_PENDING)
		{
			MSRS.rsapplet.cancelRequest(this.id);
			this.status = MSRS_FAIL;
			this.message = 'Request cancelled.'
		}
	}

	function _MSRS_Object()
	{
		MSRS_FAIL = -1;
		MSRS_COMPLETED = 0;
		MSRS_PENDING = 1;
		MSRS_PARTIAL = 2;

		this.REQUEST_MODE_COMPLETE = 0;
		this.POLLING_PERIOD = 100;

		this.pollID = 0;
		this.pollCount = 0;
		this.nextRequestID = 1;
		this.requestList = new Array;
		this.rsapplet = null;

		this.startRequest = _MSRS_startRequest;
		this.invokeMethod = _MSRS_invokeMethod;
		this.handleResponse = _MSRS_handleResponse;
		this.evaluateRequest = _MSRS_evaluateRequest;
		this.setRequestPoll = _MSRS_setRequestPoll;
		this.requestPollHandler = _MSRS_requestPollHandler;
		this.buildURL = _MSRS_buildURL;
	}

	function _MSRS_startRequest(url,method,args,cb,ecb,context)
	{
		var request = new RSCallObject(cb,ecb,context);
		if (this.rsapplet == null)
		{
			if (typeof(document.RSAspProxyApplet) == 'object')
				this.rsapplet = document.RSAspProxyApplet;
			else if (typeof(document.thisForm) == 'object' && typeof(document.thisForm.RSAspProxyApplet) == 'object')
				this.rsapplet = document.thisForm.RSAspProxyApplet;
			else
			{
				errmsg = 'ERROR:\nCannot locate proxy which supports Remote Scripting.\nWas RSEnableRemoteScripting method invoked?';
				request.status = MSRS_FAIL;
				request.message = errmsg; 
				alert(errmsg);
			}
		}

		if (request.status != MSRS_FAIL)
		{
			url = this.buildURL(url,method,args);
			url_context = window.location.href; // May not be 'window.location.pathname'
			this.rsapplet.startRequest(request.id,url_context,url,this.REQUEST_MODE_COMPLETE);
			if (typeof(cb) == 'function')
			{
				if (this.pollCount++ == 0)
					this.setRequestPoll();
			}
			else
			{	// wait synchronously for response
				request.wait();
			}
		}
		return request;
	}

	function _MSRS_invokeMethod(url,method,args)
	{
		var cb, ecb, context;
		var params = new Array;
		var pn = 0;
		var i = 0;
		for (var i=0; i < args.length; i++)
		{
			if (typeof(args[i]) == 'function')
			{
				pn = -1;	// no more params
				if (typeof(cb) == 'undefined')
					cb = args[i];
				else
					ecb = args[i];
			}
			else if (pn != -1)
			{
				params[pn++] = args[i];
			}
			else
				context = args[i];
		}

		return MSRS.startRequest(url,method,params,cb,ecb,context);
	}

	function _MSRS_handleResponse(requestid)
	{
		var request = this.requestList[requestid];
        if (typeof(request) == 'undefined')
		{
            alert('Unknown request id.');
			return;
		}

        request.status = this.rsapplet.getStatus();
        if (request.status == MSRS_COMPLETED)
		{
			request.data = this.rsapplet.getData();
			request.message = this.rsapplet.getMessage();
			this.evaluateRequest(request);
			if (request.status == MSRS_FAIL)
			{	
				if (typeof(request.error_callback) == 'function')
				{
					this.pollCount--;
					request.error_callback(request);
				}
				else
					alert('Remote Scripting Error\n' + request.message);
			}
			else
			{
				if (typeof(request.callback) == 'function')
				{
					this.pollCount--;
					request.callback(request);
				}
			}
			this.rsapplet.endResponse();
			this.requestList[request.id] = null;
		}
        else if (request.status == MSRS_FAIL)
		{
			request.message = this.rsapplet.getMessage();
			if (typeof(request.error_callback) == 'function')
			{
				this.pollCount--;
				request.error_callback(request);
			}
			this.rsapplet.endResponse();
			this.requestList[request.id] = null;
		}
        else if (request.status == MSRS_PARTIAL)
		{	// not handling partial data retrieval yet
		}
        else if (request.status == MSRS_PENDING)
		{	// do nothing
		}
	}

	function _MSRS_evaluateRequest(request)
	{
		var data = request.data;
		var start_index = 0;
		var end_index = 0;
		var start_key = '<' + 'RETURN_VALUE';
		var end_key = '<' + '/RETURN_VALUE>';

		if ((start_index = data.indexOf(start_key)) != -1)
		{
			var data_start_index = data.indexOf('>',start_index) + 1;
			end_index = data.indexOf(end_key,data_start_index);
			if (end_index == -1) 
				end_index = data.length;
			var metatag = data.substring(start_index,data_start_index);
			if (metatag.indexOf('TYPE=SIMPLE') != -1)
			{
				request.return_value = unescape(data.substring(data_start_index,end_index));
				//alert('TYPE=SIMPLE:\n' + data);	// USED FOR DEBUG
			}
			else if (metatag.indexOf('TYPE=EVAL_OBJECT') != -1)
			{
				request.return_value = data.substring(data_start_index,end_index);
				//alert('TYPE=EVAL_OBJECT:\n' + data);	// USED FOR DEBUG
				request.return_value = eval(unescape(request.return_value));
			}
			else if (metatag.indexOf('TYPE=ERROR') != -1)
			{
				request.status = MSRS_FAIL;
				request.message = unescape(data.substring(data_start_index,end_index));		
			}
		}
		else
		{
			request.status = MSRS_FAIL;
			request.message = 'REMOTE SCRIPTING ERROR: Page invoked does not support remote scripting.';			
		}
	}

	function _MSRS_setRequestPoll()
	{
		this.pollID = window.setTimeout('MSRS.requestPollHandler()',this.POLLING_PERIOD,'javascript');
	}

	function _MSRS_requestPollHandler()
	{
        while (this.rsapplet.hasResponse())
        {
			this.handleResponse(this.rsapplet.getRequestID());
		}
        if (this.pollCount != 0)
            this.setRequestPoll();
	}

	function _MSRS_buildURL(url,method,args)
	{
		if (url == '') url = window.location.pathname;
		if (typeof(method) == 'string')
		{
			url += '?_method=' + method;
			url += '&_mtype=execute';
			var params = '&pcount=0';
			if (typeof(args) != 'undefined' && args.length)
			{	// add parameters
				params = '&pcount=' + args.length 
				for (var i = 0; i < args.length; i++) 
				{
					var arg = args[i];
					params += '&p' + i + '=' + escape(arg);
				}
			}
			url += params;
		}
		return url;
	}

	RSEnableRemoteScripting("/_Library")
