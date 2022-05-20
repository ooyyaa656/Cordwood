package kaoqin.packa;
import java.util.*;
public class departmentdb {
    private departmentdbao database = null;
    public departmentdb() {
        try {
           this.database = new departmentdbao();
       } catch (Exception e) {
           System.out.println(e);
       }
    }
    public void setdatabase(departmentdbao database) {
        this.database = database;
    }

    public List getdepartment(){
       return database.getdepartment();
    }
    public void adddepartment(String department_name){
       database.adddepartment(department_name);
    }
    public void deldepartment(String department_id){
           database.deldepartment(department_id);
    }
    public void editdepartment(String department_id,String department_name){
           database.editdepartment(department_id,department_name);
    }

}
