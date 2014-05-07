<%@include file="header.jsp" %>
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
com.mannir.edu.Application,
com.mannir.edu.Reg,
java.sql.ResultSetMetaData"
%>
<%!public String grade(int grade) {
		String rt = "";
		if( grade >= 80 && grade <= 100 ) { rt ="A"; }

		else if( grade >= 75 && grade <= 79 )  { rt ="A-"; }
		else if( grade >= 70 && grade <= 74 )  { rt ="B+"; }
		else if( grade >= 65 && grade <= 69 )  { rt ="B"; }
		else if( grade >= 60 && grade <= 64 )  { rt ="B-"; }
		else if( grade >= 55 && grade <= 59 )  { rt ="C+"; }
		else if( grade >= 50 && grade <= 54 )  { rt ="C"; }
		else if( grade >= 45 && grade <= 49 )  { rt ="C-"; }
		else if( grade >= 40 && grade <= 44 )  { rt ="D"; }
		else rt = "F";		
		return rt;
	}
	%>
	<%!public double points(int grade) {
		double rt = 0;
		if( grade >= 80 && grade <= 100 ) { rt =4.00; }

		else if( grade >= 75 && grade <= 79 )  { rt =3.67; }
		else if( grade >= 70 && grade <= 74 )  { rt =3.33; }
		else if( grade >= 65 && grade <= 69 )  { rt =3.00; }
		else if( grade >= 60 && grade <= 64 )  { rt =2.67; }
		else if( grade >= 55 && grade <= 59 )  { rt =2.33; }
		else if( grade >= 50 && grade <= 54 )  { rt =2.00; }
		else if( grade >= 45 && grade <= 49 )  { rt =1.67; }
		else if( grade >= 40 && grade <= 44 )  { rt =1.33; }
		else rt = 0.00;		
		return rt;
	}
	%>
		<%!public double gp(int grade) {
		double rt = 0;
		if( grade >= 80 && grade <= 100 ) { rt =4.00; }

		else if( grade >= 75 && grade <= 79 )  { rt =3.67; }
		else if( grade >= 70 && grade <= 74 )  { rt =3.33; }
		else if( grade >= 65 && grade <= 69 )  { rt =3.00; }
		else if( grade >= 60 && grade <= 64 )  { rt =2.67; }
		else if( grade >= 55 && grade <= 59 )  { rt =2.33; }
		else if( grade >= 50 && grade <= 54 )  { rt =2.00; }
		else if( grade >= 45 && grade <= 49 )  { rt =1.67; }
		else if( grade >= 40 && grade <= 44 )  { rt =1.33; }
		else rt = 0.00;		
		return rt;
	}
	%>
<% if(request.getParameter("submit") != null) {
	String data1 = request.getParameter("data");
	String data = data1.replaceAll("null", "0");
	
	String[] dt = data.split("\r\n");
	
	for(String str: dt) {
		String[] st = str.split(" ");
		int uid = Integer.parseInt(st[0]);
		String code = st[1];
		int cw=Integer.parseInt(st[2]);
		int exam = Integer.parseInt(st[3]);
		String cw2 = cw+""; String ex2= exam+"";
		if(cw==0) { cw2=null; }
		if(exam==0) { ex2=null;}
		int tt = cw+exam;
		String gr = grade(tt);
		double pt = points(tt);
		//int cu = 
		
		Statement  stm = cn.createStatement();
		stm.execute("UPDATE reg SET ca="+cw2+", exam="+ex2+", total="+tt+", grade='"+gr+"', points="+pt+" WHERE appid="+uid+" AND code='"+code+"'");
		//System.out.println("updated!");
	}
	
	

}

%>
<td valign="top">
<h1 class="title">Exam Computation Algorihms</h1>
<form id="form1" method="post" action="">
  <p>
    <label for="data">Enter StudentID,  course, ca, exam per line<br />
    </label>
<textarea name="data" id="data" cols="45" rows="10">
<% 
Object oo[][] = db.getData("reg");
    		//System.out.println(oo[0].length);
for(int i=0;i<oo.length;i++) {
	out.println(oo[i][1]+" "+oo[i][4]+" "+oo[i][5]+" "+oo[i][6]);
	//for(int j=0;j<7;j++) { out.print(oo[i][j]+"\t"); }
	//out.println(oo[0][i]);
}

%>
</textarea>
    <br />
    <input type="submit" name="submit" id="submit" value="Submit" />
  </p>
</form></td>		
<%@include file="footer.jsp" %>