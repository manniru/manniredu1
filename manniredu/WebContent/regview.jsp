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
com.mannir.edu.Reg,
java.sql.ResultSetMetaData"
%><%! Application ap; int userid=0; %><%
System.out.println(session.getAttribute("uid"));
if(session.getAttribute("uid") != null) {
	int id = Integer.parseInt(session.getAttribute("uid").toString()); userid=id;
	ap = (Application) db.get(new Application(), id);
	}

else { ap = (Application) db.get(new Application(), 1); }
%>

<td valign="top"><div id="main">
<h1 class="title">Registration Form</h1>
<div class="tabs"><ul class="tabs primary">
<li class="active" ><a href="appview.jsp?id=<%= ap.getId() %>" class="active">View</a></li>
<li ><a href="appedit.jsp?id=<%= ap.getId() %>">Edit</a></li>

</ul></div>

<div class="node" align="center">
<table style="width:700">
<tr><td><div align="center">
<h3>REGISTRATION INFORMATION</h3>
<table width="600px">
<tbody>
 <tr class="odd">
   <td width="300">ID: <strong><%= ap.getId() %></strong></td>
   <td width="300">Pin Number: <strong><%= ap.getPin() %></strong></td> </tr>
 <tr class="even">
   <td>Fullname: <strong><%= ap.getFirstname() %></strong></td>
   <td>Username: <strong><%= ap.getUsername() %></strong></td> </tr>
 <tr class="odd"><td>Gender: <strong><%= ap.getGender() %></strong></td>
   <td>Password: <strong><%= ap.getPassword() %></strong></td> </tr>
 <tr class="even">
   <td>Date of Birth: <strong><%= ap.getDob() %></strong></td>
   <td>Mobile No: <strong><%= ap.getMobileno() %></strong></td> </tr>
 <tr class="even"><td>Address: <strong><%= ap.getAddress() %></strong></td>
   <td>Email:<strong><%= ap.getEmail() %></strong></td></tr> 
 <tr class="odd">
   <td>Country: <strong><%= ap.getCountry() %></strong></td>
   <td>School: <strong><%= ap.getSchool() %></strong></td> </tr>
 <tr class="even">
   <td>Final Exam: <strong><%= ap.getExam() %></strong></td>
   <td>Grade: <strong><%= ap.getGrade() %></strong></td> </tr>
 <tr class="odd">
   <td>Picture Name: <strong><%= ap.getPicture() %></strong></td>
   <td>Application Date: <strong><%= ap.getDateapp() %></strong></td> </tr>
</tbody>
</table>

</div></td></tr>

<tr><td><div align="center"><h3>PROGRAMMES INFORMATION</h3>
  <table><tbody>
  <tr class="odd"><td ><div align="center">Programme First Choice: <strong><%= ap.getProgram() %></strong></div></td></tr>
  <tr class="odd"><td><div align="center">Admission Status: <strong><%= ap.getAdmission() %></strong></div></td></tr>
  </tbody></table>
</div></td></tr>

<tr><td><div align="center"><h3>REGISTRATION INFORMATION</h3>
  <table><tbody>
  <% for(Reg rg : db.listReg(userid)) {
	  out.println("<tr class='odd'><td ><div>Module: <strong>"+rg.getCode()+"</strong></div></td><td ><div><strong>"+rg.getTitle(rg.getCode())+"</strong></div></td></tr>");
  }
  
  %>
  
  </tbody></table>
</div></td></tr>
</table>

</div></div></td>		
<%@include file="footer.jsp" %>