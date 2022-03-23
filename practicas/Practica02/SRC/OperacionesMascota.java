import java.util.ArrayList;
import java.util.Scanner;

/**
 * Práctica 02: "Sistema de Archivos vs. Bases de Datos"
 * Clase que tiene las operaciones de agregar, consultar, editar, y eliminar información de mascotas.
 * @author Acosta Arzate Rubén
 * @author Bernal Márquez Erick
 * @author Cristobal Morales Karen
 * @author Garcia Toxqui Demian Oswaldo
 * @author  Robles Huerta Rosa Maria
 * @version 1.0, Marzo de 2022.
 */

public class OperacionesMascota{

	// ---------------- ATRIBUTOS --------------------

	/** Es la estructura donde se guardarán las mascotas */
	ArrayList<Mascota> mascotas;

	/** Objeto que nos ayudará a usar métodos auxiliares (como mostrar un menú) */
	MetodosAuxiliares aux = new MetodosAuxiliares();

	/** Nos ayudará a leer y escribir a las mascotas en un archivo CSV*/
	MascotaArchivo archivoMascota = new MascotaArchivo();

	/** Atributos que nos ayudarán a escribir y dar color en la consola */
	public static Scanner sc = new Scanner(System.in);
    public static final String RED = "\033[31m"; 
    public static final String YELLOW = "\033[33m";
    public static final String GREEN = "\u001B[32m";
    public static final String RESET = "\u001B[0m"; 

	
	/**
     * CONSTRUCTOR.
     * @param mascota -- es la lista donde se guardarán nuestras mascotas.
     */
	public OperacionesMascota(ArrayList<Mascota> mascotas) {
		this.mascotas = mascotas;
	}

	
	/**
     * Método que nos permite agregar una mascota a la "Base de Datos".
     */
	public void agregar() {
		String nombre = aux.leeCadena(sc, " •Nombre de la mascota: ");
		System.out.print(" •Edad de la mascota (en años): ");
    	int edad = aux.verificaNumero(sc, 0, 30);
    	System.out.print(" •Peso de la mascota: ");
    	int peso = aux.verificaNumero(sc, 0, 100);
    	String especie = aux.leeCadena(sc, " •Especie de la mascota: ");
    	String raza = aux.leeCadena(sc, " •Raza de la mascota: ");
    	String nombreDuenio = aux.leeCadena(sc, " •Nombre del dueño de la mascota: ");
    	String idMascota = nombre + edad + peso;
    	System.out.println(YELLOW + " **NOTA: El id de su Mascota es: " + idMascota + RESET);
		Mascota mascota = new Mascota(idMascota, nombre, edad, peso, especie, raza, nombreDuenio);
		mascotas.add(mascota);
		System.out.println(GREEN + "\n Guardando datos de mascota..." + RESET);
        archivoMascota.escribeMascota(mascotas);
	}


	/**
     * Método que nos permite consultar a las mascotas en nuestra "Base de Datos".
     */
	public void consultar() {
		System.out.print("\n");
		if(mascotas.isEmpty()){
			System.out.println(RED + " ¡ La base de datos de mascotas está vacía !" + RESET);
		} else {
			for(int i = 0; i < mascotas.size(); i++){
	            mascotas.get(i).imprimeMascota();
	        }
		}
	}

	/**
     * Método que nos permite editar un atributo de la mascota dentro de nuestra "Base de Datos".
     */
	public void editar() {
		String idMascota = aux.leeCadena(sc, " •Ingrese el identificador (id) de la mascota a editar: ");
		Mascota mascota = aux.estaMascota(mascotas, idMascota);
		if(mascota == null){
			System.out.println(RED + "\n No se encontró a la mascota :C" + RESET);
		} else {
			mascotas.remove(mascota);
			aux.menuEditarMascota();
			int editar = aux.verificaNumero(sc, 1, 6);
			switch (editar) {
				case 1:
                    String nombreE = aux.leeCadena(sc, " •Nombre de la mascota: ");
                    mascota.setNombre(nombreE);
                    break;

                case 2:
                    System.out.print(" •Edad de la mascota (en años): ");
    				int edadE = aux.verificaNumero(sc, 0, 30);
    				mascota.setEdad(edadE);
                    break;

                case 3:
                    System.out.print(" •Peso de la mascota: ");
    				int pesoE = aux.verificaNumero(sc, 0, 100);
    				mascota.setPeso(pesoE);
                    break;

                case 4:
                    String especieE = aux.leeCadena(sc, " •Especie de la mascota: ");
    				mascota.setEspecie(especieE);
                    break;

                case 5:
                    String razaE = aux.leeCadena(sc, " •Raza de la mascota: ");
    				mascota.setRaza(razaE);
                    break;

                case 6:
                    String nombreDuenioE = aux.leeCadena(sc, " •Nombre del dueño de la mascota: ");
    				mascota.setNombreDueno(nombreDuenioE);
                    break;

                default:
                    System.out.println(RED + "\n ¡¡¡ OPCIÓN FUERA DE RANGO !!!" + RESET);
                    break;
            }
            System.out.println(GREEN + "\n Se han actualizando los datos de la mascota C:" + RESET);
            mascotas.add(mascota);
        	archivoMascota.escribeMascota(mascotas);	
		}
	}
	


	/**
     * Método que nos permite eliminar a una mascota de nuestra "Base de Datos".
     */
	public void eliminar() {
		String idMascota = aux.leeCadena(sc, " •Ingrese el identificador (id) de la mascota a eliminar: ");
		Mascota mascota = aux.estaMascota(mascotas, idMascota);
		if(mascota == null){
			System.out.println(RED + "\n No se encontró a la mascota :C" + RESET);
		} else {
			System.out.println(GREEN + "\n Se ha eliminado a la mascota C:" + RESET);
			mascotas.remove(mascota);
        	archivoMascota.escribeMascota(mascotas);
		}
	}	
}