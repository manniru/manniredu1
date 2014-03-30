<jsp:useBean id="person" class="com.mannir.snippets.Person" scope="request">
<jsp:setProperty name="person" property="*"/>
</jsp:useBean>
<html>
<head>
<title>EL and Simple JavaBeans</title>
<style>
body, td {font-family:verdana;font-size:10pt;}
</style>
<head>
<body>
<h2>EL and Simple JavaBeans</h2>
<table border="0">
<tr>
<td>${person.name}</td>
<td>${person.age}</td>
<td>&nbsp;</td>
</tr>
<tr>
<form action="bean.jsp" method="post">
<td><input type="text" name="name"></td>
<td><input type="text" name="age"></td>
<td><input type="submit"></td>
</form>
<tr>
</table>
</body>
</html>