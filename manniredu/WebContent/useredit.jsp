<%@include file="header.jsp" %>
<link  href="/mutiselect/article1.css" rel="stylesheet" />
<script src="/mutiselect/jquery-1.js"></script>
<script src="/mutiselect/mutiselect.js"></script>
<script type="text/javascript" src="/js/collapse.js?Z"></script>
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
com.mannir.edu.Application,
java.sql.ResultSetMetaData"
%><%! Application ap; int id=0; %>
<% if(request.getParameter("id") != null) { id = Integer.parseInt(request.getParameter("id")); } System.out.println("ID="+id); %>
<% if(request.getParameter("id") != null) {
	int id = Integer.parseInt(request.getParameter("id"));
	ap = (Application) db.get(new Application(), id);
	}

else { ap = (Application) db.get(new Application(), 1); }
%>
<% if(request.getParameter("submit") != null) {
	String regpin = request.getParameter("regpin");
	String lv = request.getParameter("level");
	String sm = request.getParameter("semester");
	String courses1 = "";
	StringBuilder nb = new StringBuilder();
	//try {
		 String[] c1 = request.getParameterValues("courses1[]");
		 for(String cs: c1) {
			 try { cn.createStatement().executeUpdate("INSERT INTO registration(aid,pin,level,semester,code) VALUES("+
		 session.getAttribute("uid")+",'"+regpin+"',"+lv+","+sm+",'"+cs+"')");
			 } catch(Exception e) { System.out.println(e); }
			 //db.runSql(cn, "INSERT INTO registration(aid,pinid,code) VALUES("+uid+",'"+regpin+"','"+code+"')");
		 }
		 /**
		 if (c1.length > 0) { 
		 for (String n : c1) { 
			 nb.append("").append(n.replaceAll("'", "\\\\'")).append(",");
			 }
		 nb.deleteCharAt(nb.length() - 1); 
		 courses1 = nb.toString();
		 } else { courses1 = ""; }
		} catch(Exception e4) { }
	*/
	//System.out.println(nb);
	/**
	String[] cs = nb.toString().split(",");
	for(String cid: cs) {
//		
		
	}
	*/
	/**
	Enumeration en = request.getParameterNames();
	while(en.hasMoreElements()) {
		String pr = (String) en.nextElement();
		String vl = request.getParameter(pr);
		System.out.println(pr+"="+vl);
	}
	*/
	
	/**
	int nextid = getId("application");
	String pin = request.getParameter("pin");
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	
	Application ap = new Application();
	if(id!=0) { ap.setId(id); nextid=id; }
	ap.setPin(pin);
	ap.setUsername(username);
	ap.setPassword(password);
	
	ap.setMobileno(request.getParameter("mobileno"));
	ap.setEmail(request.getParameter("email"));
	ap.setFirstname(request.getParameter("firstname").toUpperCase());
	ap.setLastname(request.getParameter("lastname").toUpperCase());	
	ap.setGender(request.getParameter("gender"));
	ap.setDob(request.getParameter("dob"));
	ap.setPicture(request.getParameter("picture"));
	ap.setAddress(request.getParameter("address"));
	ap.setState(request.getParameter("state"));
	ap.setCountry(request.getParameter("country"));
	ap.setSchool(request.getParameter("school"));
	ap.setExam(request.getParameter("exam"));
	ap.setGrade(request.getParameter("grade"));
	ap.setProgram(request.getParameter("program"));
	ap.setAdmission("");
	ap.setDateapp(cdate);	
	
	if(id==0) { db.save(ap); System.out.println("Record Saved!"); }
	else { db.update(ap); System.out.println("Record Updated!"); }
	

	session.setAttribute("username", username);
	session.setAttribute("password", password);
	//session.setAttribute("usertype", "APP");
	response.setStatus(response.SC_MOVED_TEMPORARILY); 
	response.setHeader("Location", "/appview.jsp?id="+nextid);
	// else  { response.setStatus(response.SC_MOVED_TEMPORARILY); response.setHeader("Location", "appedit.jsp?msg=Invalid Pincode, try again!"); }
*/
} %>

<td valign="top"><div id="main">
<h1 class="title">User Form</h1>
<div class="tabs"><ul class="tabs primary">
<li><a href="appview.jsp?id=<%= ap.getId() %>" class="active">View</a></li>
<li class="active"><a href="appedit.jsp?id=<%= ap.getId() %>">Edit</a></li>
<li ><a href="apppdf.jsp?id=<%= ap.getId() %>">Print</a></li>
<li ><a href="applist.jsp">List</a></li>

</ul></div>

				<div class="tabs"></div>

<div class="node">

