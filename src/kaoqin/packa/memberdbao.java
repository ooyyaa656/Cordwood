package kaoqin.packa;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;

public class memberdbao {
    private ArrayList products;
        public List getmember(String subject_id) {
            products = new ArrayList();
            DBConnectionManager connMgr = DBConnectionManager.getInstance();
            Connection conn = connMgr.getConncetion("kcDB");
            try {
                String selectstatement = "select * from member where subject_id=? order by member_id desc";
                PreparedStatement prepstmt = conn.prepareStatement(selectstatement);
                prepstmt.setInt(1,Integer.parseInt(subject_id));
                ResultSet rs = prepstmt.executeQuery();
                while (rs.next()) {
                    memberdetail db = new memberdetail(rs.getString("member_id"),
                                          rs.getString("subject_id"),
                                          rs.getString("member_name"),
                                          rs.getString("begin_date"),
                                          rs.getString("remark"),
                                          rs.getString("class_name1"),
                                          rs.getString("class_name2"));
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
    public List getonemember(String member_id) {
            products = new ArrayList();
            DBConnectionManager connMgr = DBConnectionManager.getInstance();
            Connection conn = connMgr.getConncetion("kcDB");
            try {
                String selectstatement = "select * from member where member_id=?";
                PreparedStatement prepstmt = conn.prepareStatement(selectstatement);
                prepstmt.setInt(1,Integer.parseInt(member_id));
                ResultSet rs = prepstmt.executeQuery();
                while (rs.next()) {
                    memberdetail db = new memberdetail(rs.getString("member_id"),
                                          rs.getString("subject_id"),
                                          rs.getString("member_name"),
                                          rs.getString("begin_date"),
                                          rs.getString("remark"),
                                          rs.getString("class_name1"),
                                          rs.getString("class_name2"));
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

    public void addmember(String subject_id,String member_name,String begin_date,String remark,String class_name1,String class_name2) {
        DBConnectionManager connMgr = DBConnectionManager.getInstance();
        Connection conn = connMgr.getConncetion("kcDB");
        try {
            String insertinfostatement =
                    "insert member(subject_id,member_name,begin_date,remark,class_name1,class_name2) values(?,?,?,?,?,?)";
            PreparedStatement prepstmt = conn.prepareStatement(insertinfostatement);
            prepstmt.setInt(1,Integer.parseInt(subject_id));
            prepstmt.setString(2,member_name);
            prepstmt.setString(3,begin_date);
            prepstmt.setString(4,remark);
            prepstmt.setString(5,class_name1);
            prepstmt.setString(6,class_name2);
            prepstmt.executeUpdate();
            prepstmt.close();
        } catch (Exception ex) {
            System.out.println("errors....." + ex.toString());
        } finally {
            connMgr.freeConnection("kcDB", conn);
        }
    }
    public void editmember(String member_id,String member_name,String begin_date,String remark,String class_name1,String class_name2) {
            DBConnectionManager connMgr = DBConnectionManager.getInstance();
            Connection conn = connMgr.getConncetion("kcDB");
            try {
                String insertinfostatement =
                        "update member set member_name=?,begin_date=?,remark=?,class_name1=?,class_name2=? where member_id=?";
                PreparedStatement prepstmt = conn.prepareStatement(insertinfostatement);
                prepstmt.setString(1,member_name);
                prepstmt.setString(2,begin_date);
                prepstmt.setString(3,remark);
                prepstmt.setString(4,class_name1);
                prepstmt.setString(5,class_name2);
                prepstmt.setInt(6,Integer.parseInt(member_id));
                prepstmt.executeUpdate();
                prepstmt.close();
            } catch (Exception ex) {
                System.out.println("errors....." + ex.toString());
            } finally {
                connMgr.freeConnection("kcDB", conn);
            }
    }
    public void delmember(String member_id) {
        DBConnectionManager connMgr = DBConnectionManager.getInstance();
        Connection conn = connMgr.getConncetion("kcDB");
        try {
            String insertinfostatement =
                    "delete from member where member_id=?";
            PreparedStatement prepstmt = conn.prepareStatement(insertinfostatement);
            prepstmt.setInt(1,Integer.parseInt(member_id));
            prepstmt.executeUpdate();
            prepstmt.close();
        } catch (Exception ex) {
            System.out.println("errors....." + ex.toString());
        } finally {
            connMgr.freeConnection("kcDB", conn);
        }
    }
    public int getnum(String subject_id) {
             DBConnectionManager connMgr = DBConnectionManager.getInstance();
             Connection conn = connMgr.getConncetion("kcDB");
             int i=0;
             try {
                 String selectstatement ="select count(*) as num from member where subject_id=?";
                 PreparedStatement prepstmt = conn.prepareStatement(selectstatement);
                 prepstmt.setInt(1,Integer.parseInt(subject_id));
                 ResultSet rs = prepstmt.executeQuery();
                 while (rs.next()) {
                    i=rs.getInt("num");
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
