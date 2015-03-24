{% extends "/manage/main.tpl" %}
{% block managecontent %}
<table class="changepass">
<col class="col1" />
<thead>
<tr>
<th colspan="4">Private Messages</th>
</tr>
</thead>
<tbody>
<form method="POST" action="index.php?side={{current}}&action=pms">
{% if msg != '' %}
<tr><td><center><b>{{msg|raw}}</b></center></tr></td>
{% endif %}
<tr><td>To: 
<select name="to">
{% if do == "reply" %}
	{% for msg in messages %}
		<option value="{{msg.from}}">{{msg.from}}</option>
	{% endfor %}
{% else %}
	{% for name in users %}
            <option value="{{name.username}}">{{name.username}}</option>
	{% endfor %}
{% endif %}
</select>
</td></tr>
<tr><td>Subject: <input type="text" name="subject" value="{% if do == "reply" %}{%for msg in messages %}RE:&nbsp;{{msg.subject}}{% endfor %}{% endif %}">
</td></tr>
<tr><td>Message: <textarea name="message"></textarea>
<tr><td><input type="submit" name="submit" value="Submit" /></td></tr>
</tbody>
<br />
<table class="users" cellspacing="1px">
<col class="col1" /> <col class="col2" />
<col class="col1" /> <col class="col2" />
<thead>
<tr>
<th>From</th>
<th>Subject</th>
<th>Message</th>
<th>Time</th>
<th>Read</th>
</tr>
</thead>
{% for msg in messages %}
<tbody>
<td>{{msg.from}}</td>
<td>{{msg.subject}}</td>
<td>{{msg.message}}</td>
<td>{{msg.time|date('m/d/y @ h:i:s A')}}</td>
<td>
{% if msg.read == 1 %}
	Yes
{% else %}
	No
{% endif %}
</td>
<td>
{% if do != "reply" %}
	[<a href="index.php?side={{current}}&action=pms&do=read&id={{msg.id}}">Read</a>]&nbsp;&nbsp;[<a href="index.php?side={{current}}&action=pms&do=reply&id={{msg.id}}">Reply</a>]&nbsp;&nbsp;[<a href="index.php?side={{current}}&action=pms&do=del&id={{msg.id}}">Delete</a>]
{% else %}
	Replying
{% endif %}
</td>
</tbody>
{% endfor %}
</table>
{% endblock %}
