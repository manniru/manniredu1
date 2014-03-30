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
com.mannir.edu.Db,
com.mannir.edu.Pin,
java.sql.ResultSetMetaData"
%><%! public Connection cn = null; %><%

Db db = new Db("mysql","localhost","root","","manniredu");
cn = db.connect();

Pin pin = new Pin();
pin.setPin("9999999999");
pin.setType("app");
pin.setAmount(2000);
pin.setUid(0);

db.save(pin);
out.println("Record added to mysql!");

%>