package kaoqin.packa;

import java.util.*;

public class userdb {
    private userdbao database = null;
    public userdb() {
        try {
            this.database = new userdbao();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    public void setdatabase(userdbao database) {
            this.database = database;
        }
    public List getuser() {
           return database.getuser();
    }
    public List getoneuser(String user_id) {
        return database.getoneuser(user_id);
    }
    public void adduser(String username, String passwd,String name, String email,String tel,String role) {
           database.adduser(username,passwd,name,email,tel,role);
    }
    public void deluser(String user_id) {
              database.deluser(user_id);
    }
    public void edituser(String user_id, String name,String email,String tel,String role) {
           database.edituser(user_id, name, email,tel,role);
    }
    public void editpsword(String user_id,String passwd){
        database.editpsword(user_id,passwd);
    }
    public int checkUserid(String username) {
        return database.checkUserid(username);
    }
}
