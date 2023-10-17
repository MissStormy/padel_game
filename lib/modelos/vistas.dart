import 'dart:io';
import 'package:padel_game/modelos/partido.dart';

class Vistas{
  //Instancias
  Partido partido = new Partido();

  //Variables
  int MGopc = 0; //Menu general
  int MCopc = 0; //Menu opciones
  int MPopc = 0; //Menu partido

  //Constructor
  Vistas(){}

  //Metodos
  void printMenuGeneral(){
    print("=============================");
  }
  void printMenuConfig(){

  }
  void printMenuPartido(){

  }
  void printMarcador(){
    print("**************************************");
    print("*       |★| CLUB PADEL R'LYEH        *");
    print("*                                    *");
    print("*  Jugadores               SETS      *");
    print("*                                    *");
    print("*                                    *");
    print("*                                    *");
    print("**************************************");

  }

}