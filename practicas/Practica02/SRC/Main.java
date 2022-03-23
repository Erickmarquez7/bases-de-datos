import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.Scanner;

/**
 * Práctica 02: "Sistema de Archivos vs. Bases de Datos"
 * Clase Main que ejecuta todo nuestro programa.
 * @author Acosta Arzate Rubén
 * @author Bernal Márquez Erick
 * @author Cristobal Morales Karen
 * @author Garcia Toxqui Demian Oswaldo
 * @author  Robles Huerta Rosa Maria
 * @version 1.0, Marzo de 2022.
 */


public class Main {

    /** Atributos que nos ayudarán a escribir y dar color en la consola */
    public static Scanner sc = new Scanner(System.in);
    public static final String RED = "\033[31m"; 
    public static final String BLUE = "\033[34m";
    public static final String PURPLE = "\033[35m";
    public static final String YELLOW = "\033[33m";
    public static final String GREEN = "\u001B[32m";
    public static final String CYAN = "\u001B[36m";
    public static final String RESET = "\u001B[0m"; 




    public static void main(String[] args) {

        MetodosAuxiliares aux = new MetodosAuxiliares();
        Scanner sc = new Scanner(System.in);

        
        //Para mascotas
        ArrayList<Mascota> mascotas = new ArrayList<>();
        MascotaArchivo archivoMascota = new MascotaArchivo();

        //Para estéticas
        ArrayList<Estetica> esteticas = new ArrayList<>();
        EsteticaArchivo archivoEstetica = new EsteticaArchivo();
        
        //Para clientes
        ArrayList<Cliente> clientes = new ArrayList<>();
        ClienteArchivo archivoCliente = new ClienteArchivo();

        int opcion;
        System.out.println(YELLOW + "\n ******** BIENVENIDO \"LITTLE FRIEND\" ********" + RESET );

        do {
            aux.eligeEntidad();
            while (true){
                try {
                    String opcionUsuario = sc.nextLine();
                    opcion = Integer.parseInt(opcionUsuario);
                    break;
                }catch (NumberFormatException ex){
                    System.out.println(RED + "\n ¡¡¡ LOS CARACTERES NO SON VÁLIDOS  !!!" + RESET);
                    aux.eligeEntidad();
                }
            }
            switch(opcion){
                case 1:
                    System.out.println(GREEN + "\n ********  ESTÉTICAS VETERINARIAS ********" + RESET );
                    System.out.println("\n Cargando datos de Estéticas Veterinarias del archivo...");
                            try {
                                esteticas = archivoEstetica.leeEsteticas();
                                if(esteticas.isEmpty()){
                                    System.out.println(RED + " ¡ La base de datos de Estéticas veterinarias está vacía !" + RESET);
                                }
                            } catch(Exception e){
                                System.out.println(RED + "¡ La base de datos de Estéticas veterinarias está vacía !" + RESET);
                            }
                            OperacionesEstetica operacionesEstetica = new OperacionesEstetica(esteticas);
                            aux.muestraMenu("estéticas veterinarias");
                            int opEst = aux.verificaNumero(sc, 1, 4);
                            switch(opEst){
                                case 1:
                                    operacionesEstetica.agregar();
                                    break;
                                case 2:
                                    operacionesEstetica.consultar();
                                    break;
                                case 3:
                                    operacionesEstetica.editar();
                                    break;
                                case 4:
                                    operacionesEstetica.eliminar();
                                    break;
                            }
                    System.out.println(PURPLE + "______________________________________ \n" + RESET);
                    break;

                case 2:
                    System.out.println(GREEN + "\n ********  MASCOTAS ********" + RESET );
                            System.out.println("\n Cargando datos de Mascotas del archivo...");
                            try {
                            mascotas = archivoMascota.leeMascotas();
                                if(mascotas.isEmpty()){
                                    System.out.println(RED + " ¡ La base de datos de mascotas está vacía !" + RESET);
                                }
                            } catch(Exception e){
                                System.out.println(RED + "¡ La base de datos de mascotas está vacía !" + RESET);
                            }
                            OperacionesMascota operacionesMascota = new OperacionesMascota(mascotas);
                            aux.muestraMenu("mascotas");
                            int opMas = aux.verificaNumero(sc, 1, 4);
                            switch(opMas){
                                case 1:
                                    operacionesMascota.agregar();
                                    break;
                                case 2:
                                    operacionesMascota.consultar();
                                    break;
                                case 3:
                                    operacionesMascota.editar();
                                    break;
                                case 4:
                                    operacionesMascota.eliminar();
                                    break;
                            }
                    System.out.println(PURPLE + "______________________________________ \n" + RESET);
                    break;

                case 3:
                    System.out.println(GREEN + "\n ********  CLIENTES ********" + RESET );
                    System.out.println("\n Cargando datos de Clientes del archivo...");
                            try {
                                clientes = archivoCliente.leeClientes();
                                if(clientes.isEmpty()){
                                    System.out.println(RED + " ¡ La base de datos de Clientes está vacía !" + RESET);
                                }
                            } catch(Exception e){
                                System.out.println(RED + "¡ La base de datos de Clientes está vacía !" + RESET);
                            }
                            OperacionesCliente operacionesCliente = new OperacionesCliente(clientes);
                            aux.muestraMenu("clientes");
                            int opClie = aux.verificaNumero(sc, 1, 4);
                            switch(opClie){
                                case 1:
                                    operacionesCliente.agregar();
                                    break;
                                case 2:
                                    operacionesCliente.consultar();
                                    break;
                                case 3:
                                    operacionesCliente.editar();
                                    break;
                                case 4:
                                    operacionesCliente.eliminar();
                                    break;
                            }
                    System.out.println(PURPLE + "______________________________________ \n" + RESET);
                    break;

                case 0:
                    System.out.println(GREEN + "\n ¡¡ HASTA PRONTO :D !! \n" + RESET);
                    break;

                default:
                    System.out.println(RED + "\n ¡¡¡ OPCIÓN FUERA DE RANGO !!!" + RESET);
                    break;
                }
        } while(opcion != 0);
    }
}