/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Project/Maven2/JavaApp/src/main/java/${packagePath}/${mainClassName}.java to edit this template
 */
package veterinaria.projectomaven;

import java.lang.Math;
import java.sql.SQLException;
import java.util.List;
import java.util.Scanner;
import veterinaria.projectomaven.Conexion.ConexionBD;
import veterinaria.projectomaven.Modelo.Juguete;
import veterinaria.projectomaven.Modelo.Accesorio;
import veterinaria.projectomaven.Repositorio.JugueteRepositorio;
import veterinaria.projectomaven.Servicio.AccesorioServicio;
import veterinaria.projectomaven.Servicio.JugueteServicio;

/**
 * Clase principal Main donde haremos las operaciones.
 */
public class ProjectoMaven {

    public static Scanner sc = new Scanner(System.in);

    // ------------------------ MÉTODOS AUXILIARES ------------------------ 

    /**
     * Método que imprime el menú principal.
     */
    public static void menuDatos() {
        System.out.println("\n  ¿QUÉ DESEAS HACER? ");
        System.out.println(" ► TABLA JUGUETE"
                + "\n  [0] •Insertar juguete."
                + "\n  [1] •Actualizar juguete."
                + "\n  [2] •Borrar juguete."
                + "\n  [3] •Obtener informacion de todos  los juguetes."
                + "\n  [4] •Obtener informacion de un solo juguete."
                + "\n\n ► TABLA ACCESORIO"
                + "\n  [5] •Insertar accesorio."
                + "\n  [6] •Actualizar accesorio."
                + "\n  [7] •Borrar accesorio."
                + "\n  [8] •Obtener informacion de todos  los accesorios."
                + "\n  [9] •Obtener informacion de un solo accesorio."
                + "\n  [10] •SALIR.");
        System.out.print("\n Opcion: ");
    }

    /**
     * Método que manda error si el usuario ingresa un caracter cuando se pide un float.
     * @param sc es el Scanner.
     * @return un valor de tipo float.
     */
    public static float verificaDouble(Scanner sc) {
        float numCadena;
        while (true) {
            try {
                numCadena = Float.parseFloat(sc.nextLine());
                if (numCadena < 1) {
                    throw new IndexOutOfBoundsException("\n ¡ ERROR: Sólo se aceptan números positivos !");
                }
                break;
            } catch (IndexOutOfBoundsException nfe) {
                System.out.println(nfe.getMessage());
            } catch (NumberFormatException nfe) {
                System.out.println("\n ¡ ERROR: Los caracteres no son válidos  !");
            } catch (Exception e) {
                System.out.println("\n ¡ ERROR: Algo inesperado ocurrió  !");
            }
        }
        return numCadena;
    }

    /**
     * Método que manda error si el usuario ingresa un caracter cuando se pide un entero.
     * @param sc es el Scanner.
     * @return un valor de tipo entero.
     *
     */
    public static int verificaInt(Scanner sc) {
        int numCadena;
        while (true) {
            try {
                numCadena = Integer.parseInt(sc.nextLine());
                if (numCadena < 1) {
                    throw new IndexOutOfBoundsException("\n ¡ ERROR: Sólo se aceptan números positivos !");
                }
                break;
            } catch (IndexOutOfBoundsException nfe) {
                System.out.println(nfe.getMessage());
            } catch (NumberFormatException nfe) {
                System.out.println("\n ¡ ERROR: Los caracteres no son válidos  !");
            } catch (Exception e) {
                System.out.println("\n ¡ ERROR: Algo inesperado ocurrió  !");
            }
        }
        return numCadena;
    }

    /**
     * Método que crea el id de un producto a partir de su nombre.
     * @param nombre es el nombre del producto.
     * @return un id basado en el nombre de un producto.
     */
    public static String creaId(String nombre) {
        String letter = (nombre.substring(0, 3)).toUpperCase();
        String id = letter;
        for (int i = 1; i <= 7; i++) {
            id += (int) (Math.random() * 10);
        }
        return id;
    }

    /**
     * Método que verifica que el nombre del producto tenga mínimo 3 caracteres.
     * @param producto es el tipo de producto.
     * @return un nombre para el producto con mínimo 3 caracteres.
     *
     */
    public static String verificaNombre(String producto) {
        String nombre;
        do {
            System.out.println("\n[._.] ¿Cuál es el nombre del " + producto + " ?");
            nombre = sc.nextLine();
            if (nombre.length() < 3) {
                System.out.println("\n ¡ ERROR: El nombre debe de tener mínimo 3 caracteres !");
            }
        } while (nombre.length() < 3);
        return nombre;
    }

    /**
     * Método que verifica que el id del producto tenga 10 caracteres.
     * @param producto es el tipo de producto.
     * @return un id para el producto con 10 caracteres.
     */
    public static String verificaId(String producto) {
        String id;
        do {
            System.out.println("\n[._.] ¿Cuál es el nuevo ID del " + producto + " a actualizar?");
            id = sc.nextLine();
            if (id.length() < 10 || id.length() > 10) {
                System.out.println("\n ¡ ERROR: El id debe de tener 10 caracteres !");
            }
        } while (id.length() < 10 || id.length() > 10);
        return id;
    }

