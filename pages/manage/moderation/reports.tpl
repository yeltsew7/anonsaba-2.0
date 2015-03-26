{% extends "/manage/main.tpl" %}
{% block managecontent %}
<table class="changepass">
<col class="col1" />
<thead>
<tr>
<th colspan="4">Appeals</th>
</tr>
</thead>
<tbody>
{% if msg != '' %}
<tr><td><center><b>{{msg|raw}}</b></center></tr></td>
{% endif %}
<table class="users" cellspacing="1px">
<col class="col1" /> <col class="col2" />
<col class="col1" /> <col class="col2" />
<thead>
<tr>
<th>ID</th>
<th>Board</th>
<th>Name</th>
<th>Image</th>
<th>Message</th>
<th>Reason</th>
<th>&nbsp;</th>
</tr>
</thead>
{% for report in reports %}
<tbody>
<td>{{report.id}}</td>
<td>/{{report.boardname}}/</td>
<td>{{report.name}}</td>
<td></td>
<td>{{report.message}}</td>
<td>{{report.reportmsg}}</td>
<td>[<a href="index.php?side={{current}}&action=reports&act=clear&id={{report.id}}&board={{report.boardname}}"> Clear</a> ]</td>
</tbody>
{%endfor%}
</table>
</table>
{% endblock %}
