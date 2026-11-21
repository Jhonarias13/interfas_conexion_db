package com.ejercicio.laboratorio.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {

    private Conexion(){

    }

    public static String probarConexion(String url, String nombre, String clave ){

        try(Connection conexion = DriverManager.getConnection(url, nombre, clave)) {
            return "OK";
        }
        catch (SQLException e) {
            return "Error de conexion: " + e;
        }
    }
}
