<script src="SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>
<link href="SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css" />
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
com.mannir.SmsVoice,
java.sql.ResultSetMetaData"
%><%! Application ap; int id=0; %>
<% if(request.getParameter("id") != null) { id = Integer.parseInt(request.getParameter("id")); } System.out.println("ID="+id); %>
<% if(request.getParameter("id") != null) {
	int id = Integer.parseInt(request.getParameter("id"));
	ap = (Application) db.get(new Application(), id);
	}

else { ap = (Application) db.get(new Application(), 1); }
%>
<% 

if(request.getParameter("submit") != null) {
	//System.out.println(request.getParameter("username")); System.exit(0);
	/**
	if(request.getParameter("username").toString().equals("admin")) {
		response.setStatus(response.SC_MOVED_TEMPORARILY); 
		response.setHeader("Location", "/error.jsp");
	}
	*/
	String mobileno = request.getParameter("mobileno");
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
	ap.setRole("applicant");
	
	if(id==0) { db.save(ap);
	String message = "You have succesfull Register at Mannir Cloud Education System, your username is "+username+", password is "+password;
	SmsVoice sv = new SmsVoice();
	String sms = sv.send(mobileno, message);
	System.out.println(sms); }
	else { db.update(ap); System.out.println("Record Updated!"); }
	

	session.setAttribute("uid", db.getlastid("application"));
	session.setAttribute("username", username);
	session.setAttribute("password", password);
	session.setAttribute("role", "applicant");
	response.setStatus(response.SC_MOVED_TEMPORARILY); 
	response.setHeader("Location", "/appview.jsp?id="+nextid);
	// else  { response.setStatus(response.SC_MOVED_TEMPORARILY); response.setHeader("Location", "appedit.jsp?msg=Invalid Pincode, try again!"); }

} %>

<td valign="top"><div id="main">
<h1 class="title">Application Form</h1>
<div class="tabs"><ul class="tabs primary">
<li><a href="appview.jsp?id=<%= ap.getId() %>" class="active">View</a></li>
<li class="active"><a href="appedit.jsp?id=<%= ap.getId() %>">Edit</a></li>

</ul></div>

				<div class="tabs"></div>

<div class="node">

<form action=""  accept-charset="UTF-8" method="post" id="webform-client-form-11" class="webform-client-form">
<div><fieldset id="f1">
<legend><b>Application Form</b></legend><div id="webform-component-account-information--account-info" class="webform-layout-box horiz"><div class="webform-component webform-component-textfield" id="webform-component-account-information--account-info--application-pin"><div class="form-item" id="edit-submitted-account-information-account-info-application-pin-wrapper">

<input type="hidden" name="pin" id="pin" value="" />

