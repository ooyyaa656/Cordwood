package kaoqin.packa;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

public class budgetpage extends pageination
{
  protected Collection packResultSet(ResultSet rs)
    throws SQLException
  {
    Collection goods = new ArrayList();
    while (rs.next()) {
    	budgetdetail db = new budgetdetail(rs.getString("budget_id"), rs.getString("subject_id"),rs.getString("budget_year"), rs.getString("device1"),
    			rs.getString("device2"), rs.getString("device3"), rs.getString("device4"), rs.getString("material"),
    			rs.getString("experiment"), rs.getString("power"), rs.getString("travel"), rs.getString("meeting"),
    			rs.getString("international"), rs.getString("publish"), rs.getString("cooperate"), rs.getString("expert"),
    			rs.getString("labour"), rs.getString("manage"), rs.getString("multi"), rs.getString("jixiao"),
    			rs.getString("other1"), rs.getString("other2"), rs.getString("transfer"), rs.getString("base1"),
    			rs.getString("base2"), rs.getString("base3"), rs.getString("base4"), rs.getString("base5"),
    			rs.getString("base6"));

      goods.add(db);
    }
    return goods;
  }
}