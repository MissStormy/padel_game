import 'dart:io';

class Juego{
  //Variables
  int puntoLocal = 0;
  int marcadorLocal = 0;
  int puntoVisita = 0;
  int marcadorVisita = 0;
  final List<int> puntos = [00, 15, 30, 40];
  bool finalJuego = false;

  //Constructor
  Juego(){
    this.puntoLocal = puntoLocal;
    this.puntoVisita = puntoVisita;
    this.marcadorLocal = marcadorLocal;
    this.marcadorVisita = marcadorVisita;
    this.finalJuego = finalJuego;
  }

  //Metodos
  bool? addPuntoLocal(){
    try{
      //Lo primero, miramos si no sobrepasamos el limite
      if(puntoLocal < puntos.length - 1){
      puntoLocal++;
    }
      int marcadorLocal = puntos[puntoLocal];
    }catch(e){
      print("Ooopsie, woopsie");
    }
    


  }

}