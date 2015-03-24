{% extends "/manage/main.tpl" %}
{% block managecontent %}
<table class="changepass">
<col class="col1" />
<thead>
<tr>
<th colspan="4">Cleanup</th>
</tr>
</thead>
<tbody>
{% if cleansql == '1' %}
<tr><td>Cleaning SQL database...</tr></td>
{% endif %}
{% if sqldone == '1' %}
<tr><td><font color="green">SQL database has been cleaned</font></td></tr>
{% endif %}
{%if twigcache == '1' %}
<tr><td>Generating new HTML files and clearing Twig cache...</td></tr>
{% endif %}
{%if twigdone == '1' %}
<tr><td><font color="green">HTML files generated and Twig cache cleared</font></td></tr>
<tr><td>Cleanup took <b>{{howlong}}</b> seconds.</tr></td>
{% endif %}
<form method="POST">
<tr><td><input type="submit" name="cleanup" value="Cleanup" /></tr></td>
</form>
</tbody>
</table>
{% endblock %}
