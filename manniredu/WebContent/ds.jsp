<%@
page import="javax.servlet.http.*,
com.google.appengine.api.datastore.DatastoreService,
com.google.appengine.api.datastore.DatastoreServiceFactory,
com.google.appengine.api.datastore.Entity,
java.util.Date"
%><%

DatastoreService ds = DatastoreServiceFactory.getDatastoreService();

Entity e = new Entity("pin");
e.setProperty("pin", "9999999999");
e.setProperty("type", "app");
e.setProperty("amount", 2000);
e.setProperty("status", 0);
ds.put(e);
out.println("Record added to Datastore!");
//Date hireDate = new Date();
//employee.setProperty("hireDate", hireDate);
//employee.setProperty("attendedHrTraining", true);




%>