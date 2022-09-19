/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package veterinaria.projectomaven.Servicio;

import veterinaria.projectomaven.Modelo.Juguete;
import veterinaria.projectomaven.Repositorio.JugueteRepositorio;
import java.util.List;

/**
 * Clase que se encarga de hacer CRUD con los juguetes
 */
public class JugueteServicio {

    private JugueteRepositorio jugueteRepositorio = new JugueteRepositorio();

    /**
     * Método que se encarga de obtener a todos los juguetes.
     * @return List -- La lista de los juguetes
     * @throws Exception -- En caso de que suceda algún error.
     */
    public List<Juguete> getJuguetes() throws Exception {
        return jugueteRepositorio.getJuguetes();
    }

    /**
     * Método que se encarga de insertar un juguete.
     * @param juguete -- El juguete a insertar.
     * @throws Exception -- En caso de que suceda algún error.
     */
    public void insertarJuguete(Juguete juguete) throws Exception {
        jugueteRepositorio.insertarJuguete(juguete);
    }

    /**
     * Método que se encarga de obtener un juguete.
     * @param idProducto -- El id del juguete a obtener.
     * @return Juguete -- el juguete a buscar.
     * @throws Exception -- En caso de que ocurra algún error.
     */
    public Juguete getJuguete(String idProducto) throws Exception {
        return jugueteRepositorio.getJuguete(idProducto);
    }

    /**
     * Método que actualiza un juguete.
     * @param idProducto -- El id del juguete a buscar.
     * @param juguete -- Los valores nuevos a actualizar del juguete.
     * @throws Exception -- En caso de que ocurra algún error.
     */
    public void actualizarJuguete(String idProducto, Juguete juguete) throws Exception {
        jugueteRepositorio.actualizarJuguete(idProducto, juguete);
    }

    /**
     * Metodo que borra un juguete.
     * @param idProducto -- El id del juguete a borrar.
     * @throws Exception -- En caso de que ocurra algún error.
     */
    public void borrarJuguete(String idProducto) throws Exception {
        jugueteRepositorio.borrarJuguete(idProducto);
    }
}
