{% extends "/manage/main.tpl" %}
{% block managecontent %}
<table class="changepass">
<col class="col1" />
<thead>
<tr>
<th colspan="4"><div style="float:left;">Site Configuration</div></th>
</tr>
</thead>
<tbody>
{% if message != '' %}
<tr><td><center><b>{{message|raw}}</b></center></tr></td>
{% endif %}
<form method="post">
<th colspan="4">Main<div style="float:right;"><input type="submit" name="submit" value="Update"></div></th>
<tr><td>Site Name: <input type="text" name="sitename" value="{{sitename}}"></td></tr>
<tr><td>Site Slogan: <input type="text" name="slogan" value="{{slogan}}"></td></tr>
<tr><td>IRC: <input type="text" name="irc" value="{{irc}}"></td></tr>
<tr><td>Anonsaba Version: <input type="text" name="version" value="{{version}}" disabled="disabled"></td></tr>
<th colspan="4">Posts</th>
<tr><td>Thread Image Height: <input type="text" name="timgh" value="{{timgh}}"></td></tr>
<tr><td>Thread Image Width: <input type="text" name="timgw" value="{{timgw}}"></td></tr>
<tr><td>Reply Image Height: <input type="text" name="rimgh" value="{{rimgh}}"></td></tr>
<tr><td>Reply Image Width: <input type="text" name="rimgw" value="{{rimgw}}"></td></tr>
<tr><td>Default Ban Message: <input type="text" name="bm" value="{{bm}}"></td></tr>
</tbody>
</table>
{% endblock %}
