package com.ejercicio.laboratorio.view;

import javax.swing.*;

public class Ventana extends JFrame {

    public Ventana(Principal principal){
        setTitle("Conexion DB");
        setSize(600, 400);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);

        add(principal);
        setVisible(true);

    }
}
