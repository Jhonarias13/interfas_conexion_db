package com.ejercicio.laboratorio;

import com.ejercicio.laboratorio.service.impl.ConexionServiceImpl;
import com.ejercicio.laboratorio.view.Principal;
import com.ejercicio.laboratorio.view.Ventana;

public class Main {
    public static void main(String[] args) {
        Ventana ventana = new Ventana(new Principal(new ConexionServiceImpl()));
    }
}