<%@include file="header.jsp" %>
<link  href="/mutiselect/article1.css" rel="stylesheet" />
<script src="/mutiselect/jquery-1.js"></script>
<script src="/mutiselect/mutiselect.js"></script>
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

} %>

<td valign="top"><div id="main">
<h1 class="title">Registration Form</h1>
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
<div style="float:left;margin-right:2px;"><label>Application No</label><select name="gender" class="form-select" id="gender">
<option value="<%= ap.getGender() %>" selected="selected"><%= ap.getGender() %></option><option value="M">Male</option><option value="F">Female</option></select></div>
<div style="float:left;margin-right:2px;"><label>Registration PIN</label><input type="text" name="pin" id="pin" size="20" value="<%= ap.getPin() %>" class="form-text" /></div>
<div style="float:left;margin-right:2px;"><label>Year</label><select name="year" class="form-select" id="year" ><option value="<%= ap.getGrade() %>" selected="selected"><%= ap.getGrade() %></option>
<option value="1">1</option><option value="1">2</option><option value="1">3</option></select></div>
<div style="float:left;margin-right:2px;"><label>Semester</label><select name="grade" class="form-select" id="grade" ><option value="<%= ap.getGrade() %>" selected="selected"><%= ap.getGrade() %></option>
<option value="A">A</option><option value="B">B</option><option value="C">C</option></select></div>
<div style="clear:both"></div><br>

<%  
out.println("<div class='example'><strong>Module Course Registration</strong><ul class='options'></ul><select onchange='courses1(this);' class='options'>");

java.net.URL ur =config.getServletContext().getResource("/txt/_courses.txt");
BufferedReader rd =new BufferedReader(new InputStreamReader(ur.openStream()));	

String ln;
while ((ln = rd.readLine()) != null) { try {
	String [] c1  = ln.split("\t");
	out.println("<option value='"+c1[1]+"'>"+c1[1]+" ("+c1[2]+")&nbsp;&nbsp;&nbsp;&nbsp;&nbspCU:"+c1[3]+"</option>");
	} catch(Exception e) { }	}

out.println("</select><img src='/mutiselect/add00000.png' alt='Add' style='vertical-align: middle;' onclick='courses1($(this).prev().get(0));'></div>");
%>

</div></div></fieldset>

<input type="hidden" name="application" id="application" value=""  />
<input type="submit" name="submit" id="submit" value="Submit"  class="form-submit" />
</div>

  <script type="text/javascript"> 
    var config = {
      '.chzn-select'           : {},
      '.chzn-select-deselect'  : {allow_single_deselect:true},
      '.chzn-select-no-single' : {disable_search_threshold:10},
      '.chzn-select-no-results': {no_results_text:'Oops, nothing found!'},
      '.chzn-select-width'     : {width:"95%"}
    }
    for (var selector in config) {
      $(selector).chosen(config[selector]);
    }
  </script>
  </form>
</div></div></td>		
<%@include file="footer.jsp" %>