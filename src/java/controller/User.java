
package controller;

import model.Connect;

public class User {
    
    private Connect con;
            
    public User(){
        con = new Connect();
    }
    
    private int user_id;
    private String user, password, birth_date, state;
    

  

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getBirth_date() {
        return birth_date;
    }

    public void setBirth_date(String birth_date) {
        this.birth_date = birth_date;
    }

    public String getState() {
        return state;
    }

    public void setState(String State) {
        this.state = State;
    }
    
    
}
