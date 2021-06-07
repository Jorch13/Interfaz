/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interfaz;

//Zona de imports
import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;

/**
 *
 * @author jorge
 */
public class AppInterfaz {

    //Variables para la conexión a la BD
    static Connection con = null;
    static Statement sentencia;
    static ResultSet resultado;
    //Variables para la ventana
    JFrame f;
    FlowLayout flow;
    JButton buscar;
    JPanel p;
    JTextField texto;
    JScrollPane js;
    JTable rConsul;

    //Constructor de la ventana
    AppInterfaz() {

        p = new JPanel(); //Panel para texto y boton buscar
        texto = new JTextField(); //Campo de texto
        buscar = new JButton("Buscar DNI"); //Boton de buscar
        flow = new FlowLayout(FlowLayout.CENTER, 5, 30); //Ajustamos el layout del panel

        p.add(texto); //Añadimos el texto al panel
        p.add(buscar); //Añadimos el boton al panel
        p.setLayout(flow); //Seleccionamos el layout para el panel

        js = new JScrollPane(); //Panel que se usará para la tabla de resultados

        f = new JFrame("Buscar ventas JM"); //Creamos el frame (ventana)
        f.add(p, "North"); //Añadimos el panel a la ventana, arriba
        f.setVisible(true); //Hacemos la ventana visible 
        f.setSize(600, 400); //Aplicamos el tamano de la ventana con el metodo setSize

        f.setLocationRelativeTo(null); //Colocamos la ventana en el centro de la pantalla

        //Creamos el escuchador para el boton de buscar
        ActionListener escuchador = new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                int i = Integer.parseInt(texto.getText()); //Convertimos el texto a entero
                buscar_dni(i); //Llamada al metodo para buscar ese DNI
            }
        };
        buscar.addActionListener(escuchador); //Añadimos el escuchador al boton de buscar

        //Hacemos que la ventana se cierre al clicar en la cruz
        f.addWindowListener(new WindowAdapter() {
            @Override
            public void windowClosing(WindowEvent e) {
                f.dispose();
            }
        });
    }

    //Metodo para conectar con la base de datos
    public void conectar() {
        //Comprobamos que conecta con un try catch
        try {
            String url = "jdbc:mariadb://localhost:3306/automoviles"; //Localizacion de la BD
            con = DriverManager.getConnection(url, "root", ""); //Conexion a la base
            System.out.println("Conectado");
        } catch (Exception e) {
            System.out.println("No conectado" + e);
        }
    }

    //Metodo para buscar por DNI
    public void buscar_dni(int dni) {
        conectar(); //Conectamos a la BD
        String a = "SELECT count(*) FROM ventas" + " WHERE dni='" + dni + "'"; //Usamos este string para la consulta de la longitud
        String q = "SELECT * FROM ventas" + " WHERE dni='" + dni + "'"; //Este lo usamos para la consulta de los datos
        try {
            sentencia = con.createStatement(); //Creamos una sentencia a partir de la conexión 
            resultado = sentencia.executeQuery(a); //Obtenemos la consulta, que devuelve la longitud
            resultado.next(); // Hay que avanzar el cursor para obtenerlo
            int dim = resultado.getInt(1); //Guardamos las dimensiones en una variable
            String[][] ventas = new String[dim][4]; //Creamos un array de dos dimensiones para los resultados
            resultado = sentencia.executeQuery(q); //Obtenemos la consulta que devuelve los datos
            int i = 0; //Contador
            //Añade los resultados al array de strings ventas
            //Para que se repita si un mismo DNI tiene varias ventas
            while (resultado.next()) {
                ventas[i][0] = resultado.getString(1);
                ventas[i][1] = resultado.getString(2);
                ventas[i][2] = resultado.getString(3);
                ventas[i][3] = resultado.getString(4);
                i++;
            }
            String columnas[] = {"CIFC", "DNI", "CODCOCHE", "COLOR"}; //Nombramos las columnas de la tabla (cabecera)
            rConsul = new JTable(ventas, columnas); //Creamos la tabla con los datos y sus cabeceras
            rConsul.setBounds(50, 150, 200, 200); //Establecemos la localizacion de la tabla
            js.setViewportView(rConsul); //Poner la etiqueta en el contenedor
            f.add(js, BorderLayout.CENTER); //Añadimos los componentes a la ventana
            f.setVisible(true); //Hacemos visible el JFrame

            System.out.println("Correcto"); //Mostramos el mensaje de que ha ido bien
        } catch (Exception e) {
            System.out.println(e);
        }
        //Cerramos el flujo de datos con la BD
        try{
            con.close();
            System.out.println("Conexion con la BD cerrada");
        } catch (Exception e){
            System.out.println("Error al cerrar la conexion: "+e);
        }
    }

    public static void main(String[] args) {
        AppInterfaz v = new AppInterfaz();
    }

}
