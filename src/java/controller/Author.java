package controller;

import model.Connect;

public class Author {

    Connect con;

    public Author() {
        con = new Connect();
    }

    private int auth_id, nat_id;
    private String name, fname, lname, birth_date, state;

    public int getAuth_id() {
        return auth_id;
    }

    public void setAuth_id(int auth_id) {
        this.auth_id = auth_id;
    }

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

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
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

    public void setState(String state) {
        this.state = state;
    }

    public void newElement() {
        con.setInsert("INSERT into authors(name,apepat,apemat,birth_date,state,nationality_id) values('" + this.name + "','" + this.fname + "','" + this.lname + "','" + this.birth_date + "',1," + this.nat_id + ")");
    }

    public void delElement() {
        con.setInsert("UPDATE authors set state=0 where author_id=" + this.auth_id + "");
    }

    public void updElement() {
        con.setInsert("UPDATE authors set name='"+this.name+"',apepat='"+this.fname+"',apemat='"+this.lname+"',birth_date='"+this.birth_date+"',nationality_id="+this.nat_id+" where author_id="+this.auth_id+"");
    }


}
