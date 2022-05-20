package kaoqin.packa;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;

public class loginin {
    public boolean getlogin(String username, String passwd) {
        DBConnectionManager connMgr = DBConnectionManager.getInstance();
        Connection conn = connMgr.getConncetion("kcDB");
        String nu = "0";
        try {
            String selectstatement =
                    "select count(*) as nu from user_info where username=? and passwd=password(?)";
            PreparedStatement prepstmt = conn.prepareStatement(selectstatement);
            prepstmt.setString(1, username);
            prepstmt.setString(2, passwd);
            ResultSet rs = prepstmt.executeQuery();

            while (rs.next()) {
                nu = rs.getString("nu");
            }
            prepstmt.close();
        } catch (Exception ex) {
            System.out.println("errors....." + ex.toString());
        } finally {
            connMgr.freeConnection("kcDB", conn);
        }
        if (nu.equals("0")) {
            return false;
        } else {
            return true;
        }
    }

    public String[] getrole(String username) {
        String role[] = {"","","","","",""};
        DBConnectionManager connMgr = DBConnectionManager.getInstance();
        Connection conn = connMgr.getConncetion("kcDB");
        try {
            String selectstatement = "select * from user_info where username=?";
            PreparedStatement prepstmt = conn.prepareStatement(selectstatement);
            prepstmt.setString(1, username);
            ResultSet rs = prepstmt.executeQuery();

            while (rs.next()) {
                role[0] = rs.getString("user_id");
                role[1] = rs.getString("username");
                role[2] = rs.getString("name");
                role[3] = rs.getString("email");
                role[4] = rs.getString("tel");
                role[5]=rs.getString("role");
            }
            prepstmt.close();
        } catch (Exception ex) {
            System.out.println("errors....." + ex.toString());
        } finally {
            connMgr.freeConnection("kcDB", conn);
        }
        return role;
    }
    public String getlink(String username, String passwd){
        DBConnectionManager connMgr = DBConnectionManager.getInstance();
        Connection conn = connMgr.getConncetion("kcDB");
        String locked="";
        String nu="";
        //0密码错1通过2锁定
        try {
            String selectstatement ="select count(*) as num1 from subject where subject_num=? and passwd=?";
            PreparedStatement prepstmt1 = conn.prepareStatement(selectstatement);
            prepstmt1.setString(1, username);
            prepstmt1.setString(2, passwd);
            ResultSet rs1 = prepstmt1.executeQuery();
            rs1.next();
            nu=rs1.getString("num1");
            prepstmt1.close();
            if(nu.equals("1")){
                selectstatement ="select locked from subject where subject_num=?";
                PreparedStatement prepstmt = conn.prepareStatement(selectstatement);
                prepstmt.setString(1, username);
                ResultSet rs = prepstmt.executeQuery();
                while(rs.next()){
                  locked=rs.getString("locked");
                }
                prepstmt.close();
                if(locked.equals("1")){
                    nu="2";
                }
            }
        } catch (Exception ex) {
            System.out.println("errors....." + ex.toString());
        } finally {
            connMgr.freeConnection("kcDB", conn);
        }
         return nu;
    }
}
