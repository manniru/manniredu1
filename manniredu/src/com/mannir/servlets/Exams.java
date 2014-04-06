package com.mannir.servlets;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;

import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.mannir.edu.Db;
import com.mannir.edu.Examrecords;
import com.mannir.edu.Registration;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.PrintSetup;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class Exams extends HttpServlet {
	public String id="", uid="", pincode="", regno="", password="", mobileno="", fullname="", school="", department="", programme="", session="", courses1="", courses2="", bankname="", tellerno="", amount="", datereg="", mail="", created="", filename="";
	private Connection cn;
	
	public static void main(String[] args) {

	}
	
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "attachment; filename=ExamResults.xlsx");
        
        XSSFWorkbook wb = new XSSFWorkbook();
		XSSFSheet sh = wb.createSheet("ExamResults");
		Map<String, Object[]> data = new HashMap<String, Object[]>();
		data.put("1", new Object[] {"Reg No.", "Fullname", "Course", "CU", "CA", "Exam", "Total", "Grade", "Point", "GP", "Remarks"});
        
    	DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
    	
    	boolean isMultipart = ServletFileUpload.isMultipartContent(request);
    	
    	// Create a new file upload handler
    	ServletFileUpload upload = new ServletFileUpload();

    	// Parse the request
    	
    	try {
    	FileItemIterator iter = upload.getItemIterator(request);
    	while (iter.hasNext()) {
    	    FileItemStream item = iter.next();
    	    String name = item.getFieldName();
    	    InputStream stream = item.openStream();
    	    if (item.isFormField()) {
    	        System.out.println("Form field " + name + " with value "
    	            + Streams.asString(stream) + " detected.");
    	    } else {
    	        System.out.println("File field " + name + " with file name "
    	            + item.getName() + " detected.");
    	        // Process the input stream
    	        
    			try {
    				//DatastoreService ds = DatastoreServiceFactory.getDatastoreService();  
    			    //FileInputStream file = new FileInputStream(new File("exams.xls"));
    			     
    			    //Get the workbook instance for XLS file 
    			    HSSFWorkbook workbook = new HSSFWorkbook(stream);
    			 
    			    //Get first sheet from the workbook
    			    HSSFSheet sheet = workbook.getSheetAt(0);
    			     
    			    //Iterate through each rows from first sheet
    			    Iterator<Row> rowIterator = sheet.iterator();
    			    
    		
    			    int a=2;
    			    while(rowIterator.hasNext()) {
    			    	
    			    	
    			        Row row = rowIterator.next();
    			        
    			        if(row.getRowNum()>0) {
    			        	
            			String fn = row.getCell(0).toString();
            		    String rn = row.getCell(1).toString();
        			    String cs = row.getCell(2).toString();
        			    int cu = Integer.parseInt(row.getCell(3).toString());   			        
    			        int ca = Integer.parseInt(row.getCell(4).toString());
    			        int ex = Integer.parseInt(row.getCell(5).toString());

    			        
    			        int tt = Integer.parseInt(gd("tt",cu, ca,ex));
    			        String gr = gd("gr",cu, ca,ex);
    			        double pt = Double.parseDouble(gd("pt",cu, ca,ex));
    			        double gp = Double.parseDouble(gd("gp",cu, ca,ex));
    			        String rm = gd("rm", cu, ca,ex);
    			        
    			        Entity e1 = new Entity("EXAMS");
    			        e1.setProperty("regno",rn);
    			        e1.setProperty("course",cs);
    			        e1.setProperty("cu",cu);
    			        e1.setProperty("ca",ca);
    			        e1.setProperty("exam",ex);
    			        e1.setProperty("total",tt);
    			        e1.setProperty("grade",gr);
    			        e1.setProperty("point",pt);
    			        e1.setProperty("gp",gp);
    			        e1.setProperty("remarks",rm);
    			        e1.setProperty("fullname",fn);

    			        ds.put(e1);
    			        
    			      	 data.put(a+"", new Object[] {fn, rn, cs, cu+"", ca+"", ex+"", tt+"", gr, pt, gp, rm});

    			        
    			       a++;
    			        
    			        }
    			       // System.out.println(row.getCell(0)+"=="+row.getCell(1));
    			         
    			        //For each row, iterate through each columns
    			      ///  Iterator<Cell> cellIterator = row.cellIterator();
    			      ///  while(cellIterator.hasNext()) {
    			             
    			         // /  Cell cell = cellIterator.next();
    			             

    			            /**
    			            switch(cell.getCellType()) {
    			                case Cell.CELL_TYPE_BOOLEAN:
    			                    System.out.print(cell.getBooleanCellValue() + "\t\t");
    			                    break;
    			                case Cell.CELL_TYPE_NUMERIC:
    			                    System.out.print(cell.getNumericCellValue() + "\t\t");
    			                    break;
    			                case Cell.CELL_TYPE_STRING:
    			                    System.out.print(cell.getStringCellValue() + "\t\t");
    			                    break;
    			            }
    			            */
    			        }
    			    
    			        System.out.println("");
    			  ///  }
    			    //file.close();
    			   // FileOutputStream out =  new FileOutputStream(new File("test.xls"));
    			  //  workbook.write(out);
    			    //out.close();
    			     
} catch (FileNotFoundException e) { e.printStackTrace(); } catch (IOException e) { e.printStackTrace();	} 	        
     
}}} catch(Exception e1) { System.out.println(e1);  }	
    	

