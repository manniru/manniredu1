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
	int nextid = getId("application");
	String pin = request.getParameter("pin");
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	
	Application ap = new Application();
	if(id!=0) { ap.setId(id); nextid=id; }
	ap.setPin(pin);
	ap.setUsername(username);
	ap.setPassword(password);
	// TODO sadiq will do this function
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
	session.setAttribute("role", "user");
	//session.setAttribute("usertype", "APP");
	response.setStatus(response.SC_MOVED_TEMPORARILY); 
	response.setHeader("Location", "/appview.jsp?id="+nextid);
	// else  { response.setStatus(response.SC_MOVED_TEMPORARILY); response.setHeader("Location", "appedit.jsp?msg=Invalid Pincode, try again!"); }

} %>

<td valign="top"><div id="main">
<h1 class="title">Application Form</h1>
<div class="tabs"><ul class="tabs primary">
<li><a href="appview.jsp?id=<%= ap.getId() %>" class="active">View</a></li>
<li class="active"><a href="appedit.jsp?id=<%= ap.getId() %>">Edit</a></li>
<li ><a href="apppdf.jsp?id=<%= ap.getId() %>">Print</a></li>
<li ><a href="applist.jsp">List</a></li>

</ul></div>

				<div class="tabs"></div>

<div class="node">

<form action=""  accept-charset="UTF-8" method="post" id="webform-client-form-11" class="webform-client-form">
<div><fieldset id="f1">
<legend><b>Application Form</b></legend><div id="webform-component-account-information--account-info" class="webform-layout-box horiz"><div class="webform-component webform-component-textfield" id="webform-component-account-information--account-info--application-pin"><div class="form-item" id="edit-submitted-account-information-account-info-application-pin-wrapper">
<div style="float:left;margin-right:2px;"><label>Application PIN</label><input type="text" name="pin" id="pin" size="20" value="<%= ap.getPin() %>" class="form-text" /></div>
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
<div style="float:left;margin-right:2px;"><label>Program 1</label>
<select name="program" class="form-select" id="program" ><option value="<%= ap.getProgram() %>" selected="selected"><%= ap.getProgram() %></option>
<% for(String st: db.list("program")) { out.println("<option value='"+st+"'>"+st+"</option>"); } %></select></div>

</div></div></fieldset>

<input type="hidden" name="application" id="application" value=""  />
<input type="submit" name="submit" id="submit" value="Submit"  class="form-submit" />
</div></form>
</div></div></td>		
<%@include file="footer.jsp" %>