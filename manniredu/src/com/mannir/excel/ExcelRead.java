package com.mannir.excel;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Iterator;
import java.util.Vector;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

public class ExcelRead 
{
	public ExcelRead() 
	{}
		public static void main(String[] args)
			throws FileNotFoundException,IOException 
		{
			Vector cellVectorHolder = new Vector();
			FileInputStream myInput = new 
				FileInputStream("Mannir.xls");
			/** Create a POIFSFileSystem object**/
			
			POIFSFileSystem myFileSystem = new
				POIFSFileSystem(myInput);
			/** Create a workbook using the File System**/
			
			HSSFWorkbook myWorkBook = new
				HSSFWorkbook(myFileSystem);
			/** Get the first sheet from workbook**/
			
			HSSFSheet mySheet = myWorkBook.getSheetAt(0);
			/** We now need something to 
				iterate through the cells.**/
			
			Iterator rowIter = mySheet.rowIterator();
			while(rowIter.hasNext())
			{
				HSSFRow myRow = (HSSFRow) rowIter.next();
				Iterator cellIter = myRow.cellIterator();
				Vector cellStoreVector=new Vector();
				while(cellIter.hasNext()){
				HSSFCell myCell = (HSSFCell) cellIter.next();
				cellStoreVector.addElement(myCell);
			}
			cellVectorHolder.addElement(cellStoreVector);
		}
		System.out.println("Data is "+cellVectorHolder);
}
}
