import 'dart:io';
import 'package:padel_game/modelos/gameset.dart';


class Partido{
  //Instancias
  GameSet gameSet = new GameSet();
  

  //Variables
  int numSetsLocal = 0;
  int numSetsVisita = 0;
  bool finalPartido = false;
   Map<String, int> marcador = {
    'Sets locales': 0,
    'Sets visitante': 0
  };
  //Constructor
  Partido(){
    this.numSetsLocal = numSetsLocal;
    this.numSetsVisita = numSetsVisita;
    this.finalPartido = finalPartido;
  }

  //Metodos
  bool? addPuntoLocal(){
    bool? resultado = false;
    resultado = gameSet.addPuntoLocal();

    if(resultado == true){
      numSetsLocal++;
      marcador['Sets locales'] = numSetsLocal;
      if(numSetsLocal == 3){
        finalPartido = true;
      }else{
        finalPartido = false;
      }
    }else{
      resultado = false;
    }

    return finalPartido;
  }
  bool? addPuntoVisita(){
bool? resultado = false;
    resultado = gameSet.addPuntoVisita();

    if(resultado == true){
      numSetsVisita++;
      marcador['Sets visitante'] = numSetsVisita;
      if(numSetsVisita == 3){
        finalPartido = true;
      }else{
        finalPartido = false;
      }
    }else{
      resultado = false;
    }

    return finalPartido;
  }
  void printPartido(){
    print("\x1B[2J\x1B[0;0H");
    gameSet.getGameSet();
    print("==========SETS===========");
    print("Local: ${marcador['Sets locales']}");
    print("Visitante: ${marcador['Sets visitante']}");
    print("=========================");
  }
}