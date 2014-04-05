package com.mannir.edu;

import org.apache.poi.xssf.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import java.util.Map;
import java.util.HashMap;
import java.io.FileOutputStream;

public class Examrecords {
    private static final String[] titles = {
            "SN", "Student ID",	"Student Name", "Programme", "Level", "Semester", "Module", "Units", "CW", "EXAM"};

    private static Object[][] sample_data2 = {
            {"1", "u1131819", "MUHAMMAD MANNIR AHMAD", "BSE", 1, "A", "SD3048", 28, null, null},
            {"2", "u1012923", "ZAHRAU SHARU MAIGARI", "BSE", 1, "A", "SD3048", 17, null, null},
            {"3", "U1132933", "JAHARA FERAS MACARABON", "BIS", 1, "A", "SD3048", 32, null, null},
    };
    
    private static Object[][] sample_data = null;

    public static void main(String[] args) throws Exception {
    	Db db = new Db("mysql","localhost","root","","manniredu");
    	sample_data = db.regData("registration");
		
        Workbook wb;
        if(args.length > 0 && args[0].equals("-xls")) wb = new HSSFWorkbook();
        else wb = new XSSFWorkbook();
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
        FileOutputStream out = new FileOutputStream(file);
        wb.write(out);
        out.close();
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