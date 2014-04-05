package com.mannir.edu;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.net.InetAddress;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.derby.drda.NetworkServerControl;

public class Db {
	private static Connection cn = null;
	private String dbtype, dbhost, dbuser, dbpass, dbname;

	public static void main(String[] args) {
		//Db db = new Db("emb","localhost","admin","13131","manniredu");
		Db db = new Db("mysql","localhost","root","","manniredu");
		
		Object[][] oo = db.regData("registration");
				
		for(int a=0; a<oo.length; a++) {
		for(int i=0; i<oo[a].length; i++) { System.out.print(oo[a][i]+"\t"); }
		System.out.println();
		}
		

	}
	
	public void test4() {
		
		//System.out.println(db.getlastid("application"));
		
		//for(Registration rg : db.getAllRegistration()) { System.out.println(rg.getRid()); }
		
		
		
		//Application ap = (Application) db.get(new Application(), 3);
		//ap.setId(6);
		//ap.setFirstname("Mannir2");
		//db.update(ap);
		
		
		
		
		
		
		
		
		
		
		
		//Application ap = (Application) db.get(new Application(), 3);
		//System.out.println(ap.getFirstname());
		//System.out.println(ap.get("fullname"));
		
	}
	
	public void test3() {
		//for(Application ap : db.getAllApplication()) { System.out.println(ap.getId()); }
		//System.out.println(db.list("examtype"));
		/**
		Pin pin = new Pin();
		pin.setPin("9999999999");
		pin.setType("app");
		pin.setAmount(2000);
		db.save(pin);
		*/
		//Employee emp = new Employee();
		//HashMap emp = db.getEmp(49);
		//HashMap sal = db.getSal(49);
		//HashMap ded = db.getDed(49);
		//System.out.println(emp);
		//System.out.println(sal);
		//System.out.println(ded);
		
		//System.out.println(hm.get("BASIC"));
		/**
		Iterator it = hm.entrySet().iterator();
	    while (it.hasNext()) {
	        Map.Entry pairs = (Map.Entry)it.next();
	       //System.out.println(pairs.getKey() + " = " + pairs.getValue());
	        it.remove();
	    }
	    */
	}
	
	public void test2() {
		//Db db = new Db("emb","localhost","admin","13131","payrolldb");


		//System.out.println("m1:"+emp.getFirstname());
		//db.get(emp,3380);
		//System.out.println("m2:"+emp.getFirstname());
	}
	
	public void test1() {
		//Employee emp = new Employee();
		//emp.setId(1725);
		//db.get(emp);
		
		//Db db = new Db("net","admin","13131","payrolldb");
		//conn = db.connect();
		/**
		String[] cl = db.getColumns(conn, "EMPLOYEE");
		Object[][] data = db.getData("EMPLOYEE");
		Employee emp = db.getEmployee(1013);
		List<String> salcols = db.getSalaries(emp.getRank(), emp.getSteps(), "cols");
		List<String> salrows = db.getSalaries(emp.getRank(), emp.getSteps(), "rows");
		
		List<String> ddcols = db.getDeductions(emp.getEmpid(), "cols");
		List<String> ddrows = db.getDeductions(emp.getEmpid(), "rows");

		for(String st: ddcols) {
			System.out.println(st);
		}
		
		ArrayList<Integer> alist = new ArrayList<Integer>();
		alist.add(10);
		alist.add(22);
		alist.add(30);
		System.out.println(alist);
		
		double sum = 0;
		for(Integer integer : alist) {
			sum +=integer;
		}
		
		System.out.println(sum);
*/
		///Object[][] oo = Db.getSalaries("CPL","STEPS07");
		///System.out.println(oo[0][2]);
		///for(Object st: oo[0]) {
		///	System.out.println(st);
		//}
		
		/**
		System.out.println(data);
		
		for(String st: cl) {
			System.out.println("private String "+st.toLowerCase()+";");
		}
		*/
		
	}
	
	public Db(String dbtype,String dbhost, String dbuser, String dbpass, String dbname) {
		this.dbtype = dbtype;
		this.dbhost = dbhost;
		this.dbuser = dbuser;
		this.dbpass = dbpass;
		this.dbname = dbname;
		cn = this.connect();
	}
	
