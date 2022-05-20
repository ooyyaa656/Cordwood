package kaoqin.packa;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.*;

public class sumdbao {
    private ArrayList products;
    public List getsum(String user_id) {
        products = new ArrayList();
        DBConnectionManager connMgr = DBConnectionManager.getInstance();
        Connection conn = connMgr.getConncetion("kcDB");
        try {
            String selectstatement;
            if(user_id.equals("")){
               selectstatement = "select subject_id,user_id,name,subject_num,head,department,source,locked from subject";
            }else{
               selectstatement = "select subject_id,user_id,name,subject_num,head,department,source,locked from subject where user_id="+user_id;
            }
            PreparedStatement prepstmt = conn.prepareStatement(selectstatement);
            ResultSet rs = prepstmt.executeQuery();

            while (rs.next()) {
                sumdetail1 db =
            new sumdetail1(rs.getString("subject_id"),
                               rs.getString("user_id"),
                               rs.getString("name"),
                               rs.getString("subject_num"),
                               rs.getString("head"),
                               rs.getString("department"),
                               rs.getString("source"),
                               rs.getString("locked"));
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

    public List getQuerysum(String queryStatement) {
        products = new ArrayList();
        DBConnectionManager connMgr = DBConnectionManager.getInstance();
        Connection conn = connMgr.getConncetion("kcDB");
        try {
            PreparedStatement prepstmt = conn.prepareStatement(queryStatement);
            ResultSet rs = prepstmt.executeQuery();

            while (rs.next()) {
                sumdetail1 db =
            new sumdetail1(rs.getString("subject_id"),
                               rs.getString("user_id"),
                               rs.getString("name"),
                               rs.getString("subject_num"),
                               rs.getString("head"),
                               rs.getString("department"),
                               rs.getString("source"),
                               rs.getString("locked"));

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
    public List getOutQuerysum(String queryStatement) {
            products = new ArrayList();
            DBConnectionManager connMgr = DBConnectionManager.getInstance();
            Connection conn = connMgr.getConncetion("kcDB");
            try {
                PreparedStatement prepstmt = conn.prepareStatement(queryStatement);
                ResultSet rs = prepstmt.executeQuery();
                while (rs.next()) {
                    sumdetail2 db = new sumdetail2(rs.getString("institute_num"),
                                   rs.getString("noinstitute_num"),
                                   rs.getString("project_num"),
                                   rs.getString("subject_name"),
                                   rs.getString("subject_num"),
                                   rs.getString("sub_num"),
                                   rs.getString("pro_num"),
                                   rs.getString("total"),
                                   rs.getString("funds"),
                                   rs.getString("head"),
                                   rs.getString("department"),
                                   rs.getString("period"),
                                   rs.getString("source"));
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
   public List getonesum(String subject_id) {
        products = new ArrayList();
        DBConnectionManager connMgr = DBConnectionManager.getInstance();
        Connection conn = connMgr.getConncetion("kcDB");
        try {
            String selectstatement =
                    "select * from subject where subject_id=?";
            PreparedStatement prepstmt = conn.prepareStatement(selectstatement);
            prepstmt.setInt(1, Integer.parseInt(subject_id));
            ResultSet rs = prepstmt.executeQuery();
            while (rs.next()) {
                sumdetail db =
                        new sumdetail(rs.getString("subject_id"),
                               rs.getString("user_id"),
                               rs.getString("name"),
                               rs.getString("institute_num"),
                               rs.getString("noinstitute_num"),
                               rs.getString("iproject_num"),
                               rs.getString("project_num"),
                               rs.getString("subject_name"),
                               rs.getString("subject_num"),
                               rs.getString("sub_num"),
                               rs.getString("linkman"),
                               rs.getString("email"),
                               rs.getString("passwd"),
                               rs.getString("project_name"),
                               rs.getString("pro_num"),
                               rs.getString("total"),
                               rs.getString("funds"),
                               rs.getString("head"),
                               rs.getString("department"),
                               rs.getString("period"),
                               rs.getString("co_school"),
                               rs.getString("co_country"),
                               rs.getString("grade"),
                               rs.getString("source"),
                               rs.getString("consigned"),
                               rs.getString("type"),
                               rs.getString("knowledge"),
                               rs.getString("field"),
                               rs.getString("objective"),
                               rs.getString("trade"),
                               rs.getString("cooperation"),
                               rs.getString("progress"),
                               rs.getString("reason"),
                               rs.getString("locked"),
                               rs.getString("subject_money"),
                               rs.getString("templet"));
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
    public String[] getmail() {
           String [] mailinfo={"common","common;6009"};
           return mailinfo;
    }
    public String resetpasswd(String subject_id) {
        DBConnectionManager connMgr = DBConnectionManager.getInstance();
        Connection conn = connMgr.getConncetion("kcDB");
        long timeset = System.currentTimeMillis();
        String passwd=String.valueOf(timeset);
        try {
            String selectstatement = "update subject set passwd=? where subject_id=?";
            PreparedStatement prepstmt1 = conn.prepareStatement(selectstatement);
            prepstmt1.setString(1,passwd);
            prepstmt1.setInt(2, Integer.parseInt(subject_id));
            prepstmt1.executeUpdate();
            prepstmt1.close();

        } catch (Exception ex) {
            System.out.println("errors....." + ex.toString());
        } finally {
            connMgr.freeConnection("kcDB", conn);
        }
        return passwd;
    }

    public String addsum(String user_id,String name,String institute_num, String noinstitute_num, String iproject_num,
                          String project_num,String subject_name,String subject_num,String sub_num,String linkman,
                          String email,String subject_money,String pro_num,String templet){
    	
        DBConnectionManager connMgr = DBConnectionManager.getInstance();
        Connection conn = connMgr.getConncetion("kcDB");
        long timeset = System.currentTimeMillis();
        String passwd=String.valueOf(timeset);
        try {
            String statement =
                    "insert into subject(user_id,name,institute_num,noinstitute_num,iproject_num,project_num,subject_name,subject_num,sub_num,linkman,email,passwd,subject_money,pro_num,templet) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement prepstmt = conn.prepareStatement(
                    statement);
            prepstmt.setInt(1, Integer.parseInt(user_id));
            prepstmt.setString(2, name);
            prepstmt.setString(3, institute_num);
            prepstmt.setString(4, noinstitute_num);
            prepstmt.setString(5, iproject_num);
            prepstmt.setString(6, project_num);
            prepstmt.setString(7, subject_name);
            prepstmt.setString(8, subject_num);
            prepstmt.setString(9, sub_num);
            prepstmt.setString(10, linkman);
            prepstmt.setString(11, email);
            prepstmt.setString(12, passwd);
            prepstmt.setString(13, subject_money);
            prepstmt.setString(14, pro_num);
            prepstmt.setString(15, templet);
            prepstmt.executeUpdate();
            prepstmt.close();

        } catch (Exception ex) {
            System.out.println("errors....." + ex.toString());
        } finally {
            connMgr.freeConnection("kcDB", conn);
        }
        return passwd;
    }

    public void delsum(String subject_id) {

        DBConnectionManager connMgr = DBConnectionManager.getInstance();
        Connection conn = connMgr.getConncetion("kcDB");
        try {
            String selectstatement = "delete from member where subject_id=?";
            PreparedStatement prepstmt2= conn.prepareStatement(selectstatement);
            prepstmt2.setInt(1, Integer.parseInt(subject_id));
            prepstmt2.executeUpdate();
            prepstmt2.close();
            selectstatement = "delete from subject where subject_id=?";
            PreparedStatement prepstmt1 = conn.prepareStatement(selectstatement);
            prepstmt1.setInt(1, Integer.parseInt(subject_id));
            prepstmt1.executeUpdate();
            prepstmt1.close();

        } catch (Exception ex) {
            System.out.println("errors....." + ex.toString());
        } finally {
            connMgr.freeConnection("kcDB", conn);
        }
    }

    public void editsum(String subject_id,String institute_num, String noinstitute_num,String iproject_num,String project_num, String subject_name,
      String subject_num,String sub_num,String linkman,String email,String project_name,String pro_num,String total,String funds,String head,String department,
      String period,String co_school,String co_country,String grade,String source,String consigned,String type,String knowledge,String field,
      String objective,String trade,String cooperation,String progress,String reason,String subject_money,String templet) {
        DBConnectionManager connMgr = DBConnectionManager.getInstance();
        Connection conn = connMgr.getConncetion("kcDB");
        try {
            String updateinfostatement = "update subject set institute_num=?,noinstitute_num=?,iproject_num=?,project_num=?,"+
          "subject_name=?,subject_num=?,sub_num=?,linkman=?,email=?,project_name=?,pro_num=?,total=?,funds=?,"+
         "head=?,department=?,period=?,co_school=?,co_country=?,grade=?,source=?,consigned=?,type=?,knowledge=?,field=?,"+
         "objective=?,trade=?,cooperation=?,progress=?,reason=?,subject_money=?,templet=? where subject_id=?";
            PreparedStatement prepstmt = conn.prepareStatement(updateinfostatement);

            prepstmt.setString(1, institute_num);
            prepstmt.setString(2, noinstitute_num);
            prepstmt.setString(3, iproject_num);
            prepstmt.setString(4, project_num);
            prepstmt.setString(5, subject_name);
            prepstmt.setString(6, subject_num);
            prepstmt.setString(7, sub_num);
            prepstmt.setString(8, linkman);
            prepstmt.setString(9, email);
            prepstmt.setString(10, project_name);
            prepstmt.setString(11, pro_num);
            prepstmt.setString(12, total);

            prepstmt.setString(13, funds);
            prepstmt.setString(14, head);
            prepstmt.setString(15, department);
            prepstmt.setString(16, period);
            prepstmt.setString(17, co_school);
            prepstmt.setString(18, co_country);
            prepstmt.setString(19, grade);
            prepstmt.setString(20, source);
            prepstmt.setString(21, consigned);
            prepstmt.setString(22, type);
            prepstmt.setString(23, knowledge);
            prepstmt.setString(24, field);
            prepstmt.setString(25, objective);
            prepstmt.setString(26, trade);
            prepstmt.setString(27, cooperation);
            prepstmt.setString(28, progress);
            prepstmt.setString(29, reason);
            prepstmt.setString(30, subject_money);
            prepstmt.setString(31,templet);
            prepstmt.setInt(32,Integer.parseInt(subject_id));

            prepstmt.executeUpdate();
            prepstmt.close();
        } catch (Exception ex) {
            System.out.println("errors....." + ex.toString());
        } finally {
            connMgr.freeConnection("kcDB", conn);
        }
    }
    
    public void editsumlocked(String subject_id,String locked) {
    DBConnectionManager connMgr = DBConnectionManager.getInstance();
    Connection conn = connMgr.getConncetion("kcDB");
    try {
        String updateinfostatement = "update subject set locked=? where subject_id=?";
        PreparedStatement prepstmt = conn.prepareStatement(updateinfostatement);

        prepstmt.setString(1, locked);
        prepstmt.setInt(2,Integer.parseInt(subject_id));

        prepstmt.executeUpdate();
        prepstmt.close();
    } catch (Exception ex) {
        System.out.println("errors....." + ex.toString());
    } finally {
        connMgr.freeConnection("kcDB", conn);
    }
   }
    
   //no use?
   public List getlinksum(String subject_num) {
        products = new ArrayList();
        DBConnectionManager connMgr = DBConnectionManager.getInstance();
        Connection conn = connMgr.getConncetion("kcDB");
        try {
            String selectstatement =
                    "select * from subject where subject_num=?";
            PreparedStatement prepstmt = conn.prepareStatement(selectstatement);
            prepstmt.setString(1, subject_num);
            ResultSet rs = prepstmt.executeQuery();
            while (rs.next()) {
                sumdetail db =
                        new sumdetail(rs.getString("subject_id"),
                               rs.getString("user_id"),
                               rs.getString("name"),
                               rs.getString("institute_num"),
                               rs.getString("noinstitute_num"),
                               rs.getString("iproject_num"),
                               rs.getString("project_num"),
                               rs.getString("subject_name"),
                               rs.getString("subject_num"),
                               rs.getString("sub_num"),
                               rs.getString("linkman"),
                               rs.getString("email"),
                               rs.getString("passwd"),
                               rs.getString("project_name"),
                               rs.getString("pro_num"),
                               rs.getString("total"),
                               rs.getString("funds"),
                               rs.getString("head"),
                               rs.getString("department"),
                               rs.getString("period"),
                               rs.getString("co_school"),
                               rs.getString("co_country"),
                               rs.getString("grade"),
                               rs.getString("source"),
                               rs.getString("consigned"),
                               rs.getString("type"),
                               rs.getString("knowledge"),
                               rs.getString("field"),
                               rs.getString("objective"),
                               rs.getString("trade"),
                               rs.getString("cooperation"),
                               rs.getString("progress"),
                               rs.getString("reason"),
                               rs.getString("locked"),
                               rs.getString("subject_money"),
                               rs.getString("templet"));
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
    //no use?
    public void editlinksum(String subject_id,String subject_name,
      String project_name,String pro_num,String total,String funds,String head,String department,
      String period,String co_school,String co_country,String grade,String source,String consigned,String type,String knowledge,String field,
      String objective,String trade,String cooperation,String progress,String reason) {
        DBConnectionManager connMgr = DBConnectionManager.getInstance();
        Connection conn = connMgr.getConncetion("kcDB");
        try {
            String updateinfostatement = "update subject set "+
          "subject_name=?,project_name=?,pro_num=?,total=?,funds=?,"+
         "head=?,department=?,period=?,co_school=?,co_country=?,grade=?,source=?,consigned=?,type=?,knowledge=?,field=?,"+
         "objective=?,trade=?,cooperation=?,progress=?,reason=? where subject_id=?";
            PreparedStatement prepstmt = conn.prepareStatement(updateinfostatement);

            prepstmt.setString(1, subject_name);
            prepstmt.setString(2, project_name);
            prepstmt.setString(3, pro_num);
            prepstmt.setString(4, total);
            prepstmt.setString(5, funds);
            prepstmt.setString(6, head);
            prepstmt.setString(7, department);
            prepstmt.setString(8, period);
            prepstmt.setString(9, co_school);
            prepstmt.setString(10, co_country);
            prepstmt.setString(11, grade);
            prepstmt.setString(12, source);
            prepstmt.setString(13, consigned);
            prepstmt.setString(14, type);
            prepstmt.setString(15, knowledge);
            prepstmt.setString(16, field);
            prepstmt.setString(17, objective);
            prepstmt.setString(18, trade);
            prepstmt.setString(19, cooperation);
            prepstmt.setString(20, progress);
            prepstmt.setString(21, reason);
            prepstmt.setInt(22,Integer.parseInt(subject_id));

            prepstmt.executeUpdate();
            prepstmt.close();
        } catch (Exception ex) {
            System.out.println("errors....." + ex.toString());
        } finally {
            connMgr.freeConnection("kcDB", conn);
        }
    }
    
    //no use?
    public String getlinkpass(String subject_num,String email) {
        products = new ArrayList();
        DBConnectionManager connMgr = DBConnectionManager.getInstance();
        Connection conn = connMgr.getConncetion("kcDB");
        String num1="";
        try {
            String selectstatement =
                    "select count(*) as num1 from subject where subject_num=? and email=?";
            PreparedStatement prepstmt = conn.prepareStatement(selectstatement);
            prepstmt.setString(1, subject_num);
            prepstmt.setString(2, email);
            ResultSet rs = prepstmt.executeQuery();
            rs.next();
            num1=rs.getString("num1");
            prepstmt.close();
        } catch (Exception ex) {
            System.out.println("errors....." + ex.toString());
        } finally {
            connMgr.freeConnection("kcDB", conn);
        }
        return num1;
    }
    
    public String uniquenum(String subject_num) {
        products = new ArrayList();
        DBConnectionManager connMgr = DBConnectionManager.getInstance();
        Connection conn = connMgr.getConncetion("kcDB");
        String num1="";
        try {
            String selectstatement =
                    "select count(*) as num1 from subject where subject_num=?";
            PreparedStatement prepstmt = conn.prepareStatement(selectstatement);
            prepstmt.setString(1, subject_num);
           
            ResultSet rs = prepstmt.executeQuery();
            rs.next();
            num1=rs.getString("num1");
            prepstmt.close();
        } catch (Exception ex) {
            System.out.println("errors....." + ex.toString());
        } finally {
            connMgr.freeConnection("kcDB", conn);
        }
        return num1;
    }
}
