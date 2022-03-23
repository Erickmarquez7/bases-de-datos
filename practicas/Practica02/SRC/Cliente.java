import java.util.ArrayList;

/**
 * Práctica 02: "Sistema de Archivos vs. Bases de Datos"
 * Clase que representa a la Entidad Dueño de la mascota o Cliente.
 * @author Acosta Arzate Rubén
 * @author Bernal Márquez Erick
 * @author Cristobal Morales Karen
 * @author Garcia Toxqui Demian Oswaldo
 * @author  Robles Huerta Rosa Maria
 * @version 1.0, Marzo de 2022.
 */
public class Cliente {
    // ---------------- ATRIBUTOS --------------------

    /** NOMBRE COMPLETO. Es el nombre del cliente. */
    private String nombre;

    /** NOMBRE COMPLETO. Es apellido paterno del cliente. */
    private String apellidoP;

    /** NOMBRE COMPLETO. Es el apellido materno del cliente. */
    private String apellidoM;

    /** Es la CURP del cliente. */
    private String CURP;
    
    /** DIRECCIÓN COMPLETA. Estado donde vive el Cliente. */
    private String estado;

    /** DIRECCIÓN COMPLETA. Calle donde vive el Cliente. */
    private String calle;

    /** DIRECCIÓN COMPLETA. Número donde vive el Cliente. */
    private int numero;

    /** DIRECCIÓN COMPLETA. Código Postal donde vive el Cliente. */
    private int postal;
    
    /** Número telefónico del Cliente. */
    private long telefono;

    /** Nos dice si el cliente es frecuente. */
    private boolean esFrecuente;

    /** Nos dice el número de mascotas que tiene el cliente. */
    private int numMascotas;

    /** Nos dice el correo electrónico del cliente. */
    private String email;

    /** Nos dice el método de pago del cliente. */
    private String metodoPago;

    /**
     * Constructor por parametros que genera un Cliente
     * @param nombre -- Nombre del Cliente
     * @param apellidoP -- Apellido Paterno del Cliente
     * @param apellidoM -- Apellido Materno del Cliente
     * @param CURP -- Curp del Cliente
     * @param estado -- estado del domimicilio del Cliente
     * @param calle -- calle del domicilio del Cliente
     * @param numero -- numero del domicilio Cliente 
     * @param postal -- codigo postal del cliente
     * @param telefono -- Telefono del Cliente
     * @param esFrecuente -- Nos dice si el cliente es frecuente.
     * @param numMascotas -- Número de mascotas que el cliente lleva a consulta.
     * @param email -- e-mail del Cliente
     * @param metodoPago -- Método de Pago del cliente.
     */
    public Cliente(String CURP, String nombre, String apellidoP, String apellidoM, String estado, 
        String calle, int numero, int postal, long telefono, boolean esFrecuente,
        int numMascotas, String email, String metodoPago) {
        this.nombre = nombre;
        this.apellidoP = apellidoP;
        this.apellidoM = apellidoM;
        this.CURP = CURP;
        this.estado = estado;
        this.calle = calle;
        this.numero = numero;
        this.postal = postal;
        this.telefono = telefono;
        this.esFrecuente = esFrecuente;
        this.numMascotas = numMascotas;
        this.email = email;
        this.metodoPago = metodoPago;
    }

    /**
    * Metodo getNombre que obtiene el nombre del Cliente
    * @return nombre -- El nombre del Cliente
    */
    public String getNombre() {
        return nombre;
    }


    /**
     * Metodo setNombre que define el nuevo nombre del Cliente
     * @param nombre -- El nuevo nombre del Cliente
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    
    /**
     * Metodo getApellidoP que obtiene el apellido Paterno del Cliente
     * @return apellidoP -- El Apellido Paterno del Cliente
     */
    public String getApellidoP() {
        return apellidoP;
    }
    
    
    /**
     * Metodo setAPellidoP que define el nuevo apellido del Cliente
     * @param apellidoP -- El nuevo Apellido del Cliente
     */
    public void setApellidoP(String apellidoP) {
        this.apellidoP = apellidoP;
    }
    
    
    /**
     * Metodo getAPellidoM que obtiene el apellido Materno del Cliente
     * @return apellidoM -- El apellido Materno del Cliente
     */
    public String getApellidoM() {
        return apellidoM;
    }
    
    /**
     * Metodo setApellidoM que define el nuevo apellido materno del Cliente
     * @param apellidoM  -- EL nuevo apellido materno del Cliente
     */
    public void setApellidoM(String apellidoM) {
        this.apellidoM = apellidoM;
    }

    /**
     * Metodo getCURP que obtiene el CURP del Cliente
     * @return CURP -- La CURP del Cliente
     */
    public String getCURP() {
        return CURP;
    }

    /**
     * Metodo setCURP que define la nueva CURP del Opeardor
     * @param CURP -- La nueva CURP del Cliente
     */
    public void setCURP(String CURP) {
        this.CURP = CURP;
    }

    /**
     * Metodo getEstado que obtiene el estado del Cliente
     * @return estado -- El estado del Cliente
     */
    public String getEstado() {
        return estado;
    }

