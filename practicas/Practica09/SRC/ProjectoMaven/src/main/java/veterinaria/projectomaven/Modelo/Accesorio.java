/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package veterinaria.projectomaven.Modelo;

/**
 * Clase que representa a un accesorio
 */
public class Accesorio {

    private String idProducto;
    private String nombre;
    private float precio;
    private int numUnidades;
    private String descripcion;
    private String nombreArchivo;

    /**
     * Constructor por parametros que crea un accesorio
     *
     * @param idProducto -- El id del accesorio
     * @param nombre -- El nombre del accesorio
     * @param precio -- El precio del accesorio
     * @param numUnidades -- El numero de unidades del accesorio
     * @param descripcion -- La descripcion del accesorio
     * @param nombreArchivo -- El nombre del accesorio en archivo
     */
    public Accesorio(String idProducto, String nombre, float precio, int numUnidades, String descripcion, String nombreArchivo) {
        this.idProducto = idProducto;
        this.nombre = nombre;
        this.precio = precio;
        this.numUnidades = numUnidades;
        this.descripcion = descripcion;
        this.nombreArchivo = nombreArchivo;
    }

    /**
     * Método getIdProducto que obtiene el id del producto.
     * @return String -- el id del producto
     */
    public String getIdProducto() {
        return idProducto;
    }

    /**
     * Método set que define un nuevo id del producto.
     * @param idProducto -- El nuevo id del producto
     */
    public void setIdProducto(String idProducto) {
        this.idProducto = idProducto;
    }

    /**
     * Método getNombre que obtiene el nombre del producto.
     * @return String -- el nombre del producto
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * Método set que define un nuevo nombre del producto.
     * @param nombre -- El nuevo nombre del producto
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * Método getPrecio que obtiene el precio del producto.
     * @return float -- el precio del producto
     */
    public float getPrecio() {
        return precio;
    }

    /**
     * Método set que define el nuevo precio del producto.
     * @param precio -- El nuevo precio del producto
     */
    public void setPrecio(float precio) {
        this.precio = precio;
    }

    /**
     * Método getNumUnidades que obtiene el numero de unidades del producto.
     * @return int -- el numero de unidades del producto
     */
    public int getNumUnidades() {
        return numUnidades;
    }

    /**
     * Método set que define el nuevo numero de unidades del producto.
     * @param numUnidades -- El nuevo numero de unidades del producto
     */
    public void setNumUnidades(int numUnidades) {
        this.numUnidades = numUnidades;
    }

    /**
     * Método getDescripcion que obtiene la descripcion del producto.
     * @return String -- la descripcion del producto
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * Método set que define la nueva descripcion del producto.
     * @param descripcion -- La nueva descripcion del producto
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    /**
     * Método getNombreArchivo que obtiene el nombre en archivo del producto.
     * @return String -- el nombre en archivo del producto
     */
    public String getNombreArchivo() {
        return nombreArchivo;
    }

    /**
     * Método set que define el nuevo nombre en archivo del producto.
     * @param nombreArchivo -- El nuevo nombre en archivo del producto
     */
    public void setNombreArchivo(String nombreArchivo) {
        this.nombreArchivo = nombreArchivo;
    }

    /**
     * Método toString que imprime un accesorio.
     * @return String -- lo que define a un accesorio.
     */
    @Override
    public String toString() {
        return "\n Accesorio{" + "idProducto=" + idProducto + ", nombre=" + nombre + ", precio=" + precio + ", numUnidades=" + numUnidades + ", descripcion=" + descripcion + ", nombreArchivo=" + nombreArchivo + '}';
    }
}
