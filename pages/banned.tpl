<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>BANNED!</title>
<style type="text/css">
{% raw %}
body {
        background:#FAE8D4;
	width: 100% !important;
}
{% endraw %}</style>
</head>
<body>
<h1 style="font-size: 3em;">Banned</h1>
<br />
<h2 style="font-size: 2em;font-weight: bold;text-align: center;">
OH NO! You're Banned :(
</h2>
<img src="/pages/css/banned.jpg" style="float:left" />
{% for ban in bans %}
IP: {{ban.ip}}<br />
Reason: {{ban.reason}}<br />
Banned until: {{ban.until|date('m/d/y @ h:i:s A')}}<br />
Banned from: {% if ban.boards == 'all' %}All Boards{% else %}{{ban.boards|replace({'|':'/, /'})}}{% endif %}<br />
Can Appeal? {% if ban.appeal != 0 %}Yes{% else %}No{% endif %}
{%if ban.appeal != 0 %}
<br />
Can Appeal on: {{ban.appeal|date('m/d/y @ h:i:s A')}}
{% endif %}
{% endfor %}
<div style="text-align: center;width: 100%;position: absolute;bottom: 10px;">
<br />
<div class="footer" style="clear: both;">
	<div class="legal">	- Anonsaba {{version}} -
</div>
</div>
</body>
</html>
