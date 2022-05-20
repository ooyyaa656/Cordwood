package kaoqin.packa;

public class userdetail {
    private String user_id=null;
    private String username=null;
    private String name=null;
    private String email=null;
    private String role=null;
    private String tel=null;
    public userdetail(String user_id,String username,String name,String email,String tel,String role) {
        this.user_id=user_id;
        this.username=username;
        this.name=name;
        this.email=email;
        this.tel=tel;
        this.role=role;
    }
    public String getEmail() {
        return email;
    }

    public String getName() {
        return name;
    }

    public String getRole() {
        return role;
    }

    public String getUser_id() {
        return user_id;
    }

    public String getUsername() {
        return username;
    }

    public String getTel() {
        return tel;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }
}
