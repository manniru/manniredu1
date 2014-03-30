package com.mannir.excel;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;

public class ExcelWrite
{
	public static void main(String args[])
	{
		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFSheet sheet = 
			workbook.createSheet("Sample sheet");
		TreeMap<String, Object[]> data = 
			new TreeMap<String, Object[]>();
		data.put("1", new Object[] 
			{"Emp No.", "Name", "Salary"});
		data.put("2", new Object[] 
			{1d, "shalabh", 1500000.00d});
		data.put("3", new Object[] 
			{2d, "yutika", 800000.00d});
		data.put("4", new Object[] 
			{3d, "john", 700000.09d});
		data.put("5", new Object[]
			{4d, "harry", 788884d});
		Set<String> keyset = data.keySet();
		int rownum = 0;
		for (String key : keyset) 
		{
			Row row = sheet.createRow(rownum++);
			Object [] objArr = data.get(key);
			int cellnum = 0;
			for (Object obj : objArr) 
			{
				Cell cell = row.createCell(cellnum++);
				if(obj instanceof Date)
				cell.setCellValue((Date)obj);
				else if(obj instanceof Boolean)
				cell.setCellValue((Boolean)obj);
				else if(obj instanceof String)
				cell.setCellValue((String)obj);
				else if(obj instanceof Double)
				cell.setCellValue((Double)obj);
			}
		}
		try 
		{
			FileOutputStream out =
			new FileOutputStream
				(new File("Mannir.xls"));
			workbook.write(out);
			out.close();
			System.out.println
				("Excel written successfully..");
		} 
		catch (FileNotFoundException e) 
		{
			e.printStackTrace();
		} 
		catch (IOException e) 
		{
			e.printStackTrace();
		}
	}
}
