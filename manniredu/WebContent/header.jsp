<%@include file="manniredu.jsp" %>

<% if(request.getParameter("q") != null && request.getParameter("q").equals("logout")) {
	session.setAttribute("role", null);
	session.setAttribute("username", null);
	response.setStatus(response.SC_MOVED_TEMPORARILY); 
	response.setHeader("Location", "/index.jsp");
}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<head>
<title>Mannir Education Cloud System</title>
<link rel="alternate" type="application/rss+xml" title="Mannir eSystems Limited RSS" href="rss.xml">

<link rel="shortcut icon" href="files/favicon0.png" type="image/x-icon">
<link type="text/css" rel="stylesheet" media="all" href="files/node0000.css">
<link type="text/css" rel="stylesheet" media="all" href="files/defaults.css">
<link type="text/css" rel="stylesheet" media="all" href="files/system00.css">
<link type="text/css" rel="stylesheet" media="all" href="files/system-m.css">
<link type="text/css" rel="stylesheet" media="all" href="files/user0000.css">
<link type="text/css" rel="stylesheet" media="all" href="files/style000.css">

<script type="text/javascript" src="files/jquery00.js"></script>
<script type="text/javascript" src="files/drupal00.js"></script>
<script type="text/javascript" src="files/jquery01.js"></script>
<script type="text/javascript" src="files/suckerfi.js"></script>
<script language="javascript" src="files/jquery-1.js"></script>
</head>
<body>
<div id="above" class="clear-block"></div>
<div id="page">
	<div id="masthead">

		<div id="header" class="clear-block">
			<div class="header-right">
				<div class="header-left">
					<div id="logo" style="text-align:left;"><a href="/" title="Home"><img width="80" height="80" src="images/uel.png" alt="Home"></a></div> 
					<div id="name-and-slogan">
                    <h1 id="site-name" align="center">
							<a href="/" title="Home">Online Education Cloud System</a>
                            <div id="site-slogan" style="font-size:20px;">School Information System using Google Cloud Computing Tetchnology</div>
						</h1>
															</div> <!-- /name-and-slogan -->
                                                            
								</div> <!-- /header-left -->
  			</div> <!-- /header-right -->
		</div> <!-- /header -->

	</div>

	<div id="prenav"></div>
	<div id="navigation" class="menu">
			<div id="primary" class="clear-block">
			
			
<div class="navcont">
<ul><li class="menu-114 first"><a href="#" title="Home">Home</a></li>
<li class="menu-115"><a href="#" title="About us">About us</a></li>
<li class="menu-116"><a href="#" title="Schools">Schools</a></li>
<li class="menu-117"><a href="#" title="Departments">Departments</a></li>
<li class="menu-118"><a href="#" title="Programmes">Programmes</a></li>
<li class="menu-119"><a href="appedit.jsp" title="New Application">New Application</a></li>
<li class="menu-120"><a href="#" title="New Registration">New Registration</a></li>
<li class="menu-121"><a href="#" title="Admission Requirments">Admission Requirments</a></li>
<li class="menu-122"><a href="#" title="Admission List">Admission List</a></li>
<li class="menu-123"><a href="#" title="Contact us">Contact us</a></li>
</ul>
</div>



		</div>
			</div>	<div id="postnav"></div>

	


<div id="middlecontainer">
<table border="0" cellpadding="0" cellspacing="0" id="content"><tr>




































<% if(request.getParameter("login") != null) {
	String uid2="", user2="", pass2="", role="";
	String user1 = request.getParameter("user");
	String pass1 = request.getParameter("pass");
	System.out.println(user1+"="+pass1);
	
	try { ResultSet rs = cn.createStatement().executeQuery("SELECT uid,username,password,role FROM users WHERE username='"+user1+"' AND password='"+pass1+"'"); rs.next();
	uid2 = rs.getString("uid");
	user2 = rs.getString("username");
	pass2 = rs.getString("password");
	role = rs.getString("role");
	} catch(Exception e) { System.out.println(e); }
	
	
	if(user1.equals(user2) && pass1.equals(pass2)) {
		session.setAttribute("uid", uid2);
		session.setAttribute("username", user1);
		session.setAttribute("password", pass1);
		session.setAttribute("role", role);
		response.setStatus(response.SC_MOVED_TEMPORARILY); 
		response.setHeader("Location", "/main.jsp");
	} else { response.setStatus(response.SC_MOVED_TEMPORARILY); response.setHeader("Location", "/invalid.jsp?id=1"); }
	//db.query("");
	//
}

