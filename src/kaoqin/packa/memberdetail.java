package kaoqin.packa;

public class memberdetail {
    private String member_id=null;
    private String subject_id=null;
    private String member_name=null;
    private String begin_date=null;
    private String remark=null;
    private String class_name1=null;
    private String class_name2=null;

    public memberdetail(String member_id,String subject_id,String member_name,String begin_date,
                        String remark,String class_name1,String class_name2) {
        this.member_id=member_id;
        this.subject_id=subject_id;
        this.member_name=member_name;
        this.begin_date=begin_date;
        this.remark=remark;
        this.class_name1=class_name1;
        this.class_name2=class_name2;
    }

    public String getClass_name1() {
        return class_name1;
    }

    public String getClass_name2() {
        return class_name2;
    }

    public String getMember_id() {
        return member_id;
    }

    public String getMember_name() {
        return member_name;
    }

    public String getSubject_id() {
        return subject_id;
    }

    public String getBegin_date() {
        return begin_date;
    }

    public String getRemark() {
        return remark;
    }

    public void setClass_name1(String class_name1) {
        this.class_name1 = class_name1;
    }

    public void setClass_name2(String class_name2) {
        this.class_name2 = class_name2;
    }

    public void setMember_name(String member_name) {
        this.member_name = member_name;
    }

    public void setMember_id(String member_id) {
        this.member_id = member_id;
    }
    public void setSubject_id(String subject_id) {
        this.subject_id = subject_id;
    }
    public void setBegin_date(String begin_date) {
        this.begin_date = begin_date;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
