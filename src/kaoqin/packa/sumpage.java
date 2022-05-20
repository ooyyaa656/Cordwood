package kaoqin.packa;

import java.util.*;
import java.sql.*;

public class sumpage extends pageination{
       protected Collection packResultSet(ResultSet rs)throws SQLException {
       Collection goods=new ArrayList();
       while(rs.next()){
           sumdetail1 db =
            new sumdetail1(rs.getString("subject_id"),
                               rs.getString("user_id"),
                               rs.getString("name"),
                               rs.getString("subject_num"),
                               rs.getString("head"),
                               rs.getString("department"),
                               rs.getString("source"),
                               rs.getString("locked"));
           goods.add(db);
       }
       return goods;
   }

}
