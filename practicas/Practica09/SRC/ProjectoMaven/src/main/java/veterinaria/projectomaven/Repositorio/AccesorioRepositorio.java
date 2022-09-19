/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package veterinaria.projectomaven.Repositorio;

import veterinaria.projectomaven.Conexion.ConexionBD;
import veterinaria.projectomaven.Modelo.Accesorio;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * Clase que se encarga de obtener información acerca de los accesorios en la
 * base de datos.
 */
public class AccesorioRepositorio {

    private ConexionBD conexionBD = new ConexionBD();
    //Objeto para ejecutar queries
    private Statement stmt;
    //Objeto para prepara un querie para su ejecucion
    private PreparedStatement ps;

    /**
     * Método que se conecta a la base de datos y obtiene todas las entradas de los accesorios.
     * @return List -- Una lista de accesorios.
     * @throws SQLException -- Excepcion que sale si no se logra a hacer la query de la consulta o la conexión.
     */
    public List<Accesorio> getAccesorios() throws SQLException {
        String query = "SELECT * FROM accesorio"; //Escribimos nuestra query
        List accesorioLista = new ArrayList<Accesorio>();
        try {
            //Nos conectamos a la base de datos
            conexionBD.conectar();
            //Preparamos la base de datos
            stmt = conexionBD.prepararDeclaracion();
            //Ejecuto mi query y me regresa un iterador
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                Accesorio ac = new Accesorio(
                        rs.getString("idProducto"),
                        rs.getString("nombre"),
                        rs.getFloat("precio"),
                        rs.getInt("numUnidades"),
                        rs.getString("descripcion"),
                        rs.getString("nombreArchivo"));
                //Agrego el resultado
                accesorioLista.add(ac);
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
        return accesorioLista;
    }

    /**
     * Metodo que obtiene a un accesorio dentro de la base a partir de su id.
     * @param idProducto -- El id del accesorio a buscar
     * @return Accesorio -- El accesorio en caso de encontrarse null, en otro caso.
     * @throws SQLException --Excepcion que sale si no se logra a hacer la query
     * de la consulta o la conexion.
     */
    public Accesorio getAccesorio(String idProducto) throws SQLException {
        String query = "SELECT * FROM accesorio WHERE idProducto = ?";
        Accesorio ac = null;
        try {
            //Conectamos a la Base
            conexionBD.conectar();
            //Preparamos la Base para la consulta
            ps = conexionBD.prepararDeclaracionPreparada(query);
            //Modificamos la consulta, para ver que sustituira
            ps.setString(1, idProducto);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ac = new Accesorio(
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
        return ac;
    }

    /**
     * Método que inserta un accesorio dentro de la base de datos.
     * @param accesorio -- El accesorio que deseamos insertar en la base de datos.
     */
    public void insertarAccesorio(Accesorio accesorio) {
        String query = "INSERT INTO accesorio "
                + "(idProducto, nombre, precio, numUnidades, descripcion, nombreArchivo)"
                + " VALUES (?,?,?,?,?,?)";
        try {
            conexionBD.conectar();
            ps = conexionBD.prepararDeclaracionPreparada(query);
            ps.setString(1, accesorio.getIdProducto());
            ps.setString(2, accesorio.getNombre());
            ps.setFloat(3, accesorio.getPrecio());
            ps.setInt(4, accesorio.getNumUnidades());
            ps.setString(5, accesorio.getDescripcion());
            ps.setString(6, accesorio.getNombreArchivo());
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
     * Método que actualiza un accesorio dentro de la base de datos.
     * @param idProducto -- El id del producto a buscar para actualizar
     * @param accesorio -- El accesorio que vamos a intercambiar sus valores
     */
    public void actualizarAccesorio(String idProducto, Accesorio accesorio) {
        String query = "UPDATE accesorio SET idProducto = ?, nombre = ?, "
                + "precio = ?, numUnidades = ?, "
                + "descripcion = ?, nombreArchivo = ? WHERE idProducto = ?";
        try {
            conexionBD.conectar();;
            ps = conexionBD.prepararDeclaracionPreparada(query);
            ps.setString(1, accesorio.getIdProducto());
            ps.setString(2, accesorio.getNombre());
            ps.setFloat(3, accesorio.getPrecio());
            ps.setInt(4, accesorio.getNumUnidades());
            ps.setString(5, accesorio.getDescripcion());
            ps.setString(6, accesorio.getNombreArchivo());
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
     * Método para borrar un accesorio.
     * @param idProducto -- id del accesorio a eliminar
     * @return Boolean -- true si se realizo, false en caso contrario.
     */
    public Boolean borrarAccesorio(String idProducto) {
        String query = "DELETE FROM accesorio WHERE idProducto = ?";
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