	public Connection connect() {
		if(dbtype.equals("emb")) {
			try{ Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
			cn = DriverManager.getConnection("jdbc:derby:"+dbname+";create=false;user="+dbuser+";password="+dbpass);
			}catch(Exception e){System.out.println(e); }
			System.out.println("connected to embedded database!");				
		}
		else if(dbtype.equals("net")) {
			try { NetworkServerControl server = new NetworkServerControl(InetAddress.getByName("localhost"),1527);
				server.start(null);
				System.out.println("JavaDB Server Started!");		
			} catch(Exception e) {System.out.println("Cannot Start DB Server!"+e); }
			
			try{ Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
				cn = DriverManager.getConnection("jdbc:derby://localhost:1527/"+dbname);
				}catch(Exception e){System.out.println(e); }
			System.out.println("connected to JavaDB Server");
		}
		else if(dbtype.equals("mysql")) {
		try { Class.forName("com.mysql.jdbc.Driver").newInstance();
			cn = DriverManager.getConnection("jdbc:mysql://"+dbhost+"/"+dbname, dbuser, dbpass);
			if(!cn.isClosed()) System.out.println("connected to Mysql");
		} catch (Exception e) { System.out.println(e); }
		}
		return cn;
	}
	
	public String[] getColumns(Connection cn, String tb) {
		String[] simpleArray = null;
		   try { Statement st = cn.createStatement(); 
		   	ResultSet rs = st.executeQuery("SELECT * FROM "+tb);
		     ResultSetMetaData md = rs.getMetaData();
		     int columns = md.getColumnCount();     
		     List<String> where = new ArrayList();
		     for (int i = 1; i <= columns; i++) {where.add(md.getColumnName(i)); }
		     simpleArray = new String[where.size()];
		     where.toArray(simpleArray);
		   }
		   catch (Exception e1) { System.out.println(e1); }
		   return simpleArray;
	}
	
	public static Object[][] getData(String tb) {
		Object[][] oo = null;
	
		try {
		Statement st2 = cn.createStatement();
		ResultSet r3 = st2.executeQuery("SELECT * FROM "+tb);
		ResultSetMetaData metaData = r3.getMetaData();
		int colCount = metaData.getColumnCount();
		ArrayList rows = new ArrayList();
		Object[] row = null;
		while (r3.next()) {
		row = new Object[colCount];
		for (int a = 0; a < colCount; a++) {
		row[a] = r3.getObject(a + 1);
		}
		rows.add(row);
		}
		oo = (Object[][])rows.toArray(new Object[0][0]);
		} catch(Exception e3) { System.out.println("getObjects()"+e3);
		
		}
		return oo;
	}
	
	public void runSql(Connection cn, String sql) {
		try {
		Statement st = cn.createStatement();
		st.execute(sql);
		System.out.println(sql);
		} catch(Exception e) { System.out.println(e); }
		
	}


	
	public static ArrayList<Application> getAllApplication() {
		ArrayList<Application> list = new ArrayList<Application>();		
		try { ResultSet rs = cn.createStatement().executeQuery("SELECT * FROM APPLICATION");
			while(rs.next()) {
				Application ap = new Application();
				ap.setId(Integer.parseInt(rs.getString("id")));
				ap.setPin(rs.getString("pin"));
				ap.setUsername(rs.getString("username"));
				ap.setPassword(rs.getString("password"));
				ap.setMobileno(rs.getString("mobileno"));
				ap.setEmail(rs.getString("email"));
				ap.setFirstname(rs.getString("firstname"));
				ap.setLastname(rs.getString("lastname"));
				ap.setGender(rs.getString("gender"));
				ap.setDob(rs.getString("dob"));
				ap.setPicture(rs.getString("picture"));
				ap.setAddress(rs.getString("address"));
				ap.setState(rs.getString("state"));
				ap.setCountry(rs.getString("country"));
				ap.setSchool(rs.getString("school"));
				ap.setExam(rs.getString("exam"));
				ap.setGrade(rs.getString("grade"));
				ap.setProgram(rs.getString("program"));
				ap.setAdmission(rs.getString("admission"));
				ap.setDateapp(rs.getString("dateapp"));
				list.add(ap);
			}
		} catch (SQLException ex) { System.err.println(ex.getMessage()); }
		return list;
	}
	
