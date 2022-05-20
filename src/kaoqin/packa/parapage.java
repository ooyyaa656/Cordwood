package kaoqin.packa;

import java.util.*;
import java.sql.*;

public class parapage extends pageination{
       protected Collection packResultSet(ResultSet rs)throws SQLException {
       Collection goods=new ArrayList();
       while(rs.next()){
           paradetail db =
            new paradetail(rs.getString("para_id"),
                               rs.getString("para_value"));
           goods.add(db);
       }
       return goods;
   }
}
