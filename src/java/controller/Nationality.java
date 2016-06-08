
package controller;

import java.sql.ResultSet;
import model.Connect;

public class Nationality {
    
    Connect con;
    
    public Nationality(){
      con = new Connect();  
    }
    
    private int nat_id;
    private String name,state;
    

    public int getNat_id() {
        return nat_id;
    }

    public void setNat_id(int nat_id) {
        this.nat_id = nat_id;
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
        con.setInsert("INSERT into nationalities(name,state) values('"+this.name+"',1)");
    }
    
    public void delElement(){
       con.setInsert("UPDATE nationalities set state=0 where nation_id="+this.nat_id+"");
    }
    
    public void updElement(){
        con.setInsert("UPDATE nationalities set name='"+this.name+"' where nation_id="+this.nat_id+"");
    }
    
    public ResultSet showAll() {
        
        con.setConsult("select * from nationalities where state=1");
        ResultSet rs=con.getResult();
        return rs;
        
    }
    public ResultSet showEdit() {
        
        con.setConsult("select * from nationalities where nation_id='"+this.nat_id+"' and state=1");
        ResultSet rs=con.getResult();
        return rs;
        
    }
    public ResultSet showSearch(){
    
        con.setConsult("select * from nationalities where name like '%" + this.name + "%' and state=1");
        ResultSet rs=con.getResult();
        return rs;
    }
}