/**
        // create a workbook , worksheet
        Workbook wb = new HSSFWorkbook();
        Sheet sheet = wb.createSheet("ExamResults");
        CreationHelper createHelper = wb.getCreationHelper();

        // Create a row and put some cells in it. Rows are 0 based.
        Row row = sheet.createRow((short)0);
        Cell cell = row.createCell(0);
        cell.setCellValue(1);
        row.createCell(1).setCellValue(1.2);
        row.createCell(2).setCellValue( createHelper.createRichTextString("This is a string") );
        row.createCell(3).setCellValue(true);

        //write workbook to outputstream
        ServletOutputStream out = response.getOutputStream();
        wb.write(out);
        out.flush();
        out.close();   	
 */
    	 
    	 
		Set<String> keyset = data.keySet();
		int rownum = 0;
		for (String key : keyset) {
		    Row row = sh.createRow(rownum++);
		    Object [] objArr = data.get(key);
		    int cellnum = 0;
		    for (Object obj : objArr) {
		        Cell cell = row.createCell(cellnum++);
		        if(obj instanceof Date) cell.setCellValue((Date)obj);
		        else if(obj instanceof Boolean) cell.setCellValue((Boolean)obj);
		        else if(obj instanceof String)  cell.setCellValue((String)obj);
		        else if(obj instanceof Double) cell.setCellValue((Double)obj);
		    }
		}
		 
		try {
			
		   // FileOutputStream out = new FileOutputStream(new File("new.xls"));
		   // wb.write(out);
		  //  out.close();
		    
	        ServletOutputStream out = response.getOutputStream();
	        wb.write(out);
	        out.flush();
	        out.close(); 
	        
		    System.out.println("Excel written successfully..");
		     
		} catch (FileNotFoundException e) {
		    e.printStackTrace();
		} catch (IOException e) {
		    e.printStackTrace();
		}   	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("Hi");
    	
    	response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "attachment; filename=ExamResults.xlsx");
        
////////////////////////////////////////////////////////
    	String[] titles = {"SN", "Student ID",	"Student Name", "Programme", "Level", "Semester", "Module", "Units", "CW", "EXAM"}; 	
    	Db db = new Db("mysql","localhost","root","","manniredu");
    	Object[][]  sample_data = db.regData("registration");
        Workbook wb;
        //if(args.length > 0 && args[0].equals("-xls")) 
        	//wb = new HSSFWorkbook();else 
        wb = new XSSFWorkbook();
        Map<String, CellStyle> styles = createStyles(wb);
        Sheet sheet = wb.createSheet("Examsheet");
        PrintSetup printSetup = sheet.getPrintSetup();
        printSetup.setLandscape(true);
        sheet.setFitToPage(true);
        sheet.setHorizontallyCenter(true);

        //title row
        Row titleRow = sheet.createRow(0);
        titleRow.setHeightInPoints(30);
        Cell titleCell = titleRow.createCell(0);
        titleCell.setCellValue("Student Examination Records Sheet");
        titleCell.setCellStyle(styles.get("title"));
        sheet.addMergedRegion(CellRangeAddress.valueOf("$A$1:$J$1"));

        //header row
        Row headerRow = sheet.createRow(1);
        headerRow.setHeightInPoints(20);
        Cell headerCell;
        for (int i = 0; i < titles.length; i++) {
            headerCell = headerRow.createCell(i);
            headerCell.setCellValue(titles[i]);
            headerCell.setCellStyle(styles.get("header"));
        }

        int rownum = 2;
        for (int i = 0; i < 10; i++) {
            Row row = sheet.createRow(rownum++);
            for (int j = 0; j < titles.length; j++) {
                Cell cell = row.createCell(j);
             
                    cell.setCellStyle(styles.get("cell"));
                
            }
        }



        //set sample data
        for (int i = 0; i < sample_data.length; i++) {
            Row row = sheet.getRow(2 + i);
            for (int j = 0; j < sample_data[i].length; j++) {
                if(sample_data[i][j] == null) continue;

                if(sample_data[i][j] instanceof String) { row.getCell(j).setCellValue((String)sample_data[i][j]); } 
                else { try { row.getCell(j).setCellValue((Double)sample_data[i][j]); }
                		catch(Exception e) { row.getCell(j).setCellValue((Integer)sample_data[i][j]); }
                	}
            }
        }

        //finally set column widths, the width is measured in units of 1/256th of a character width
        sheet.setColumnWidth(0, 5*256); //30 characters wide
        sheet.setColumnWidth(1, 20*256); //30 characters wide
        sheet.setColumnWidth(2, 30*256); //30 characters wide
        sheet.setColumnWidth(3, 20*256); //30 characters wide
        sheet.setColumnWidth(4, 10*256); //30 characters wide
        sheet.setColumnWidth(5, 10*256); //30 characters wide
        //for (int i = 4; i < 9; i++) { sheet.setColumnWidth(i, 6*256); }
        sheet.setColumnWidth(10, 10*256); //10 characters wide

        // Write the output to a file
        String file = "Examrecord.xls";
        if(wb instanceof XSSFWorkbook) file += "x";
       
        //try { FileOutputStream out = new FileOutputStream(file); wb.write(out); out.close(); } catch(Exception e) { System.out.println(e); }
