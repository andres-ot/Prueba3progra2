/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.sql.ResultSet;
import model.Connect;

/**
 *
 * @author fabian
 */
public class Country {
    
    private Connect con;
  
    private int country_id;
    private String name, state,  created_by;
    
    public int getCountry_id() {
        return country_id;
    }

    public void setCountry_id(int country_id) {
        this.country_id = country_id;
    }

    public String getCreated_by() {
        return created_by;
    }

    public void setCreated_by(String created_by) {
        this.created_by = created_by;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    
    
    public void newElement(){
        con = new Connect();
        con.setInsert("INSERT into countries(name,created_by,state) values('"+this.name+"', "+this.created_by+",1)");
    }
    
    public void delElement(){
       con = new Connect();
       con.setInsert("UPDATE countries set state=0 where country_id="+this.country_id+"");
    }
    
    public void updElement(){
        con = new Connect();
        con.setInsert("UPDATE countries set name='"+this.name+"' where country_id="+this.country_id+"");
    }
    
    public ResultSet showAll() {
        con = new Connect();
        con.setConsult("select p.name, p.country_id, p.state, u.user as createdby from countries as p left join users as u on u.user_id=p.created_by where p.state=1");
        ResultSet rs=con.getResult();
        return rs;
        
    }
}
