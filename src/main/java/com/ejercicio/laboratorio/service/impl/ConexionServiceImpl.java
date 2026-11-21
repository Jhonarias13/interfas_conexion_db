package com.ejercicio.laboratorio.service.impl;


import com.ejercicio.laboratorio.persistence.Conexion;
import com.ejercicio.laboratorio.service.ConexionService;

public class ConexionServiceImpl implements ConexionService {
    @Override
    public String probarConexion(String url, String nombre, String clave) {
        return Conexion.probarConexion(url, nombre, clave);
    }
}
