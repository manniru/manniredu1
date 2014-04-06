<%@page import="java.io.*,java.util.*,
com.twilio.sdk.TwilioRestClient,
com.twilio.sdk.TwilioRestException,
com.twilio.sdk.resource.factory.SmsFactory,
com.twilio.sdk.resource.instance.Sms,
com.twilio.sdk.resource.list.SmsList,
java.util.HashMap,
java.util.Map
"%>

<%! String ou=""; %>
<%
if(request.getParameter("mobileno") != null) {
	String mn = "+"+request.getParameter("mobileno");
	
	//String mobile = "+"+"601123064474";
	
	String msg = "This Message was sent from maniru.appsot.com/sms.jsp";
	ou = sendsms(mn, msg);

}
%>

<%! public String sendsms(String mobileno, String msg) {
	String rt="";
	try {
	TwilioRestClient client = new TwilioRestClient("AC0b56c1b6b1ff87e0caaf2c41ee5a7380", "c09e3ae21d61af8c9ad0f24a61c932ea");
	// Build a filter for the SmsList
			Map<String, String> params = new HashMap<String, String>();
			params.put("Body", msg);
			params.put("To", mobileno);
			params.put("From", "+14242851118");
			SmsFactory messageFactory = client.getAccount().getSmsFactory();
			Sms message = messageFactory.create(params);
			rt = message.getSid();
	} catch(Exception e) { rt="sendsms()"+e; }
	
	return rt;
}

%>

<% out.println("SMS Sending status is "+ou); %>