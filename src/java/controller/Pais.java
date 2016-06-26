/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.sql.ResultSet;

/**
 *
 * @author fabian
 */
public class Pais {
    private int pais_id, creado_por;
    private String nombre, estado;

    public int getPais_id() {
        return pais_id;
    }

    public void setPais_id(int pais_id) {
        this.pais_id = pais_id;
    }

    public int getCreado_por() {
        return creado_por;
    }

    public void setCreado_por(int creado_por) {
        this.creado_por = creado_por;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
    public void crear()
    {
        
    }
    
    public void editar()
    {
        
    }
    
    public void eliminar()
    {
        
    }
    
    public ResultSet getAll()
    {
        ResultSet rs = null;
        return rs;
    }
}
