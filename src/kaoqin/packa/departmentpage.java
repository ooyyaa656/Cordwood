package kaoqin.packa;

import java.util.*;
import java.sql.*;

public class departmentpage extends pageination{
       protected Collection packResultSet(ResultSet rs)throws SQLException {
       Collection goods=new ArrayList();
       while(rs.next()){
           departmentdetail db =
            new departmentdetail(rs.getString("department_id"),
                               rs.getString("department_name"));
           goods.add(db);
       }
       return goods;
   }

}
