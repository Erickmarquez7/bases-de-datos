import java.util.ArrayList;

/**
 *Clase que permite escribir y leer a Esteticas sobre un archivo CSV
 * @author Ricardo Badillo Macias
 * @version 16/03/2022
 */
public class EsteticaArchivo extends LeeryEscribir{
    /**
     * Constructor por omision que crea el archivo Estetica.csv
     */
    public EsteticaArchivo(){
	super("Estetica.csv");
    }

    /**
     * Metodo que prepara el arreglo de Esteticas para que puede ser guardado
     * @param operador -- El arreglo de estetica
     */
    public void escribeEstetica(ArrayList<Estetica> estetica) {
	String lineaEstetica = "";
	for (Estetica e : estetica) {
		lineaEstetica += e + "\n";
	}
	super.escribeArchivo(lineaEstetica);
	}
    
    /**
     * Metodo que convierte un arreglo de String a un arreglo de Esteticas
     * @return esteticas -- El arreglo de esteticas
     * @throws ArchivoNoExiste -- Se lanza la excepción cuando el archivo no existe
     */
    public ArrayList<Estetica> leeEsteticas() throws ArchivoNoExiste {
        String lineas[] = super.leeArchivo();
        ArrayList<Estetica> esteticas = new ArrayList<>();
        for (int i = 0; i < lineas.length; i++) {
            if (!lineas[i].equals("null")) {
                esteticas.add(parseaEstetica(lineas[i]));
            }
        }
	return esteticas;
    }

    /**
     * Metodo que recibe una cadena y parsea los datos para crear una Estetica
     * @param cadenaEstetica -- La cadena a parsear
     * @return el objeto con los datos de la cadena
     */
    private Estetica parseaEstetica(String cadenaEstetica) {
	    String linea[] = cadenaEstetica.trim().split(",");
        String id = linea[0];
	    String nombre = linea[1];
        String estado = linea[2];
        String calle = linea[3];
	    int numero =   Integer.parseInt(linea[4]);
        int codigoP =  Integer.parseInt(linea[5]);
        long telefono = Long.parseLong(linea[6]);
	    String horario = linea[7];
        int ganancias =  Integer.parseInt(linea[8]);
        int consultorios = Integer.parseInt(linea[9]);
	    return new Estetica(id,nombre,estado,calle,numero,codigoP,telefono,horario,ganancias,consultorios);
	}    
}