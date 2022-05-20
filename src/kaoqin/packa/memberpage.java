package kaoqin.packa;

import java.util.*;
import java.sql.*;

public class memberpage extends pageination{
       protected Collection packResultSet(ResultSet rs)throws SQLException {
       Collection goods=new ArrayList();
       while(rs.next()){
           memberdetail db =
            new memberdetail(rs.getString("member_id"),
                             rs.getString("subject_id"),
                             rs.getString("member_name"),
                             rs.getString("begin_date"),
                             rs.getString("remark"),
                             rs.getString("class_name1"),
                             rs.getString("class_name2"));
           goods.add(db);
       }
       return goods;
   }
}
