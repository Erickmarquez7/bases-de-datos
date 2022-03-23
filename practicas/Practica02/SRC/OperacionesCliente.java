import java.util.ArrayList;
import java.util.Scanner;

/**
 * Práctica 02: "Sistema de Archivos vs. Bases de Datos"
 * Clase que tiene las operaciones de agregar, consultar, editar, y eliminar información de clientes.
 * @author Acosta Arzate Rubén
 * @author Bernal Márquez Erick
 * @author Cristobal Morales Karen
 * @author Garcia Toxqui Demian Oswaldo
 * @author  Robles Huerta Rosa Maria
 * @version 1.0, Marzo de 2022.
 */

public class OperacionesCliente {

	// ---------------- ATRIBUTOS --------------------

	/** Es la estructura donde se guardarán las clientes */
	ArrayList<Cliente> clientes;

	/** Objeto que nos ayudará a usar métodos auxiliares (como mostrar un menú) */
	MetodosAuxiliares aux = new MetodosAuxiliares();

	/** Nos ayudará a leer y escribir a las clientes en un archivo CSV*/
	ClienteArchivo archivoCliente = new ClienteArchivo();

	/** Atributos que nos ayudarán a escribir y dar color en la consola */
	public static Scanner sc = new Scanner(System.in);
    public static final String RED = "\033[31m"; 
    public static final String YELLOW = "\033[33m";
    public static final String GREEN = "\u001B[32m";
    public static final String RESET = "\u001B[0m"; 

	
	/**
     * CONSTRUCTOR.
     * @param cliente -- es la lista donde se guardarán nuestros clientes.
     */
	public OperacionesCliente(ArrayList<Cliente> clientes) {
		this.clientes = clientes;
	}

	
	/**
     * Método que nos permite agregar un cliente a la "Base de Datos".
     */
	public void agregar() {
		String nombre = aux.leeCadena(sc, " •Nombre del cliente: ");
		String apellidoP = aux.leeCadena(sc, " •Apellido Paterno: ");
		String apellidoM = aux.leeCadena(sc, " •Apellido Materno: ");
		String curp = aux.leeCadena(sc, " •CURP: ");
		String estado = aux.leeCadena(sc, " •Estado donde vive el cliente: ");
		String calle = aux.leeCadena(sc, " •Calle donde vive el cliente: ");
		System.out.print(" •Número donde vive el cliente: ");
    	int numero = aux.verificaSoloNumero(sc);
    	System.out.print(" •Código Postal donde vive el cliente: ");
    	int codigoP = aux.verificaSoloNumero(sc);
    	System.out.print(" •Número telefónico del cliente: ");
    	long telefono = aux.verificaLong(sc);
    	boolean esFrecuente;
    	System.out.println(" •¿Es cliente frecuente?");
    	aux.menuSiNo();
    	int opcion = aux.verificaNumero(sc,1,2);
    	if(opcion == 1){
    		esFrecuente = true;
    	} else {
    		esFrecuente = false;
    	}
    	System.out.print(" •Número de mascotas que el cliente lleva a consulta: ");
    	int numMascotas = aux.verificaSoloNumero(sc);
    	String email = aux.leeCadena(sc, " •E-mail: ");
    	String metodoPago;
    	System.out.println(" •¿Cuál es su método de pago?");
    	aux.menuMetodoPago();
    	int opPago = aux.verificaNumero(sc,1,2);
    	if(opPago == 1){
    		metodoPago = "Físico";
    	} else {
    		metodoPago = "Internet";
    	}
    	Cliente cliente = new Cliente(curp,nombre,apellidoP,apellidoM,estado,calle,numero,codigoP,
    						telefono,esFrecuente,numMascotas,email,metodoPago);
		clientes.add(cliente);
		System.out.println(GREEN + "\n Guardando datos de cliente..." + RESET);
        archivoCliente.escribeCliente(clientes);
	}


	/**
     * Método que nos permite consultar a las clientes en nuestra "Base de Datos".
     */
	public void consultar() {
		System.out.print("\n");
		if(clientes.isEmpty()){
			System.out.println(RED + " ¡ La base de datos de clientes está vacía !" + RESET);
		} else {
			for(int i = 0; i < clientes.size(); i++){
	            clientes.get(i).imprimeCliente();
	        }
		}
	}

