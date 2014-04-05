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
java.sql.ResultSetMetaData,
java.util.Date,
java.text.DateFormat,
java.text.SimpleDateFormat
"
%>
<%! int uid=0; public Db db = new Db("mysql","localhost","root","","manniredu");
public Connection cn = db.connect();

DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
Date date = new Date();
public String cdate = dateFormat.format(date);
%>

<%! public int getId(String tb) {
	int nextid = 0;
	try { Statement st = cn.createStatement();
	ResultSet rs = st.executeQuery("SELECT MAX(id)+1 as nextid FROM "+tb); rs.next();
	nextid = Integer.parseInt(rs.getString("nextid"));
	} catch(Exception e) { System.out.println(e); }
	return nextid;
}

public int getAdm(int uid) {
	int adm = 0;
	try { Statement st = cn.createStatement();
	ResultSet rs = st.executeQuery("SELECT admission FROM users WHERE uid="+uid); rs.next();
	adm = Integer.parseInt(rs.getString("admission"));
	} catch(Exception e) {}
	return uid;
}


%>

<% if(session.getAttribute("uid")!=null) {
	try { uid = Integer.parseInt(session.getAttribute("uid").toString()); } catch(Exception e) { System.out.println(e); }
}
%>
