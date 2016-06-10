package controller;

import model.Connect;
import java.sql.ResultSet;
import java.util.ArrayList;

import java.util.List;

public class User {

    private Connect con;

    public User() {
        con = new Connect();
    }

    private int user_id;
    private String user, password, birth_date, state, sqlsent;

    public String getSqlsent() {
        return sqlsent;
    }

    public void setSqlsent(String sqlsent) {
        this.sqlsent = sqlsent;
    }

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

    public List lfuser() {
        List<String> list = new ArrayList<>();
        con.setConsult("select user,password, user_id from users where user='" + this.user + "'");
        try {
            while (con.getResult().next()) {
                list.add(con.getResult().getString("user"));
                list.add(con.getResult().getString("password"));
                list.add(con.getResult().getString("user_id"));
            }
        } catch (Exception e) {
        }
        //try{con.getResult().close();}catch(Exception e){}
        return list;
    }

    public void newElement() {
        con.setInsert("INSERT into users(user,password,birth_date,state) VALUES('" + this.user + "','" + this.password + "','" + this.birth_date + "', 1)");
    }

    public void delElement() {
        con.setInsert("UPDATE users set state=0 where user_id=" + this.user_id + "");
    }

    public void updElement() {
        con.setInsert("UPDATE users set user='" + this.user + "', password='" + this.password + "', birth_date='" + this.birth_date + "' where user_id='" + this.user_id + "'");
    }

    public ResultSet showAll() {
        
        con.setConsult("select * from users where state=1");
        ResultSet rs=con.getResult();
  
        return rs;
        
    }
    public ResultSet showEdit() {
        
        con.setConsult("select * from users where user_id='"+this.user_id+"' and state=1");
        ResultSet rs=con.getResult();
      
        return rs;
        
    }
    public ResultSet showSearch(){
    
        con.setConsult("select * from users where user like '%" + this.user + "%' and state=1");
        ResultSet rs=con.getResult();

        return rs;
    }
    
}
