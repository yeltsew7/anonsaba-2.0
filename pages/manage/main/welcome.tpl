{% extends "/manage/main.tpl" %}
{% block managecontent %}
<table class="stats">

<col class="col1" /><col class="col2" /><col class="col1" /><col class="col2" />
<thead>
<tr>
<th colspan="4">Statistics</th>
</tr>
</thead>
<tbody>
<tr>

<td>Installation Date: </td>
<td class="strong">
{% if installdate != 'Today' %}
{{installdate|date('m/d/y @ h:i:s A')}}
{% else %}
{{installdate}}
{% endif %}
</td>
<td>Database Type: </td>
<td class="strong">{{databasetype}}</td>
</tr>
<tr>
<td>Anonsaba Version: </td>
<script>
function eggs() {
     alert('Eventually this will check for updates');
 }
 </script>
<td class="strong"><a onclick="eggs()">{{version}}</a></td>
<td>Twig Version: </td>
<td class="strong">{{ constant('Twig_Environment::VERSION') }}</td>
</tr>
<tr>
<td>Number of Boards: </td>
<td class="strong">{{boardnum}}</td>
<td>Site Memory Usage: </td>
<td class="strong">{{memory}} MiB</td>
</tr>
<tr>

<td>Total Posts: </td>
<td class="strong">{{numpost}}</td>
<td>Site Peak memory usage: </td>
<td class="strong">{{peakmemory}} MiB</td>
</tr>
</tbody>
</table>
{% endblock %}
