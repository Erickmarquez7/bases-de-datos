/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package veterinaria.projectomaven.Servicio;

import veterinaria.projectomaven.Modelo.Accesorio;
import veterinaria.projectomaven.Repositorio.AccesorioRepositorio;
import java.util.List;

/**
 * Clase que se encarga de hacer CRUD con los accesorios
 */
public class AccesorioServicio {

    private AccesorioRepositorio accesorioRepositorio = new AccesorioRepositorio();

    /**
     * Método que se encarga de obtener a todos los accesorios.
     * @return List -- La lista de los accesorios.
     * @throws Exception -- En caso de que suceda algún error.
     */
    public List<Accesorio> getAccesorios() throws Exception {
        return accesorioRepositorio.getAccesorios();
    }

    /**
     * Método que se encarga de insertar un accesorio.
     * @param accesorio -- El accesorio a insertar.
     * @throws Exception -- En caso de que suceda algún error.
     */
    public void insertarAccesorio(Accesorio accesorio) throws Exception {
        accesorioRepositorio.insertarAccesorio(accesorio);
    }

    /**
     * Método que se encarga de obtener un accesorio.
     * @param idProducto -- El id del accesorio a obtener.
     * @return Accesorio -- El accesorio a buscar.
     * @throws Exception -- En caso de que ocurra algún error.
     */
    public Accesorio getAccesorio(String idProducto) throws Exception {
        return accesorioRepositorio.getAccesorio(idProducto);
    }

    /**
     * Método que actualiza un accesorio.
     * @param idProducto -- El id del accesorio a actualizar.
     * @param accesorio -- Los valores nuevos a actualizar del accesorio.
     * @throws Exception -- En caso de que ocurra algún error.
     */
    public void actualizarAccesorio(String idProducto, Accesorio accesorio) throws Exception {
        accesorioRepositorio.actualizarAccesorio(idProducto, accesorio);
    }

    /**
     * Método que borra un accesorio.
     * @param idProducto -- El id del accesorio a borrar.
     * @throws Exception -- En caso de que ocurra algún error.
     */
    public void borrarAccesorio(String idProducto) throws Exception {
        accesorioRepositorio.borrarAccesorio(idProducto);
    }
}
