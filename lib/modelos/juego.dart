import 'dart:io';

class Juego{
  //Variables
  int puntoLocal = 0;
  int marcadorLocal = 0;
  int puntoVisita = 0;
  int marcadorVisita = 0;
  final List<int> puntos = [00, 15, 30, 40];
  bool finalJuego = false;

  Map<String, int> marcador = {
    'Puntos locales': 0,
    'Puntos visitante': 0,
  };

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
      //Lo primero, miramos si no sobrepasamos el limite de la lista
      if(puntoLocal < puntos.length - 1){
      puntoLocal++;
    }
      //Guardamos el valor de los puntos en el marcador
      int marcadorLocal = puntos[puntoLocal];
      marcador['Puntos locales'] = marcadorLocal;
      //Y ahora miramos si ha ganado o no
      if(marcadorLocal == 40){
        finalJuego = true;
      }else{
        finalJuego = false;
      }

      //Retornamos el valor para recogerlo desde GameSet
      return finalJuego;

    }catch(e){
      print("Ooopsie, woopsie");
    }
  }

  bool? addPuntoVisita(){
    try{
      //Lo primero, miramos si no sobrepasamos el limite de la lista
      if(puntoVisita < puntos.length - 1){
      puntoVisita++;
    }
      //Guardamos el valor de los puntos en el marcador
      int marcadorVisita = puntos[puntoVisita];
      marcador['Puntos visitante'] = marcadorVisita;
      //Y ahora miramos si ha ganado o no
      if(marcadorVisita == 40){
        finalJuego = true;
      }else{
        finalJuego = false;
      }

      //Retornamos el valor para recogerlo desde GameSet
      return finalJuego;

    }catch(e){
      print("Ooopsie, woopsie");
    }
  }

  void getJuego(){
    print("=====================");
    print("Local: ${marcador['Puntos locales']}");
    print("Visitante: ${marcador['Puntos visitante']}");
    print("=====================");
  }
}