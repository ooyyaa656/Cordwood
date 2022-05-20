package kaoqin.packa;

import java.util.*;

public class sumdb {
    private sumdbao database = null;
    public sumdb() {
        try {
           this.database = new sumdbao();
       } catch (Exception e) {
           System.out.println(e);
       }
    }
    public void setdatabase(sumdbao database) {
        this.database = database;
    }
    public List getsum(String user_id){
         return database.getsum(user_id);
    }
   public List getQuerysum(String queryStatement){
         return database.getQuerysum(queryStatement);
   }
   public List getOutQuerysum(String queryStatement){
         return database.getOutQuerysum(queryStatement);
   }
   public List getonesum(String subject_id){
         return database.getonesum(subject_id);
   }
   public String[] getmail() {
       return database.getmail();
   }
   public String resetpasswd(String subject_id) {
       return database.resetpasswd(subject_id);
   }
   public String addsum(String user_id,String name,String institute_num, String noinstitute_num, String iproject_num,
                          String project_num,String subject_name,String subject_num,String sub_num,String linkman,String email,String subject_money,String pro_num,String templet){
         return database.addsum(user_id,name,institute_num,noinstitute_num,iproject_num,project_num,subject_name,subject_num,sub_num,linkman,email,subject_money,pro_num,templet);
  }
   public void delsum(String subject_id){
         database.delsum(subject_id);
   }
   public void editsum(String subject_id,String institute_num, String noinstitute_num,String iproject_num,String project_num, String subject_name,
      String subject_num,String sub_num,String linkman,String email,String project_name,String pro_num,String total,String funds,String head,String department,
      String period,String co_school,String co_country,String grade,String source,String consigned,String type,String knowledge,String field,
      String objective,String trade,String cooperation,String progress,String reason,String subject_money,String templet){
       database.editsum(subject_id,institute_num,noinstitute_num,iproject_num,project_num,subject_name,
    subject_num,sub_num,linkman,email,project_name,pro_num,total,funds,head,department,period,co_school,co_country,grade,source,consigned,type,knowledge,
    field,objective,trade,cooperation,progress,reason,subject_money,templet);
   }
    public void editsumlocked(String subject_id,String locked) {
         database.editsumlocked(subject_id,locked);
    }
    public List getlinksum(String subject_num) {
         return database.getlinksum(subject_num);
    }
    public void editlinksum(String subject_id,String subject_name,
    	      String project_name,String pro_num,String total,String funds,String head,String department,
    	      String period,String co_school,String co_country,String grade,String source,String consigned,String type,String knowledge,String field,
    	      String objective,String trade,String cooperation,String progress,String reason) {
    	        database.editlinksum(subject_id,subject_name,
    	    project_name,pro_num,total,funds,head,department,period,co_school,co_country,grade,source,consigned,type,knowledge,
    	    field,objective,trade,cooperation,progress,reason);
    	    }
    public String getlinkpass(String subject_num,String email) {
        return database.getlinkpass(subject_num,email);
    }
    public String uniquenum(String subject_num){
    	return database.uniquenum(subject_num);
    }
}
