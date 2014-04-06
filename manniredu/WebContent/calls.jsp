<%@page import="java.io.*,java.util.*,
com.twilio.sdk.*,
java.util.HashMap,
java.util.Map
"%>

<%! String ou=""; %>
<%
if(request.getParameter("mobileno") != null) {
	String mn = "+"+request.getParameter("mobileno");
	
	//String mobile = "+"+"601123064474";
	
	String msg = "This Message was sent from maniru.appsot.com/sms.jsp";
///	ou = sendsms(mn, msg);

}
%>


<%! public static final String APIVERSION = "2010-04-01"; %>

<%

String AccountSid = "AC0b56c1b6b1ff87e0caaf2c41ee5a7380";
String AuthToken = "c09e3ae21d61af8c9ad0f24a61c932ea";
String CallerID = "+14242851118";
String ToCall = "+601123064474";
String Url="http://twimlets.com/message?Message%5B0%5D=Hello%20from%20my%20java%20application.&Message%5B1%5D=http%3A%2F%2Fcom.twilio.music.electronica.s3.amazonaws.com%2Fteru_-_110_Downtempo_Electronic_4.mp3";
TwilioRestClient client = new TwilioRestClient(AccountSid, AuthToken, null);
//build map of post parameters
Map params = new HashMap();
params.put("From", CallerID);
params.put("To", ToCall);
params.put("Url", Url);
TwilioRestResponse resp;
try { resp = client.request("/"+APIVERSION+"/Accounts/"+client.getAccountSid()+"/Calls", "POST", params);
	if(resp.isError())
System.out.println("Error making outgoing call: "+resp.getHttpStatus()+"n"+resp.getResponseText());
else { System.out.println(resp.getResponseText()); }
} catch (TwilioRestException e) { e.printStackTrace(); }




%>


<% out.println("SMS Sending status is "+ou); %>