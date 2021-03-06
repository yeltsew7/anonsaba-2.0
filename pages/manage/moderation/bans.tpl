{% extends "/manage/main.tpl" %}
{% block managecontent %}
<table class="changepass">
<col class="col1" />
<form method="POST">
<thead>
<tr>
<th colspan="4">Add a Ban<div style="float:right;"><input type="submit" name="submit" value="Ban" /></div></th>
</tr>
</thead>
<tbody>
{% if msg != '' %}
<tr><td><center><b>{{msg|raw}}</b></center></tr></td>
{% endif %}
<tr><td>IP: <input type="text" name="ip" value="{% if do == 'ban' %}{{ip}}{% endif %}"></td></tr>
<tr><td>Ban Reason:&nbsp;&nbsp;
<select name="reason">
	<option value="Spam" onclick="selected=selected location.href = 'index.php?side={{current}}&action=bans{% if do == 'ban' %}&do=ban&ip={{ip}}&boardname={{boardname}}{% endif %}{% if show == 'no' %}&show={{show}}&val={{show}}{% endif %}{% if bm == 'no' %}&bm=no{% endif %}'">Spam</option>
	<option value="Off Topic" onclick="selected=selected location.href = 'index.php?side={{current}}&action=bans{% if do == 'ban' %}&do=ban&ip={{ip}}&boardname={{boardname}}{% endif %}{% if show == 'no' %}&show={{show}}&val={{show}}{% endif %}{% if bm == 'no' %}&bm=no{% endif %}'">Off Topic</option>
	<option value="Trolling" onclick="selected=selected location.href = 'index.php?side={{current}}&action=bans{% if do == 'ban' %}&do=ban&ip={{ip}}&boardname={{boardname}}{% endif %}{% if show == 'no' %}&show={{show}}&val={{show}}{% endif %}{% if bm == 'no' %}&bm=no{% endif %}'">Trolling</option>
	<option value="other"onclick="location.href = 'index.php?side={{current}}&action=bans{% if do == 'ban' %}&do=ban&ip={{ip}}&boardname={{boardname}}{% endif %}{% if show == 'no' %}&show={{show}}&val={{show}}{% endif %}{% if bm == 'no' %}&bm=no{% endif %}&other=yes'" {% if other == 'yes'%}selected{% endif %}>Other</option>
</select>
</tr></td>
{% if other == 'yes' %}
<tr><td>Other Ban reason: <input type="text" name="other" /></tr></td>
{% endif %}
<tr><td>
<label for="all">All boards</label>
<input type="checkbox" name="all" /><br />
<label for="or">
<b>or</b>
</label><br />
{% for board in boards %}
<label for="bans{{board.name}}">/{{board.name}}/</label><input type="checkbox" name="bans{{board.name}}" {% if boardname == board.name %}checked{% endif %}>
{% endfor %}
</tr></td>
<tr><td>Ban until: <input type="text" name="until">&nbsp;&nbsp;Example: <b>1 day 2 hours 30 minutes 5 seconds</b></tr></td>
<tr><td>Can Appeal:
<select id="appeal" name="appeal">
	<option value="yes" onclick="location.href = 'index.php?side={{current}}&action=bans{% if do == 'ban' %}&do=ban&ip={{ip}}&boardname={{boardname}}{% endif %}{% if other == 'yes'%}&other=yes{% endif %}{% if bm == 'no' %}&bm=no{% endif %}&show=yes'">Yes</option>
	<option value="no" onclick="location.href = 'index.php?side={{current}}&action=bans{% if do == 'ban' %}&do=ban&ip={{ip}}&boardname={{boardname}}{% endif %}{% if other == 'yes'%}&other=yes{% endif %}{% if bm == 'no' %}&bm=no{% endif %}&show=no&val=no'" {% if val == 'no'%}selected{% endif %}>No</option>
</select>
</tr></td>
{% if show == 'yes' or show == '' %}
<tr><td>Can Appeal in: <input type="text" name="appealin">&nbsp;&nbsp;Example: <b>1 day 2 hours 30 minutes 5 seconds</tr></td>
{% endif %}
{% if do == 'ban' %}
<tr><td>Display ban message: 
<select id="bm" name="bm">
	<option value="yes" onclick="location.href = 'index.php?side={{current}}&action=bans{% if do == 'ban' %}&do=ban&ip={{ip}}&boardname={{boardname}}{% endif %}{% if other == 'yes'%}&other=yes{% endif %}{% if show == 'no' %}&show={{show}}&val={{show}}{% endif %}&bm=yes'">Yes</option>
	<option value="no" onclick="location.href = 'index.php?side={{current}}&action=bans{% if do == 'ban' %}&do=ban&ip={{ip}}&boardname={{boardname}}{% endif %}{% if other == 'yes'%}&other=yes{% endif %}{% if show == 'no' %}&show={{show}}&val={{show}}{% endif %}&bm=no'" {% if bm == 'no'%}selected{% endif %}>No</option>
</select>
</tr></td>
{% if bm == 'yes' or bm == '' %}
<tr><td>Ban Message: <input type="text" name="bm1" value='{{dbm}}' />&nbsp;&nbsp;{{dbm|raw}}</tr></td>
{% endif %}
{% endif %}
<br/ >
<th colspan="4">View/Remove a Ban</th>
<table class="users" cellspacing="1px">
<col class="col1" /> <col class="col2" />
<col class="col1" /> <col class="col2" />
<thead>
<tr>
<th>IP</th>
<th>Reason</th>
<th>Banned until</th>
<th>Boards</th>
<th>Appeal date</th>
<th>Appealed</th>
<th>&nbsp;</th>
</tr>
</thead>
{% for ban in bans %}
<tbody>
<td>{{ban.ip}}</td>
<td>{{ban.reason}}</td>
<td>{{ban.until|date('m/d/y @ h:i:s A')}}</td>
<td>{%if ban.boards == 'all' %}All boards {% else %}/{{ban.boards|replace({'|':'/, /'})}}/{% endif %}</td>
<td>{% if ban.appeal == 0 %}Cannot Appeal{% else %}{{ban.appeal|date('m/d/y @ h:i:s A')}}{% endif %}</td>
<td>{% if ban.appealed == null %}No{% else %}Yes{% endif %}</td>
<td>[<a href="index.php?side={{current}}&action=bans&act=del&id={{ban.id}}"> Delete</a> ]</td>
</tbody>
{%endfor%}
</table>
<center>
{% if pages -1 > 0 %}
  {% for i in range(0, pages ) %}
      [ {% if page != i %}<a href="/management/index.php?side={{current}}&action=bans&page={{i}}">{% endif %}{{i}}{% if page != i %}</a>{% endif %} ]
  {% endfor %}
{% else %}
[ 0 ]
{% endif %}
</center>
<form method="POST">
{% endblock %}
