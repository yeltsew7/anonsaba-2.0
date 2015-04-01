{% extends "/manage/main.tpl" %}
{% block managecontent %}
<table class="changepass">
<col class="col1" />
<thead>
<tr>
<th colspan="4">Move Threads</th>
</tr>
</thead>
<tbody>
{% if message != '' %}
<tr><td><center><b>{{message|raw}}</b></center></tr></td>
{% endif %}
<form method="POST">
<tr><td>Thread ID: <input type="text" name="id"></td></tr>
<tr><td><label for="board">Board:</label>
<select name="board">
{% for board in boards %}
            <option value="{{board.name}}">/{{board.name}}/</option>
{% endfor %}
</select>
</tr></td>
<tr><td><label for="newboard">New Board:</label>
<select name="newboard">
{% for board in boards %}
            <option value="{{board.name}}">/{{board.name}}/</option>
{% endfor %}
</select>
</tr></td>
<tr><td><input type="submit" name="submit" value="Submit"></tr></td>
</form>
</tbody>
</form>
</table>
{% endblock %}
