<%@page import="javax.servlet.http.*,
java.io.*,
com.mannir.snippets.User
"%>

<% if(request.getParameter("submit") != null) {
	User user = new User();
	//user.setId(id);
	user.setUsername(request.getParameter("username"));
	user.setPassword(request.getParameter("password"));
	user.setFullname(request.getParameter("fullname"));
	user.setMobileno(request.getParameter("mobileno"));
	
	System.out.println(user.getFullname());
}

%>

<jsp:useBean id="user" class="com.mannir.snippets.User" scope="request">
<jsp:setProperty name="user" property="*"/></jsp:useBean>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form name="form1" method="post" action="">
  <table width="500" border="0">
    <tr>
      <td>User ID</td>
      <td>Username</td>
      <td>Password</td>
      <td>Fullname</td>
      <td>Mobile No</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><label for="userid"></label><input type="text" name="userid" id="userid"></td>
      <td><label for="username"></label><input type="text" name="username" id="username"></td>
      <td><label for="password"></label><input type="text" name="password" id="password"></td>
      <td><label for="fullname"></label><input type="text" name="fullname" id="fullname"></td>
      <td><input type="text" name="mobileno" id="mobileno"></td>
      <td><input type="submit" name="submit" id="submit" value="Submit"></td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <p>List
  </p>
  <table width="500" border="1">
    <tr>
      <td>User ID</td>
      <td>Username</td>
      <td>Password</td>
      <td>Fullname</td>
      <td>Mobile No</td>
    </tr>
    <tr>
      <td>${person.name}</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </table>
  <p>&nbsp;</p>
</form>
</body>
</html>