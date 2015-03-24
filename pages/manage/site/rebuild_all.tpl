{% extends "/manage/main.tpl" %}
{% block managecontent %}
<table class="rebuild">
<col class="col1" />
<thead>
<tr>
<th colspan="4">Clear Twig cache</th>
</tr>
</thead>
<tbody>
{% if cache == '1' %}
<tr><td>Clearing Twig cache now...</tr></td>
{% endif %}
{% if done == '1' %}
<tr><td>{{message|raw}}</td></tr>
{% endif %}

<form method="POST">
<tr><td><input type="submit" name="run" value="Clear Cache" /></tr></td>
</form>
</tbody>
</table>
{% endblock %}
