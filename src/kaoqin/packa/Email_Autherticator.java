package kaoqin.packa;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Email_Autherticator extends Authenticator
{
    private String username = null;
       private String userpasswd = null;

       public Email_Autherticator(){}
       public Email_Autherticator(String username,String userpasswd){
           this.username = username;
           this.userpasswd = userpasswd;
       }

       public void setUserName(String username){
           this.username = username;
       }

       public void setPassword(String password){
           this.userpasswd = password;
       }

       public PasswordAuthentication getPasswordAuthentication(){
           return new PasswordAuthentication(username,userpasswd);
       }
}
