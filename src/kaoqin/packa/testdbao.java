package kaoqin.packa;

import java.util.*;
import java.sql.*;

public class testdbao {
    public void adduser() {
        DBConnectionManager connMgr = DBConnectionManager.getInstance();
        Connection conn = connMgr.getConncetion("kcDB");
        try {
            String insertinfostatement =
                    "insert into  task_info_list (task_id, data_id, time_start, time_end, obs_mode, timeline_id, origin_id, obs_id, para, generate_time, finished_time, finished_status)  VALUES "+
                    "('ID1307-20170307-69A1Bh'"+", 1307, 163497602, 163501202, 'D', '', '', 'FixStep', 'UnitType', '2017-04-24 05:11:58', '2017-04-24 05:11:58', 'U')"; 
            PreparedStatement prepstmt = conn.prepareStatement(
                    insertinfostatement);            
            prepstmt.executeUpdate();
            prepstmt.close();
        } catch (Exception ex) {
            System.out.println("errors....." + ex.toString());
        } finally {
            connMgr.freeConnection("kcDB", conn);
        }
    }

}