	public static ArrayList<Registration> getAllRegistration() {
		ArrayList<Registration> list = new ArrayList<Registration>();		
		try { ResultSet rs = cn.createStatement().executeQuery("SELECT * FROM REGISTRATION");
			while(rs.next()) {
				Registration rg = new Registration();
				rg.setRid(Integer.parseInt(rs.getString("rid")));
				rg.setAid(rs.getString("aid"));
				rg.setPin(rs.getString("pin"));
				rg.setCode(rs.getString("code"));
				rg.setLevel(rs.getString("level"));
				rg.setSemester(rs.getString("semester"));
				rg.setCw(rs.getString("cw"));
				rg.setExam(rs.getString("exam"));
				rg.setTotal(rs.getString("total"));
				rg.setGrade(rs.getString("grade"));
				rg.setPoint(rs.getString("point"));
				rg.setGp(rs.getString("gp"));
				rg.setRemarks(rs.getString("remarks"));
				rg.setDatereg(rs.getString("datereg"));
				list.add(rg);
			}
		} catch (Exception ex) { System.out.println(ex); }
		return list;
	}

	
	public void save(Object obj) {
		String tb = obj.getClass().getSimpleName().toLowerCase();
		try {
		Field[] fl = Class.forName(obj.getClass().getName()).getFields();
		//System.out.println(s.getName()); 
		StringBuffer sb = new StringBuffer();
		sb.append("INSERT INTO "+tb + "(");
		int n1=1;
		for(Field s : fl) { if(n1>1) { sb.append(s.getName()+","); }
			n1++;
		}
	
		sb.append(")");
		sb.deleteCharAt(sb.length()-2);
		sb.append(" VALUES(");
		for(int a=1;a<=n1-2;a++) { sb.append("?,"); }
		sb.deleteCharAt(sb.length()-1).toString();
		sb.append(")");
		
		String sql = sb.toString(); //"INSERT INTO "+tb + "(pin, type, amount) VALUES" + "(?,?,?)";
		System.out.println(sql);
		PreparedStatement ps = cn.prepareStatement(sql);
		
		int n=1;
		for(Field s : fl) {
			if(n>1) {
			String nm = s.getName();
			String vl = (String) s.get(obj);
			try {ps.setString(n-1, vl);} catch(Exception e1) { ps.setInt(n-1, 1);  System.out.println("db.save()"+e1); } 
			}
			n++;
		}


		ps .executeUpdate();	
		} catch(Exception e) { System.out.println(e); }
	}
	
	public void update(Object obj) {
		String tb = obj.getClass().getSimpleName().toLowerCase();
		try {
		Field[] fl = Class.forName(obj.getClass().getName()).getFields();
		//System.out.println(s.getName()); 
		StringBuffer sb = new StringBuffer();
		sb.append("UPDATE "+tb + " SET ");
		//System.out.println(obj.getClass().getDeclaredField("firstname").get(obj));
		int n1=1;
		for(Field f : fl) { if(n1>1) { sb.append(f.getName()+"='"+
				obj.getClass().getDeclaredField(f.getName()).get(obj)+"',"); }
			n1++;
		}
		sb.deleteCharAt(sb.length()-1).toString();
		sb.append(" WHERE id="+obj.getClass().getDeclaredField("id").get(obj));

		String sql = sb.toString(); //"INSERT INTO "+tb + "(pin, type, amount) VALUES" + "(?,?,?)";
		System.out.println(sql);
		int st = cn.createStatement().executeUpdate(sql);
		System.out.println(st+" Records updated!");
		} catch(Exception e) { System.out.println(e); }
	}
	
