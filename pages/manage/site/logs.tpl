{% extends "/manage/main.tpl" %}
{% block managecontent %}
<table class="logs">
<col class="col1" />
<thead>
<tr>
<form method="POST">
<th colspan="4">Logs</th>
</tr>
</thead>
<tbody>
{% if message != '' %}
<tr><td><center><b>{{message|raw}}</b></center></tr></td>
{% endif %}
<table class="users" cellspacing="1px">
<col class="col1" /> <col class="col2" />
<col class="col1" /> <col class="col2" />
<thead>
<tr>
<th>Time</th>
<th>User</th>
<th>Message</th>
{% if root != '' %}
<th>[<a href="index.php?side={{current}}&action=logs&do=del&id=all">Delete All</a>]</th>
{% endif %}
</tr>
</thead>
<tbody>
 {% for log in entries %}
<tr>
<td>{{ log.time|date('m/d/y @ h:i:s A') }}</td>
<td>{{ log.user }}</td>
<td>{{ log.message }}</td>
{% if root != '0' %}
<td>[<a href="index.php?side={{current}}&action=logs&do=del&id={{log.id}}">Delete</a>]</td>
{% endif %}
</tr>
{% endfor %}
</tbody>
</table>
<center>
{% if pages -1 > 0 %}
  {% for i in range(0, pages ) %}
      [ {% if page != i %}<a href="/management/index.php?side={{current}}&action=logs&page={{i}}">{% endif %}{{i}}{% if page != i %}</a>{% endif %} ]
  {% endfor %}
{% else %}
[ 0 ]
{% endif %}
</center>
</form>
{% endblock %}