    /**
     * Método que imprime los atributos a actualizar.
     */
    public static void menuActualizar() {
        System.out.println("\n ¿QUÉ DESEA ACTUALIZAR? ");
        System.out.println("  [1] •Id"
                + "\n  [2] •Nombre"
                + "\n  [3] •Precio"
                + "\n  [4] •Num. Unidades"
                + "\n  [5] •Descripción"
                + "\n  [6] •Nombre de archivo"
                + "\n  [0] •Salir");
        System.out.print("\n Opcion: ");
    }


    public static void main(String[] args) throws Exception {

        String idProducto;
        String nombre;
        float precio;
        int numUnidades;
        String descripcion;
        String nombreArchivo;
        String opcion;
        String idProductoN;
        JugueteServicio jugueteS = new JugueteServicio();
        Juguete juguete;
        List listaJuguetes;
        AccesorioServicio accesorioS = new AccesorioServicio();
        Accesorio accesorio;
        List listaAccesorios;

        System.out.println("BIENVENIDO A NUESTRO SISTEMA REALIZADOR DE OPERACIONES\nCRUD SOBRE UNA BASE DE DATOS :D");
        try {
            do {
                menuDatos();
                opcion = sc.nextLine();
                switch (opcion) {
                    case "0":
                        System.out.println("\n **** INSERTAR JUGUETE ****\n");
                        nombre = verificaNombre("juguete");
                        idProducto = creaId(nombre);
                        System.out.println("\n[._.] ¿Cuál es el precio del juguete a insertar?");
                        precio = verificaDouble(sc);
                        System.out.println("\n[._.] ¿Cuántas unidades hay del juguete a insertar?");
                        numUnidades = verificaInt(sc);
                        System.out.println("\n[._.] ¿Cuál es la descripción del juguete a insertar?");
                        descripcion = sc.nextLine();
                        System.out.println("\n[._.] ¿Cuál es el nombre del archivo del juguete a insertar?");
                        nombreArchivo = sc.nextLine();
                        juguete = new Juguete(idProducto, nombre, precio, numUnidades, descripcion, nombreArchivo);
                        jugueteS.insertarJuguete(juguete);

                        break;
                    case "1":
                        System.out.println("\n **** ACTUALIZAR JUGUETE ****\n");
                        System.out.println("[._.] ¿Cuál es el ID del juguete a actualizar?:");
                        idProducto = sc.nextLine();
                        juguete = jugueteS.getJuguete(idProducto);
                        if (juguete == null) {
                            System.out.println("\n NO EXISTE EL JUGUETE :C \n");
                        } else {
                            String opAct;
                            do {
                                menuActualizar();
                                opAct = sc.nextLine();
                                switch (opAct) {
                                    case "1":
                                        String id = verificaId("juguete");
                                        juguete.setIdProducto(id);
                                        break;
                                    case "2":
                                        nombre = verificaNombre("juguete");
                                        juguete.setNombre(nombre);
                                        break;
                                    case "3":
                                        System.out.println("[._.] ¿Cuál es el nuevo precio del juguete a actualizar?");
                                        precio = verificaDouble(sc);
                                        juguete.setPrecio(precio);
                                        break;
                                    case "4":
                                        System.out.println("[._.] ¿Cuántas unidades nuevas hay del juguete a actualizar?");
                                        numUnidades = verificaInt(sc);
                                        juguete.setNumUnidades(numUnidades);
                                        break;
                                    case "5":
                                        System.out.println("[._.] ¿Cuál es la nueva descripción del juguete a actualizar?");
                                        descripcion = sc.nextLine();
                                        juguete.setDescripcion(descripcion);
                                        break;
                                    case "6":
                                        System.out.println("[._.] ¿Cuál es el nuevo nombre del archivo del juguete a actualizar?");
                                        nombreArchivo = sc.nextLine();
                                        juguete.setNombreArchivo(nombreArchivo);
                                        break;
                                }
                            } while (!opAct.equals("0"));
                            jugueteS.actualizarJuguete(idProducto, juguete);
                            System.out.println("\n SE HA ACTUALIZADO EL JUGUETE :D ");
                            System.out.println(juguete);
                        }
                        break;
                    case "2":
                        System.out.println("\n **** BORRAR JUGUETE ****\n");
                        System.out.println("[._.] ¿Cuál es el ID del juguete a borrar?:");
                        idProducto = sc.nextLine();
                        juguete = jugueteS.getJuguete(idProducto);
                        if (juguete == null) {
                            System.out.println("\n NO EXISTE EL JUGUETE :C \n");
                        } else {
                            jugueteS.borrarJuguete(idProducto);
                            System.out.println("\n SE HA ELIMINADO EL JUGUETE :D \n");
                        }
                        break;
                    case "3":
                        System.out.println("\nCARGANDO JUGUETES...\n");
                        listaJuguetes = jugueteS.getJuguetes();
                        System.out.println(listaJuguetes.toString());
                        break;
                    case "4":
                        System.out.println("\n **** OBTENER JUGUETE ****\n");
                        System.out.println("[._.] ¿Cuál es el ID del juguete a obtener?:");
                        idProducto = sc.nextLine();
                        System.out.println("\nCARGANDO JUGUETE...\n");
                        juguete = jugueteS.getJuguete(idProducto);
                        if (juguete == null) {
                            System.out.println("\n NO EXISTE EL JUGUETE :C \n");
                        } else {
                            System.out.println(juguete);
                        }
                        break;
                    case "5":
                        System.out.println("\n **** INSERTAR ACCESORIO ****\n");
                        nombre = verificaNombre("accesorio");
                        idProducto = creaId(nombre);
                        System.out.println("[._.] ¿Cuál es el precio del accesorio a insertar?");
                        precio = verificaDouble(sc);
                        System.out.println("[._.] ¿Cuántas unidades hay del accesorio a insertar?");
                        numUnidades = verificaInt(sc);
                        System.out.println("[._.] ¿Cuál es la descripcion del accesorio a insertar?");
                        descripcion = sc.nextLine();
                        System.out.println("[._.] ¿Cuál es el nombre del archivo del accesorio a insertar?");
                        nombreArchivo = sc.nextLine();
                        accesorio = new Accesorio(idProducto, nombre, precio, numUnidades, descripcion, nombreArchivo);
                        accesorioS.insertarAccesorio(accesorio);

                        break;
                    case "6":
                        System.out.println("\n **** ACTUALIZAR ACCESORIO ****\n");
                        System.out.println("[._.] ¿Cuál es el ID del accesorio a actualizar?:");
                        idProducto = sc.nextLine();
                        accesorio = accesorioS.getAccesorio(idProducto);
                        if (accesorio == null) {
                            System.out.println("\n NO EXISTE EL ACCESORIO :C \n");
                        } else {
                            String opAct;
                            do {
                                menuActualizar();
                                opAct = sc.nextLine();
                                switch (opAct) {
                                    case "1":
                                        String id = verificaId("accesorio");
                                        accesorio.setIdProducto(id);
                                        break;
                                    case "2":
                                        nombre = verificaNombre("accesorio");
                                        accesorio.setNombre(nombre);
                                        break;
                                    case "3":
                                        System.out.println("[._.] ¿Cuál es el nuevo precio del accesorio a actualizar?");
                                        precio = verificaDouble(sc);
                                        accesorio.setPrecio(precio);
                                        break;
                                    case "4":
                                        System.out.println("[._.] ¿Cuántas unidades nuevas hay del accesorio a actualizar?");
                                        numUnidades = verificaInt(sc);
                                        accesorio.setNumUnidades(numUnidades);
                                        break;
                                    case "5":
                                        System.out.println("[._.] ¿Cuál es la nueva descripción del accesorio a actualizar?");
                                        descripcion = sc.nextLine();
                                        accesorio.setDescripcion(descripcion);
                                        break;
                                    case "6":
                                        System.out.println("[._.] ¿Cuál es el nuevo nombre del archivo del accesorio a actualizar?");
                                        nombreArchivo = sc.nextLine();
                                        accesorio.setNombreArchivo(nombreArchivo);
                                        break;
                                }
                            } while (!opAct.equals("0"));
                            accesorioS.actualizarAccesorio(idProducto, accesorio);
                            System.out.println("\n SE HA ACTUALIZADO EL ACCESORIO :D ");
                            System.out.println(accesorio);
                        }
                        break;
                    case "7":
                        System.out.println("\n **** BORRAR ACCESORIO ****\n");
                        System.out.println("[._.] ¿Cuál es el ID del accesorio a borrar?:");
                        idProducto = sc.nextLine();
                        accesorio = accesorioS.getAccesorio(idProducto);
                        if (accesorio == null) {
                            System.out.println("\n NO EXISTE EL ACCESORIO :C \n");
                        } else {
                            accesorioS.borrarAccesorio(idProducto);
                            System.out.println("\n SE HA ELIMINADO EL ACCESORIO :D \n");
                        }
                        break;
                    case "8":
                        System.out.println("CARGANDO ACCESORIOS...");
                        listaAccesorios = accesorioS.getAccesorios();
                        System.out.println(listaAccesorios.toString());
                        break;
                    case "9":
                        System.out.println("\n **** OBTENER ACCESORIO ****\n");
                        System.out.println("[._.] ¿Cuál es el ID del accesorio a obtener?:");
                        idProducto = sc.nextLine();
                        System.out.println("\nCARGANDO ACCESORIO...\n");
                        accesorio = accesorioS.getAccesorio(idProducto);
                        if (accesorio == null) {
                            System.out.println("\n NO EXISTE EL ACCESORIO :C \n");
                        } else {
                            System.out.println(accesorio);
                        }
                        break;
                }
            } while (!opcion.equals("10"));
            System.out.println(" ¡ HASTA PRONTO :D !");
        } catch (SQLException sql) {
            sql.printStackTrace();
        }

    }
}
