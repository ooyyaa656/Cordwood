package kaoqin.packa;

import org.apache.poi.hssf.usermodel.HSSFCell;
import java.io.IOException;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import java.io.FileInputStream;
import org.apache.poi.hssf.usermodel.HSSFRow;

public class initdata {
    public void initgood(String filename,String para_name) throws IOException {
        paradb  good = new paradb();
        good.delallpara(para_name);
        HSSFWorkbook workbook = new HSSFWorkbook(new FileInputStream(filename));
        String para_value;
        HSSFSheet sheet = null;
        HSSFRow row = null;
        HSSFCell cell = null;
        int beginnum = 0, endnum = 0, i = 0;
        sheet = workbook.getSheetAt(0);
        beginnum = sheet.getFirstRowNum();
        endnum = sheet.getLastRowNum();
        i=endnum;
        while (i>=beginnum) {
                para_value= "";
                row = sheet.getRow(i);
                cell = row.getCell((short) 0);
                para_value = cell.getStringCellValue();
                if (!(para_value.equals(""))){
//                cell = row.getCell((short) 1);
//                name = cell.getStringCellValue();
//                cell = row.getCell((short) 2);
//                employee_id=(int)cell.getNumericCellValue();
//                cell = row.getCell((short) 3);
//                workdate= format.format(cell.getDateCellValue());
                good.insertpara(para_name,para_value);
                }
                i--;
        }
        if(para_name.equals("class1")||para_name.equals("class2")||para_name.equals("knowledge")){}else{
        good.insertpara(para_name,"");}
    }
}