<div style="float:left;margin-right:2px;"><label>Username</label><input type="text" name="username" id="username" size="20" value="<%= ap.getUsername() %>" class="form-text" /></div>
<div style="float:left;margin-right:2px;"><label>Password</label><input type="password" name="password" id="password" size="20" value="<%= ap.getPassword() %>" class="form-text" /></div>
<div style="float:left;margin-right:2px;"><label>Mobile No</label><input type="text" name="mobileno" id="mobileno" size="20" value="<%= ap.getMobileno() %>" class="form-text" /></div>
<div style="float:left;margin-right:2px;"><label>Email</label><input type="text" name="email" id="email" size="20" value="<%= ap.getEmail() %>" class="form-text" /></div>
<div style="clear:both"></div><br>
<div style="float:left;margin-right:2px;"><label>Firstname</label><input type="text" name="firstname" id="firstname" size="20" value="<%= ap.getFirstname() %>" class="form-text" /></div>
<div style="float:left;margin-right:2px;"><label>Lastname</label><input type="text" name="lastname" id="lastname" size="20" value="<%= ap.getLastname() %>" class="form-text" /></div>
<div style="float:left;margin-right:2px;"><label>Gender</label><select name="gender" class="form-select" id="gender">
<option value="<%= ap.getGender() %>" selected="selected"><%= ap.getGender() %></option><option value="M">Male</option><option value="F">Female</option></select></div>
<div style="float:left;margin-right:2px;"><label>Date or Birth</label><input type="date" name="dob"></div>
<input type="hidden" name="picture" id="picture" value="" />
<div style="clear:both"></div><br>
<div style="float:left;margin-right:2px;"><label>Address</label><input type="text" name="address" id="address" size="20" value="<%= ap.getAddress() %>" class="form-text" /></div>
<div style="float:left;margin-right:2px;"><label>State</label><input type="text" name="state" id="state" size="20" value="<%= ap.getState() %>" class="form-text" /></div>
<div style="float:left;margin-right:2px;"><label>Country</label>
<select name="country">
<option value="">Country...</option>
<option value="Afganistan">Afghanistan</option>
<option value="Albania">Albania</option>
<option value="Algeria">Algeria</option>
<option value="American Samoa">American Samoa</option>
<option value="Andorra">Andorra</option>
<option value="Angola">Angola</option>
<option value="Anguilla">Anguilla</option>
<option value="Antigua &amp; Barbuda">Antigua &amp; Barbuda</option>
<option value="Argentina">Argentina</option>
<option value="Armenia">Armenia</option>
<option value="Aruba">Aruba</option>
<option value="Australia">Australia</option>
<option value="Austria">Austria</option>
<option value="Azerbaijan">Azerbaijan</option>
<option value="Bahamas">Bahamas</option>
<option value="Bahrain">Bahrain</option>
<option value="Bangladesh">Bangladesh</option>
<option value="Barbados">Barbados</option>
<option value="Belarus">Belarus</option>
<option value="Belgium">Belgium</option>
<option value="Belize">Belize</option>
<option value="Benin">Benin</option>
<option value="Bermuda">Bermuda</option>
<option value="Bhutan">Bhutan</option>
<option value="Bolivia">Bolivia</option>
<option value="Bonaire">Bonaire</option>
<option value="Bosnia &amp; Herzegovina">Bosnia &amp; Herzegovina</option>
<option value="Botswana">Botswana</option>
<option value="Brazil">Brazil</option>
<option value="British Indian Ocean Ter">British Indian Ocean Ter</option>
<option value="Brunei">Brunei</option>
<option value="Bulgaria">Bulgaria</option>
<option value="Burkina Faso">Burkina Faso</option>
<option value="Burundi">Burundi</option>
<option value="Cambodia">Cambodia</option>
<option value="Cameroon">Cameroon</option>
<option value="Canada">Canada</option>
<option value="Canary Islands">Canary Islands</option>
<option value="Cape Verde">Cape Verde</option>
<option value="Cayman Islands">Cayman Islands</option>
<option value="Central African Republic">Central African Republic</option>
<option value="Chad">Chad</option>
<option value="Channel Islands">Channel Islands</option>
<option value="Chile">Chile</option>
<option value="China">China</option>
<option value="Christmas Island">Christmas Island</option>
<option value="Cocos Island">Cocos Island</option>
<option value="Colombia">Colombia</option>
<option value="Comoros">Comoros</option>
<option value="Congo">Congo</option>
<option value="Cook Islands">Cook Islands</option>
<option value="Costa Rica">Costa Rica</option>
<option value="Cote DIvoire">Cote D'Ivoire</option>
<option value="Croatia">Croatia</option>
<option value="Cuba">Cuba</option>
<option value="Curaco">Curacao</option>
<option value="Cyprus">Cyprus</option>
<option value="Czech Republic">Czech Republic</option>
<option value="Denmark">Denmark</option>
<option value="Djibouti">Djibouti</option>
<option value="Dominica">Dominica</option>
<option value="Dominican Republic">Dominican Republic</option>
<option value="East Timor">East Timor</option>
<option value="Ecuador">Ecuador</option>
<option value="Egypt">Egypt</option>
<option value="El Salvador">El Salvador</option>
<option value="Equatorial Guinea">Equatorial Guinea</option>
<option value="Eritrea">Eritrea</option>
<option value="Estonia">Estonia</option>
<option value="Ethiopia">Ethiopia</option>
<option value="Falkland Islands">Falkland Islands</option>
<option value="Faroe Islands">Faroe Islands</option>
<option value="Fiji">Fiji</option>
<option value="Finland">Finland</option>
<option value="France">France</option>
<option value="French Guiana">French Guiana</option>
<option value="French Polynesia">French Polynesia</option>
<option value="French Southern Ter">French Southern Ter</option>
<option value="Gabon">Gabon</option>
<option value="Gambia">Gambia</option>
<option value="Georgia">Georgia</option>
<option value="Germany">Germany</option>
<option value="Ghana">Ghana</option>
<option value="Gibraltar">Gibraltar</option>
<option value="Great Britain">Great Britain</option>
<option value="Greece">Greece</option>
<option value="Greenland">Greenland</option>
<option value="Grenada">Grenada</option>
<option value="Guadeloupe">Guadeloupe</option>
<option value="Guam">Guam</option>
<option value="Guatemala">Guatemala</option>
<option value="Guinea">Guinea</option>
<option value="Guyana">Guyana</option>
<option value="Haiti">Haiti</option>
<option value="Hawaii">Hawaii</option>
<option value="Honduras">Honduras</option>
<option value="Hong Kong">Hong Kong</option>
<option value="Hungary">Hungary</option>
<option value="Iceland">Iceland</option>
<option value="India">India</option>
<option value="Indonesia">Indonesia</option>
<option value="Iran">Iran</option>
<option value="Iraq">Iraq</option>
<option value="Ireland">Ireland</option>
<option value="Isle of Man">Isle of Man</option>
<option value="Israel">Israel</option>
<option value="Italy">Italy</option>
<option value="Jamaica">Jamaica</option>
<option value="Japan">Japan</option>
<option value="Jordan">Jordan</option>
<option value="Kazakhstan">Kazakhstan</option>
<option value="Kenya">Kenya</option>
<option value="Kiribati">Kiribati</option>
<option value="Korea North">Korea North</option>
<option value="Korea Sout">Korea South</option>
<option value="Kuwait">Kuwait</option>
<option value="Kyrgyzstan">Kyrgyzstan</option>
<option value="Laos">Laos</option>
<option value="Latvia">Latvia</option>
<option value="Lebanon">Lebanon</option>
<option value="Lesotho">Lesotho</option>
<option value="Liberia">Liberia</option>
<option value="Libya">Libya</option>
<option value="Liechtenstein">Liechtenstein</option>
<option value="Lithuania">Lithuania</option>
<option value="Luxembourg">Luxembourg</option>
<option value="Macau">Macau</option>
<option value="Macedonia">Macedonia</option>
<option value="Madagascar">Madagascar</option>
<option value="Malaysia">Malaysia</option>
<option value="Malawi">Malawi</option>
<option value="Maldives">Maldives</option>
<option value="Mali">Mali</option>
<option value="Malta">Malta</option>
<option value="Marshall Islands">Marshall Islands</option>
<option value="Martinique">Martinique</option>
<option value="Mauritania">Mauritania</option>
<option value="Mauritius">Mauritius</option>
<option value="Mayotte">Mayotte</option>
<option value="Mexico">Mexico</option>
<option value="Midway Islands">Midway Islands</option>
<option value="Moldova">Moldova</option>
<option value="Monaco">Monaco</option>
<option value="Mongolia">Mongolia</option>
<option value="Montserrat">Montserrat</option>
<option value="Morocco">Morocco</option>
<option value="Mozambique">Mozambique</option>
<option value="Myanmar">Myanmar</option>
<option value="Nambia">Nambia</option>
<option value="Nauru">Nauru</option>
<option value="Nepal">Nepal</option>
<option value="Netherland Antilles">Netherland Antilles</option>
<option value="Netherlands">Netherlands (Holland, Europe)</option>
<option value="Nevis">Nevis</option>
<option value="New Caledonia">New Caledonia</option>
<option value="New Zealand">New Zealand</option>
<option value="Nicaragua">Nicaragua</option>
<option value="Niger">Niger</option>
<option value="Nigeria">Nigeria</option>
<option value="Niue">Niue</option>
<option value="Norfolk Island">Norfolk Island</option>
<option value="Norway">Norway</option>
<option value="Oman">Oman</option>
<option value="Pakistan">Pakistan</option>
<option value="Palau Island">Palau Island</option>
<option value="Palestine">Palestine</option>
<option value="Panama">Panama</option>
<option value="Papua New Guinea">Papua New Guinea</option>
<option value="Paraguay">Paraguay</option>
<option value="Peru">Peru</option>
<option value="Phillipines">Philippines</option>
<option value="Pitcairn Island">Pitcairn Island</option>
<option value="Poland">Poland</option>
<option value="Portugal">Portugal</option>
<option value="Puerto Rico">Puerto Rico</option>
<option value="Qatar">Qatar</option>
<option value="Republic of Montenegro">Republic of Montenegro</option>
<option value="Republic of Serbia">Republic of Serbia</option>
<option value="Reunion">Reunion</option>
<option value="Romania">Romania</option>
<option value="Russia">Russia</option>
<option value="Rwanda">Rwanda</option>
<option value="St Barthelemy">St Barthelemy</option>
<option value="St Eustatius">St Eustatius</option>
<option value="St Helena">St Helena</option>
<option value="St Kitts-Nevis">St Kitts-Nevis</option>
<option value="St Lucia">St Lucia</option>
<option value="St Maarten">St Maarten</option>
<option value="St Pierre &amp; Miquelon">St Pierre &amp; Miquelon</option>
<option value="St Vincent &amp; Grenadines">St Vincent &amp; Grenadines</option>
<option value="Saipan">Saipan</option>
<option value="Samoa">Samoa</option>
<option value="Samoa American">Samoa American</option>
<option value="San Marino">San Marino</option>
<option value="Sao Tome &amp; Principe">Sao Tome &amp; Principe</option>
<option value="Saudi Arabia">Saudi Arabia</option>
<option value="Senegal">Senegal</option>
<option value="Serbia">Serbia</option>
<option value="Seychelles">Seychelles</option>
<option value="Sierra Leone">Sierra Leone</option>
<option value="Singapore">Singapore</option>
<option value="Slovakia">Slovakia</option>
<option value="Slovenia">Slovenia</option>
<option value="Solomon Islands">Solomon Islands</option>
<option value="Somalia">Somalia</option>
<option value="South Africa">South Africa</option>
<option value="Spain">Spain</option>
<option value="Sri Lanka">Sri Lanka</option>
<option value="Sudan">Sudan</option>
<option value="Suriname">Suriname</option>
<option value="Swaziland">Swaziland</option>
<option value="Sweden">Sweden</option>
<option value="Switzerland">Switzerland</option>
<option value="Syria">Syria</option>
<option value="Tahiti">Tahiti</option>
<option value="Taiwan">Taiwan</option>
<option value="Tajikistan">Tajikistan</option>
<option value="Tanzania">Tanzania</option>
<option value="Thailand">Thailand</option>
<option value="Togo">Togo</option>
<option value="Tokelau">Tokelau</option>
<option value="Tonga">Tonga</option>
<option value="Trinidad &amp; Tobago">Trinidad &amp; Tobago</option>
<option value="Tunisia">Tunisia</option>
<option value="Turkey">Turkey</option>
<option value="Turkmenistan">Turkmenistan</option>
<option value="Turks &amp; Caicos Is">Turks &amp; Caicos Is</option>
<option value="Tuvalu">Tuvalu</option>
<option value="Uganda">Uganda</option>
<option value="Ukraine">Ukraine</option>
<option value="United Arab Erimates">United Arab Emirates</option>
<option value="United Kingdom">United Kingdom</option>
<option value="United States of America">United States of America</option>
<option value="Uraguay">Uruguay</option>
<option value="Uzbekistan">Uzbekistan</option>
<option value="Vanuatu">Vanuatu</option>
<option value="Vatican City State">Vatican City State</option>
<option value="Venezuela">Venezuela</option>
<option value="Vietnam">Vietnam</option>
<option value="Virgin Islands (Brit)">Virgin Islands (Brit)</option>
<option value="Virgin Islands (USA)">Virgin Islands (USA)</option>
<option value="Wake Island">Wake Island</option>
<option value="Wallis &amp; Futana Is">Wallis &amp; Futana Is</option>
<option value="Yemen">Yemen</option>
<option value="Zaire">Zaire</option>
<option value="Zambia">Zambia</option>
<option value="Zimbabwe">Zimbabwe</option>
</select>
</div>
<div style="clear:both"></div>
<div style="float:left;margin-right:2px;"><label>Last Qualification: </label><select name="school" class="form-select" id="school"><option value="<%= ap.getSchool() %>" selected="selected"><%= ap.getSchool() %></option><% for(String st: db.list("hqtype")) { out.println("<option value='"+st+"'>"+st+"</option>"); } %></select></div>
<div style="float:left;margin-right:2px;"><label>Exam Type</label><select name="exam" class="form-select" id="exam" ><option value="<%= ap.getExam() %>" selected="selected"><%= ap.getExam() %></option><% for(String st: db.list("examtype")) { out.println("<option value='"+st+"'>"+st+"</option>"); } %></select></div>
<div style="float:left;margin-right:2px;"><label>Grade</label><select name="grade" class="form-select" id="grade" ><option value="<%= ap.getGrade() %>" selected="selected"><%= ap.getGrade() %></option><% for(String st: db.list("gradetype")) { out.println("<option value='"+st+"'>"+st+"</option>"); } %></select></div>
<div style="float:left;margin-right:2px;"><label>Program you want to Apply</label>
<select name="program" class="form-select" id="program" ><option value="<%= ap.getProgram() %>" selected="selected"><%= ap.getProgram() %></option>
<% for(String st: db.list("program")) { out.println("<option value='"+st+"'>"+st+"</option>"); } %></select></div>

</div></div></fieldset>

<input type="hidden" name="application" id="application" value=""  />
<input type="submit" name="submit" id="submit" value="Submit"  class="form-submit" />
</div></form>
</div></div></td>		
<%@include file="footer.jsp" %>