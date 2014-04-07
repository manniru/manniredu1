<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>

<%
String url = null;
//if (SystemProperty.environment.value()==SystemProperty.Environment.Value.Production) {
  // Load the class that provides the new "jdbc:google:mysql://" prefix.
  try { Class.forName("com.mysql.jdbc.GoogleDriver");
  url = "jdbc:google:mysql://your-project-id:your-instance-name/guestbook?user=root";
} 
catch(Exception e) { 
	Class.forName("com.mysql.jdbc.Driver"); url = "jdbc:mysql://127.0.0.1:3306/manniredu?user=root";
}

Connection conn = DriverManager.getConnection(url);
//ResultSet rs = conn.createStatement().executeQuery("SELECT guestName, content, entryID FROM entries");
%>

<% if(request.getParameter("login") != null) {
	String uid2="", user2="", pass2="", role="";
	String user1 = request.getParameter("user");
	String pass1 = request.getParameter("pass");
	//System.out.println(user1+"="+pass1);
		
	try {
		ResultSet rs = conn.createStatement().executeQuery("SELECT * FROM application WHERE username='"+user1+"' AND password='"+pass1+"'"); rs.next();
		uid2 = rs.getString("id");
		user2 = rs.getString("username");
		pass2 = rs.getString("password");
		role = rs.getString("role");
		
		System.out.println(user1+"="+user2);
		System.out.println(pass1+"="+pass2);
	} catch(Exception e) { System.out.println(e); }
	
	if(user1.equals(user2) && pass1.equals(pass2)) {
		session.setAttribute("uid", uid2);
		session.setAttribute("username", user1);
		session.setAttribute("password", pass1);
		session.setAttribute("role", role);
		
		response.setStatus(response.SC_MOVED_TEMPORARILY); 
		response.setHeader("Location", "/main.jsp");
	}
	else {
		System.out.println("invalid password!");
		response.setStatus(response.SC_MOVED_TEMPORARILY); 
		response.setHeader("Location", "/index.jsp?msg=Invalid Username or Password!");
	}
	//System.out.println(user1+"="+pass1);
}





%>