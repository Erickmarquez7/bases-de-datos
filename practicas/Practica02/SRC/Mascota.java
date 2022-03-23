/**
 * Práctica 02: "Sistema de Archivos vs. Bases de Datos"
 * Clase que representa a la Entidad Mascota.
 * @author Acosta Arzate Rubén
 * @author Bernal Márquez Erick
 * @author Cristobal Morales Karen
 * @author Garcia Toxqui Demian Oswaldo
 * @author  Robles Huerta Rosa Maria
 * @version 1.0, Marzo de 2022.
 */

public class Mascota {

    // ---------------- ATRIBUTOS --------------------

    /** Representa el identificador de la mascota. */
    private String id;

    /** Representa el nombre de la mascota. */
    private String nombre;

    /** Representa la edad de la mascota. */
    private int edad;

    /** Representa el peso de la mascota. */
    private int peso;

    /** Representa la especie de la mascota. */
    private String especie;

    /** Representa la raza de la mascota. */
    private String raza;

    /** Representa al nombre del dueño de la mascota. */
    private String nombreDueno;
    
    
    /**
     * Constructor por parametros que genera una Mascota.
     * @param id -- Identificador de la Mascota
     * @param nombre -- Nombre de la Mascota
     * @param edad -- Edad de la Mascota
     * @param peso -- Peso de la Mascota
     * @param especie -- especie de la Mascota
     * @param raza -- raza de la Mascota
     * @param nombreDueno -- Nombre del dueno de la Mascota
     */
    public Mascota(String id, String nombre, int edad, int peso, String especie, String raza, 
    String nombreDueno) {
        this.id = id;
        this.nombre = nombre;
        this.edad = edad;
        this.peso = peso;
        this.especie = especie;
        this.raza = raza;
        this.nombreDueno = nombreDueno;
    }

    /**
     * CONSTRUCTOR POR OMISIÓN.
     */
    public Mascota(){}

    /**
    * Metodo getId que obtiene el identificador de la Mascota
    * @return id -- El identificador de la Mascota
    */
    public String getId() {
        return id;
    }

    /**
     * Metodo setId que define el nuevo identidicador de la Mascota
     * @param id -- El nuevo identificador de la Mascota
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
    * Metodo getNombre que obtiene el nombre de la Mascota
    * @return nombre -- El nombre de la Mascota
    */
    public String getNombre() {
        return nombre;
    }

    /**
     * Metodo setNombre que define el nuevo nombre de la Mascota
     * @param nombre -- El nuevo nombre de la Mascota
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }


    /**
    * Metodo getEdad que obtiene la edad de la Mascota
    * @return edad -- La edad de la Mascota
    */
    public int getEdad() {
        return edad;
    }

    /**
     * Metodo setEdad que define la nueva edad de la Mascota
     * @param edad -- La nueva edad de la Mascota
     */
    public void setEdad(int edad) {
        this.edad = edad;
    }


    /**
    * Metodo getPeso que obtiene el peso de la Mascota
    * @return peso -- El peso de la Mascota
    */
    public int getPeso() {
        return peso;
    }

    /**
     * Metodo setPeso que define el nuevo peso de la Mascota
     * @param peso -- El nuevo peso de la Mascota
     */
    public void setPeso(int peso) {
        this.peso = peso;
    }


    /**
    * Metodo getEspecia que obtiene la especie de la Mascota
    * @return especie -- La especia de la Mascota
    */
    public String getEspecie() {
        return especie;
    }

    /**
     * Metodo setEspecie que define la nueva especie de la Mascota
     * @param especia -- La nueva especie de la Mascota
     */
    public void setEspecie(String especie) {
        this.especie = especie;
    }


    /**
    * Metodo getRaza que obtiene la raza de la Mascota
    * @return raza -- La raza de la Mascota
    */
    public String getRaza() {
        return raza;
    }

    /**
     * Metodo setRaza que define la nueva de la Mascota
     * @param raza -- La nueva raza de la Mascota
     */
    public void setRaza(String raza) {
        this.raza = raza;
    }

    
    /**
    * Metodo getNombreDueno que obtiene el nombre del dueno de la Mascota
    * @return nombreDueno -- El nombre del dueno de la Mascota
    */
    public String getNombreDueno() {
        return nombreDueno;
    }

    /**
     * Metodo setDueno que define el nuevo nombre del dueno de la Mascota
     * @param nombreDueno -- El nuevo nombre del dueno de la Mascota
     */
    public void setNombreDueno(String nombreDueno) {
        this.nombreDueno = nombreDueno;
    }

    /**
     * Metodo ToString de Mascota.
     * @return Regresa la representación de una mascota para generar el CSV.
     */
    @Override
    public String toString() {
        return this.id + "," + this.nombre + "," + this.edad + "," + this.peso + "," 
        + this.especie + "," + this.raza + "," + this.nombreDueno;
    }

    /**
     * Método que imprime de manera amigable los datos de la mascota.
     */
    public void imprimeMascota(){
        String YELLOW = "\033[33m";
        String GREEN = "\u001B[32m";
        String RESET = "\u001B[0m"; 
        System.out.println(GREEN + "______________________________________ \n" + RESET);
        System.out.println(YELLOW + "   MASCOTA " + RESET);
        System.out.println(" Nombre: " + nombre);
        System.out.println(" Id: " + id);
        System.out.println(" Edad: " + edad);
        System.out.println(" Peso: " + peso);
        System.out.println(" Especie: " + especie);
        System.out.println(" Raza: " + raza);
        System.out.println(" Nombre del dueño: " + nombreDueno);
    }
}