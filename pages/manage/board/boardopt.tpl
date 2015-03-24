{% extends "/manage/main.tpl" %}
{% block managecontent %}
<table class="changepass">
<col class="col1" />
<thead>
<tr>
<th colspan="4">Board options</th>
</tr>
</thead>
<tbody>
{% if message != '' %}
<tr><td><center><b>{{message|raw}}</b></center></tr></td>
{% endif %}
{% if do != 'edit' %}
<form method="POST" action="index.php?side={{current}}&action=boardopt&do=edit">
<tr><td><label for="boards">Board:</label>
<select name="boards">
{% for boards in list %}
            <option value="{{boards.name}}">/{{boards.name}}/</option>
{% endfor %}
</select>
</tr></td>
<tr><td><input type="submit" name="go" value="Go"></tr></td>
</form>
{% else %}
{% for item in boardopts %}
<form method="post">
<input type="hidden" name="edit" value="{{item.id}}">
<tr><td>Directory: <input type="text" name="name" value="{{item.name}}" disabled="disabled"></td></tr>
<tr><td>Description: <input type="text" name="desc" value="{{item.desc}}"></td></tr>
<tr><td><label for="class">Board class:</label>
<select name="class">
<option value="1" {% if item.class == 1 %}selected="selected"{% endif %}>Safe for Work</option>
<option value="2" {% if item.class == 2 %}selected="selected"{% endif %}>Not Safe for Work</option>
</select>
</tr></td>
<tr><td><label for="section">Board section:</label>
<select name="section">
<option value="">Select a section</option>
{% for section in entry %}
<option value="{{section.name}}" {% if item.section == section.name %}selected="selected"{% endif %} />{{section.name}}</option>
{% endfor %}
</select>
<tr><td><label for="header">Include Header:</label><textarea name="header" rows="12" cols="80">{{item.header}}</textarea></tr></td>
<tr><td>File URL posting: <input type="checkbox" name="fileurl" {% if item.fileurl == 1 %}checked="checked"{% endif %}></tr></td>
<tr><td>Allowed Filetypes:<br />
{{thingy|raw}}
</tr></td>
<tr><td>File per post: <input type="text" name="fileperpost" value="{{item.fileperpost}}"></tr></td>
<tr><td>Max image size: <input type="text" name="imagesize" value="{{item.imagesize}}"></tr></td>
<tr><td>Max posts per page: <input type="text" name="postperpage" value="{{item.postperpage}}"></tr></td>
<tr><td>Max board pages: <input type="text" name="maxboardpage" value="{{item.boardpages}}"></tr></td>
<tr><td>Max thread hour: <input type="text" name="threadhours" value="{{item.threadhours}}"></tr></td>
<tr><td>Mark page: <input type="text" name="markpage" value="{{item.markpage}}"></tr></td>
<tr><td>Max thread replies: <input type="text" name="threadreply" value="{{item.threadreply}}"></tr></td>
<tr><td>Poster name: <input type="text" name="postername" value="{{item.postername}}"></tr></td>
<tr><td>Locked: <input type="checkbox" name="locked" {% if item.locked == 1 %}checked="checked"{% endif %}></tr></td>
<tr><td>Enable email: <input type="checkbox" name="email" {% if item.email == 1 %}checked="checked"{% endif %}></tr></td>
<tr><td>Enable ads: <input type="checkbox" name="ads" {% if item.ads == 1 %}checked="checked"{% endif %}></tr></td>
<tr><td>Enable IDs: <input type="checkbox" name="showid" {% if item.showid == 1 %}checked="checked"{% endif %}></tr></td>
<tr><td>Enable reporting: <input type="checkbox" name="report" {% if item.report == 1 %}checked="checked"{% endif %}></tr></td>
<tr><td>Enable captcha: <input type="checkbox" name="captcha" {% if item.captcha == 1 %}checked="checked"{% endif %}></tr></td>
<tr><td>Enable no file posting: <input type="checkbox" name="nofile" {% if item.nofile == 1 %}checked="checked"{% endif %}></tr></td>
<tr><td>Forced Anonymous: <input type="checkbox" name="forcedanon" {% if item.forcedanon == 1 %}checked="checked"{% endif %}></tr></td>
<tr><td>Trail board: <input type="checkbox" name="trail" {% if item.trail == 1 %}checked="checked"{% endif %}></tr></td>
<tr><td>Popular board: <input type="checkbox" name="popular" {% if item.popular == 1 %}checked="checked"{% endif %}></tr></td>
<tr><td>Enable recent posts: <input type="checkbox" name="recentpost" {% if item.recentpost == 1 %}checked="checked"{% endif %}></tr></td>
<tr><td><input type="submit" name="submit" value="Submit"></tr></td>
</form>
{% endfor %}
{% endif %}
</tbody>
</table>
{% endblock %}
