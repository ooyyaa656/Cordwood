package kaoqin.packa;

import java.util.List;

public class paradb {
    private paradbao database = null;
    public paradb() {
        try {
           this.database = new paradbao();
       } catch (Exception e) {
           System.out.println(e);
       }
    }
    public void delpara(String para_name,String para_id){
         database.delpara(para_name,para_id);
    }
    public void delallpara(String para_name){
         database.delallpara(para_name);
    }
    public void insertpara(String para_name,String para_value){
         database.insertpara(para_name,para_value);
    }
    public void editpara(String para_name,String para_id,String para_value){
         database.editpara(para_name,para_id,para_value);
    }
    public List getpara(String table_name){
         return database.getpara(table_name);
    }
}
