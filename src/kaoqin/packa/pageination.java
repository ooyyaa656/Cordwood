package kaoqin.packa;

import java.util.*;
import java.sql.*;

public abstract class pageination {
    private String sql;
    private int rowsPerPage;
    private int rowsCount;
    private int pagesCount;
    public void setRowsPerPage(int rowsPerPage){
       this.rowsPerPage=rowsPerPage;
    }
    public void setSQL(String sql)throws SQLException{
       this.sql=sql;
       this.rowsCount=0;
       this.pagesCount=0;

       this.rowsCount=countRows();
       this.pagesCount=countPages();
    }
    public int getPagesCount() {
        return pagesCount;
    }

    public int getRowsCount() {
        return rowsCount;
    }

    public int getRowsPerPage(){
       return rowsPerPage;
    }

    public String getSQL() {
        return sql;
    }
   public Collection getPage(int page)throws SQLException{
       Collection result=new ArrayList();
       DBConnectionManager connMgr = DBConnectionManager.getInstance();
       Connection conn = connMgr.getConncetion("kcDB");
       Statement stmt=conn.createStatement();

       int startRow=(page-1)*getRowsPerPage()+1;
       int rows=this.getRowsPerPage();

       String pageSql=mySqlpagesql.getPageSQL(this.sql,startRow,rows);
       ResultSet rs=stmt.executeQuery(pageSql);

       result=packResultSet(rs);

       rs.close();
       stmt.close();
       connMgr.freeConnection("kcDB", conn);
       return result;
   }
   private int countRows()throws SQLException{
     String countSql=this.sql;
     countSql=countSql.toLowerCase();
     int fromPos=countSql.indexOf(" from ");
     countSql=countSql.substring(fromPos);
     countSql="select count(*)"+countSql;

     DBConnectionManager connMgr = DBConnectionManager.getInstance();
     Connection conn = connMgr.getConncetion("kcDB");
     Statement stmt=conn.createStatement();
     ResultSet rs=stmt.executeQuery(countSql);
     rs.first();
     int count=rs.getInt(1);

     rs.close();
     stmt.close();
     connMgr.freeConnection("kcDB", conn);
     return count;
   }
   private int countPages(){
      if((rowsCount%rowsPerPage)==0){
          return rowsCount/rowsPerPage;
      }else{
          return(rowsCount/rowsPerPage+1);
      }
    }
    protected abstract Collection packResultSet(ResultSet rs)throws SQLException;

}
