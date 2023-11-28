<!DOCTYPE html>
<html>
<head>
<title>SWISH -- SWI-Prolog for SHaring</title>
<link rel="shortcut icon" href="/icons/favicon.ico">
<link rel="apple-touch-icon" href="/icons/swish-touch-icon.png">

<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/css/swish-min.css">
<script type="text/javascript">

// Override RequireJS timeout, until main file is loaded.
window.require = { waitSeconds: 0 };
		  
</script>
<script src="/js/require.js" data-main="/js/swish-min">

</script>

</head>
<body>
<nav class="navbar navbar-default" role="navigation">
<div class="navbar-header"><button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button><a href="/" class="pengine-logo">&nbsp;</a><a href="/" class="swish-logo">&nbsp;</a></div>
<div class="collapse navbar-collapse" id="navbar">
<ul class="nav navbar-nav menubar">
</ul>
<ul class="nav navbar-nav navbar-right">
<li>
<div class="chat">
<div class="chat-users">
<ul class="nav navbar-nav pull-right" id="chat">
</ul>
</div>
<div class="user-count"><span id="user-count">?</span> users online</div>
</div>
</li>
<li>

<form class="navbar-form" role="search">
<div class="input-group">
<input type="text" class="form-control typeahead" placeholder="Search" data-search-in="source files predicates" title="Searches code, documentation and files" id="search">
<div class="input-group-btn"><button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button></div>
</div>
</form>

</li>
<li><a href="/login" id="login" class="login"><span class="login"><span class="value"><img src="/icons/social_google_box.png" class="login-with" data-server="google" data-frame="popup" title="Login with Google"><img src="/icons/so-icon.png" class="login-with" data-server="stackexchange" data-frame="popup" title="Login with StackOverflow"></span></span><span class="logout"><span class="value">Logout</span></span></a></li>
<li><a class="dropdown-toggle broadcast-bell" data-toggle="dropdown"><span id="broadcast-bell" data-document="gitty:Hangout.swinb"></span><b class="caret"></b></a>
<ul class="dropdown-menu pull-right" id="chat-menu">
<li><a data-action="chat-shared">Open hangout</a></li>
<li><a data-action="chat-about-file">Open chat for current file</a></li>
</ul>
</li>
<li><a id="swish-updates"></a></li>
</ul>
</div>
</nav>
<script type="text/javascript">

		   window.swish = window.swish||{};
		   window.swish.config_hash = "a8439633296df37521855f22a8a6ead83322d56a";
		   
</script>
<script type="text/javascript">

		   window.swish = window.swish||{};
		   window.swish.option = window.swish.option||{};
		  
</script>
<div id="content" class="container tile-top">
<div class="tile horizontal" data-split="50%">
<div class="editors tabbed">
<div class="notebook" data-label="Notebook">

<pre class="notebook-data" style="display:none" data-file="L1_H1.swinb" data-meta="{
  &quot;author&quot;:&quot;Luca Tudor&quot;,
  &quot;commit&quot;:&quot;e632158474263956b6da6949fb99bcb111c451cc&quot;,
  &quot;data&quot;:&quot;eb1034f5ae29fe08a184f55d3942d1698aa79893&quot;,
  &quot;modify&quot;: [&quot;any&quot;, &quot;login&quot;, &quot;owner&quot; ],
  &quot;name&quot;:&quot;L1_H1.swinb&quot;,
  &quot;peer&quot;:&quot;109.98.196.226&quot;,
  &quot;public&quot;:true,
  &quot;symbolic&quot;:&quot;HEAD&quot;,
  &quot;time&quot;:1697017825.3051522,
  &quot;title&quot;:&quot;L1_H1&quot;
}" data-st_type="gitty" data-chats="{&quot;count&quot;:0}">
&lt;div class="notebook"&gt;

&lt;div class="nb-cell program" name="p1"&gt;
geist(logan).
geist(hesh).
geist(elias).
spieltFussball(elias).
party.
&lt;/div&gt;

&lt;/div&gt;
</pre>

</div>
</div>
<div class="tile vertical" data-split="70%">
<div class="prolog-runners"></div>
<div class="prolog-query"></div>
</div>
</div>
</div>
</body>
</html>
