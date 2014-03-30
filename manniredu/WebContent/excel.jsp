<%@ page import="java.io.InputStream" %>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@ page contentType="application/vnd.ms-excel" %>
<%@ page import="java.io.*" %>
<%
  try {
 HSSFWorkbook wb = new HSSFWorkbook();
  HSSFSheet sheet1 = wb.createSheet("new sheet");
  HSSFSheet sheet2 = wb.createSheet("second sheet");
 HSSFSheet sheet3 = wb.createSheet("third sheet");
  HSSFSheet sheet4 = wb.createSheet("fourth sheet");
 HSSFSheet sheet5 = wb.createSheet("third sheet");
  HSSFSheet sheet6 = wb.createSheet("fifth sheet");
  FileOutputStream fileOut = new FileOutputStream("Excel.xls");
  wb.write(fileOut);
  fileOut.close();  
 out.println("Your file has been created succesfully");
  } catch ( Exception ex ) {
  
  } 
%>