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
%>
<td valign="top"><div id="main">
<h1 class="title">Pins Managements</h1>
<div class="tabs"><ul class="tabs primary">
<li ><a href="appview.jsp?id=<%= "1" %>" class="active">View</a></li>
<li ><a href="appedit.jsp?id=<%= "1" %>">Edit</a></li>
<li ><a href="apppdf.jsp?id=<%= "1" %>" target="new">Print</a></li>
<li class="active"><a href="applist.jsp">List</a></li>

</ul></div>

<div class="node" align="center">
<table class="sticky-enabled" style="width:90%">
<thead><tr><th>ID</th><th>Username</th><th>Firstname</th><th>Lastname</th><th>Mobile No</th><th>School</th><th>Exam</th><th>Grade</th><th>Program Applied</th><th>Admission</th><th>Action</th></tr></thead>
<tbody>

<%
Db db = new Db("mysql","localhost","root","","manniredu");
int sn = 1;
for(Application ap : db.getAllApplication()) {
	int m = sn % 2;
	if(m==1) { out.println("<tr class='odd'>"); }
	else { out.println("<tr class='even'>"); }			
	//out.println("<td style='border:1px solid black;'>"+sn+"</td>");
	out.println("<td style='border:1px solid black;'>"+ap.getId()+"</td>");
	out.println("<td style='border:1px solid black;'>"+ap.getUsername()+"</td>");
	out.println("<td style='border:1px solid black;'>"+ap.getFirstname()+"</td>");
	out.println("<td style='border:1px solid black;'>"+ap.getLastname()+"</td>");
	out.println("<td style='border:1px solid black;'>"+ap.getMobileno()+"</td>");
	out.println("<td style='border:1px solid black;'>"+ap.getSchool()+"</td>");
	out.println("<td style='border:1px solid black;'>"+ap.getExam()+"</td>");
	out.println("<td style='border:1px solid black;'>"+ap.getGrade()+"</td>");
	out.println("<td style='border:1px solid black;'>"+ap.getProgram()+"</td>");
	out.println("<td style='border:1px solid black;'>"+ap.getAdmission()+"</td>");
	out.println("<td style='border:1px solid black;'><a href='/appview.jsp?id="+ap.getId()+"'>View</a> - <a href='/appedit.jsp?id="+ap.getId()+"'>Edit</a> - <a href='/apppdf.jsp?id="+ap.getId()+"' target='new'>Print</a></td>");
	out.println("</tr>");
	sn++;
	
}
	

%>



</tbody>
</table>

</div></div></td>		
<%@include file="footer.jsp" %>