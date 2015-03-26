{% extends "/manage/main.tpl" %}
{% block managecontent %}
<table class="changepass">
<col class="col1" />
<thead>
<tr>
<th colspan="4">Change Account password</th>
</tr>
</thead>
<tbody>
<form method="POST">
{% if message != '' %}
<tr><td><center><b>{{message|raw}}</b></center></tr></td>
{% endif %}
<tr><td>Old password: <input type="text" name="oldpass"></td></tr>
<tr><td>New Password: <input type="text" name="newpass"></td></tr>
<tr><td>New Password (Enter again): <input type="text" name="newpass2"></td></tr>
<tr><td><input type="submit" name="submit" value="Submit" /></td></tr>
</tbody>
</table>
{% endblock %}
