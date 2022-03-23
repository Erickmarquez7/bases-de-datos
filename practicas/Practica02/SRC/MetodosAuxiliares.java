import java.util.ArrayList;
import java.util.Scanner;

/**
 * Práctica 02: "Sistema de Archivos vs. Bases de Datos"
 * Clase que tiene métodos auxiliares que son ajenos a la "Base de Datos".
 * @author Acosta Arzate Rubén
 * @author Bernal Márquez Erick
 * @author Cristobal Morales Karen
 * @author Garcia Toxqui Demian Oswaldo
 * @author  Robles Huerta Rosa Maria
 * @version 1.0, Marzo de 2022.
 */

public class MetodosAuxiliares {

    // ---------------- ATRIBUTOS --------------------


    /** Atributos que nos ayudarán a escribir y dar color en la consola */
    public static Scanner sc = new Scanner(System.in);
    public static final String RED = "\033[31m"; 
    public static final String BLUE = "\033[34m";
    public static final String PURPLE = "\033[35m";
    public static final String YELLOW = "\033[33m";
    public static final String GREEN = "\u001B[32m";
    public static final String CYAN = "\u001B[36m";
    public static final String RESET = "\u001B[0m"; 


    /**
     * CONSTRUCTOR POR OMISIÓN.
     */
	public MetodosAuxiliares(){}


	/**
	 * Imprime un mensaje y obtiene una cadena como respuesta al mensaje.
	 * @param sc -- Scanner el cual leerá la cadena.
	 * @param msg -- El mensaje a imprimir.
	 * @return La respuesta al mensaje.
	 */
	public String leeCadena(Scanner sc, String msg) {
		System.out.print(msg);
		return sc.nextLine();
	}


    /**
     * Método que verfica la robustez de lo que el usuario ingrese dentro de un rango específico.
     * En caso de escribir un entero fuera de rango ó caracteres, se mandarán errores durante ejecución.
     * @param sc es el Scanner.
     * @param numLimite1 es el número que determina donde empieza el rango.
     * @param numLimite2 es el número que determina donde termina el rango.
     * @return un entero dentro de un rango válido.
     * @throws IndexOutOfBoundsException si el entero está fuera de rango.
     **/
    public int verificaNumero(Scanner sc, int numLimite1, int numLimite2) throws IndexOutOfBoundsException {
        int n;
        while(true) {
            try {
                n = Integer.parseInt(sc.nextLine());
                if(n < numLimite1 || n > numLimite2){
                    throw new IndexOutOfBoundsException(RED + "\n ¡¡¡ NÚMERO FUERA DE RANGO !!!" + RESET);
                }
                break;
            }catch(IndexOutOfBoundsException nfe){
                System.out.println(nfe.getMessage());
            } catch(NumberFormatException nfe){
                System.out.println(RED + "\n ¡¡¡ LOS CARACTERES NO SON VÁLIDOS  !!!" + RESET);
            } catch(Exception e){
                System.out.println(RED + "\n ¡¡¡ ALGO INESPERADO OCURRIÓ !!!" + RESET);
            }
        }
        return n;
    }

    /**
     * Método que manda error si el usuario ingresa un caracter cuando se pide un número.
     * @param sc es el Scanner.
     * @return un entero.
     * @throws IndexOutOfBoundsException si el entero está fuera de rango.
     **/
    public int verificaSoloNumero(Scanner sc) {
        int n;
        while(true) {
            try {
                n = Integer.parseInt(sc.nextLine());
                break;
            }catch(IndexOutOfBoundsException nfe){
                System.out.println(nfe.getMessage());
            } catch(NumberFormatException nfe){
                System.out.println(RED + "\n ¡¡¡ LOS CARACTERES NO SON VÁLIDOS  !!!" + RESET);
            } catch(Exception e){
                System.out.println(RED + "\n ¡¡¡ ALGO INESPERADO OCURRIÓ !!!" + RESET);
            }
        }
        return n;
    }

    /**
     * Método que manda error si el usuario ingresa un caracter cuando se pide un número.
     * @param sc es el Scanner.
     * @return un entero dentro de un rango válido.
     * @throws IndexOutOfBoundsException si el entero está fuera de rango.
     **/
    public long verificaLong(Scanner sc) {
        long numCadena;
        while(true) {
            try {
                numCadena = Long.parseLong(sc.nextLine());
                break;
            }catch(IndexOutOfBoundsException nfe){
                System.out.println(nfe.getMessage());
            } catch(NumberFormatException nfe){
                System.out.println(RED + "\n ¡¡¡ LOS CARACTERES NO SON VÁLIDOS  !!!" + RESET);
            } catch(Exception e){
                System.out.println(RED + "\n ¡¡¡ ALGO INESPERADO OCURRIÓ !!!" + RESET);
            }
        }
        return numCadena;
    }

    /**
     * Método que imprimé el menú principal
     */
    public static void menuDatos(){ 
        System.out.println(CYAN + "\n ¿QUÉ HACER? " + RESET);
        System.out.println("  [1] •Cargar datos."
                       + "\n  [2] •Manipular datos." 
                       + "\n  [3] •Salir.");
        System.out.print(PURPLE + "\n Opcion: " + RESET);
    }

