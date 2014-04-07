package com.mannir;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.TwilioRestResponse;
import com.twilio.sdk.resource.factory.SmsFactory;
import com.twilio.sdk.resource.instance.Sms;

public class SmsVoice {

	public static void main(String[] args) throws UnsupportedEncodingException {
		SmsVoice sms = new SmsVoice();
		//String status = sms.send("601123064474", "Mannir SmsVoice Java Class");
		SmsVoice call = new SmsVoice();
		call.call("601123064474", "Thank you for calling Mannir eSystems Limited");
	}

	public String send(String mobileno, String msg) {
		String rt="";
		try {
		TwilioRestClient client = new TwilioRestClient("AC0b56c1b6b1ff87e0caaf2c41ee5a7380", "c09e3ae21d61af8c9ad0f24a61c932ea");
		// Build a filter for the SmsList
				Map<String, String> params = new HashMap<String, String>();
				params.put("Body", msg);
				params.put("To", "+"+mobileno);
				params.put("From", "+14242851118");
				SmsFactory messageFactory = client.getAccount().getSmsFactory();
				Sms message = messageFactory.create(params);
				rt = message.getSid();
		} catch(Exception e) { rt="sendsms()"+e; }
		
		return rt;		
	}
	
	public void call(String mobileno, String message) {
		String AccountSid = "AC0b56c1b6b1ff87e0caaf2c41ee5a7380";
		String AuthToken = "c09e3ae21d61af8c9ad0f24a61c932ea";
		String CallerID = "+14242851118";
		String ToCall = "+" + mobileno;
		String msg = message.replaceAll(" ", "%20");
		String Url="http://twimlets.com/message?Message%5B0%5D="+msg;
		TwilioRestClient client = new TwilioRestClient(AccountSid, AuthToken, null);
		//build map of post parameters
		Map params = new HashMap();
		params.put("From", CallerID);
		params.put("To", ToCall);
		params.put("Url", Url);
		TwilioRestResponse resp;
		try { resp = client.request("/2010-04-01/Accounts/"+client.getAccountSid()+"/Calls", "POST", params);
			if(resp.isError())
		System.out.println("Error making outgoing call: "+resp.getHttpStatus()+"n"+resp.getResponseText());
		else { System.out.println(resp.getResponseText()); }
		} catch (TwilioRestException e) { e.printStackTrace(); }
	}

}