<form action=""  accept-charset="UTF-8" method="post" id="webform-client-form-11" class="webform-client-form">
<fieldset id="f1" class='collapsible'>
<legend>User Registration</legend>
<div class="form-item">
<div style="float:left;margin-right:2px;"><label>Username</label><input type="text" name="username" id="username" size="20" value="<%= ap.getUsername() %>" class="form-text" /></div>
<div style="float:left;margin-right:2px;"><label>Password</label><input type="text" name="password" id="password" size="20" value="<%= ap.getPassword() %>" class="form-text" /></div>
<div style="float:left;margin-right:2px;"><label>Mobile No</label><input type="text" name="mobileno" id="mobileno" size="20" value="<%= ap.getMobileno() %>" class="form-text" /></div>
<div style="float:left;margin-right:2px;"><label>Email</label><input type="text" name="email" id="email" size="20" value="<%= ap.getEmail() %>" class="form-text" /></div>
<div style="clear:both"></div><br>
<div style="float:left;margin-right:2px;"><label>Firstname</label><input type="text" name="firstname" id="firstname" size="20" value="<%= ap.getFirstname() %>" class="form-text" /></div>
<div style="float:left;margin-right:2px;"><label>Lastname</label><input type="text" name="lastname" id="lastname" size="20" value="<%= ap.getLastname() %>" class="form-text" /></div>
<div style="float:left;margin-right:2px;"><label>Gender</label><select name="gender" class="form-select" id="gender">
<option value="<%= ap.getGender() %>" selected="selected"><%= ap.getGender() %></option><option value="M">Male</option><option value="F">Female</option></select></div>
<div style="float:left;margin-right:2px;"><label>Date or Birth</label><input type="text" name="dob" id="dob" size="20" value="<%= ap.getDob() %>" class="form-text" /></div>
<div style="float:left;margin-right:2px;"><label>Upload your Picture</label><input type="file" name="picture"  class="form-file" id="picture" size="40" /></div>
<div style="clear:both"></div><br>
<div style="float:left;margin-right:2px;"><label>Address</label><input type="text" name="address" id="address" size="20" value="<%= ap.getAddress() %>" class="form-text" /></div>
<div style="float:left;margin-right:2px;"><label>State</label><input type="text" name="state" id="state" size="20" value="<%= ap.getState() %>" class="form-text" /></div>
<div style="float:left;margin-right:2px;"><label>Country</label><select name="country" class="form-select" id="country">
<option value="<%= ap.getCountry() %>" selected="selected"><%= ap.getCountry() %></option><option value="Nigeria">Nigeria</option><option value="Malaysia">Malaysia</option></select></div>
<div style="float:left;margin-right:2px;"><label>Last School: </label><select name="school" class="form-select" id="school"><option value="<%= ap.getSchool() %>" selected="selected"><%= ap.getSchool() %></option><% for(String st: db.list("hqtype")) { out.println("<option value='"+st+"'>"+st+"</option>"); } %></select></div>
<div style="float:left;margin-right:2px;"><label>Exam Type</label><select name="exam" class="form-select" id="exam" ><option value="<%= ap.getExam() %>" selected="selected"><%= ap.getExam() %></option><% for(String st: db.list("examtype")) { out.println("<option value='"+st+"'>"+st+"</option>"); } %></select></div>
<div style="float:left;margin-right:2px;"><label>Exam Final Grade</label><select name="grade" class="form-select" id="grade" ><option value="<%= ap.getGrade() %>" selected="selected"><%= ap.getGrade() %></option><% for(String st: db.list("gradetype")) { out.println("<option value='"+st+"'>"+st+"</option>"); } %></select></div>
<div style="clear:both"></div><br>

</div>
</fieldset>

<fieldset id='f2' class='collapsible'><legend>Program Registration</legend>
<div class="form-item">
<div style="float:left;margin-right:2px;">
  <label>Application Pin</label><input type="text" name="apppin" id="apppin" size="20" value="<%= ap.getPin() %>" class="form-text" /></div>
<div style="float:left;margin-right:2px;"><label>Select Program</label>
<select name="program" class="form-select" id="program" ><option value="<%= ap.getProgram() %>" selected="selected"><%= ap.getProgram() %></option>
<% for(String st: db.list("program")) { out.println("<option value='"+st+"'>"+st+"</option>"); } %></select></div></div></fieldset>




<fieldset id='f3' class='collapsible'><legend>Module Registration</legend><div class="form-item">
<div style="float:left;margin-right:2px;"><label>Registration Pin</label><input type="text" name="regpin" id="regpin" size="20" value="" class="form-text" /></div>
<div style="float:left;margin-right:2px;"><label>Level</label><select name="level" class="form-select" id="level">
<option value="1" selected="selected">1</option><option value="2">2</option><option value="3">3</option></select></div>
<div style="float:left;margin-right:2px;"><label>Semester</label><select name="semester" class="form-select" id="semester">
<option value="1" selected="selected">1</option><option value="2">2</option><option value="3">3</option></select></div>
<div style="clear:both"></div>
<%  
out.println("<ul class='options'></ul><select onchange='courses1(this);' class='options'>");

//java.net.URL ur =config.getServletContext().getResource("/txt/_courses.txt");
//BufferedReader rd =new BufferedReader(new InputStreamReader(ur.openStream()));

try { ResultSet rs = cn.createStatement().executeQuery("SELECT * FROM courses");
while(rs.next()) {
	String cid = rs.getString("cid");
	String code = rs.getString("code");
	String title = rs.getString("title");
	String cu = rs.getString("cu");
	out.println("<option value='"+code+"'>"+code+" ("+title+")</option>");
}

} catch(Exception e) { System.out.println(e); }


out.println("</select><img src='/mutiselect/add00000.png' alt='Add' style='vertical-align: middle;' onclick='courses1($(this).prev().get(0));'>");
%>
</div></fieldset>

<input type="submit" name="submit" id="submit" value="Submit"  class="form-submit" />
</form>
</div></div></td>		
<%@include file="footer.jsp" %>