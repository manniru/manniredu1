package com.mannir.snippets;

import java.util.List;
import java.util.Map;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
 
public class ExcelBuilder{
 
    protected void buildExcelDocument() {
    	/**
            WritableWorkbook workbook;
         
        // get data model which is passed by the Spring container
        List<Book> listBooks = (List<Book>) model.get("listBooks");
         
        // create a new Excel sheet
        WritableSheet sheet = workbook.createSheet("Java Books", 0);
         
        // create header row
        sheet.addCell(new Label(0, 0, "Book Title"));
        sheet.addCell(new Label(1, 0, "Author"));
        sheet.addCell(new Label(2, 0, "ISBN"));
        sheet.addCell(new Label(3, 0, "Published Date"));
        sheet.addCell(new Label(4, 0, "Price"));
         
        // create data rows
        int rowCount = 1;
         
        for (Book aBook : listBooks) {
            sheet.addCell(new Label(0, rowCount, aBook.getTitle()));
            sheet.addCell(new Label(1, rowCount, aBook.getAuthor()));
            sheet.addCell(new Label(2, rowCount, aBook.getIsbn()));
            sheet.addCell(new Label(3, rowCount, aBook.getPublishedDate()));
            sheet.addCell(new jxl.write.Number(4, rowCount, aBook.getPrice()));
             
            rowCount++;
        }
    }
    
    public class Book {
    	
    }
  */  
    }
}