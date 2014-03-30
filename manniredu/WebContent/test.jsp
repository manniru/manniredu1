<%@page import="javax.servlet.http.*,
com.mannir.edu.Db,
com.mannir.edu.Pin,
com.google.appengine.api.utils.SystemProperty,
java.util.*"
%><% if (SystemProperty.environment.value() == SystemProperty.Environment.Value.Development) {
	out.println("App Engnine Development");
}

else if (SystemProperty.environment.value() == SystemProperty.Environment.Value.Production) {
	out.println("App Engnine Production");
}

else {
	out.println("Running on Embedded Jetty");
	}


%>