//////////////////////////////////////////////////////////
		try {
			// FileOutputStream out = new FileOutputStream(new File("new.xls"));
		    // wb.write(out); out.close();		    
	        ServletOutputStream out = response.getOutputStream();
	        wb.write(out);	out.flush();	out.close();    
		    System.out.println("Excel written successfully..");	    
		} catch(Exception e) { System.out.println(e); }


    }

    public String gd(String type, int cu, int ca, int ex) {
    	String rt = null;
    	int tt = (ca+ex);
    	String gr = null;
    	double pt;
    	double gp;
    	String rm;  	
    	
    	int marks = tt;

        	if (marks >= 70) {gr="A"; pt =4.0; gp = pt*cu; rm = "DISTINCTION";} 
        else if (marks >= 60) {gr="B"; pt =3.0; gp = pt*cu; rm = "CREDIT";} 
        else if (marks >= 50) {gr="C"; pt =3.0; gp = pt*cu; rm = "VERY GOOD";} 
        else if (marks >= 45) {gr="D"; pt =2.0; gp = pt*cu; rm = "GOOD";} 
        else if (marks >= 40) {gr="E"; pt =1.0; gp = pt*cu; rm = "PASS";} 
        				else  {gr="F"; pt =0.0; gp = pt*cu; rm = "C/O"; }

    	
    	

    	switch(type) {
		case "tt":  rt = tt+""; break;
		case "gr": rt = gr; break;			
		case "pt": rt = pt+""; break;
		case "gp": rt = gp+""; break;
		case "rm": rt = rm; break;
		
    	}

    	return rt;
    }
    
    public String course(String cd, String tp) {
    	String vl = null;
    	try {
    	ResultSet r = cn.createStatement().executeQuery("SELECT * FROM COURSES WHERE CODE='"+cd+"'"); r.next();
    	vl = r.getString(tp);
    	} catch (Exception e3) {System.out.println(e3); }
    	return vl;
    }
    
    private static Map<String, CellStyle> createStyles(Workbook wb){
        Map<String, CellStyle> styles = new HashMap<String, CellStyle>();
        CellStyle style;
        Font titleFont = wb.createFont();
        titleFont.setFontHeightInPoints((short)18);
        titleFont.setBoldweight(Font.BOLDWEIGHT_BOLD);
        style = wb.createCellStyle();
        style.setAlignment(CellStyle.ALIGN_CENTER);
        style.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
        style.setFont(titleFont);
        styles.put("title", style);

        Font monthFont = wb.createFont();
        monthFont.setFontHeightInPoints((short)11);
        monthFont.setColor(IndexedColors.WHITE.getIndex());
        style = wb.createCellStyle();
        style.setAlignment(CellStyle.ALIGN_CENTER);
        style.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
        style.setFillForegroundColor(IndexedColors.GREY_50_PERCENT.getIndex());
        style.setFillPattern(CellStyle.SOLID_FOREGROUND);
        style.setFont(monthFont);
        style.setWrapText(true);
        styles.put("header", style);

        style = wb.createCellStyle();
        style.setAlignment(CellStyle.ALIGN_CENTER);
        style.setWrapText(true);
        style.setBorderRight(CellStyle.BORDER_THIN);
        style.setRightBorderColor(IndexedColors.BLACK.getIndex());
        style.setBorderLeft(CellStyle.BORDER_THIN);
        style.setLeftBorderColor(IndexedColors.BLACK.getIndex());
        style.setBorderTop(CellStyle.BORDER_THIN);
        style.setTopBorderColor(IndexedColors.BLACK.getIndex());
        style.setBorderBottom(CellStyle.BORDER_THIN);
        style.setBottomBorderColor(IndexedColors.BLACK.getIndex());
        styles.put("cell", style);

        style = wb.createCellStyle();
        style.setAlignment(CellStyle.ALIGN_CENTER);
        style.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
        style.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
        style.setFillPattern(CellStyle.SOLID_FOREGROUND);
        style.setDataFormat(wb.createDataFormat().getFormat("0.00"));
        styles.put("formula", style);

        style = wb.createCellStyle();
        style.setAlignment(CellStyle.ALIGN_CENTER);
        style.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
        style.setFillForegroundColor(IndexedColors.GREY_40_PERCENT.getIndex());
        style.setFillPattern(CellStyle.SOLID_FOREGROUND);
        style.setDataFormat(wb.createDataFormat().getFormat("0.00"));
        styles.put("formula_2", style);

        return styles;
    }
}