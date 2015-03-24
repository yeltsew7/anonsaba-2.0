&#91;<a href="{{KU_WEBPATH}}/{{board.name}}/">Return</a>&#93;
{% if KU_FIRSTLAST  == 'true' and ( postcount > 50 or replycount > 50) %}
	&#91;<a href="{{KU_WEBPATH}}/{{board.name}}/res/{{posts.0.id}}.html">Entire Thread</a>&#93; 
	&#91;<a href="{{KU_WEBPATH}}/{{board.name}}/res/{{posts.0.id}}+50.html">Last 50 posts</a>&#93;
	{% if posts > 100 or replycount > 100  %}
		&#91;<a href="{{KU_WEBPATH}}/{{board.name}}/res/{{posts.0.id}}-100.html">First 100 posts</a>&#93;
	{% endif %}
{% endif %}
{% if not isread %}
	<div class="replymode">Posting mode: Reply
	{% if modifier == 'first100' %}
		[First 100 posts]
	{% elseif modifier == 'last50' %}
		[Last 50 posts]
	{% endif %}
{% else %}
	&#91;<a href="{{KU_WEBPATH}}/{{board.name}}/res/{{posts.0.id}}.html">Entire Thread</a>&#93; 
{% endif %}
</div>
