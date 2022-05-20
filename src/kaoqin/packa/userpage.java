package kaoqin.packa;

import java.util.*;
import java.sql.*;

public class userpage extends pageination{
    protected Collection packResultSet(ResultSet rs)throws SQLException {
       Collection goods=new ArrayList();
       while(rs.next()){
           userdetail db =
                        new userdetail(rs.getString("user_id"),
                                       rs.getString("username"),
                                       rs.getString("name"),
                                       rs.getString("email"),
                                       rs.getString("tel"),
                                       rs.getString("role"));
           goods.add(db);
       }
       return goods;
   }

}
