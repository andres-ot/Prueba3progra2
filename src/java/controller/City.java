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
 * @author andres
 */
public class City {

    private int city_id, country_id, state;
    private String name;
    private Connect con;
    
    public City(){
        con= new Connect();
    }
    
    public int getCity_id() {
        return city_id;
    }

    public void setCity_id(int city_id) {
        this.city_id = city_id;
    }

    public int getCountry_id() {
        return country_id;
    }

    public void setCountry_id(int country_id) {
        this.country_id = country_id;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    public void newElement(){
        con.setInsert("INSERT into cities(name, country_id, state) values('"+this.name+",'"+this.country_id+"',1)");
    }
    
    public void delElement(){
       con.setInsert("UPDATE cities set state=0 where city_id="+this.city_id+"");
    }
    
    public void updElement(){
        con.setInsert("UPDATE cities set name='"+this.name+"', country_id='"+this.country_id+"' where city_id="+this.city_id+"");
    }
    
    public ResultSet showAll() {
        con = new Connect();
        con.setConsult("select p.name, p.country_id, p.city_id, p.state, u.user as creador from cities as p left join countries as c on c.country_id=p.country_id");
        ResultSet rs=con.getResult();
        return rs;
        
    }
}
