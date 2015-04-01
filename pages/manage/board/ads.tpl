{% extends "/manage/main.tpl" %}
{% block managecontent %}
<table class="changepass">
<col class="col1" />
<thead>
<tr>
<th colspan="4">Ads</th>
</tr>
</thead>
<tbody>
{% if message != '' %}
<tr><td><center><b>{{message|raw}}</b></center></tr></td>
{% endif %}
<form method="POST">
<tr><td>Image URL: <input type="text" name="url"></td></tr>
<tr><td><label for="board">Type:</label>
<select name="type">
            <option value="sfw">Safe for Work</option>
            <option value="nsfw">Not Safe for Work</option>
</select>
</tr></td>
<tr><td>Image Height: <input type="text" name="h"></td></tr>
<tr><td>Image Width: <input type="text" name="w"></td></td>
<tr><td><input type="submit" name="submit" value="Submit"></tr></td>
</form>
<br />
<table class="users" cellspacing="1px">
<col class="col1" /> <col class="col2" />
<col class="col1" /> <col class="col2" />
<thead>
<tr>
<th>Image URL</th>
<th>Type</th>
<th>Height/Width</th>
<th>&nbsp;</th>
</tr>
</thead>
<tbody>
 {% for ad in ads %}
<tr>
<td>{{ ad.url }}</td>
<td>{% if ad.type == 'sfw' %}Safe For Work{% else %}Not Safe for Work{% endif %}</td>
<td>{{ad.h}}/{{ad.w}}</td>
<td>[<a href="index.php?side={{current}}&action=ads&do=del&id={{ad.id}}">Delete</a>]</td>
</tr>
{% endfor %}
</tbody>
</form>
</table>
{% endblock %}
