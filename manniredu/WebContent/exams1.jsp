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
com.mannir.edu.Registration,
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
			     if(paramName.substring(0, 2).equals("id")) sb.append(value+",");
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
<h1 class="title">Examination Results Computation</h1>
<div class="tabs"><ul class="tabs primary">
<li ><a href="appview.jsp?id=<%= "1" %>" class="active">View</a></li>
<li ><a href="appedit.jsp?id=<%= "1" %>">Edit</a></li>
<li ><a href="apppdf.jsp?id=<%= "1" %>" target="new">Print</a></li>
<li class="active"><a href="applist.jsp">List</a></li>

</ul></div>

<div class="node" align="center">
<a href="<%=this.getServletContext().getContextPath() %>/exams.xls">Sample Excel File</a>
<form method="POST" enctype="multipart/form-data" action="/exams">
<fieldset class="container-inline collapsible">
  <legend><span class="fieldset-legend">Upload Examination Records</span></legend>
<div class="fieldset-wrapper"><div style="float:left;margin-right:2px;">
<div style="float:left;margin-right:2px;"><label>Select File to Upload</label><input type="file" name="upfile"></div>
<div style="float:left;margin-right:2px;"><label>Type Course Code</label><input type="text" name="note"></div>
<input type="submit" value="Upload" class="form-submit">
  </div></div>
</fieldset>
</form>



<br><br>
<form method="post" enctype="multipart/form-data">
<div class="container-inline">
<a href="excel.jsp" target="new">Click here to Download Excel File</a>
 <select name="action" class="form-select"><option value="admadd" selected="selected">Add Admission</option><option value="admdel">Delete Admission</option><option value="sendsms">Send SMS</option></select>

<input type="submit" name="op1" value="Submit"  class="form-submit" />
Upload Exam Records:
 <label for="upload"></label>
 <input type="file" name="upload" id="upload" />
</div>



<%
out.println("<table class='sticky-enabled' style='width:90%'>"+
		"<thead><tr><th class='select-all'></th><th>ID</th><th>Username</th><th>Firstname</th><th>Lastname</th><th>Mobile No</th>"+
		"<th>School</th><th>Exam</th><th>Grade</th><th>Program Applied</th><th>Admission</th><th>Action</th></tr></thead>"+
		"<tbody>");

Db db = new Db("mysql","localhost","root","","manniredu");
int sn = 1;
for(Registration rg : db.getAllRegistration()) {
	int m = sn % 2;
	if(m==1) { out.println("<tr class='odd'>"); }
	else { out.println("<tr class='even'>"); }			
	//out.println("<td style='border:1px solid black;'><input type='checkbox' name='id"+rg.getRid()+"' value='"+rg.getRid()+"' /></td>");
	out.println("<td style='border:1px solid black;'>"+rg.getRid()+"</td>");
	out.println("<td style='border:1px solid black;'>"+rg.getAid()+"</td>");
	out.println("<td style='border:1px solid black;'>"+rg.getCode()+"</td>");
	out.println("<td style='border:1px solid black;'>"+rg.getCw()+"</td>");
	out.println("<td style='border:1px solid black;'>"+rg.getExam()+"</td>");
	out.println("<td style='border:1px solid black;'>"+rg.getTotal()+"</td>");
	out.println("<td style='border:1px solid black;'>"+rg.getPoint()+"</td>");
	out.println("<td style='border:1px solid black;'>"+rg.getGp()+"</td>");
	out.println("<td style='border:1px solid black;'>"+rg.getRid()+"</td>");
	out.println("<td style='border:1px solid black;'>"+rg.getRid()+"</td>");
	out.println("<td style='border:1px solid black;'><a href='/appview.jsp?id="+rg.getRid()+"'>View</a> - <a href='/appedit.jsp?id="+rg.getRid()+"'>Edit</a> - <a href='/apppdf.jsp?id="+rg.getRid()+"' target='new'>Print</a></td>");
	out.println("</tr>");
	sn++;
	
}

out.println("</tbody></table>");
%>




</form>
</div></div></td>		
<%@include file="footer.jsp" %>