    /**
     * Metodo setEstado que define el Estado del Domicilio del Cliente
     * @param estado -- El nuevo estado del Cliente
     */
    public void setEstado(String estado) {
        this.estado = estado;
    }

    /**
     * Metodo getCalle que obtiene la calle del Cliente
     * @return calle -- La calle del Cliente
     */
    public String getCalle() {
        return calle;
    }

    /**
     * Metodo setCalle que define la calle del Domicilio del Cliente
     * @param calle -- La nueva calle del Cliente
     */
    public void setCalle(String calle) {
        this.calle = calle;
    }

    /**
     * Metodo getNumero que obtiene el numero del Cliente
     * @return numero -- el numero del Cliente
     */
    public int getNumero() {
        return numero;
    }

    /**
     * Metodo setNumero que define el numero del Domicilio del Cliente
     * @param numero -- El nuevo numero del Cliente
     */
    public void setNumero(int numero) {
        this.numero = numero;
    }


    /**
     * Metodo getPostal que obtiene el codigo postal del Cliente
     * @return postal -- el codigo postal del Cliente
     */
    public int getPostal() {
        return postal;
    }

    /**
     * Metodo setPostal que define el codigo postal del Domicilio del Cliente
     * @param numero -- El nuevo codigo postal del Cliente
     */
    public void setPostal(int postal) {
        this.postal = postal;
    }

    /**
     * Metodo getTelefono que obtiene el telefono del Cliente
     * @return telefono -- el telefono del Cliente
     */
    public long getTelefono() {
        return telefono;
    }

    /**
     * Metodo setTelefono que define el telefono del Cliente
     * @param telefono -- El nuevo telefono del Cliente
     */
    public void setTelefono(long telefono) {
        this.telefono = telefono;
    }

    /**
     * Metodo getEsFrecuente que nos dice si el Cliente es frecuente.
     * @return esFrecuente -- si el cliente es frecuente.
     */
    public boolean getEsFrecuente() {
        return esFrecuente;
    }

    /**
     * Metodo setEsFrecuente que define si el cliente es frecuente.
     * @param esFrecuente -- El nuevo estado sobre si es frecuente.
     */
    public void setEsFrecuente(boolean esFrecuente) {
        this.esFrecuente = esFrecuente;
    }

    /**
     * Metodo getNumMascotas que nos dice cuántas mascotas lleva el cliente a consulta.
     * @return numMascotas -- cantidad de mascotas que lleva el cliente a consulta.
     */
    public int getNumMascotas() {
        return numMascotas;
    }

    /**
     * Metodo setNumMascotas que define la nueva cantidad de mascotas del cliente.
     * @param numMascotas -- la nueva cantidad de mascotas del cliente.
     */
    public void setNumMascotas(int numMascotas) {
        this.numMascotas = numMascotas;
    }

    /**
     * Metodo getEmail que nos devuelve el email del cliente.
     * @return email -- email del cliente.
     */
    public String getEmail() {
        return email;
    }

    /**
     * Metodo setEmail que define el nuevo email del cliente.
     * @param email -- el nuevo email del cliente.
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * Metodo getMetodoPago que nos dice el método de pago del cliente.
     * @return metodoPago -- metodoPago del cliente.
     */
    public String getMetodoPago() {
        return metodoPago;
    }

    /**
     * Metodo setMetodoPago que define el nuevo método de pago del cliente.
     * @param metodoPago -- el nuevo método de pago del cliente.
     */
    public void setMetodoPago(String metodoPago) {
        this.metodoPago = metodoPago;
    }


    /**
     * Metodo ToString del Cliente.
     * @return Regresa la representación de un cliente para generar el CSV.
     */
    @Override
    public String toString() {
        return this.CURP + "," + this.nombre + "," + this.apellidoP + "," + this.apellidoM + "," + this.estado + "," 
        + this.calle + "," + this.numero + "," + this.postal + "," + this.telefono + "," + this.esFrecuente
        + "," + this.numMascotas + "," + this.email + "," + this.metodoPago;
    }

    /**
     * Método que imprime de manera amigable los datos del cliente.
     */
    public void imprimeCliente(){
        String YELLOW = "\033[33m";
        String GREEN = "\u001B[32m";
        String RESET = "\u001B[0m"; 
        System.out.println(GREEN + "______________________________________ \n" + RESET);
        System.out.println(YELLOW + "   CLIENTE " + RESET);
        System.out.println(" Nombre: " + nombre);
        System.out.println(" Apellido Paterno: " + apellidoP);
        System.out.println(" Apellido Materno: " + apellidoM);
        System.out.println(" CURP: " + CURP);
        System.out.println(" Estado: " + estado);
        System.out.println(" Calle: " + calle);
        System.out.println(" Número: " + numero);
        System.out.println(" Código Postal: " + postal);
        System.out.println(" Teléfono: " + telefono);
        System.out.println(" ¿Es cliente frecuente?: " + esFrecuente);
        System.out.println(" Núm. Mascotas: " + numMascotas);
        System.out.println(" Email: " + email);
        System.out.println(" Método de pago: " + metodoPago);
    }
}