/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nb

/**
 * Clase Excepcion que surje cuando un archivo se intenta manipular y no existe
 * @author Ricardo Badillo Macias
 * @version 16/03/2022
 */
public class ArchivoNoExiste extends Exception{
    public ArchivoNoExiste(String message){
        super(message);
    }
}
