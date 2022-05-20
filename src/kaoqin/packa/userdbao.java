package kaoqin.packa;

import java.util.*;
import java.sql.*;

public class userdbao {
    private ArrayList products;
    public List getuser() {
        products = new ArrayList();
        DBConnectionManager connMgr = DBConnectionManager.getInstance();
        Connection conn = connMgr.getConncetion("kcDB");
        try {
            String selectstatement =
                    "select * from user_info where role<>'admin'";
            PreparedStatement prepstmt = conn.prepareStatement(selectstatement);
            ResultSet rs = prepstmt.executeQuery();

            while (rs.next()) {
                userdetail db =
                        new userdetail(rs.getString("user_id"),
                                       rs.getString("username"),
                                       rs.getString("name"),
                                       rs.getString("email"),
                                       rs.getString("tel"),
                                       rs.getString("role"));

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

    public List getoneuser(String user_id) {
        products = new ArrayList();
        DBConnectionManager connMgr = DBConnectionManager.getInstance();
        Connection conn = connMgr.getConncetion("kcDB");
        try {
            String selectstatement =
                    "select * from user_info where user_id=?";
            PreparedStatement prepstmt = conn.prepareStatement(selectstatement);
            prepstmt.setInt(1, Integer.parseInt(user_id));
            ResultSet rs = prepstmt.executeQuery();
            while (rs.next()) {
                userdetail db =
                        new userdetail(rs.getString("user_id"),
                                       rs.getString("username"),
                                       rs.getString("name"),
                                       rs.getString("email"),
                                       rs.getString("tel"),
                                       rs.getString("role"));
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

    public void adduser(String username, String passwd, String name,String email,String tel,String role) {
        DBConnectionManager connMgr = DBConnectionManager.getInstance();
        Connection conn = connMgr.getConncetion("kcDB");
        try {
            String insertinfostatement =
                    "insert into user_info(username,passwd,name,email,tel,role) values(?,password(?),?,?,?,?) ";
            PreparedStatement prepstmt = conn.prepareStatement(
                    insertinfostatement);
            prepstmt.setString(1, username);
            prepstmt.setString(2, passwd);
            prepstmt.setString(3, name);
            prepstmt.setString(4, email);
            prepstmt.setString(5, tel);
            prepstmt.setString(6, role);
            prepstmt.executeUpdate();
            prepstmt.close();
        } catch (Exception ex) {
            System.out.println("errors....." + ex.toString());
        } finally {
            connMgr.freeConnection("kcDB", conn);
        }
    }

    public void deluser(String user_id) {
        DBConnectionManager connMgr = DBConnectionManager.getInstance();
        Connection conn = connMgr.getConncetion("kcDB");
        try {
            String selectstatement = null;
            selectstatement = "delete from user_info where user_id=?";
            PreparedStatement prepstmt1 = conn.prepareStatement(selectstatement);
            prepstmt1.setInt(1, Integer.parseInt(user_id));
            prepstmt1.executeUpdate();
            prepstmt1.close();
        } catch (Exception ex) {
            System.out.println("errors....." + ex.toString());
        } finally {
            connMgr.freeConnection("kcDB", conn);
        }
    }

    public void edituser(String user_id, String name,String email,String tel,String role) {
        DBConnectionManager connMgr = DBConnectionManager.getInstance();
        Connection conn = connMgr.getConncetion("kcDB");
        try {
            String updateinfostatement =
                    "update user_info set name=?,email=?,tel=?,role=? where user_id=?";
            PreparedStatement prepstmt = conn.prepareStatement(
                    updateinfostatement);
            prepstmt.setString(1, name);
            prepstmt.setString(2, email);
            prepstmt.setString(3, tel);
            prepstmt.setString(4, role);
            prepstmt.setInt(5, Integer.parseInt(user_id));
            prepstmt.executeUpdate();
            prepstmt.close();
        } catch (Exception ex) {
            System.out.println("errors....." + ex.toString());
        } finally {
            connMgr.freeConnection("kcDB", conn);
        }
    }

    public void editpsword(String user_id, String passwd) {

        DBConnectionManager connMgr = DBConnectionManager.getInstance();
        Connection conn = connMgr.getConncetion("kcDB");
        try {
            String updateinfostatement =
                    "update user_info set passwd=password(?) where user_id=?";
            PreparedStatement prepstmt = conn.prepareStatement(
                    updateinfostatement);
            prepstmt.setString(1, passwd);
            prepstmt.setInt(2, Integer.parseInt(user_id));
            prepstmt.executeUpdate();
            prepstmt.close();
        } catch (Exception ex) {
            System.out.println("errors....." + ex.toString());
        } finally {
            connMgr.freeConnection("kcDB", conn);
        }
    }

    public int checkUserid(String username) {
        int i = 0;
        DBConnectionManager connMgr = DBConnectionManager.getInstance();
        Connection conn = connMgr.getConncetion("kcDB");
        try {
            String updateinfostatement =
                    "select count(*) as numofuser from user_info where username=?";
            PreparedStatement prepstmt = conn.prepareStatement(
                    updateinfostatement);
            prepstmt.setString(1, username);
            ResultSet rs = prepstmt.executeQuery();
            while (rs.next()) {
                i = Integer.parseInt((String) rs.getString("numofuser"));
            }
            prepstmt.close();
        } catch (Exception ex) {
            System.out.println("errors....." + ex.toString());
        } finally {
            connMgr.freeConnection("kcDB", conn);
        }
        return i;
    }
}
