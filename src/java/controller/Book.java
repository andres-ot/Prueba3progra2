package controller;

import java.sql.ResultSet;
import model.Connect;

public class Book {

    Connect con;

    public Book() {
        con = new Connect();
    }

    private int book_id, pages, auth_id,created_by;
    private String name, isbn, state, publish_date;

    

    
    
    public int getBook_id() {
        return book_id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public int getPages() {
        return pages;
    }

    public void setPages(int pages) {
        this.pages = pages;
    }

    public int getAuth_id() {
        return auth_id;
    }

    public void setAuth_id(int auth_id) {
        this.auth_id = auth_id;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public int getCreated_by() {
        return created_by;
    }

    public void setCreated_by(int created_by) {
        this.created_by = created_by;
    }

    public String getPublish_date() {
        return publish_date;
    }

    public void setPublish_date(String publish_date) {
        this.publish_date = publish_date;
    }

    public void newElement() {
        con.setInsert("INSERT into books(name,isbn,publish_date,pages,author_id,created_by,state) values('" + this.name + "','" + this.isbn + "','" + this.publish_date + "'," + this.pages + "," + this.auth_id + "," + this.created_by + ",1)");
    }

    public void delElement() {
        con.setInsert("UPDATE books set state=0 where book_id=" + this.book_id + "");
    }

    public void updElement() {
        
        con.setInsert("UPDATE books set name='" + this.name + "',isbn='" + this.isbn + "',publish_date='" + this.publish_date + "',pages=" + this.pages + ",author_id=" + this.auth_id + ",created_by=" + this.created_by + " where book_id=" + this.book_id + "");
    }
    
    public ResultSet showAll() {
        
        con.setConsult("select * from books where state=1");
        ResultSet rs=con.getResult();
        
        return rs;
        
    }
    public ResultSet showEdit() {
        
        String query = "SELECT b.author_id, b.name as book_name, b.isbn, b.pages, b.publish_date ";
        String query2 ="c.user ";
        String query3 = "from books as b left join users as c on c.user_id=b.created_by ";
        String query4 = "where b.id ="+this.book_id;
        //con.setConsult("select * from books,authors where book_id='"+this.book_id+"' and state=1");
        con.setConsult(query+query2+query3+query4);
        ResultSet rs=con.getResult();
       
        return rs;
        
    }
    public ResultSet showAuths() {
        
        con.setConsult("select b.name, b.isbn, b.pages, b.publish_date, a.namre as aut_name, a.apepta, a.apemant from books as b join left authors as a on b.author_id = a.author_id where b.state=1");
        ResultSet rs=con.getResult();
       
        return rs;
        
    }
    public ResultSet showSearch(){
    
        con.setConsult("select * from books where name like '%" + this.name + "%' and state=1");
        ResultSet rs=con.getResult();
      
        return rs;
    }
    
}