    /**
     * Método que imprimé el menú principal para elegir qué entidad consultar.
     */
    public void eligeEntidad(){ 
        System.out.println(CYAN + "\n POR FAVOR, ELIJA UNA OPCIÓN " + RESET);
        System.out.println("  [1] •Estética Veterinaria."
                       + "\n  [2] •Mascotas." 
                       + "\n  [3] •Clientes."
                       + "\n  [0] •Salir.");
        System.out.print(PURPLE + "\n Opcion: " + RESET);
    }


    /**
     * Método que imprimé cómo podemos manipular la información de la "Base de Datos"
     * @param entidad -- Representa a la entidad cuya infomación vamos a manipular.
     */
    public void muestraMenu(String entidad){ 
        System.out.println(CYAN + "\n ¿QUÉ QUIERE HACER? " + RESET);
        System.out.println("  [1] •Agregar " + entidad
                       + "\n  [2] •Consultar " + entidad 
                       + "\n  [3] •Editar " + entidad
                       + "\n  [4] •Borrar " + entidad);
        System.out.print(PURPLE + "\n Opcion: " + RESET);
    }

    /**
     * Método que imprimé los atributos que podemos editar de una mascota.
     */
    public static void menuEditarMascota(){ 
        System.out.println(CYAN + "\n ¿QUÉ DESEA EDITAR? " + RESET);
        System.out.println("  [1] •Nombre."
                       + "\n  [2] •Edad." 
                       + "\n  [3] •Peso."
                       + "\n  [4] •Especie."
                       + "\n  [5] •Raza."
                       + "\n  [6] •Nombre del dueño.");
        System.out.print(PURPLE + "\n Opcion: " + RESET);
    }	

    /**
     * Método que imprimé los atributos que podemos editar de una estética.
     */
    public static void menuEditarEstetica(){ 
        System.out.println(CYAN + "\n ¿QUÉ DESEA EDITAR? " + RESET);
        System.out.println("  [1] •Nombre."
                       + "\n  [2] •Estado." 
                       + "\n  [3] •Calle."
                       + "\n  [4] •Número."
                       + "\n  [5] •Código Postal."
                       + "\n  [6] •Teléfono."
                       + "\n  [7] •Horario."
                       + "\n  [8] •Ganancias."
                       + "\n  [9] •Núm. Consultorios.");
        System.out.print(PURPLE + "\n Opcion: " + RESET);
    }  

    /**
     * Método que imprimé los atributos que podemos editar de un cliente.
     */
    public static void menuEditarCliente(){ 
        System.out.println(CYAN + "\n ¿QUÉ DESEA EDITAR? " + RESET);
        System.out.println("  [1] •Nombre."
                       + "\n  [2] •Apellido Paterno." 
                       + "\n  [3] •Apellido Materno."
                       + "\n  [4] •CURP."
                       + "\n  [5] •Estado."
                       + "\n  [6] •Calle."
                       + "\n  [7] •Número."
                       + "\n  [8] •Código Postal."
                       + "\n  [9] •Teléfono."
                       + "\n  [10] •Si el cliente es frecuente."
                       + "\n  [11] •Número de mascotas del cliente."
                       + "\n  [12] •Email."
                       + "\n  [13] •Método de pago.");
        System.out.print(PURPLE + "\n Opcion: " + RESET);
    }  


    /**
     * Método que imprimé un menú "sí" "no".
     */
    public static void menuSiNo(){ 
        System.out.println("  [1] •Sí."
                       + "\n  [2] •No.");
        System.out.print(PURPLE + "\n Opcion: " + RESET);
    }

    /**
     * Método que imprimé un menú para el método de pago del cliente.
     */
    public static void menuMetodoPago(){
        System.out.println("  [1] •Físico."
                       + "\n  [2] •Internet.");
        System.out.print(PURPLE + "\n Opcion: " + RESET);
    }

    /**
     * Método que nos nos regresa a una mascota ingresando su id.
     */
    public Mascota estaMascota(ArrayList<Mascota> mascotas, String idMascota){
        Mascota mascota = null;
        for(int i = 0; i < mascotas.size(); i++) {
            if(idMascota.equals(mascotas.get(i).getId())){
                mascota = mascotas.get(i);
            } 
        }
        return mascota;
    }  

    /**
     * Método que nos nos regresa a una estética ingresando su id.
     */
    public Estetica estaEstetica(ArrayList<Estetica> esteticas, String idEstetica){
        Estetica estetica = null;
        for(int i = 0; i < esteticas.size(); i++) {
            if(idEstetica.equals(esteticas.get(i).getId())){
                estetica = esteticas.get(i);
            } 
        }
        return estetica;
    } 


    /**
     * Método que nos nos regresa a un cliente ingresando su curp.
     */
    public Cliente estaCliente(ArrayList<Cliente> clientes, String curp){
        Cliente cliente = null;
        for(int i = 0; i < clientes.size(); i++) {
            if(curp.equals(clientes.get(i).getCURP())){
                cliente = clientes.get(i);
            } 
        }
        return cliente;
    } 
}