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

    public void newElement() {
        con = new Connect();
        con.setInsert("INSERT into cities(name,country_id,state) values('"+this.name+"','"+this.country_id+"',1)");
    }

    public void delElement() {
        con = new Connect();
        con.setInsert("UPDATE cities set state=0 where city_id=" + this.city_id + "");
    }

    public void updElement() {
        con = new Connect();
        con.setInsert("UPDATE cities set name='" + this.name + "', country_id='" + this.country_id + "' where city_id=" + this.city_id + "");
    }

    public ResultSet showAll() {
        con = new Connect();
        con.setConsult("select * from cities where state=1");
        ResultSet rs = con.getResult();
        return rs;

    }

    public ResultSet showAllFrom(int pais_id) {
        con = new Connect();
        con.setConsult("select * from cities where country_id = " + pais_id);
        ResultSet rs = con.getResult();
        return rs;

    }
}
