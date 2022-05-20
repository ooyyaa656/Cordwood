package kaoqin.packa;
public class sumdetail2 {
    private String institute_num = null;
    private String noinstitute_num = null;
    private String project_num = null;
    private String subject_name = null;
    private String subject_num = null;
    private String sub_num = null;
    private String pro_num = null;
    private String total = null;
    private String funds = null;
    private String head = null;
    private String department = null;
    private String period = null;
    private String source = null;
    public sumdetail2(String institute_num, String noinstitute_num,String project_num,
                      String subject_name, String subject_num, String sub_num,
                      String pro_num, String total, String funds, String head,
                      String department, String period,String source) {
        this.institute_num = institute_num;
        this.noinstitute_num = noinstitute_num;
        this.project_num = project_num;
        this.subject_name = subject_name;
        this.subject_num = subject_num;
        this.sub_num = sub_num;
        this.pro_num = pro_num;
        this.total = total;
        this.funds = funds;
        this.head = head;
        this.department = department;
        this.period = period;
        this.source = source;
    }

    public String getDepartment() {
        return department;
    }

    public String getFunds() {
        return funds;
    }

    public String getHead() {
        return head;
    }

    public String getInstitute_num() {
        return institute_num;
    }

    public String getNoinstitute_num() {
        return noinstitute_num;
    }

    public String getPeriod() {
        return period;
    }

    public String getPro_num() {
        return pro_num;
    }

    public String getProject_num() {
        return project_num;
    }

    public String getSource() {
        return source;
    }

    public String getSub_num() {
        return sub_num;
    }

    public String getSubject_name() {
        return subject_name;
    }

    public String getSubject_num() {
        return subject_num;
    }

    public String getTotal() {
        return total;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public void setFunds(String funds) {
        this.funds = funds;
    }

    public void setInstitute_num(String institute_num) {
        this.institute_num = institute_num;
    }

    public void setHead(String head) {
        this.head = head;
    }

    public void setNoinstitute_num(String noinstitute_num) {
        this.noinstitute_num = noinstitute_num;
    }

    public void setPeriod(String period) {
        this.period = period;
    }

    public void setPro_num(String pro_num) {
        this.pro_num = pro_num;
    }

    public void setProject_num(String project_num) {
        this.project_num = project_num;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public void setSub_num(String sub_num) {
        this.sub_num = sub_num;
    }

    public void setSubject_name(String subject_name) {
        this.subject_name = subject_name;
    }

    public void setSubject_num(String subject_num) {
        this.subject_num = subject_num;
    }

    public void setTotal(String total) {
        this.total = total;
    }

}
