/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package veterinaria.projectomaven.Conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Clase que se encarga de conectar con la base de datos en postgresql
 */
public class ConexionBD {

    Connection conexionBD = null;

    /**
     * Método que se encarga de conectar.
     * @throws SQLException -- Si no se logra conectar lanza un error.
     */
    public void conectar() throws SQLException {
        String jdbc = "jdbc:postgresql://localhost:5432/postgres";
        conexionBD = DriverManager.getConnection(jdbc, "postgres", "lomito");
    }

    /**
     * Método que se encarga de cerrar la conexión.
     * @throws SQLException -- Si no se logra cerrar lanza un error.
     */
    public void cerrar() throws SQLException {
        conexionBD.close();
    }

    /**
     * Método que se encarga de preparar la base de datos para recibir una sentencia.
     * @return Statement -- Objeto que utilizaremos para crear sentencias sql.
     * @throws SQLException -- Si no se logra preparar lanza un error.
     */
    public Statement prepararDeclaracion() throws SQLException {
        return conexionBD.createStatement();
    }

    /**
     * Método que se encarga de preparar la base de datos para recibir una sentencia preparada.
     * @param query -- La query que modificaremos en caso de necesitar parametros.
     * @return PreparedStatement -- Objeto que utilizaremos para las sentencias sql.
     * @throws SQLException -- Si no se logra prepara lanza un error
     */
    public PreparedStatement prepararDeclaracionPreparada(String query) throws SQLException {
        return conexionBD.prepareStatement(query);
    }
}
