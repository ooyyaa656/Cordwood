package kaoqin.packa;
import java.util.List;

public class memberdb {
    private memberdbao database = null;
    public memberdb() {
        try {
           this.database = new memberdbao();
       } catch (Exception e) {
           System.out.println(e);
       }
    }
    public void setdatabase(memberdbao database) {
        this.database = database;
    }
    public List getmember(String subject_id){
         return database.getmember(subject_id);
    }
    public List getonemember(String member_id){
         return database.getonemember(member_id);
    }
    public void addmember(String subject_id,String member_name,String begin_date,String remark,String class_name1,String class_name2){
        database.addmember(subject_id,member_name,begin_date,remark,class_name1,class_name2);
    }
    public void editmember(String member_id,String member_name,String begin_date,String remark,String class_name1,String class_name2){
        database.editmember(member_id,member_name,begin_date,remark,class_name1,class_name2);
    }
    public void delmember(String member_id){
         database.delmember(member_id);
    }
    public int getnum(String subject_id) {
        return database.getnum(subject_id);
    }
}
