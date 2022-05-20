package kaoqin.packa;

import java.io.PrintStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class budgetdbao
{
  private ArrayList products;

  public List getbudget(String subject_id)
  {
    this.products = new ArrayList();
    DBConnectionManager connMgr = DBConnectionManager.getInstance();
    Connection conn = connMgr.getConncetion("kcDB");
    try {
      String selectstatement = "select * from budget where subject_id=? order by budget_id desc";
      PreparedStatement prepstmt = conn.prepareStatement(selectstatement);
      prepstmt.setInt(1, Integer.parseInt(subject_id));
      ResultSet rs = prepstmt.executeQuery();
      while (rs.next()) {
    	budgetdetail db = new budgetdetail(rs.getString("budget_id"), rs.getString("subject_id"), rs.getString("budget_year"),rs.getString("device1"),
    			rs.getString("device2"), rs.getString("device3"), rs.getString("device4"), rs.getString("material"),
    			rs.getString("experiment"), rs.getString("power"), rs.getString("travel"), rs.getString("meeting"),
    			rs.getString("international"), rs.getString("publish"), rs.getString("cooperate"), rs.getString("expert"),
    			rs.getString("labour"), rs.getString("manage"), rs.getString("multi"), rs.getString("jixiao"),
    			rs.getString("other1"), rs.getString("other2"), rs.getString("transfer"), rs.getString("base1"),
    			rs.getString("base2"), rs.getString("base3"), rs.getString("base4"), rs.getString("base5"),
    			rs.getString("base6"));

        this.products.add(db);
      }
      prepstmt.close();
    } catch (Exception ex) {
      System.out.println("errors....." + ex.toString());
    } finally {
      connMgr.freeConnection("kcDB", conn);
    }
    return this.products;
  }
  public List getonebudget(String budget_id) {
    this.products = new ArrayList();
    DBConnectionManager connMgr = DBConnectionManager.getInstance();
    Connection conn = connMgr.getConncetion("kcDB");
    try {
      String selectstatement = "select * from budget where budget_id=?";
      PreparedStatement prepstmt = conn.prepareStatement(selectstatement);
      prepstmt.setInt(1, Integer.parseInt(budget_id));
      ResultSet rs = prepstmt.executeQuery();
      while (rs.next()) {
    	  budgetdetail db = new budgetdetail(rs.getString("budget_id"), rs.getString("subject_id"), rs.getString("budget_year"), rs.getString("device1"),
    			rs.getString("device2"), rs.getString("device3"), rs.getString("device4"), rs.getString("material"),
    			rs.getString("experiment"), rs.getString("power"), rs.getString("travel"), rs.getString("meeting"),
    			rs.getString("international"), rs.getString("publish"), rs.getString("cooperate"), rs.getString("expert"),
    			rs.getString("labour"), rs.getString("manage"), rs.getString("multi"), rs.getString("jixiao"),
    			rs.getString("other1"), rs.getString("other2"), rs.getString("transfer"), rs.getString("base1"),
    			rs.getString("base2"), rs.getString("base3"), rs.getString("base4"), rs.getString("base5"),
    			rs.getString("base6"));

        this.products.add(db);
      }
      prepstmt.close();
    } catch (Exception ex) {
      System.out.println("errors....." + ex.toString());
    } finally {
      connMgr.freeConnection("kcDB", conn);
    }
    return this.products;
  }

  public void addbudget(String subject_id,String budget_year,String device1,String device2,
  		String device3,String device4,String material,String experiment,String power,
		String travel,String meeting,String international,String publish,String cooperate,
		String expert,String labour,String manage,String multi,String jixiao,String other1,
		String other2,String transfer,String base1,String base2,String base3,String base4,
		String base5,String base6) {
	  
    DBConnectionManager connMgr = DBConnectionManager.getInstance();
    Connection conn = connMgr.getConncetion("kcDB");
    try {
      String insertinfostatement = "insert budget(subject_id,device1,device2,"+
    		"device3,device4,material,experiment,power,"+
    		"travel,meeting,international,publish,cooperate,"+
    		"expert,labour,manage,multi,jixiao,other1,"+
    		"other2,transfer,base1,base2,base3,base4,"+
    		"base5,base6,budget_year) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

      PreparedStatement prepstmt = conn.prepareStatement(insertinfostatement);
      prepstmt.setInt(1, Integer.parseInt(subject_id));
      prepstmt.setInt(2, device1==""?0:Integer.parseInt(device1));
      prepstmt.setInt(3, device2==""?0:Integer.parseInt(device2));
      prepstmt.setInt(4, device3==""?0:Integer.parseInt(device3));
      prepstmt.setInt(5, device4==""?0:Integer.parseInt(device4));
      prepstmt.setInt(6, material==""?0:Integer.parseInt(material));
      prepstmt.setInt(7, experiment==""?0:Integer.parseInt(experiment));
      prepstmt.setInt(8, power==""?0:Integer.parseInt(power));
      prepstmt.setInt(9, travel==""?0:Integer.parseInt(travel));
      prepstmt.setInt(10, meeting==""?0:Integer.parseInt(meeting));
      prepstmt.setInt(11, international==""?0:Integer.parseInt(international));
      prepstmt.setInt(12, publish==""?0:Integer.parseInt(publish));
      prepstmt.setInt(13, cooperate==""?0:Integer.parseInt(cooperate));
      prepstmt.setInt(14, expert==""?0:Integer.parseInt(expert));
      prepstmt.setInt(15, labour==""?0:Integer.parseInt(labour));
      prepstmt.setInt(16, manage==""?0:Integer.parseInt(manage));
      prepstmt.setInt(17, multi==""?0:Integer.parseInt(multi));
      prepstmt.setInt(18, jixiao==""?0:Integer.parseInt(jixiao));
      prepstmt.setInt(19, other1==""?0:Integer.parseInt(other1));
      prepstmt.setInt(20, other2==""?0:Integer.parseInt(other2));
      prepstmt.setInt(21, transfer==""?0:Integer.parseInt(transfer));
      prepstmt.setInt(22, base1==""?0:Integer.parseInt(base1));
      prepstmt.setInt(23, base2==""?0:Integer.parseInt(base2));
      prepstmt.setInt(24, base3==""?0:Integer.parseInt(base3));
      prepstmt.setInt(25, base4==""?0:Integer.parseInt(base4));
      prepstmt.setInt(26, base5==""?0:Integer.parseInt(base5));
      prepstmt.setInt(27, base6==""?0:Integer.parseInt(base6));
      prepstmt.setInt(28, Integer.parseInt(budget_year));
      prepstmt.executeUpdate();
      prepstmt.close();
      
    } catch (Exception ex) {
      System.out.println("errors....." + ex.toString());
    } finally {
      connMgr.freeConnection("kcDB", conn);
    }
  }

  public void editbudget(String budget_id,String budget_year,String device1,String device2,
	  		String device3,String device4,String material,String experiment,String power,
			String travel,String meeting,String international,String publish,String cooperate,
			String expert,String labour,String manage,String multi,String jixiao,String other1,
			String other2,String transfer,String base1,String base2,String base3,String base4,
			String base5,String base6) {
	  
	DBConnectionManager connMgr = DBConnectionManager.getInstance();
    Connection conn = connMgr.getConncetion("kcDB");
    try {
      String insertinfostatement = "update budget set device1=?,device2=?,device3=?,device4=?," +
      		"material=?,experiment=?,power=?,travel=?,meeting=?,international=?," +
      		"publish=?,cooperate=?,expert=?,labour=?,manage=?,multi=?," +
      		"jixiao=?,other1=?,other2=?,transfer=?,base1=?,base2=?," +
      		"base3=?,base4=?,base5=?,base6=?,budget_year=? where budget_id=?";

      PreparedStatement prepstmt = conn.prepareStatement(insertinfostatement);
      prepstmt.setInt(1, device1==""?0:Integer.parseInt(device1));
      prepstmt.setInt(2, device2==""?0:Integer.parseInt(device2));
      prepstmt.setInt(3, device3==""?0:Integer.parseInt(device3));
      prepstmt.setInt(4, device4==""?0:Integer.parseInt(device4));
      prepstmt.setInt(5, material==""?0:Integer.parseInt(material));
      prepstmt.setInt(6, experiment==""?0:Integer.parseInt(experiment));
      prepstmt.setInt(7, power==""?0:Integer.parseInt(power));
      prepstmt.setInt(8, travel==""?0:Integer.parseInt(travel));
      prepstmt.setInt(9, meeting==""?0:Integer.parseInt(meeting));
      prepstmt.setInt(10, international==""?0:Integer.parseInt(international));
      prepstmt.setInt(11, publish==""?0:Integer.parseInt(publish));
      prepstmt.setInt(12, cooperate==""?0:Integer.parseInt(cooperate));
      prepstmt.setInt(13, expert==""?0:Integer.parseInt(expert));
      prepstmt.setInt(14, labour==""?0:Integer.parseInt(labour));
      prepstmt.setInt(15, manage==""?0:Integer.parseInt(manage));
      prepstmt.setInt(16, multi==""?0:Integer.parseInt(multi));
      prepstmt.setInt(17, jixiao==""?0:Integer.parseInt(jixiao));
      prepstmt.setInt(18, other1==""?0:Integer.parseInt(other1));
      prepstmt.setInt(19, other2==""?0:Integer.parseInt(other2));
      prepstmt.setInt(20, transfer==""?0:Integer.parseInt(transfer));
      prepstmt.setInt(21, base1==""?0:Integer.parseInt(base1));
      prepstmt.setInt(22, base2==""?0:Integer.parseInt(base2));
      prepstmt.setInt(23, base3==""?0:Integer.parseInt(base3));
      prepstmt.setInt(24, base4==""?0:Integer.parseInt(base4));
      prepstmt.setInt(25, base5==""?0:Integer.parseInt(base5));
      prepstmt.setInt(26, base6==""?0:Integer.parseInt(base6));
      prepstmt.setInt(27, Integer.parseInt(budget_year));
      prepstmt.setInt(28, Integer.parseInt(budget_id));
      
      prepstmt.executeUpdate();
      prepstmt.close();
    } catch (Exception ex) {
      System.out.println("errors....." + ex.toString());
    } finally {
      connMgr.freeConnection("kcDB", conn);
    } }

  public void delbudget(String budget_id) {
    DBConnectionManager connMgr = DBConnectionManager.getInstance();
    Connection conn = connMgr.getConncetion("kcDB");
    try {
      String insertinfostatement = "delete from budget where budget_id=?";

      PreparedStatement prepstmt = conn.prepareStatement(insertinfostatement);
      prepstmt.setInt(1, Integer.parseInt(budget_id));
      prepstmt.executeUpdate();
      prepstmt.close();
    } catch (Exception ex) {
      System.out.println("errors....." + ex.toString());
    } finally {
      connMgr.freeConnection("kcDB", conn);
    }
  }
}