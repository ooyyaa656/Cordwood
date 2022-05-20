package kaoqin.packa;

public class paradetail {
    private String para_id=null;
    private String para_value=null;

    public paradetail(String para_id,String para_value) {
        this.para_id=para_id;
        this.para_value=para_value;
    }

    public String getPara_id() {
        return para_id;
    }

    public String getPara_value() {
        return para_value;
    }

    public void setPara_id(String para_id) {
        this.para_id = para_id;
    }

    public void setPara_value(String para_value) {
        this.para_value = para_value;
    }

}
