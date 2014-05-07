package com.mannir.edu;

import java.sql.Connection;
import java.sql.ResultSet;

public class Reg {
	public int id;
	public int appid;
	public int level;
	public int semester;
	public String code;
	public String title;
	public Connection cn = null;
	public String sname;
	public int ca;
	public int exam;
	public int total;
	public String grade;
	public double points;
	public double gp;
	public String remarks;
	
	public Reg() {
		Db db = new Db("mysql","localhost","root","","manniredu");
		cn = db.connect();
		
	}
	
	public String getTitle(String code) {
		String rt = "";
		try { ResultSet rs = cn.createStatement().executeQuery("SELECT * FROM courses WHERE code = '"+code+"'"); rs.next();
			rt = rs.getString("title");
		
		} catch(Exception e) { System.out.println(e); }
		
		return rt;
	}
	
	public String getSname(int uid) {
		String rt = "";
		try { ResultSet rs = cn.createStatement().executeQuery("SELECT CONCAT(firstname,\" \", lastname) AS fullname FROM application WHERE id="+uid); rs.next();
			rt = rs.getString("fullname");
		
		} catch(Exception e) { System.out.println(e); }
		
		return rt;
	}
	
	public String getCu(String code) {
		String rt = "";
		try { ResultSet rs = cn.createStatement().executeQuery("SELECT * FROM courses WHERE code='"+code+"'"); rs.next();
			rt = rs.getString("cu");
		
		} catch(Exception e) { System.out.println(e); }
		
		return rt;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getAppid() {
		return appid;
	}

	public void setAppid(int appid) {
		this.appid = appid;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int getSemester() {
		return semester;
	}

	public void setSemester(int semester) {
		this.semester = semester;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Connection getCn() {
		return cn;
	}

	public void setCn(Connection cn) {
		this.cn = cn;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public int getCa() {
		return ca;
	}

	public void setCa(int ca) {
		this.ca = ca;
	}

	public int getExam() {
		return exam;
	}

	public void setExam(int exam) {
		this.exam = exam;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public double getPoints() {
		return points;
	}

	public void setPoints(double points) {
		this.points = points;
	}

	public double getGp() {
		return gp;
	}

	public void setGp(double gp) {
		this.gp = gp;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}



}
