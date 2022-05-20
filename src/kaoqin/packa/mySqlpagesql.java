package kaoqin.packa;

public class mySqlpagesql {
    public mySqlpagesql() {
    }
    public static String getPageSQL(String sql,int startRow,int rows){
        String pageSql=sql+" limit "+(startRow-1)+","+rows;
        return pageSql;
    }
}