	/**
     * Método que nos permite editar un atributo de la mascota dentro de nuestra "Base de Datos".
     */
	public void editar() {
		String curp = aux.leeCadena(sc, " •Ingrese el CURP del cliente: ");
		Cliente cliente = aux.estaCliente(clientes, curp);
		if(cliente == null){
			System.out.println(RED + "\n No se encontró al cliente :C" + RESET);
		} else {
			clientes.remove(cliente);
			aux.menuEditarCliente();
			int editar = aux.verificaNumero(sc, 1, 13);
			switch (editar) {
				case 1:
                    String nombreC = aux.leeCadena(sc, " •Nombre del cliente: ");
                    cliente.setNombre(nombreC);
                    break;

                case 2:
                    String apellidoPC = aux.leeCadena(sc, " •Apellido Paterno: ");
    				cliente.setApellidoP(apellidoPC);
    				break;

                case 3:
                    String apellidoMC = aux.leeCadena(sc, " •Apellido Materno: ");
    				cliente.setApellidoM(apellidoMC);
    				break;

                case 4:
                    String curpC = aux.leeCadena(sc, " •CURP: ");
    				cliente.setCURP(curpC);
                    break;

                case 5:
                	String estadoC = aux.leeCadena(sc, " •Estado donde vive el cliente: ");
    				cliente.setEstado(estadoC);
                    break;

                case 6:
                    String calleC = aux.leeCadena(sc, " •Calle donde vive el cliente: ");
    				cliente.setCalle(calleC);
                    break;

                case 7:
                    System.out.print(" •Número donde vive el cliente: ");
                    int numeroC = aux.verificaSoloNumero(sc);
                    cliente.setNumero(numeroC);
                    break;

                case 8:
                    System.out.print(" •Código Postal donde vive el cliente: ");
    				int codigoPC = aux.verificaSoloNumero(sc);
                    cliente.setPostal(codigoPC);
                    break;

                case 9:
                    System.out.print(" •Número telefónico del cliente: ");
    				long telefonoC = aux.verificaLong(sc);
    				cliente.setTelefono(telefonoC);
    				break;

                case 10:
                	boolean esFrecuenteC;
                	System.out.println(" •¿Es cliente frecuente?");
                	aux.menuSiNo();
                	int opcionC = aux.verificaNumero(sc,1,2);
                	if(opcionC == 1){
    					esFrecuenteC = true;
    				} else {
    					esFrecuenteC = false;
    				}
    				cliente.setEsFrecuente(esFrecuenteC);
                    break;

                case 11:
                	System.out.print(" •Número de mascotas que el cliente lleva a consulta: ");
    				int numMascotasC = aux.verificaSoloNumero(sc);
    				cliente.setNumMascotas(numMascotasC);
                    break;

                case 12:
                    String emailC = aux.leeCadena(sc, " •E-mail: ");
    				cliente.setEmail(emailC);
                    break;

                case 13:
                    String metodoPagoC;
                    System.out.println(" •¿Cuál es su método de pago?");
    				aux.menuMetodoPago();
    				int opPagoC = aux.verificaNumero(sc,1,2);
    				if(opPagoC == 1){
    					metodoPagoC = "Físico";
    				} else {
    					metodoPagoC = "Internet";
    				}
    				cliente.setMetodoPago(metodoPagoC);
                    break;

                default:
                    System.out.println(RED + "\n ¡¡¡ OPCIÓN FUERA DE RANGO !!!" + RESET);
                    break;
            }
            System.out.println(GREEN + "\n Se han actualizando los datos del cliente C:" + RESET);
            clientes.add(cliente);
        	archivoCliente.escribeCliente(clientes);	
		}
	}
	


	/**
     * Método que nos permite eliminar a un cliente de nuestra "Base de Datos".
     */
	public void eliminar() {
		String curp = aux.leeCadena(sc, " •Ingrese el CURP del cliente: ");
		Cliente cliente = aux.estaCliente(clientes, curp);
		if(cliente == null){
			System.out.println(RED + "\n No se encontró al cliente :C" + RESET);
		} else {
			System.out.println(GREEN + "\n Se ha eliminado al cliente C:" + RESET);
			clientes.remove(cliente);
        	archivoCliente.escribeCliente(clientes);
		}
	}	
}