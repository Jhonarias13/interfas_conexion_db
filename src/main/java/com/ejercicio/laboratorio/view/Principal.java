package com.ejercicio.laboratorio.view;

import com.ejercicio.laboratorio.service.ConexionService;

import javax.swing.*;
import java.awt.*;

public class Principal extends JPanel {

    private final int FILAS = 6;
    private final int COLUMNAS = 1;
    private final int ESPACIO_HORIZONTAL = 10;
    private final int ESPACIO_VERTICAL = 0;

    private ConexionService conexionService;

    public Principal(ConexionService conexionService){
        this.conexionService = conexionService;


        setLayout(new BorderLayout(15, 20));
        setBorder(BorderFactory.createEmptyBorder(20,30, 20, 30));

        JLabel lblTitulo = new JLabel("INICIAR CONEXION");
        lblTitulo.setFont(new Font("Arial", Font.BOLD, 24));
        lblTitulo.setHorizontalAlignment(SwingConstants.CENTER);

        JPanel panelFormulario = new JPanel();
        panelFormulario.setLayout(new GridLayout(FILAS, COLUMNAS, ESPACIO_HORIZONTAL, ESPACIO_VERTICAL));

        JLabel lblUrl = new JLabel("URL de conexion: ");
        JTextField txtUrl = new JTextField();
        txtUrl.setPreferredSize(new Dimension(200, 10));

        JLabel lblNombreUsuario = new JLabel("Nombre de usuario: ");
        JTextField txtNombreUsuario = new JTextField();
        txtUrl.setPreferredSize(new Dimension(200, 10));

        JLabel lblClave = new JLabel("Contraseña: ");
        JPasswordField txtClave = new JPasswordField();
        txtUrl.setPreferredSize(new Dimension(200, 10));

        JPanel panelBoton = new JPanel();
        panelBoton.setLayout(new GridLayout(2, 1, ESPACIO_HORIZONTAL, ESPACIO_VERTICAL));
        JButton bntConectar = new JButton("Probar conexion");


        JTextArea textArea = new JTextArea();

        textArea.setLineWrap(true);
        textArea.setWrapStyleWord(true);

        JScrollPane scrollPane = new JScrollPane(textArea);

        scrollPane.setPreferredSize(new Dimension(200, 30));

        panelBoton.add(bntConectar);
        panelBoton.add(scrollPane);

        panelFormulario.add(lblUrl);
        panelFormulario.add(txtUrl);

        panelFormulario.add(lblNombreUsuario);
        panelFormulario.add(txtNombreUsuario);

        panelFormulario.add(lblClave);
        panelFormulario.add(txtClave);

        add(lblTitulo, BorderLayout.NORTH);
        add(panelFormulario, BorderLayout.CENTER);
        add(panelBoton, BorderLayout.SOUTH);


        bntConectar.addActionListener(e ->{
            System.out.println(">> Clic");
            if (txtUrl.getText() == null || txtUrl.getText().isBlank()){
                JOptionPane.showMessageDialog(null, "Debe digitar una URL de conexion.", "Error", JOptionPane.ERROR_MESSAGE);
            }else
            if (txtNombreUsuario.getText() == null || txtNombreUsuario.getText().isBlank()){
                JOptionPane.showMessageDialog(null, "Debe digitar un nombre de usuario.", "Error", JOptionPane.ERROR_MESSAGE);
            }else
            if(txtClave.getPassword() == null || txtClave.getPassword().length == 0){
                JOptionPane.showMessageDialog(null, "Debe digitar una clave", "Error", JOptionPane.ERROR_MESSAGE);
            }else{
                String mensajeConexion = conexionService.probarConexion(txtUrl.getText(), txtNombreUsuario.getText(), new String(txtClave.getPassword()));

                if ("OK".equals(mensajeConexion)){
                    textArea.setText("Conexion exitosa.");
                    textArea.setBackground(Color.GREEN);
                }else {
                    textArea.setText(mensajeConexion);
                    textArea.setBackground(Color.RED);
                }

            }
        });
    }


}
