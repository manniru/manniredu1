<%@page import="javax.servlet.http.*,
com.mannir.edu.Db,
com.mannir.edu.Pin,
com.google.appengine.api.utils.SystemProperty,
java.sql.*,
com.google.appengine.api.datastore.DatastoreService,
com.google.appengine.api.datastore.DatastoreServiceFactory,
com.google.appengine.api.datastore.Entity,
java.util.*"
%><%! public Connection cn = null; %><% if (SystemProperty.environment.value() == SystemProperty.Environment.Value.Development ||
SystemProperty.environment.value() == SystemProperty.Environment.Value.Production) {
	out.println("App Engnine");
	DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
	Entity e = new Entity("pin");
	e.setProperty("pin", "9999999999");
	e.setProperty("type", "reg");
	e.setProperty("amount", 2000);
	e.setProperty("status", 0);
	ds.put(e);
	out.println("Record added to Datastore!");
}


else {
	out.println("Running on Embedded Jetty");
	Db db = new Db("mysql","localhost","root","","manniredu");
	cn = db.connect();

	Pin pin = new Pin();
	pin.setPin("9999999999");
	pin.setType("reg");
	pin.setAmount(2000);
	pin.setUid(0);

	db.save(pin);
	out.println("Record added to mysql!");
	}


%>