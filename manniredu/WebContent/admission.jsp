<%@include file="header.jsp" %>
<%@
page import="javax.servlet.http.*,
java.io.*,
java.util.*,
java.io.FileReader,
java.io.BufferedReader,
java.sql.*,
java.text.NumberFormat,
java.text.DecimalFormat,
java.util.Date,
java.text.DateFormat,
com.mannir.edu.Db,
com.mannir.edu.Pin,
com.mannir.edu.Application,
java.sql.ResultSetMetaData"
%><%! Application ap; %><%
if(request.getParameter("id") != null) {
	int id = Integer.parseInt(request.getParameter("id"));
	ap = (Application) db.get(new Application(), id);
	}

else { ap = (Application) db.get(new Application(), 1); }
%>

<td valign="top"><div id="main">
<h1 class="title">Admission Status</h1>
<div class="tabs"><ul class="tabs primary">
<li class="active" ><a href="appview.jsp?id=<%= ap.getId() %>" class="active">View</a></li>
<li ><a href="appedit.jsp?id=<%= ap.getId() %>">Edit</a></li>

</ul></div>

<div class="node" align="center">
<h1><% 
if(ap.getAdmission().equals("")) { out.println("Welcome "+ap.getFirstname()+", Your Admission is Pending!"); }
else { out.println("Welcome "+ap.getFirstname()+", You are Admitted you can Register now!"); }
%></h1>

</div></div></td>		
<%@include file="footer.jsp" %>