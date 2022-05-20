package kaoqin.packa;

public class sumdetail1 {
    private String subject_id=null;
    private String user_id=null;
    private String name=null;
    private String subject_num=null;
    private String head=null;
    private String department=null;
    private String source=null;
    private String locked=null;
    public sumdetail1(String subject_id,String user_id,String name,String subject_num,String head,String department,String source,String locked) {
               this.subject_id=subject_id;
               this.user_id=user_id;
               this.name=name;
               this.subject_num=subject_num;
               this.head=head;
               this.department=department;
               this.source=source;
               this.locked=locked;
    }

    public String getDepartment() {
        return department;
    }

    public String getHead() {
        return head;
    }

    public String getLocked() {
        return locked;
    }

    public String getSource() {
        return source;
    }

    public String getSubject_id() {
        return subject_id;
    }

    public String getSubject_num() {
        return subject_num;
    }

    public String getUser_id() {
        return user_id;
    }

    public String getName() {
        return name;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public void setHead(String head) {
        this.head = head;
    }

    public void setLocked(String locked) {
        this.locked = locked;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public void setSubject_id(String subject_id) {
        this.subject_id = subject_id;
    }

    public void setSubject_num(String subject_num) {
        this.subject_num = subject_num;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public void setName(String name) {
        this.name = name;
    }
}
