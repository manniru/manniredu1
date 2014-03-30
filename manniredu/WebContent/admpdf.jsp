<%@include file="manniredu.jsp" %>
<%@ page import="javax.servlet.http.*,
java.io.*,
java.util.*,
java.io.FileReader,
java.io.BufferedReader,
com.itextpdf.text.*,
com.itextpdf.text.Chunk,
com.itextpdf.text.DocumentException,
com.itextpdf.text.FontFactory,
com.itextpdf.text.Image,
com.itextpdf.text.PageSize,
com.itextpdf.text.Paragraph,
com.itextpdf.text.Phrase,
com.itextpdf.text.pdf.Barcode39,
com.itextpdf.text.pdf.PdfContentByte,
com.itextpdf.text.pdf.PdfWriter,
com.itextpdf.text.pdf.PdfPTable,
com.itextpdf.text.pdf.PdfPCell,
com.mannir.edu.Application,
com.mannir.edu.Db"
%><%! Application ap; %><%
if(request.getParameter("id") != null) {
	int id = Integer.parseInt(request.getParameter("id"));
	ap = (Application) db.get(new Application(), id);
	}

else { ap = (Application) db.get(new Application(), 1); }
%><% response.setContentType("application/pdf");
Document document = new Document(PageSize.A4, 20f, 20f, 20f, 20f);     
try{ ByteArrayOutputStream buffer = new ByteArrayOutputStream();
PdfWriter.getInstance(document, buffer); 
document.open();

Image logo = Image.getInstance(getServletContext().getRealPath("/images/logo.png"));
logo.setAbsolutePosition(20f, 735f);
logo.scaleAbsolute(80f, 90f);

Image photo = Image.getInstance(getServletContext().getRealPath("/images/nopic.jpg"));
photo.setAbsolutePosition(490f, 735f);
photo.scaleAbsolute(80f, 90f);

Paragraph p1 = new Paragraph("",FontFactory.getFont(FontFactory.HELVETICA_BOLD, 18));
p1.add("MANNIR CLOUD EUDCATION SYSTEM");
p1.add(Chunk.NEWLINE);
p1.add("KANO, KANO STATE");
p1.add(Chunk.NEWLINE);
p1.add(" ");
p1.add("ONLINE ADMISSION LETTER");
p1.setAlignment(Element.ALIGN_CENTER);
p1.add(Chunk.NEWLINE);
p1.add(" ");

Paragraph tt1 = new Paragraph("APPLICATION INFORMATION",FontFactory.getFont(FontFactory.HELVETICA_BOLD, 16));
tt1.setAlignment(Element.ALIGN_CENTER);
PdfPTable tb1 = new PdfPTable(2);
// for(int i=1;i<=20;i++) { tb1.addCell(new PdfPCell(new Paragraph(rs.getString(i)))); }
tb1.addCell(new PdfPCell(new Phrase("Application ID: " + ap.getId())));
tb1.addCell(new PdfPCell(new Phrase("PIN Number: " + ap.getPin())));
tb1.addCell(new PdfPCell(new Phrase("Username: " + ap.getUsername())));
tb1.addCell(new PdfPCell(new Phrase("Password: " + ap.getPassword())));
tb1.addCell(new PdfPCell(new Phrase("Mobile No: " + ap.getMobileno())));
tb1.addCell(new PdfPCell(new Phrase("Email: " + ap.getEmail())));
tb1.addCell(new PdfPCell(new Phrase("Fullname: " + ap.getFirstname())));
tb1.addCell(new PdfPCell(new Phrase("Gender: " + ap.getGender())));
tb1.addCell(new PdfPCell(new Phrase("Date of Birth: " + ap.getDob())));
tb1.addCell(new PdfPCell(new Phrase("Picture Name: " + ap.getPicture())));    
tb1.addCell(new PdfPCell(new Phrase("Address: " + ap.getAddress())));    
tb1.addCell(new PdfPCell(new Phrase("Country: " + ap.getCountry())));    
tb1.addCell(new PdfPCell(new Phrase("School: " + ap.getSchool())));    
tb1.addCell(new PdfPCell(new Phrase("Final Exam: " + ap.getExam())));   
tb1.addCell(new PdfPCell(new Phrase("Grade: " + ap.getGrade())));    
tb1.addCell(new PdfPCell(new Phrase("Program Applied:" + ap.getProgram())));    
tb1.addCell(new PdfPCell(new Phrase("Admission Status:" + ap.getAdmission())));
tb1.addCell(new PdfPCell(new Phrase("Application Date: " + ap.getDateapp())));
tb1.setWidthPercentage(100f);

document.add(logo);
document.add(p1);
document.add(photo);
document.add(tt1);
document.add(new Paragraph(" ",FontFactory.getFont(FontFactory.HELVETICA_BOLD, 18)));
document.add(tb1);
document.close(); 

DataOutput dataOutput = new DataOutputStream(response.getOutputStream());
byte[] bytes = buffer.toByteArray();
response.setContentLength(bytes.length);
for(int i = 0; i < bytes.length; i++) { dataOutput.writeByte(bytes[i]); }

} catch(DocumentException e){ e.printStackTrace(); }
//} else { out.println("You have to submit Registration No!"); }

//}
//System.out.println("manniru="+course("GNS111","title"));


%><%!
/**
public String course(String cd, String cl) {
	String tt="", code="", title="", cu="";
	String rt="";
	try {
	
    BufferedReader reader = new BufferedReader(new FileReader("agpcloud/_courses.txt"));
    StringBuilder sb = new StringBuilder();
    String line;

    while((line = reader.readLine())!= null){
    	int t1 = line.indexOf("\t");
    	int t2 = line.indexOf("\t", t1+1);
    	int t3 = line.indexOf("\t", t2+1);
    	int t4 = line.indexOf("\t", t3+1);
    	code = line.substring(t1, t2).trim();
    	title = line.substring(t2, t3).trim();
    	cu = line.substring(t3, t4).trim();
    	if(code.equals(cd) && cl.equals("title")) { rt = title; }
    	if(code.equals(cd) && cl.equals("cu")) { rt = cu; }
    	///if(cd.equals(t1)) { rt=title; }
    	//System.out.println(line);
    	//System.out.println(code);
        ///sb.append(line+"\n");
    }
    
    ///System.out.println(sb.toString());
	} catch(Exception e5) { }
	//if(cl.equals("title")) { rt = tt; }
	
	return rt;
	
}
*/
%>