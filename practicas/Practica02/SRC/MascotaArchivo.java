import java.util.ArrayList;

/**
 * Práctica 02: "Sistema de Archivos vs. Bases de Datos"
 * Clase que nos permitirá leer y escribir nuestra información en archivos CSV.
 * @author Acosta Arzate Rubén
 * @author Bernal Márquez Erick
 * @author Cristobal Morales Karen
 * @author Garcia Toxqui Demian Oswaldo
 * @author  Robles Huerta Rosa Maria
 * @version 1.0, Marzo de 2022.
 */

public class MascotaArchivo extends LeeryEscribir {

    /**
     * Constructor por omisión que crea el archivo Mascota.csv
     */
    public MascotaArchivo(){
	   super("Mascota.csv");
    }


    /**
     * Metodo que prepara el arreglo de Mascotas para que puede ser guardado
     * @param operador -- El arreglo de mascota
     */
    public void escribeMascota(ArrayList<Mascota> mascota) {
	   String lineaMascota = "";
	   for (Mascota m : mascota) {
	   	lineaMascota += m + "\n";
	   }
	   super.escribeArchivo(lineaMascota);
	}
    

    /**
     * Metodo que convierte un arreglo de String a un arreglo de Mascotas
     * @return mascotas -- El arreglo de mascotas
     * @throws ArchivoNoExiste -- Se lanza la excepción cuando el archivo no existe
     */
    public ArrayList<Mascota> leeMascotas() throws ArchivoNoExiste {
        String lineas[] = super.leeArchivo();
        ArrayList<Mascota> mascotas = new ArrayList<>();
        for (int i = 0; i < lineas.length; i++) {
            if (!lineas[i].equals("null")) {
                mascotas.add(parseaMascota(lineas[i]));
            }
        }
	   return mascotas;
    }


    /**
     * Metodo que recibe una cadena y parsea los datos para crear una Mascota
     * @param cadenaMascota -- La cadena a parsear
     * @return el objeto con los datos de la cadena
     */
    private Mascota parseaMascota(String cadenaMascota) {
	    String linea[] = cadenaMascota.trim().split(",");
        String id = linea[0];
	    String nombre = linea[1];
        int edad = Integer.parseInt(linea[2]);
        int peso = Integer.parseInt(linea[3]);
	    String especie = linea[4];
        String raza = linea[5];
	    String nombreDueno = linea[6];
	    return new Mascota(id,nombre,edad,peso,especie,raza,nombreDueno);
	}
}