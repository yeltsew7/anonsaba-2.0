{% extends "/manage/main.tpl" %}
{% block managecontent %}
<table class="changepass">
<col class="col1" />
<thead>
<tr>
<th colspan="4">Wordfilters</th>
</tr>
</thead>
<tbody>
{% if message != '' %}
<tr><td><center><b>{{message|raw}}</b></center></tr></td>
{% endif %}
{% if do != 'edit' %}
<form method="POST" action="index.php?side={{current}}&action=wf&do=add">
<tr><td>Word: <input type="text" name="word"></td></tr>
<tr><td>Replaced by: <input type="text" name="replace"></tr><td>
<tr><td><label for="boards">Boards:</label><input type="hidden" name="boards"><br />
<label for="all">All boards</label>
<input type="checkbox" name="all" /><br />
<label for="or">
<b>or</b>
</label><br />
{% for board in boards %}
<label for="words{{board.name}}">/{{board.name}}/</label><input type="checkbox" name="words{{board.name}}">
{% endfor %}
<tr><td><input type="submit" name="submit" value="Submit"></tr></td>
</form>
{% else %}
{% for item in entrys %}
<form method="post" action="index.php?side={{current}}&action=wf&do=edit&id={{item.id}}">
<tr><td>Word: <input type="text" name="word" value="{{item.word}}"></td></tr>
<tr><td>Replaced by: <input type="text" name="replace" value="{{item.replace}}"></tr><td>
<tr><td><label for="boards">Boards:</label><input type="hidden" name="boards"><br />
<label for="all">All boards</label>
<input type="checkbox" name="all" {% if item.boards == 'all' %}checked="checked"{% endif %} /><br />
<label for="or">
<b>or</b>
</label><br />
{% for board in boards %}
<label for="words{{board.name}}">/{{board.name}}/</label><input type="checkbox" name="words{{board.name}}" {% if item.boards in board.name %} checked="checked" {% endif %}>
{% endfor %}
<tr><td><input type="submit" name="submit" value="Submit"></tr></td>
</form>
{% endfor %}
{% endif %}
<br />
<table class="users" cellspacing="1px">
<col class="col1" /> <col class="col2" />
<col class="col1" /> <col class="col2" />
<thead>
<tr>
<th>Word</th>
<th>Replaced</th>
<th>Boards</th>
<th>&nbsp;</th>
</tr>
</thead>
<tbody>
 {% for filter in entry %}
<tr>
<td>{{filter.word}}</td>
<td>{{filter.replace|raw}}</td>
<td>{%if filter.boards == 'all' %}All boards {% else %}/{{filter.boards|replace({'|':'/, /'})}}/{% endif %}</td>
<td>[<a href="index.php?side={{current}}&action=wf&do=edit&id={{filter.id}}">Edit</a>]&nbsp;[<a href="index.php?side={{current}}&action=wf&do=del&id={{filter.id}}">Delete</a>]</td>
</tr>
{% endfor %}
</tbody>
</table>
{% endblock %}
