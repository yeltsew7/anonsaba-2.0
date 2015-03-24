{% extends "/manage/main.tpl" %}
{% block managecontent %}
<table class="news">
<col class="col1" />
<thead>
<tr>
<th colspan="4">News</th>
</tr>
</thead>
<tbody>
{% if message != '' %}
<tr><td><center><b>{{message|raw}}</b></center></tr></td>
{% endif %}
{% if do != 'edit' %}
<form method="POST" action="index.php?side={{current}}&action=news">
<tr><td>Email: <input type="text" name="email">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>CAN BE LEFT BLANK</b>
<tr><td>Subject: <input type="text" name="subject">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>CAN NOT BE LEFT BLANK</b></td></tr>
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
<th>Date Added</th>
<th>Subject</th>
<th>Message</th>
<th>&nbsp;</th>
</tr>
</thead>
<tbody>
 {% for news in entries %}
<tr>
<td>{{ news.date|date('m/d/y @ h:i:s A') }}</td>
<td>{{ news.subject|raw }}</td>
<td>{{ news.message|raw }}</td>
<td>[<a href="index.php?side={{current}}&action=news&do=edit&id={{news.id}}">Edit</a>]&nbsp;[<a href="index.php?side={{current}}&action=news&do=del&id={{news.id}}">Delete</a>]</td>
</tr>
{% endfor %}
{% else %}
{% for item in entry %}
<form method="post" action="index.php?side={{current}}&action=news&do=edit&id={{item.id}}">
<tr><td>Email: <input type="text" name="email" value="{{item.email}}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>CAN BE LEFT BLANK</b>
<tr><td>Subject: <input type="text" name="subject" value="{{item.subject}}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>CAN NOT BE LEFT BLANK</b></td></tr>
<tr><td><label for="message">Message:</label> <textarea id="message" name="message" rows="25" cols="80">{{item.message}}</textarea></tr><td>
<tr><td><input type="submit" name="submit" value="Submit"></tr></td>
<input type="hidden" id="edit" name="edit" value="{{item.id}}" />
</form>
{% endfor %}
{% endif %}
</tbody>
</table>
{% endblock %}
