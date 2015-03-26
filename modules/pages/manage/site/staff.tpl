{% extends "/manage/main.tpl" %}
{% block managecontent %}
<table class="logs">
<col class="col1" />
<thead>
<tr>
<th colspan="4">Staff</th>
</tr>
</thead>
<tbody>
{% if message != '' %}
<tr><td><center><b>{{message|raw}}</b></center></tr></td>
{% endif %}
{% if do != 'edit' %}
<form method="POST" action="index.php?side={{current}}&action=staff&do=add">
<tr><td>Username: <input type="text" name="username">
<tr><td>Password: <input type="text" name="password">
<tr><td><label for="level">Staff level:</label>
        <select name="level">
            <option value="admin">Administrator</option>
            <option value="supermod">Super Moderator</option>
            <option value="mod">Moderator</option>
            <option value="janitor">Janitor</option>
        </select>
</tr><td>
<tr><td><input type="submit" name="submit" value="Submit"></tr></td>
</form>
<br /><br />
<table class="users" cellspacing="1px">
<col class="col1" /> <col class="col2" />
<col class="col1" /> <col class="col2" />
<thead>
<tr>
<th>Username</th>
<th>Boards</th>
<th>Last active</th>
<th>&nbsp;</th>
</tr>
</thead>
<thead>
<tr>
<th colspan="4">Administrators</th>
</tr>
</thead>
<tbody>
 {% for staff in entries %}
{% if staff.level == 'admin' and staff.suspended == '0' %}
<tr>
<td>{{ staff.username }}</td>
<td>All boards</td>
<td>{% if staff.active == '0' %}Never{% else %}{{staff.active|date('m/d/y @ h:i:s A')}}{% endif %}</td>
<td>[<a href="index.php?side={{current}}&action=staff&do=edit&id={{staff.id}}">Edit</a>]&nbsp;[<a href="index.php?side={{current}}&action=staff&do=suspend&id={{staff.id}}">Suspended</a>]&nbsp;[<a href="index.php?side={{current}}&action=staff&do=del&id={{staff.id}}">Delete</a>]</td>
</tr>
{% endif %}
{% endfor %}
<tr>
<th colspan="4">Super Moderators</th>
</tr>
</thead>
<tbody>
 {% for staff in entries %}
{% if staff.level == 'supermod' and staff.suspended == '0' %}
<tr>
<td>{{ staff.username }}</td>
<td>{% if staff.boards == '' %}None{% elseif staff.boards == 'allboards' %}All boards{% else %}/{{staff.boards|replace({'|':'/, /'})}}/{% endif %}</td>
<td>{% if staff.active == '0' %}Never{% else %}{{staff.active|date('m/d/y @ h:i:s A')}}{% endif %}</td>
<td>[<a href="index.php?side={{current}}&action=staff&do=edit&id={{staff.id}}">Edit</a>]&nbsp;[<a href="index.php?side={{current}}&action=staff&do=suspend&id={{staff.id}}">Suspended</a>]&nbsp;[<a href="index.php?side={{current}}&action=staff&do=del&id={{staff.id}}">Delete</a>]</td>
</tr>
{% endif %}
{% endfor %}
<tr>
<th colspan="4">Moderators</th>
</tr>
</thead>
<tbody>
 {% for staff in entries %}
{% if staff.level == 'mod' and staff.suspended == '0' %}
<tr>
<td>{{ staff.username }}</td>
<td>{% if staff.boards == '' %}None{% elseif staff.boards == 'allboards' %}/{{staff.boards|replace({'|':'/, /'})}}/{% endif %}</td>
<td>{% if staff.active == '0' %}Never{% else %}{{staff.active|date('m/d/y @ h:i:s A')}}{% endif %}</td>
<td>[<a href="index.php?side={{current}}&action=staff&do=edit&id={{staff.id}}">Edit</a>]&nbsp;[<a href="index.php?side={{current}}&action=staff&do=suspend&id={{staff.id}}">Suspended</a>]&nbsp;[<a href="index.php?side={{current}}&action=staff&do=del&id={{staff.id}}">Delete</a>]</td>
</tr>
{% endif %}
{% endfor %}
<tr>
<th colspan="4">Janitors</th>
</tr>
</thead>
<tbody>
 {% for staff in entries %}
{% if staff.level == 'janitor' and staff.suspended == '0' %}
<tr>
<td>{{ staff.username }}</td>
<td>{% if staff.boards == '' %}None{% elseif staff.boards == 'allboards' %}/{{staff.boards|replace({'|':'/, /'})}}/{% endif %}</td>
<td>{% if staff.active == '0' %}Never{% else %}{{staff.active|date('m/d/y @ h:i:s A')}}{% endif %}</td>
<td>[<a href="index.php?side={{current}}&action=staff&do=edit&id={{staff.id}}">Edit</a>]&nbsp;[<a href="index.php?side={{current}}&action=staff&do=suspend&id={{staff.id}}">Suspended</a>]&nbsp;[<a href="index.php?side={{current}}&action=staff&do=del&id={{staff.id}}">Delete</a>]</td>
</tr>
{% endif %}
{% endfor %}
<tr>
<th colspan="4">Suspended</th>
</tr>
</thead>
<tbody>
 {% for staff in entries %}
{% if staff.suspended == '1' %}
<tr>
<td>{{ staff.username }}</td>
<td>{% if staff.boards == '' %}None{% elseif staff.boards == 'allboards' %}/{{staff.boards|replace({'|':'/, /'})}}/{% endif %}</td>
<td>{% if staff.active == '0' %}Never{% else %}{{staff.active|date('m/d/y @ h:i:s A')}}{% endif %}</td>
<td>[<a href="index.php?side={{current}}&action=staff&do=edit&id={{staff.id}}">Edit</a>]&nbsp;[<a href="index.php?side={{current}}&action=staff&do=unsuspend&id={{staff.id}}">Unsuspended</a>]&nbsp;[<a href="index.php?side={{current}}&action=staff&do=del&id={{staff.id}}">Delete</a>]</td>
</tr>
{% endif %}
{% endfor %}
{% else %}
{% for data in staff %}
<form method="POST" action="index.php?side={{current}}&action=staff&do=edit&id={{data.id}}">
<tr><td>Username: <input type="text" id="username" name="username" value="{{data.username}}" disabled="disabled" />
<tr><td><label for="level">Staff level:</label>
        <select name="level">
            <option value="admin" {% if data.level == 'admin' %}selected="selected"{% endif %}>Administrator</option>
            <option value="supermod" {% if data.level == 'supermod' %}selected="selected"{% endif %}>Super Moderator</option>
            <option value="mod" {% if data.level == 'mod' %}selected="selected"{% endif %}>Moderator</option>
            <option value="janitor" {% if data.level == 'janitor' %}selected="selected"{% endif %}>Janitor</option>
        </select>
</tr></td>
<tr><td>Boards:<br /> 
<label for="all">All boards </label>
<input type="checkbox" name="all" {% if data.boards == 'all' %}checked="checked"{% endif %} />
<br />
<b><label for="wut">or</label></b><br />
{% for board in boards %}
<label for="mods{{board.name}}">/{{board.name}}/</label>
<input type="checkbox" name="mods{{board.name}}" /><br />
{% endfor %}</tr></td>
<tr><td><input type="submit" name="submit" value="Submit"></tr></td>
</form>
{% endfor %}
{% endif %}
</tbody>
</table>
{% endblock %}
