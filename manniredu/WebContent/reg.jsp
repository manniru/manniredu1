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
%>
<% if(request.getParameter("generateexcel") != null) {
	//System.out.println("hi");
}


if(request.getParameter("op1") != null) {
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
<td valign="top">
<h1 class="title">Registration List</h1>
<div class="tabs"><ul class="tabs primary">
<li ><a href="appview.jsp?id=<%= "1" %>" class="active">View</a></li>
<li ><a href="appedit.jsp?id=<%= "1" %>">Edit</a></li>
<li ><a href="apppdf.jsp?id=<%= "1" %>" target="new">Print</a></li>
<li class="active"><a href="applist.jsp">List</a></li>

</ul></div>
<a href="<%=this.getServletContext().getContextPath() %>/exams">Download Excel File</a>

<%
out.println("<table class='sticky-enabled' style='width:90%'>"+
		"<thead><tr><th>ID</th><th>STUDENT ID</th>"+
		"<th>LEVEL</th><th>SEMESTER</th><th>STUDENT NAME</th><th>MODULE</th><th>CA</th><th>EXAM</th><th>TOTAL</th><th>GRADE</th><th>POINT</th><th>GP</th><th>REMARKS</th></tr></thead>"+
		"<tbody>");

Db db = new Db("mysql","localhost","root","","manniredu");
int sn = 1;
for(Reg rg : db.listReg(0)) {
	int m = sn % 2;
	if(m==1) { out.println("<tr class='odd'>"); }
	else { out.println("<tr class='even'>"); }			
	//out.println("<td style='border:1px solid black;'><input type='checkbox' name='id"+rg.getRid()+"' value='"+rg.getRid()+"' /></td>");
	//out.println("<td style='border:1px solid black;'>"+rg.getId()+"</td>");
	out.println("<td style='border:1px solid black;'>"+rg.getId()+"</td>");
	out.println("<td style='border:1px solid black;'>"+rg.getLevel()+"</td>");
	out.println("<td style='border:1px solid black;'>"+rg.getSemester()+"</td>");
	out.println("<td style='border:1px solid black;'>"+rg.getAppid()+"</td>");
	out.println("<td style='border:1px solid black;'>"+rg.getSname(rg.getAppid())+"</td>");
	out.println("<td style='border:1px solid black;'>"+rg.getCode()+"</td>");
	out.println("<td style='border:1px solid black;'>"+rg.getCa()+"</td>");
	out.println("<td style='border:1px solid black;'>"+rg.getExam()+"</td>");
	out.println("<td style='border:1px solid black;'>"+rg.getTotal()+"</td>");
	out.println("<td style='border:1px solid black;'>"+rg.getGrade()+"</td>");
	out.println("<td style='border:1px solid black;'>"+rg.getPoints()+"</td>");
	out.println("<td style='border:1px solid black;'>"+rg.getGp()+"</td>");
	out.println("<td style='border:1px solid black;'>"+rg.getRemarks()+"</td>");

	//out.println("<td style='border:1px solid black;'><a href='/appview.jsp?id="+rg.getRid()+"'>View</a> - <a href='/appedit.jsp?id="+rg.getRid()+"'>Edit</a> - <a href='/apppdf.jsp?id="+rg.getRid()+"' target='new'>Print</a></td>");
	out.println("</tr>");
	sn++;
	
}

out.println("</tbody></table>");
%>

</td>		
<%@include file="footer.jsp" %>