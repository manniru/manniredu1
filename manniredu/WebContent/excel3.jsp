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
org.apache.poi.hssf.usermodel.HSSFSheet,
org.apache.poi.hssf.usermodel.HSSFWorkbook,
org.apache.poi.ss.usermodel.Cell,
org.apache.poi.ss.usermodel.CreationHelper,
org.apache.poi.ss.usermodel.Row,
org.apache.poi.ss.usermodel.Sheet,
org.apache.poi.ss.usermodel.Workbook
"
%>

<%
/**
response.setContentType("application/vnd.ms-excel");
response.setHeader("Content-Disposition", "attachment; filename=ExamResults.xls");

HSSFWorkbook wb = new HSSFWorkbook();
HSSFSheet sh = wb.createSheet("ExamResults");
Map<String, Object[]> data = new HashMap<String, Object[]>();
data.put("1", new Object[] {"Reg No.", "Fullname", "Course", "CU", "CA", "Exam", "Total", "Grade", "Point", "GP", "Remarks"});

wb.write(response.getOutputStream()); // Write workbook to response.
//wb.close();

*/
%>

<%
/**
out.println("<table class='sticky-enabled' style='width:90%'>"+
		"<thead><tr><th class='select-all'></th><th>ID</th><th>Username</th><th>Firstname</th><th>Lastname</th><th>Mobile No</th>"+
		"<th>School</th><th>Exam</th><th>Grade</th><th>Program Applied</th><th>Admission</th><th>Action</th></tr></thead><tbody>");

Db db = new Db("mysql","localhost","root","","manniredu");
int sn = 1;
for(Registration rg : db.getAllRegistration()) {
	int m = sn % 2;
	if(m==1) { out.println("<tr class='odd'>"); }
	else { out.println("<tr class='even'>"); }			
	out.println("<td style='border:1px solid black;'><input type='checkbox' name='id"+rg.getRid()+"' value='"+rg.getRid()+"' /></td>");
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
*/
%>

${param["username"]}
<br>
${header["user-agent"]}