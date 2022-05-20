package kaoqin.packa;

import java.util.List;

public class testdb {
	private testdbao database = null;
    public testdb() {
        try {
            this.database = new testdbao();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    public void adduser() {
           database.adduser();
    }
}
