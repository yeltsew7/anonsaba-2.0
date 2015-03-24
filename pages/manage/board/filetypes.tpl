{% extends "/manage/main.tpl" %}
{% block managecontent %}
<table class="changepass">
<col class="col1" />
<thead>
<tr>
<th colspan="4">Filetypes</th>
</tr>
</thead>
<tbody>
{% if message != '' %}
<tr><td><center><b>{{message|raw}}</b></center></tr></td>
{% endif %}
{% if do != 'edit' %}
<form method="POST" action="index.php?side={{current}}&action=filetypes&do=add">
<tr><td>Filetype: <input type="text" name="name"> (<b>LOWER CASE</b>)</td></tr>
<tr><td>Image: <input type="text" name="image" value="generic.png"></tr><td>
<tr><td><input type="submit" name="submit" value="Submit"></tr></td>
</form>
{% else %}
{% for item in entrys %}
<form method="post" action="index.php?side={{current}}&action=filetypes&do=edit&id={{item.id}}">
<tr><td>Filetype: <input type="text" name="name" value="{{item.name}}"></td></tr>
<tr><td>Image: <input type="text" name="image" value="{{item.image}}"></tr><td>
<tr><td><input type="submit" name="submit" value="Submit"></tr></td>
</form>
{% endfor %}
{% endif %}
<br />
<table class="users" cellspacing="1px">
<col class="col1" /> <col class="col2" />
<col class="col1" /> <col class="col2" />
<thead>
<tr>
<th>Filetype</th>
<th>Image</th>
<th>&nbsp;</th>
</tr>
</thead>
<tbody>
 {% for types in entry %}
<tr>
<td>{{ types.name|upper }}</td>
<td>{{ types.image }}</td>
<td>[<a href="index.php?side={{current}}&action=filetypes&do=edit&id={{types.id}}">Edit</a>]&nbsp;[<a href="index.php?side={{current}}&action=filetypes&do=del&id={{types.id}}">Delete</a>]</td>
</tr>
{% endfor %}
</tbody>
</table>
{% endblock %}
