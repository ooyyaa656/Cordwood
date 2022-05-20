package kaoqin.packa;

import java.io.PrintStream;
import java.util.List;

public class budgetdb
{
  private budgetdbao database = null;

  public budgetdb() {
    try { this.database = new budgetdbao();
    } catch (Exception e) {
      System.out.println(e);
    }
  }

  public void setdatabase(budgetdbao database) { this.database = database; }

  public List getbudget(String subject_id) {
    return this.database.getbudget(subject_id);
  }
  public List getonebudget(String budget_id) {
    return this.database.getonebudget(budget_id);
  }
  public void addbudget(String subject_id,String budget_year,String device1,String device2,
	  		String device3,String device4,String material,String experiment,String power,
			String travel,String meeting,String international,String publish,String cooperate,
			String expert,String labour,String manage,String multi,String jixiao,String other1,
			String other2,String transfer,String base1,String base2,String base3,String base4,
			String base5,String base6) {
    this.database.addbudget(subject_id,budget_year,device1,device2,device3,device4,material,experiment,power,
              travel,meeting,international,publish,cooperate,expert,labour,manage,multi,jixiao,other1,
              other2,transfer,base1,base2,base3,base4,base5,base6);
  }
  public void editbudget(String budget_id,String budget_year,String device1,String device2,
	  		String device3,String device4,String material,String experiment,String power,
			String travel,String meeting,String international,String publish,String cooperate,
			String expert,String labour,String manage,String multi,String jixiao,String other1,
			String other2,String transfer,String base1,String base2,String base3,String base4,
			String base5,String base6) {
    this.database.editbudget(budget_id,budget_year,device1,device2,device3,device4,material,experiment,power,
            travel,meeting,international,publish,cooperate,expert,labour,manage,multi,jixiao,other1,
            other2,transfer,base1,base2,base3,base4,base5,base6);
  }
  public void delbudget(String budget_id) {
    this.database.delbudget(budget_id);
  }
}