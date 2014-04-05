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
com.mannir.edu.User,
java.sql.ResultSetMetaData"
%><%! User us; int id=0; %>
<% if(request.getParameter("id") != null) { id = Integer.parseInt(request.getParameter("id")); } System.out.println("ID="+id); %>
<% if(request.getParameter("id") != null) {
	int id = Integer.parseInt(request.getParameter("id"));
	us = (User) db.get(new User(), id);
	}

else { us = (User) db.get(new User(), 1); }
%>
<% if(request.getParameter("submit") != null) {
	   Enumeration paramNames = request.getParameterNames();
	   while(paramNames.hasMoreElements()) {
	      String name = (String)paramNames.nextElement();
	      String value = request.getParameter(name);
	      System.out.println(name+"="+value);
	   }
	   ////////////////////
	int nextid = getId("user");
	String pin = request.getParameter("pin");
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	
	User ap = new User();
	if(id!=0) { us.setId(id); nextid=id; }
	us.setPin(pin);
	us.setUsername(username);
	us.setPassword(password);
	
	us.setMobileno(request.getParameter("mobileno"));
	us.setEmail(request.getParameter("email"));
	us.setFirstname(request.getParameter("firstname").toUpperCase());
	us.setLastname(request.getParameter("lastname").toUpperCase());	
	us.setGender(request.getParameter("gender"));
	us.setDob(request.getParameter("dob"));
	us.setPicture(request.getParameter("picture"));
	us.setAddress(request.getParameter("address"));
	us.setState(request.getParameter("state"));
	us.setCountry(request.getParameter("country"));
	us.setSchool(request.getParameter("school"));
	us.setExam(request.getParameter("exam"));
	us.setGrade(request.getParameter("grade"));
	us.setProgram(request.getParameter("program"));
	us.setAdmission("");
	us.setDateapp(cdate);	
	
	if(id==0) { db.save(ap); System.out.println("Record Saved!"); }
	else { db.update(ap); System.out.println("Record Updated!"); }
	

	session.setAttribute("username", username);
	session.setAttribute("password", password);
	//session.setAttribute("usertype", "APP");
	response.setStatus(response.SC_MOVED_TEMPORARILY); 
	response.setHeader("Location", "/appview.jsp?id="+nextid);
	// else  { response.setStatus(response.SC_MOVED_TEMPORARILY); response.setHeader("Location", "appedit.jsp?msg=Invalid Pincode, try again!"); }

} %>

<td valign="top"><div id="main">
<h1 class="title">User Form</h1>
<div class="tabs"><ul class="tabs primary">
<li><a href="appview.jsp?id=<%= us.getId() %>" class="active">View</a></li>
<li class="active"><a href="appedit.jsp?id=<%= us.getId() %>">Edit</a></li>
<li ><a href="apppdf.jsp?id=<%= us.getId() %>">Print</a></li>
<li ><a href="applist.jsp">List</a></li>

</ul></div>

				<div class="tabs"></div>

<div class="node">

<form action=""  accept-charset="UTF-8" method="post" id="webform-client-form-11" class="webform-client-form">
<div><fieldset id="f1">
<legend><b>User Form</b></legend><div id="webform-component-account-information--account-info" class="webform-layout-box horiz"><div class="webform-component webform-component-textfield" id="webform-component-account-information--account-info--User-pin"><div class="form-item" id="edit-submitted-account-information-account-info-User-pin-wrapper">
<div style="float:left;margin-right:2px;"><label>User PIN</label><input type="text" name="pin" id="pin" size="20" value="<%= us.getPin() %>" class="form-text" /></div>
<div style="float:left;margin-right:2px;"><label>Username</label><input type="text" name="username" id="username" size="20" value="<%= us.getUsername() %>" class="form-text" /></div>
<div style="float:left;margin-right:2px;"><label>Password</label><input type="text" name="password" id="password" size="20" value="<%= us.getPassword() %>" class="form-text" /></div>
<div style="float:left;margin-right:2px;"><label>Mobile No</label><input type="text" name="mobileno" id="mobileno" size="20" value="<%= us.getMobileno() %>" class="form-text" /></div>
<div style="float:left;margin-right:2px;"><label>Email</label><input type="text" name="email" id="email" size="20" value="<%= us.getEmail() %>" class="form-text" /></div>
<div style="clear:both"></div><br>
<div style="float:left;margin-right:2px;"><label>Firstname</label><input type="text" name="firstname" id="firstname" size="20" value="<%= us.getFirstname() %>" class="form-text" /></div>
<div style="float:left;margin-right:2px;"><label>Lastname</label><input type="text" name="lastname" id="lastname" size="20" value="<%= us.getLastname() %>" class="form-text" /></div>
<div style="float:left;margin-right:2px;"><label>Gender</label><select name="gender" class="form-select" id="gender">
<option value="<%= us.getGender() %>" selected="selected"><%= us.getGender() %></option><option value="M">Male</option><option value="F">Female</option></select></div>
<div style="float:left;margin-right:2px;"><label>Date or Birth</label><input type="text" name="dob" id="dob" size="20" value="<%= us.getDob() %>" class="form-text" /></div>
<div style="float:left;margin-right:2px;"><label>Upload your Picture</label><input type="file" name="picture"  class="form-file" id="picture" size="40" /></div>
<div style="clear:both"></div><br>
<div style="float:left;margin-right:2px;"><label>Address</label><input type="text" name="address" id="address" size="20" value="<%= us.getAddress() %>" class="form-text" /></div>
<div style="float:left;margin-right:2px;"><label>State</label><input type="text" name="state" id="state" size="20" value="<%= us.getState() %>" class="form-text" /></div>
<div style="float:left;margin-right:2px;"><label>Country</label><select name="country" class="form-select" id="country">
<option value="<%= us.getCountry() %>" selected="selected"><%= us.getCountry() %></option><option value="Nigeria">Nigeria</option><option value="Malaysia">Malaysia</option></select></div>
<div style="float:left;margin-right:2px;"><label>Last School: </label><select name="school" class="form-select" id="school"><option value="<%= us.getSchool() %>" selected="selected"><%= us.getSchool() %></option><% for(String st: db.list("hqtype")) { out.println("<option value='"+st+"'>"+st+"</option>"); } %></select></div>
<div style="float:left;margin-right:2px;"><label>Exam Type</label><select name="exam" class="form-select" id="exam" ><option value="<%= us.getExam() %>" selected="selected"><%= us.getExam() %></option><% for(String st: db.list("examtype")) { out.println("<option value='"+st+"'>"+st+"</option>"); } %></select></div>
<div style="float:left;margin-right:2px;"><label>Exam Final Grade</label><select name="grade" class="form-select" id="grade" ><option value="<%= us.getGrade() %>" selected="selected"><%= us.getGrade() %></option><% for(String st: db.list("gradetype")) { out.println("<option value='"+st+"'>"+st+"</option>"); } %></select></div>
<div style="clear:both"></div><br>
<div style="float:left;margin-right:2px;"><label>Program 1</label>
<select name="program" class="form-select" id="program" ><option value="<%= us.getProgram() %>" selected="selected"><%= us.getProgram() %></option>
<% for(String st: db.list("program")) { out.println("<option value='"+st+"'>"+st+"</option>"); } %></select></div>

</div></div></fieldset>

<input type="hidden" name="User" id="User" value=""  />
<input type="submit" name="submit" id="submit" value="Submit"  class="form-submit" />
</div></form>
</div></div></td>		
<%@include file="footer.jsp" %>