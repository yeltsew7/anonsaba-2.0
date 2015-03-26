{% extends "/manage/main.tpl" %}
{% block managecontent %}
<table class="changepass">
<col class="col1" />
<thead>
<tr>
<th colspan="4">Add board</th>
</tr>
</thead>
<tbody>
{% if message != '' %}
<tr><td><center><b>{{message|raw}}</b></center></tr></td>
{% endif %}
<form method="POST">
<tr><td>Directory: <input type="text" name="dir"></td></tr>
<tr><td>Description: <input type="text" name="desc"></tr><td>
<tr><td><input type="submit" name="submit" value="Submit"></tr></td>
</form>
<br />
<table class="users" cellspacing="1px">
<col class="col1" /> <col class="col2" />
<col class="col1" /> <col class="col2" />
<thead>
<tr>
<th colspan="4">Delete board</th>
</tr>
</thead>
<form method="POST">
<tbody>
<tr><td><label for="delboard">Directory:</label>
<select name="delboard">
{% for boards in entry %}
            <option value="{{boards.name}}">/{{boards.name}}/</option>
{% endfor %}
</select>
</tr></td>
<tr><td><input type="submit" name="delete" value="Submit"></tr></td>
</tbody>
</form>
</table>
{% endblock %}
