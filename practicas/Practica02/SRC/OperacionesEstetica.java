import java.util.ArrayList;
import java.util.Scanner;

/**
 * Práctica 02: "Sistema de Archivos vs. Bases de Datos"
 * Clase que tiene las operaciones de agregar, consultar, editar, y eliminar información de estéticas.
 * @author Acosta Arzate Rubén
 * @author Bernal Márquez Erick
 * @author Cristobal Morales Karen
 * @author Garcia Toxqui Demian Oswaldo
 * @author  Robles Huerta Rosa Maria
 * @version 1.0, Marzo de 2022.
 */

public class OperacionesEstetica {

	// ---------------- ATRIBUTOS --------------------

	/** Es la estructura donde se guardarán las estéticas */
	ArrayList<Estetica> esteticas;

	/** Objeto que nos ayudará a usar métodos auxiliares (como mostrar un menú) */
	MetodosAuxiliares aux = new MetodosAuxiliares();

	/** Nos ayudará a leer y escribir a las estéticas en un archivo CSV*/
	EsteticaArchivo archivoEstetica = new EsteticaArchivo();

	/** Atributos que nos ayudarán a escribir y dar color en la consola */
	public static Scanner sc = new Scanner(System.in);
    public static final String RED = "\033[31m"; 
    public static final String YELLOW = "\033[33m";
    public static final String GREEN = "\u001B[32m";
    public static final String RESET = "\u001B[0m"; 

	
	/**
     * CONSTRUCTOR.
     * @param esteticas -- es la lista donde se guardarán nuestras estéticas.
     */
	public OperacionesEstetica(ArrayList<Estetica> esteticas) {
		this.esteticas = esteticas;
	}

	
	/**
     * Método que nos permite agregar una estética a la "Base de Datos".
     */
	public void agregar() {
		String nombre = aux.leeCadena(sc, " •Nombre de la estética: ");
		String estado = aux.leeCadena(sc, " •Estado donde se ubica la estética: ");
		String calle = aux.leeCadena(sc, " •Calle donde se ubica la estética: ");
		System.out.print(" •Número donde se ubica la estética: ");
    	int numero = aux.verificaSoloNumero(sc);
    	System.out.print(" •Código Postal donde se ubica la estética: ");
    	int codigoP = aux.verificaSoloNumero(sc);
    	System.out.print(" •Número telefónico de la estética: ");
    	long telefono = aux.verificaLong(sc);
    	String horario = aux.leeCadena(sc, " •Horario de la estética: ");
    	String idEstetica = nombre.substring(0, 1) + codigoP;

    	System.out.println(YELLOW + " **NOTA: El id de la Estética es: " + idEstetica + RESET);
		Estetica estetica = new Estetica(idEstetica, nombre, estado, calle, numero, codigoP, telefono, horario,0,0);
		esteticas.add(estetica);
		System.out.println(GREEN + "\n Guardando datos de estética..." + RESET);
        archivoEstetica.escribeEstetica(esteticas);
	}


	/**
     * Método que nos permite consultar a las estéticas en nuestra "Base de Datos".
     */
	public void consultar() {
		System.out.print("\n");
		if(esteticas.isEmpty()){
			System.out.println(RED + " ¡ La base de datos de estéticas veterinarias está vacía !" + RESET);
		} else {
			for(int i = 0; i < esteticas.size(); i++){
	            esteticas.get(i).imprimeEstetica();
	        }
		}
	}

	/**
     * Método que nos permite editar un atributo de una estética dentro de nuestra "Base de Datos".
     */
	public void editar() {
		String idEstetica = aux.leeCadena(sc, " •Ingrese el identificador (id) de la estética a editar: ");
		Estetica estetica = aux.estaEstetica(esteticas, idEstetica);
		if(estetica == null){
			System.out.println(RED + "\n No se encontró a la estética :C" + RESET);
		} else {
			esteticas.remove(estetica);
			aux.menuEditarEstetica();
			int editar = aux.verificaNumero(sc, 1, 9);
			switch (editar) {
				case 1:
                    String nombreE = aux.leeCadena(sc, " •Nombre de la estética: ");
                    estetica.setNombre(nombreE);
                    break;

                case 2:
    				String estadoE = aux.leeCadena(sc, " •Estado donde se ubica la estética: ");
                    estetica.setEstado(estadoE);
                    break;

                case 3:
                    String calleE = aux.leeCadena(sc, " •Calle donde se ubica la estética: ");
                    estetica.setCalle(calleE);

                case 4:
                    System.out.print(" •Número donde se ubica la estética: ");
    				int numE = aux.verificaSoloNumero(sc);
    				estetica.setNumero(numE);
                    break;

                case 5:
                    System.out.print(" •Código Postal donde se ubica la estética: ");
    				int codPosE = aux.verificaSoloNumero(sc);
    				estetica.setCodigoP(codPosE);
                    break;

                case 6:
                    System.out.print(" •Número Telefónico de la estética: ");
    				long telE = aux.verificaLong(sc);
    				estetica.setTelefono(telE);
                    break;

                case 7:
                    String horarioE = aux.leeCadena(sc, " •Horario de la estética: ");
    				estetica.setHorario(horarioE);
                    break;

                case 8:
                    System.out.print(" •Ganancias de la estética: ");
    				int gananciasE = aux.verificaSoloNumero(sc);
    				estetica.setGanancias(gananciasE);
                    break;

                case 9:
                    System.out.print(" •Núm. de consultorios ");
                    System.out.print(" (sólo puede registrarse máximo 4):");
    				int consulE = aux.verificaNumero(sc, 0, 4);
    				estetica.setConsultorios(consulE);
                    break;
                default:
                    System.out.println(RED + "\n ¡¡¡ OPCIÓN FUERA DE RANGO !!!" + RESET);
                    break;
            }
            System.out.println(GREEN + "\n Se han actualizando los datos de la estética C:" + RESET);
            esteticas.add(estetica);
        	archivoEstetica.escribeEstetica(esteticas);	
		}
	}
	


	/**
     * Método que nos permite eliminar a una estética de nuestra "Base de Datos".
     */
	public void eliminar() {
		String idEstetica = aux.leeCadena(sc, " •Ingrese el identificador (id) de la estética a eliminar: ");
		Estetica estetica = aux.estaEstetica(esteticas, idEstetica);
		if(estetica == null){
			System.out.println(RED + "\n No se encontró la estética :C" + RESET);
		} else {
			System.out.println(GREEN + "\n Se ha eliminado la estética C:" + RESET);
			esteticas.remove(estetica);
        	archivoEstetica.escribeEstetica(esteticas);
		}
	}	
}