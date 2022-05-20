package kaoqin.packa;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;

public class paradbao{
    private ArrayList products;
        public List getpara(String table_name) {
            products = new ArrayList();
            DBConnectionManager connMgr = DBConnectionManager.getInstance();
            Connection conn = connMgr.getConncetion("kcDB");
            try {
                String selectstatement = "select * from "+table_name+" order by para_id desc";
                PreparedStatement prepstmt = conn.prepareStatement(selectstatement);
                ResultSet rs = prepstmt.executeQuery();

                while (rs.next()) {
                    paradetail db =
                new paradetail(rs.getString("para_id"),
                                   rs.getString("para_value"));
                    products.add(db);
                }
                prepstmt.close();
            } catch (Exception ex) {
                System.out.println("errors....." + ex.toString());
            } finally {
                connMgr.freeConnection("kcDB", conn);
            }
            return products;
    }
    public void delpara(String para_name,String para_id) {
        DBConnectionManager connMgr = DBConnectionManager.getInstance();
        Connection conn = connMgr.getConncetion("kcDB");
        try {
            String insertinfostatement =
                    "delete from "+para_name+" where para_id=?";
            PreparedStatement prepstmt = conn.prepareStatement(
                    insertinfostatement);
            prepstmt.setInt(1,Integer.parseInt(para_id));
            prepstmt.executeUpdate();
            prepstmt.close();
        } catch (Exception ex) {
            System.out.println("errors....." + ex.toString());
        } finally {
            connMgr.freeConnection("kcDB", conn);
        }
    }
    public void insertpara(String para_name,String para_value){
        DBConnectionManager connMgr = DBConnectionManager.getInstance();
        Connection conn = connMgr.getConncetion("kcDB");
        try {
            String statement ="insert into "+para_name+"(para_value) values(?)";
            PreparedStatement prepstmt = conn.prepareStatement(statement);
            prepstmt.setString(1, para_value);
            prepstmt.executeUpdate();
            prepstmt.close();
        } catch (Exception ex) {
            System.out.println("errors....." + ex.toString());
        } finally {
            connMgr.freeConnection("kcDB", conn);
        }
    }
    public void editpara(String para_name,String para_id,String para_value){
        DBConnectionManager connMgr = DBConnectionManager.getInstance();
        Connection conn = connMgr.getConncetion("kcDB");
        try {
            String statement ="update "+para_name+" set para_value=? where para_id=?";
            PreparedStatement prepstmt = conn.prepareStatement(statement);
            prepstmt.setString(1, para_value);
            prepstmt.setString(2, para_id);
            prepstmt.executeUpdate();
            prepstmt.close();
        } catch (Exception ex) {
            System.out.println("errors....." + ex.toString());
        } finally {
            connMgr.freeConnection("kcDB", conn);
        }
    }
    public void delallpara(String para_name) {
            DBConnectionManager connMgr = DBConnectionManager.getInstance();
            Connection conn = connMgr.getConncetion("kcDB");
            try {
                String insertinfostatement =
                        "delete from "+para_name;
                PreparedStatement prepstmt = conn.prepareStatement(
                        insertinfostatement);

                prepstmt.executeUpdate();
                prepstmt.close();
            } catch (Exception ex) {
                System.out.println("errors....." + ex.toString());
            } finally {
                connMgr.freeConnection("kcDB", conn);
            }
    }
    public List querypara(String table_name,String para_value) {
            products = new ArrayList();
            DBConnectionManager connMgr = DBConnectionManager.getInstance();
            Connection conn = connMgr.getConncetion("kcDB");
            try {
                String selectstatement = "select * from "+table_name+" where para_value like '%"+para_value+"%' order by para_id desc";
                PreparedStatement prepstmt = conn.prepareStatement(selectstatement);
                ResultSet rs = prepstmt.executeQuery();

                while (rs.next()) {
                    paradetail db =
                new paradetail(rs.getString("para_id"),
                                   rs.getString("para_value"));
                    products.add(db);
                }
                prepstmt.close();
            } catch (Exception ex) {
                System.out.println("errors....." + ex.toString());
            } finally {
                connMgr.freeConnection("kcDB", conn);
            }
            return products;
    }

}
