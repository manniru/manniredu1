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
com.mannir.SmsVoice,
java.sql.ResultSetMetaData"
%>
<% if(request.getParameter("op1") != null) {
	String adm="";
	if(request.getParameter("action").equals("admadd")) adm="1";
	if(request.getParameter("action").equals("admdel")) adm="";
	if(request.getParameter("action").equals("sendsms")) adm="1"; System.out.println("Send SMS here!");
	Enumeration pr = request.getParameterNames();
	StringBuffer sb = new StringBuffer();
	sb.append("UPDATE application SET admission='"+adm+"' WHERE id IN(");

			int a = 1;
			   while(pr.hasMoreElements()) {
			      String paramName = (String)pr.nextElement();
			      String value =  request.getParameter(paramName);
			      ///System.out.println(paramName+"=="+value);
			     if(paramName.substring(0, 2).equals("id")) { 
			    	 sb.append(value+",");
			    	 //System.out.println("value"+value);
			    	 Application ap = db.getApplication(Integer.parseInt(value));
			    	 SmsVoice sv = new SmsVoice();
			    	 String msg = "Congratulation "+ap.getFirstname()+" Your have been Given Admission in Mannir Education Cloud System";
			    	 sv.call(ap.getMobileno(), msg);
			    	 System.out.println("call:"+ap.getMobileno()+"=="+msg);
			     }
			 a++;
			   }
			   sb.deleteCharAt(sb.length()-1).toString();
			   sb.append(")");
			   String sql = sb.toString();
			   db.runSql(cn, sql);
			   
			   // UPDATE application SET admission='1' WHERE id IN(1,3,5)
}

%>
<td valign="top"><div id="main">
<h1 class="title">Generate Admissions</h1>
<div class="tabs"><ul class="tabs primary">
<li ><a href="appview.jsp?id=<%= "1" %>" class="active">View</a></li>
<li ><a href="appedit.jsp?id=<%= "1" %>">Edit</a></li>
<li ><a href="apppdf.jsp?id=<%= "1" %>" target="new">Print</a></li>
<li class="active"><a href="applist.jsp">List</a></li>

</ul></div>

<div class="node" align="center">
<form method="post">
<div class="container-inline">

 <select name="action" class="form-select"><option value="admadd" selected="selected">Add Admission</option><option value="admdel">Delete Admission</option><option value="sendsms">Send Admission</option></select>

<input type="submit" name="op1" value="Submit"  class="form-submit" />
</div>

<table class="sticky-enabled" style="width:90%">
<thead><tr><th class="select-all"></th><th>ID</th><th>Username</th><th>Firstname</th><th>Lastname</th><th>Mobile No</th><th>School</th><th>Exam</th><th>Grade</th><th>Program Applied</th><th>Admission</th><th>Action</th></tr></thead>
<tbody>

<%
Db db = new Db("mysql","localhost","root","","manniredu");
int sn = 1;
for(Application ap : db.getAllApplication()) {
	int m = sn % 2;
	if(m==1) { out.println("<tr class='odd'>"); }
	else { out.println("<tr class='even'>"); }			
	out.println("<td style='border:1px solid black;'><input type='checkbox' name='id"+ap.getId()+"' value='"+ap.getId()+"' /></td>");
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
</form>
</div></div></td>		
<%@include file="footer.jsp" %>