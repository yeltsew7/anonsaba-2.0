{% extends "/manage/main.tpl" %}
{% block managecontent %}
<table class="changepass">
<col class="col1" />
<thead>
<tr>
<th colspan="4">Sections</th>
</tr>
</thead>
<tbody>
{% if message != '' %}
<tr><td><center><b>{{message|raw}}</b></center></tr></td>
{% endif %}
{% if do != 'edit' %}
<form method="POST" action="index.php?side={{current}}&action=sections&do=add">
<tr><td>Name: <input type="text" name="name"></td></tr>
<tr><td>Abbreviation: <input type="text" name="abbr"></tr><td>
<tr><td>Order: <input type="text" name="order"></tr><td>
<tr><td>Hidden: <input type="checkbox" name="hidden"></tr><td>
<tr><td><input type="submit" name="submit" value="Submit"></tr></td>
<input type="hidden" id="edit" name="edit" value="" />
</form>
{% else %}
{% for item in entrys %}
<form method="post" action="index.php?side={{current}}&action=sections&do=edit&id={{item.id}}">
<tr><td>Name: <input type="text" name="name" value="{{item.name}}"></td></tr>
<tr><td>Abbreviation: <input type="text" name="abbr" value="{{item.abbr}}"></tr><td>
<tr><td>Order: <input type="text" name="order" value="{{item.order}}"></tr><td>
<tr><td>Hidden: <input type="checkbox" name="hidden" {% if item.hidden == '1' %}checked="checked"{% endif %}></tr><td>
<tr><td><input type="submit" name="submit" value="Submit"></tr></td>
<input type="hidden" id="edit" name="edit" value="{{item.id}}" />
</form>
{% endfor %}
{% endif %}
<br />
<table class="users" cellspacing="1px">
<col class="col1" /> <col class="col2" />
<col class="col1" /> <col class="col2" />
<thead>
<tr>
<th>Order</th>
<th>Name</th>
<th>Abbreviation</th>
<th>Hidden</th>
<th>&nbsp;</th>
</tr>
</thead>
<tbody>
 {% for section in entry %}
<tr>
<td>{{ section.order }}</td>
<td>{{ section.name }}</td>
<td>{{ section.abbr }}</td>
<td>{%if section.hidden == '1'%}Yes{% else %}No{% endif %}</td>
<td>[<a href="index.php?side={{current}}&action=sections&do=edit&id={{section.id}}">Edit</a>]&nbsp;[<a href="index.php?side={{current}}&action=sections&do=del&id={{section.id}}">Delete</a>]</td>
</tr>
{% endfor %}
</tbody>
</table>
{% endblock %}
