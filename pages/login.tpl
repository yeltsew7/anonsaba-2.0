<html>
<head>
<title>Login</title>
<style>
.text{
			text-align: center;
			font-size: 24px;
			font-family: sans-serif;
}
input {
			width: 25%;
			font-size: 1.5em;
			text-align: center;
			display: block;
			margin-left: auto;
			margin-right: auto;
		}
</style>
</head>
<body>
<header>
<div class="text"><h1>{{sitename}} Login</h1>
</header>
<form method="POST" action='index.php?act=login&side={{side}}&action={{action}}'>
<input type="text" name="username" placeholder="Username"/>
<input type="password" name="password" placeholder="Password"/>
<input type="submit" value="Log in">
</form>
</body>
</html>
