package kaoqin.packa;

public class query {
    public String sumQuery(String isout, String user_id, String subject_num,
                           String head, String department, String source) {
        String queryStatement = "";
        if (isout.equals("0")) {
            queryStatement = "select subject_id,user_id,name,subject_num,head,department,source,locked from subject";
        } else {
            queryStatement = "select department,institute_num,noinstitute_num,pro_num,total,funds,project_num,subject_num,subject_name,sub_num,head,period,source from subject";
        }
        String condition[] = {subject_num, head, department, source};
        String queryname[] = {"subject_num", "head", "department", "locked"};
        String conditionString = "";
        int j = 0;
        for (int i = 0; i < condition.length; i++) {
            condition[i] = condition[i].trim();
            if (!condition[i].equals("")) {
                if (!conditionString.equals("")) {
                    conditionString = conditionString + " and ";
                }
                if (i == 0 || i == 1) {
                    conditionString = conditionString + queryname[i] +
                                      " like '%" + condition[i] + "%'";
                } else {
                    conditionString = conditionString + queryname[i] + "='" +
                                      condition[i] + "'";
                }
                j = 1;
            }
        }
        if (j == 1) {
            queryStatement = queryStatement + " where user_id=" + user_id +
                             " and " + conditionString;
        } else {
            queryStatement = queryStatement + " where user_id=" + user_id;
        }
        queryStatement = queryStatement + " order by subject_id desc";
        return queryStatement;
    }

    public String sumQueryManage(String isout, String subject_num, String head,
                                 String department, String source) {
        String queryStatement = "";
        if (isout.equals("0")) {
            queryStatement = "select subject_id,user_id,name,subject_num,head,department,source,locked from subject";
        } else {
            queryStatement = "select department,institute_num,noinstitute_num,pro_num,total,funds,project_num,subject_num,subject_name,sub_num,head,period,source from subject";
        }
        String condition[] = {subject_num, head, department, source};
        String queryname[] = {"subject_num", "head", "department", "locked"};
        String conditionString = "";
        int j = 0;
        for (int i = 0; i < condition.length; i++) {
            condition[i] = condition[i].trim();
            if (!condition[i].equals("")) {
                if (!conditionString.equals("")) {
                    conditionString = conditionString + " and ";
                }
                if (i == 0 || i == 1) {
                    conditionString = conditionString + queryname[i] +
                                      " like '%" + condition[i] + "%'";
                } else {
                    conditionString = conditionString + queryname[i] + "='" +
                                      condition[i] + "'";
                }
                j = 1;
            }
        }
        if (j == 1) {
            queryStatement = queryStatement + " where " + conditionString;
        }
        queryStatement = queryStatement + " order by subject_id desc";
        return queryStatement;
    }
}
