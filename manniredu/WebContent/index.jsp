<%! public String msg=""; %><% if(request.getParameter("msg") != null) { msg=request.getParameter("msg"); } %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<head>
<title>Online Academy Cloud System</title>
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
							<a href="/" title="Home">Online Academy Cloud System</a>
                            <div id="site-slogan" style="font-size:20px;">School Information System using Google Cloud Computing Technology</div>
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
<li class="menu-121"><a href="#" title="Admission Requirments">Admission Requirements</a></li>
<li class="menu-122"><a href="#" title="Admission List">Admission List</a></li>
<li class="menu-123"><a href="#" title="Contact us">Contact us</a></li>
</ul>
</div>



		</div>
			</div>	<div id="postnav"></div>

	


<div id="middlecontainer">
<table border="0" cellpadding="0" cellspacing="0" id="content"><tr>




































<td id="sidebar-left"><div class='block block-user' id='block-user-0'>
<% // MENUS
int uid=1;

if(session.getAttribute("role")==null) {
out.println("<h2 class='title'>User login</h2><div class='content'><form action='actions.jsp' method='post' id='loginform'>"+
		"<div class='form-item'><label>Username</label><input type='text' name='user' id='user' size='15'/></div>"+
		"<div class='form-item'><label>Password</label><input type='password' name='pass' id='pass' size='15'/></div>"+
		"<input type='submit' name='login' id='login' value='Log in'  class='form-submit' />"+
		"<div class='item-list'><ul><li class='first'><a href='appedit.jsp'>New Applicaton</a></li>"+
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
			"<li class='leaf'><a href='useredit.jsp?id="+uid+"'>Course Registration</a></li>"+
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

























<td align="center" valign="top">
						<div id="main">
												<h1 class="title"></h1>
				<div class="tabs"></div>
												  <div class="node">
        <h2 class="title"><a href="/"><%= msg %></a></h2><div class="content">
        <p><center>
          <strong>Welcome to Online Cloud System for Academic Institutions</strong>
        </center>
        
         Mannir Cloud Education System Developed By: MUHAMMAD MANNIR AHMAD
        
        </p>
</div>


		<div id="fontimage">
     
        
        
        <a href="/#"><img src="images/uel1.jpg" alt="Picture 1" width="400" height="250"></a>
        <a href="/#"><img src="images/uel3.jpg" alt="Picture 1" width="400" height="250"></a>
		
		</div>
		
		
      </div>
				</div>
		</td>
<%@include file="footer.jsp" %>