	public Object get(Object obj, int id) {
		String tb = obj.getClass().getSimpleName().toLowerCase();

		try {
			PreparedStatement ps = cn.prepareStatement("SELECT * FROM "+tb.toUpperCase()+" WHERE ID = ?");
			ps.setInt(1,id);
			ResultSet rs = ps.executeQuery();
			rs.next();
			
		Field[] fl = Class.forName(obj.getClass().getName()).getFields();
		for(Field f : fl) {
			//System.out.println(f.getName());
			if(f.getType().toString().equals("int")) { set(obj, f.getName(), rs.getInt(f.getName())); }
			else { set(obj, f.getName(), rs.getString(f.getName())); }
		}
		} catch(Exception e) { System.out.println(e); }
		return obj;
	}
	
	public static boolean set(Object object, String fieldName, Object fieldValue) {
	    Class<?> clazz = object.getClass();
	    while (clazz != null) {
	        try {
	            Field field = clazz.getDeclaredField(fieldName);
	            field.setAccessible(true);
	            field.set(object, fieldValue);
	            return true;
	        } catch (NoSuchFieldException e) {
	            clazz = clazz.getSuperclass();
	        } catch (Exception e) {
	            return false;
	        }
	    }
	    return false;
	}
	
	public ArrayList<String> list(String tb) {
		ArrayList<String> list = new ArrayList<String>();
		try { ResultSet rs = cn.createStatement().executeQuery("SELECT * FROM "+tb);
		while(rs.next()) { list.add(rs.getString(2)); }
		} catch(Exception e) { System.out.println(e); }
		return list;
		
	}
	public void query(Connection cn, String sql) {
		try {
		Statement st = cn.createStatement();
		st.execute(sql);
		System.out.println(sql);
		} catch(Exception e) { System.out.println(e); }
		
	}
	
	public void sop(Object obj) {
		String tb = obj.getClass().getSimpleName().toLowerCase();
		try {
		Field[] fl = Class.forName(obj.getClass().getName()).getFields();
		//System.out.println(s.getName()); 
		StringBuffer sb = new StringBuffer();
		sb.append("INSERT INTO "+tb + "(");
		int n1=1;
		for(Field s : fl) {
			System.out.println(s.getName()+"="+s.get(obj));
			//if(n1>1) { sb.append(s.getName()+","); }
//			/n1++;
		}
		/**
		sb.append(")");
		sb.deleteCharAt(sb.length()-2);
		sb.append(" VALUES(");
		for(int a=1;a<=n1-2;a++) { sb.append("?,"); }
		sb.deleteCharAt(sb.length()-1).toString();
		sb.append(")");
		
		String sql = sb.toString(); //"INSERT INTO "+tb + "(pin, type, amount) VALUES" + "(?,?,?)";
		System.out.println(sql);
		PreparedStatement ps = cn.prepareStatement(sql);
		
		int n=1;
		for(Field s : fl) {
			if(n>1) {
			String nm = s.getName();
			String vl = s.get(obj).toString();
			try {ps.setString(n-1, vl);} catch(Exception e1) { ps.setInt(n-1, 1);  System.out.println("db.save()"+e1); } 
			}
			n++;
		}


		ps .executeUpdate();
		*/
		} catch(Exception e) { System.out.println(e); }
	}
	
	public int getlastid(String tb) {
		int rt = 0;
		try { ResultSet rs = cn.createStatement().executeQuery("SELECT MAX(id) AS maxid FROM "+tb); rs.next();
			rt = Integer.parseInt(rs.getString("maxid"));
		
		} catch(Exception e) { System.out.println(e); }
		
		return rt;
	}
	
	public static Object[][] regData(String tb) {
		Object[][] oo = null;
	
		try {
		Statement st2 = cn.createStatement();
		ResultSet r3 = st2.executeQuery("SELECT * FROM "+tb);
		ResultSetMetaData metaData = r3.getMetaData();
		int colCount = metaData.getColumnCount();
		ArrayList rows = new ArrayList();
		Object[] row = null;
		while (r3.next()) {
		row = new Object[colCount];
		for (int a = 0; a < colCount-1; a++) {
		row[a] = r3.getObject(a + 1);
		}
		rows.add(row);
		}
		oo = (Object[][])rows.toArray(new Object[0][0]);
		} catch(Exception e3) { System.out.println("regData()"+e3);
		
		}
		return oo;
	}
	
}
