import java.util.ArrayList;

/**
 * Práctica 02: "Sistema de Archivos vs. Bases de Datos"
 * Clase que representa a la Entidad Estética Veterinaria.
 * @author Acosta Arzate Rubén
 * @author Bernal Márquez Erick
 * @author Cristobal Morales Karen
 * @author Garcia Toxqui Demian Oswaldo
 * @author  Robles Huerta Rosa Maria
 * @version 1.0, Marzo de 2022.
 */
public class Estetica {

    // ---------------- ATRIBUTOS --------------------

    /** Representa el identificador de la Estética Veterinaria. */
    private String id;

    /** Representa el nombre de la Estética Veterinaria. */
    private String nombre;

    /** DIRECCIÓN. El estado donde está ubicada la Estética Veterinaria. */
    private String estado;

    /** DIRECCIÓN. La calle donde está ubicada la Estética Veterinaria. */
    private String calle;

    /** DIRECCIÓN. El número donde está ubicada la Estética Veterinaria. */
    private int numero;

    /** DIRECCIÓN. El código Postal donde está ubicada la Estética Veterinaria. */
    private int codigoP;

    /** Representa el número telefónico de la Estética Veterinaria. */
    private long telefono;

    /** Representa el horario en el que atiende la Estética Veterinaria. */
    private String horario;

    /** Representa las ganancias de la Estética Veterinaria. */
    private int ganancias;

    /** Representa el número de consultorios que hay en la Estética Veterinaria. */
    private int consultorios;


    /**
     * Constructor por parametros que genera una Estetica.
     * @param id -- Identificador de la Estetica
     * @param nombre -- Nombre de la Estetica
     * @param estado -- Estado del domicilio de la Estetica
     * @param calle -- Estado del domicilio de la Estetica
     * @param numero -- Numero del domicilio de la Estetica
     * @param CodigoP -- Codigo Postal de la Estetica
     * @param telefono -- Telefono de la Estetica
     * @param horario -- Horario de la Estetica
     * @param ganancias -- Ganancias de la Estetica
     * @param consultorios -- Número de consultorios de la Estetica
     */

    public Estetica(String id, String nombre, String estado, String calle, int numero, 
        int codigoP, long telefono, String horario, int ganancias, int consultorios) {
        this.id = id;
        this.nombre = nombre;
        this.estado = estado;
        this.calle = calle;
        this.numero = numero;
        this.codigoP = codigoP;
        this.telefono= telefono;
        this.horario = horario;
        this.ganancias = ganancias;
        this.consultorios= consultorios;
    }

    /**
     * CONSTRUCTOR POR OMISIÓN.
     */
    public Estetica(){}

    /**
    * Metodo getId que obtiene el id de la Estetica
    * @return id -- El identificador de la Estetica
    */
    public String getId() {
        return id;
    }

    /**
     * Metodo setId que define el nuevo identificador de la Estetica
     * @param id -- El nuevo identificador de la Estetica
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
    * Metodo getNombre que obtiene el nombre de la Estetica
    * @return nombre -- El nombre de la Estetica
    */
    public String getNombre() {
        return nombre;
    }

    /**
     * Metodo setNombre que define el nuevo nombre de la Estetica
     * @param nombre -- El nuevo nombre de la Estetica
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * Metodo getEstado que obtiene el estado de la Estetica
     * @return estado -- El estado de la Estetica
     */
    public String getEstado() {
        return estado;
    }

    /**
     * Metodo setEstado que define el Estado del Domicilio de la Estetica
     * @param estado -- El nuevo estado de la Estetica
     */
    public void setEstado(String estado) {
        this.estado = estado;
    }

    /**
     * Metodo getCalle que obtiene la calle de la Estetica
     * @return calle -- La calle de la Estetica
     */
    public String getCalle() {
        return calle;
    }

    /**
     * Metodo setCalle que define la calle del Domicilio de la Estetica
     * @param calle -- La nueva calle de la Estetica
     */
    public void setCalle(String calle) {
        this.calle = calle;
    }

    /**
     * Metodo getNumero que obtiene el numero de la Estetica
     * @return numero -- el numero de la Estetica
     */
    public int getNumero() {
        return numero;
    }

    /**
     * Metodo setNumero que define el numero del Domicilio de la Estetica
     * @param numero -- El nuevo numero de la Estetica
     */
    public void setNumero(int numero) {
        this.numero = numero;
    }

    /**
     * Metodo getCodigoP que obtiene el codigo postal de la Estetica
     * @return codigoP -- el codigo postal de la Estetica
     */
    public int getCodigoP() {
        return codigoP;
    }

    /**
     * Metodo setCodigoP que define el codigo postal del Domicilio de la Estetica
     * @param codigoP -- El nuevo codigo postal de la Estetica
     */
    public void setCodigoP(int codigoP) {
        this.codigoP = codigoP;
    }


    public String getHorario() {
        return horario;
    }


    public void setHorario(String horario) {
        this.horario = horario;
    }


    public int getGanancias() {
        return ganancias;
    }


    public void setGanancias(int ganancias) {
        this.ganancias = ganancias;
    }
    
    public int getConsultorios(){
        return consultorios;   
    }
    
    public void setConsultorios(int consultorios){
        this.consultorios = consultorios;   
    }
    
    public long getTelefono(){
        return telefono;
    }
    
    public void setTelefono(long telefono){
        this.telefono = telefono;
    }

    /**
     * Metodo ToString de la Estética.
     * @return Regresa la representación de una estética para generar el CSV.
     */
    @Override
    public String toString() {
        return this.id + "," + this.nombre + "," + this.estado + "," + this.calle + "," + this.numero + "," 
        + this.codigoP + "," + this.telefono + "," + this.horario + "," + this.ganancias + "," + this.consultorios;
    }

    /**
     * Método que imprime de manera amigable los datos de la estética.
     */
    public void imprimeEstetica(){
        String YELLOW = "\033[33m";
        String GREEN = "\u001B[32m";
        String RESET = "\u001B[0m"; 
        System.out.println(GREEN + "______________________________________ \n" + RESET);
        System.out.println(YELLOW + "   ESTÉTICA VETERINARIA " + RESET);
        System.out.println(" Nombre: " + nombre);
        System.out.println(" Id: " + id);
        System.out.println(" Estado: " + estado);
        System.out.println(" Calle: " + calle);
        System.out.println(" Número: " + numero);
        System.out.println(" Código Postal: " + codigoP);
        System.out.println(" Teléfono: " + telefono);
        System.out.println(" Horario: " + horario);
        System.out.println(" Ganancias: " + ganancias);
        System.out.println(" Núm. Consultorios: " + consultorios);
    }
}