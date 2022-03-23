import java.util.ArrayList;

/**
 *Clase que permite escribir y leer a Clientes sobre un archivo CSV
 * @author Ricardo Badillo Macias
 * @version 16/03/2022
 */
public class ClienteArchivo extends LeeryEscribir{
    /**
     * Constructor por omision que crea el archivo Cliente.csv
     */
    public ClienteArchivo(){
	super("Cliente.csv");
    }

    /**
     * Metodo que prepara el arreglo de Clientes para que puede ser guardado
     * @param cliente -- El arreglo de clientes
     */
    public void escribeCliente(ArrayList<Cliente> cliente) {
	String lineaCliente = "";
	for (Cliente c : cliente) {
		lineaCliente += c + "\n";
	}
	super.escribeArchivo(lineaCliente);
	}
    
    /**
     * Metodo que convierte un arreglo de String a un arreglo de Clientes
     * @return clientes -- El arreglo de clientes
     * @throws ArchivoNoExiste -- Se lanza la excepción cuando el archivo no existe
     */
    public ArrayList<Cliente> leeClientes() throws ArchivoNoExiste {
        String lineas[] = super.leeArchivo();
        ArrayList<Cliente> clientes = new ArrayList<>();
        for (int i = 0; i < lineas.length; i++) {
            if (!lineas[i].equals("null")) {
                clientes.add(parseaCliente(lineas[i]));
            }
        }
	return clientes;
    }

    /**
     * Metodo que recibe una cadena y parsea los datos para crear un Cliente
     * @param cadenaCliente -- La cadena a parsear
     * @return el objeto con los datos de la cadena
     */
    private Cliente parseaCliente(String cadenaCliente) {
	String linea[] = cadenaCliente.trim().split(",");
	String CURP = linea[0];
	String nombre = linea[1];
    String apellidoP = linea[2];
    String apellidoM = linea[3];
    String estado = linea[4];
	String calle = linea[5];
    int numero =   Integer.parseInt(linea[6]);
    int postal =   Integer.parseInt(linea[7]);
    long telefono = Long.parseLong(linea[8]);
    boolean esFrecuente = Boolean.parseBoolean(linea[9]);
    int numMascotas = Integer.parseInt(linea[10]);
    String email = linea[11];
    String metodoPago = linea[12];
	return new Cliente(CURP,nombre,apellidoP,apellidoM,estado,calle,numero,postal,telefono,
        esFrecuente,numMascotas,email,metodoPago);
	}
}