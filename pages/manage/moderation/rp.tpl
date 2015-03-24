{% extends "/manage/main.tpl" %}
{% block managecontent %}
<table class="changepass">
<col class="col1" />
<thead>
<tr>
<th colspan="4">Recent Posts</th>
</tr>
</thead>
<form method="POST">
<div style="float:left;">
<th><input type="submit" name="clear" value="Clear All"></th>
</div>
</form>
<tbody>
{% if message != '' %}
<tr><td><center><b>{{message|raw}}</b></center></tr></td>
{% endif %}
{% for post in posts %}
	<tr><td>Board:<b>/{{post.boardname}}/</b><br />
		ID: {{post.id}}<br />
		Name: {{post.name}}<br />
		Image: {% for file in files %}
		{% if post.id == file.id and post.boardname == file.board %}
			<img src="{{url}}{{post.boardname}}/src/{{file.file}}{{file.type}}" height="50" width="50">
		{% endif %}{% endfor %}<br />
		Message: {% if post.level > 0 %}{{post.message|raw}}{% else %}{{post.message}}{% endif %}
	</td></tr>
{% endfor %}
</tbody>
</table>
<center>
{% if pages -1 > 0 %}
  {% for i in range(0, pages ) %}
      [ {% if page != i %}<a href="/management/index.php?side={{current}}&action=recentpost&page={{i}}">{% endif %}{{i}}{% if page != i %}</a>{% endif %} ]
  {% endfor %}
{% else %}
[ 0 ]
{% endif %}
</center>
{% endblock %}
