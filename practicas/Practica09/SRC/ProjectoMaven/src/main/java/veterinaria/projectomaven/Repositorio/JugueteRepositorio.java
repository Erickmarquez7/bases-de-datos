/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package veterinaria.projectomaven.Repositorio;

import veterinaria.projectomaven.Conexion.ConexionBD;
import veterinaria.projectomaven.Modelo.Juguete;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * Clase que se encarga de obtener informacion acerca de los juguetes en la base de datos.
 */
public class JugueteRepositorio {

    private ConexionBD conexionBD = new ConexionBD();
    //Objeto para ejecutar queries
    private Statement stmt;
    //Objeto para prepara un querie para su ejecucion
    private PreparedStatement ps;

    /**
     * Método que se conecta a la base de datos y obtiene todas las entradas de
     * los juguetes.
     * @return List -- Una lista de juguetes.
     * @throws SQLException -- Excepcion que sale si no se logra a hacer la
     * query de la consulta o la conexion
     */
    public List<Juguete> getJuguetes() throws SQLException {
        String query = "SELECT * FROM juguete"; //Escribimos nuestra query
        List jugueteLista = new ArrayList<Juguete>();
        try {
            //Nos conectamos a la base de datos
            conexionBD.conectar();
            //Preparamos la base de datos
            stmt = conexionBD.prepararDeclaracion();
            //Ejecuto mi query y me regresa un iterador
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                Juguete ju = new Juguete(
                        rs.getString("idProducto"),
                        rs.getString("nombre"),
                        rs.getFloat("precio"),
                        rs.getInt("numUnidades"),
                        rs.getString("descripcion"),
                        rs.getString("nombreArchivo"));
                //Agrego el resultado
                jugueteLista.add(ju);
            }
        } catch (SQLException sql) {
            sql.printStackTrace();
        } finally {
            try {
                conexionBD.cerrar();
            } catch (SQLException sql) {
                sql.printStackTrace();
            }
        }
        return jugueteLista;
    }

    /**
     * Método que obtiene a un juguete dentro de la base a partir de su id.
     * @param idProducto -- El id del juguete a buscar.
     * @return Juguete -- El juguete en caso de encontrarse null, en otro caso
     * @throws SQLException --Excepcion que sale si no se logra a hacer la query
     * de la consulta o la conexión.
     */
    public Juguete getJuguete(String idProducto) throws SQLException {
        String query = "SELECT * FROM juguete WHERE idProducto = ?";
        Juguete ju = null;
        try {
            //Conectamos a la Base
            conexionBD.conectar();
            //Preparamos la Base para la consulta
            ps = conexionBD.prepararDeclaracionPreparada(query);
            //Modificamos la consulta, para ver que sustituira
            ps.setString(1, idProducto);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ju = new Juguete(
                        rs.getString("idProducto"),
                        rs.getString("nombre"),
                        rs.getFloat("precio"),
                        rs.getInt("numUnidades"),
                        rs.getString("descripcion"),
                        rs.getString("nombreArchivo"));
            }
        } catch (SQLException sql) {
            sql.printStackTrace();
        } finally {
            try {
                conexionBD.cerrar();
            } catch (SQLException sql) {
                sql.printStackTrace();
            }
        }
        return ju;
    }

    /**
     * Método que inserta un juguete dentro de la base de datos
     * @param juguete -- El juguete que deseamos insertar en la base de datos
     */
    public void insertarJuguete(Juguete juguete) {
        String query = "INSERT INTO juguete "
                + "(idProducto, nombre, precio, numUnidades, descripcion, nombreArchivo)"
                + " VALUES (?,?,?,?,?,?)";
        try {
            conexionBD.conectar();
            ps = conexionBD.prepararDeclaracionPreparada(query);
            ps.setString(1, juguete.getIdProducto());
            ps.setString(2, juguete.getNombre());
            ps.setFloat(3, juguete.getPrecio());
            ps.setInt(4, juguete.getNumUnidades());
            ps.setString(5, juguete.getDescripcion());
            ps.setString(6, juguete.getNombreArchivo());
            ps.executeUpdate();    //Utilizamos esta instruccion para insertar y actualizar
        } catch (SQLException sql) {
            sql.printStackTrace();
        } finally {
            try {
                conexionBD.cerrar();
            } catch (SQLException sql) {
                sql.printStackTrace();
            }
        }
    }

    /**
     * Método que actualiza un juguete dentro de la base de datos.
     * @param idProducto -- El id del producto a buscar para actualizar
     * @param juguete -- El juguete que vamos a intercambiar sus valores
     */
    public void actualizarJuguete(String idProducto, Juguete juguete) {
        String query = "UPDATE juguete SET idProducto = ?, nombre = ?, "
                + "precio = ?, numUnidades = ?, "
                + "descripcion = ?, nombreArchivo = ? WHERE idProducto = ?";
        try {
            conexionBD.conectar();;
            ps = conexionBD.prepararDeclaracionPreparada(query);
            ps.setString(1, juguete.getIdProducto());
            ps.setString(2, juguete.getNombre());
            ps.setFloat(3, juguete.getPrecio());
            ps.setInt(4, juguete.getNumUnidades());
            ps.setString(5, juguete.getDescripcion());
            ps.setString(6, juguete.getNombreArchivo());
            ps.setString(7, idProducto);
            ps.executeUpdate();
        } catch (SQLException sql) {
            sql.printStackTrace();
        } finally {
            try {
                conexionBD.cerrar();
            } catch (SQLException sql) {
                sql.printStackTrace();
            }
        }
    }

    /**
     * Método para borrar un juguete.
     * @param idProducto -- id del juguete a eliminar
     * @return Boolean -- true si se realizo, false en caso contrario
     */
    public Boolean borrarJuguete(String idProducto) {
        String query = "DELETE FROM juguete WHERE idProducto = ?";
        boolean ok = false;
        try {
            conexionBD.conectar();
            ps = conexionBD.prepararDeclaracionPreparada(query);
            ps.setString(1, idProducto);
            ps.executeUpdate();
            ok = true;
        } catch (SQLException sql) {
            sql.printStackTrace();
        } finally {
            try {
                conexionBD.cerrar();
            } catch (SQLException sql) {
                sql.printStackTrace();
            }
        }
        return ok;
    }

}
