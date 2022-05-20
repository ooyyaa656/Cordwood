package kaoqin.packa;

import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.util.ArrayList;

public class departmentdbao {
    private ArrayList products;
    public List getdepartment() {
        products = new ArrayList();
        DBConnectionManager connMgr = DBConnectionManager.getInstance();
        Connection conn = connMgr.getConncetion("kcDB");
        try {
            String selectstatement = "select * from department order by department_id desc";
            PreparedStatement prepstmt = conn.prepareStatement(selectstatement);
            ResultSet rs = prepstmt.executeQuery();

            while (rs.next()) {
                departmentdetail db =
                        new departmentdetail(rs.getString("department_id"),
                                       rs.getString("department_name"));

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

    public void adddepartment(String department_name) {
        DBConnectionManager connMgr = DBConnectionManager.getInstance();
        Connection conn = connMgr.getConncetion("kcDB");
        try {
            String insertinfostatement =
                    "insert into department(department_name) values(?)";
            PreparedStatement prepstmt = conn.prepareStatement(
                    insertinfostatement);
            prepstmt.setString(1, department_name);
            prepstmt.executeUpdate();
            prepstmt.close();
        } catch (Exception ex) {
            System.out.println("errors....." + ex.toString());
        } finally {
            connMgr.freeConnection("kcDB", conn);
        }
    }
    public void editdepartment(String department_id,String department_name) {
        DBConnectionManager connMgr = DBConnectionManager.getInstance();
        Connection conn = connMgr.getConncetion("kcDB");
        try {
            String insertinfostatement =
                    "update department set department_name=? where department_id=?";
            PreparedStatement prepstmt = conn.prepareStatement(
                    insertinfostatement);
            prepstmt.setString(1, department_name);
            prepstmt.setInt(2, Integer.parseInt(department_id));
            prepstmt.executeUpdate();
            prepstmt.close();
        } catch (Exception ex) {
            System.out.println("errors....." + ex.toString());
        } finally {
            connMgr.freeConnection("kcDB", conn);
        }
    }

    public void deldepartment(String department_id) {
            DBConnectionManager connMgr = DBConnectionManager.getInstance();
            Connection conn = connMgr.getConncetion("kcDB");
            try {
                String insertinfostatement =
                        "delete from department where department_id=?";
                PreparedStatement prepstmt = conn.prepareStatement(
                        insertinfostatement);
                prepstmt.setInt(1,Integer.parseInt(department_id));
                prepstmt.executeUpdate();
                prepstmt.close();
            } catch (Exception ex) {
                System.out.println("errors....." + ex.toString());
            } finally {
                connMgr.freeConnection("kcDB", conn);
            }
    }
}
