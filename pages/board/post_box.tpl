<div class="postarea">
<a id="postbox"></a>
<form name="postform" id="postform" action="{{fullpath}}post.php" method="post" enctype="multipart/form-data">
<input type="hidden" name="board" value="{{board.name}}" />
<input type="hidden" name="replythread" value="<!sm_threadid>" />
{% if board.imagesize > 0 %}
	<input type="hidden" name="MAX_FILE_SIZE" value="{{board.imagesize}}" />
{% endif %}
<input type="text" name="email" size="28" maxlength="75" value="" style="display: none;" />
<table class="postform">
	<tbody>
	{% if board.forcedanon != 1 %}
		<tr>
			<td class="postblock">
				Name</td>
			<td>
				<input type="text" name="name" size="28" maxlength="75" accesskey="n" />
			</td>
		</tr>
	{% endif %}
        {% if board.email == 1 %}
        <tr>
                <td class="postblock">
                        Email</td>
                <td>
                        <input type="text" name="em" size="28" maxlength="75" accesskey="e" />
                </td>
        </tr>
        {% endif %}
	<tr>
		<td class="postblock">
			Subject</td>
		<td>
			{% spaceless %}<input type="text" name="subject" size="35" maxlength="75" accesskey="s" />&nbsp;<input name="submit" type="submit" value=
			{% if replythread == 0 %}
				"Submit" accesskey="z" />&nbsp;(<span id="posttypeindicator">New thread</span>)
			{% elseif replythread != 0 %}
				"Reply" accesskey="z" />&nbsp;(<span id="posttypeindicator">Reply to thread <!sm_threadid></span>)
			{% else %}
				"Submit" accesskey="z" />
			{% endif %}{% endspaceless %}
		</td>
	</tr>
	<tr>
		<td class="postblock">
			Message
		</td>
		<td>
			<textarea name="message" cols="48" rows="4" accesskey="m"></textarea>
		</td>
	</tr>
	{% if board.fileperpost > 1 and replythread != 0 %}
		{% for files in 1..board.fileperpost %}
			<tr id="file{{loop.index}}"{% if not loop.first %} style="display:none"{% endif %}>
			<td class="postblock">
				File {{loop.index}}
			</td>
				<td>				
					<input{% if not loop.last %} onchange="document.getElementById('file{{loop.index + 1}}').style.display = '';"{% endif %} type="file" name="imagefile[]" size="35" accesskey="f" /> 
					{% if loop.first and replythread == 0 and board.nofile == 1 %}
					<input type="checkbox" name="nofile" id="nofile" accesskey="q" /><label for="nofile"> No File</label>
					{% endif %}
				</td>
			</tr>
			{% endfor %}
            		{% if board.fileurl == 1 %}
				<tr>
				<td class="postblock">
					File URL
				</td>
				<td>
					<input type="text" name="fileurl" size="48" accesskey="h" />
				</td>
			</tr>
			{% endif %} 
		{% else %}
        	<tr>
 			<td class="postblock">
				File
			</td>
			<td>
			<input type="file" name="imagefile[]" size="35" accesskey="f" />
			{% if replythread == 0 and board.nofile == 1 %}
				<input type="checkbox" name="nofile" id="nofile" accesskey="q" /><label for="nofile"> No File</label>
			{% endif %}
                        {% if board.email == 0 %}
                                <input type="checkbox" name="em" id="sage" value="sage" accesskey="e" /><label for="sage">No bump</label>
                        {% endif %}
			</td>
		</tr>
            {% if board.fileurl == 1 %}
		<tr>
			<td class="postblock">
				File URL
			</td>
			<td>
				<input type="text" name="fileurl" size="48" accesskey="h" />
			</td>
		</tr>
            {% endif %} 
  	{% endif %}
		<tr>
			<td class="postblock">
				Password
			</td>
			<td>
				<input type="password" name="password" accesskey="p" size="8" />&nbsp;(For post and file deletion)
			</td>
		</tr>
		<tr id="passwordbox"><td></td><td></td></tr>
		<tr>
			<td colspan="2" class="rules">
				<ul style="margin-left: 0; margin-top: 0; margin-bottom: 0; padding-left: 0;">
					<li>Supported file types are:
					{%if board.filetypes_allowed != ''%}
						{% for filetype in board.filetypes_allowed %}
							{{filetype.name|upper}}{% if loop.last %}{%else%}, {%endif%}
						{%endfor%}
					{%else%}
						None
					{%endif%}
					</li>
					<li>Maximum file size allowed is {{ '%.0f' | format(board.imagesize/1024/1024) }} MB.</li>
                                        <li>Maximum number of files per upload is {{board.fileperpost}}.</li>
					<li>Images greater than 250x250 pixels will be thumbnailed.</li>
					<li>Currently {{board.uniqueposts}} unique user posts.</li>
				</ul>
			</td>
		</tr>
	</tbody>
</table>
</form>
<hr />
</div>
<script type="text/javascript"><!--
		set_inputs("postform");
//--></script>