%>

<td id="sidebar-left"><div class='block block-user' id='block-user-0'>
<% if(session.getAttribute("role")==null) {
out.println("<h2 class='title'>User login</h2><div class='content'><form action='' method='post' id='loginform'>"+
		"<div class='form-item'><label>Username</label><input type='text' name='user' id='user' size='15'/></div>"+
		"<div class='form-item'><label>Password</label><input type='password' name='pass' id='pass' size='15'/></div>"+
		"<input type='submit' name='login' id='login' value='Log in'  class='form-submit' />"+
		"<div class='item-list'><ul><li class='first'><a href='register.jsp'>New Applicaton</a></li>"+
		"<li><a href='regedit.jsp'>New Registration</a></li><li class='last'><a href='#'>Forgot Password</a></li></ul></div></form></div>");
}
else {
	out.println("<h2 class='title'>Welcome Mannir</h2><img src='images/mannir.jpg' alt='Picture' />");
	//out.println("<br><strong>User ID: "+uid+"</strong>");
	if(session.getAttribute("role").equals("admin")) {
		out.println("<h2 class='title'>Admin Menu</h2><ul class='menu'>"+
				"<li class='leaf first'><a href='pins.jsp'>Generate Pins</a></li>"+
				"<li class='leaf'><a href='applist.jsp'>List Applications</a></li>"+
				"<li class='leaf'><a href='admgen.jsp'>Generate Admissions</a></li>"+
				"<li class='leaf'><a href='admgen.jsp'>List Admissions</a></li>"+
				"<li class='leaf'><a href='exams.jsp'>List Registration</a></li>"+
				"<li class='leaf'><a href='exams.jsp'>Exam Results</a></li>"+
				"<li class='leaf'><a href='#'>List ExamResults</a></li>"+
				"<li class='leaf'><a href='#'>Export Records</a></li>"+
				"<li class='leaf'><a href='#'>Send SMS</a></li>"+
				"<li class='leaf'><a href='#'>Make Calls</a></li>"+
				"<li class='leaf last'><a href='?q=logout'>Log out</a></li></ul>");
	}
	
	if(session.getAttribute("role").equals("applicant")) {
	out.println("<h2 class='title'>Applicant Menu</h2><ul class='menu'>"+
			"<li class='leaf'><a href='appedit.jsp?id="+uid+"'>Edit Application</a></li>"+
			"<li class='leaf'><a href='appview.jsp?id="+uid+"'>View Application</a></li>"+
			"<li class='leaf'><a href='apppdf.jsp?id="+uid+"' target='new'>Print Application</a></li>"+
			"<li class='leaf'><a href='admpdf.jsp?id="+uid+"' target='new'>Print Admission</a></li>"+
			"<li class='leaf'><a href='useredit.jsp?id="+session.getAttribute("uid")+"'>Course Registration</a></li>"+
			"<li class='leaf last'><a href='?q=logout'>Log out</a></li></ul>");
	}

	if(session.getAttribute("role").equals("student")) {
	out.println("<h2 class='title'>Student Menu</h2><ul class='menu'>"+
			"<li class='leaf first'><a href='#'>New Registration</a></li>"+
			"<li class='leaf'><a href='#'>Edit Registration</a></li>"+
			"<li class='leaf'><a href='#'>View Registration</a></li>"+
			"<li class='leaf'><a href='#'>Print Registration</a></li>"+
			"<li class='leaf'><a href='#'>Print Exam Results</a></li>"+
			"<li class='leaf last'><a href='?q=logout'>Log out</a></li></ul>");
	}

}
%>


 
</td>