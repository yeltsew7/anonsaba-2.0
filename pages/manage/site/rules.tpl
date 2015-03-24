{% extends "/manage/main.tpl" %}
{% block managecontent %}
<table class="changepass">
<col class="col1" />
<thead>
<tr>
<th colspan="4">Rules</th>
</tr>
</thead>
<tbody>
{% if message != '' %}
<tr><td><center><b>{{message|raw}}</b></center></tr></td>
{% endif %}
{% if do != 'edit' %}
<form method="POST" action="index.php?side={{current}}&action=rules">
<tr><td>Rule subject: <input type="text" name="subject">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>CAN NOT BE LEFT BLANK</b></td></tr>
<tr><td><label for="message">Message:</label> <textarea id="message" name="message" rows="25" cols="80"></textarea></tr><td>
<tr><td><input type="submit" name="submit" value="Submit"></tr></td>
<input type="hidden" id="edit" name="edit" value="" />
</form>
<br />
<table class="users" cellspacing="1px">
<col class="col1" /> <col class="col2" />
<col class="col1" /> <col class="col2" />
<thead>
<tr>
<th>Rule subject</th>
<th>Message</th>
<th>&nbsp;</th>
</tr>
</thead>
<tbody>
 {% for rules in entries %}
<tr>
<td>{{ rules.subject|raw }}</td>
<td>{{ rules.message|raw }}</td>
<td>[<a href="index.php?side={{current}}&action=rules&do=edit&id={{rules.id}}">Edit</a>]&nbsp;[<a href="index.php?side={{current}}&action=rules&do=del&id={{rules.id}}">Delete</a>]</td>
</tr>
{% endfor %}
{% else %}
{% for item in entry %}
<form method="post" action="index.php?side={{current}}&action=rules&do=edit&id={{item.id}}">
<tr><td>Rule subject: <input type="text" name="subject" value="{{item.subject}}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>CAN NOT BE LEFT BLANK</b></td></tr>
<tr><td><label for="message">Message:</label> <textarea id="message" name="message" rows="25" cols="80">{{item.message}}</textarea></tr><td>
<tr><td><input type="submit" name="submit" value="Submit"></tr></td>
<input type="hidden" id="edit" name="edit" value="{{item.id}}" />
</form>
{% endfor %}
{% endif %}
</tbody>
</table>
{% endblock %}
