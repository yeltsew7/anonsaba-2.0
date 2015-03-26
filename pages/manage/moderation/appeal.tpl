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
<th>IP</th>
<th>Message</th>
<th>Reason banned</th>
<th>&nbsp;</th>
</tr>
</thead>
{% for appeal in appeals %}
<tbody>
<td>{{appeal.ip}}</td>
<td>{{appeal.appealmsg}}</td>
<td>{{appeal.reason}}</td>
<td>[<a href="index.php?side={{current}}&action=appeal&act=approve&id={{appeal.id}}"> Approve</a> ]&nbsp;[<a href="index.php?side={{current}}&action=appeal&act=deny&id={{appeal.id}}"> Deny</a> ]</td>
</tbody>
{%endfor%}
</table>
</table>
{% endblock %}
