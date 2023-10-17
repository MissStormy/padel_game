import 'dart:io';
import 'package:padel_game/modelos/juego.dart';

class GameSet {
  //Instancias
  Juego juego = new Juego();
  //Variables
  int puntoLocal = 0;
  int puntoVisita = 0;
  int juegoLocal = 0;
  int juegoVisita = 0;
  bool? finalGameSet = false;

  Map<String, int> marcador = {
    'Puntos locales': 0,
    'Puntos visitante': 0,
    'Juegos locales': 0,
    'Juegos visitante': 0
  };

  //Constructor
  GameSet() {
    this.juegoLocal = juegoLocal;
    this.juegoVisita = juegoVisita;
    this.marcador = marcador;
    this.finalGameSet = finalGameSet;
  }

  //Metodos
  bool? addPuntoLocal() {
    bool? resultado = false;
    //Recogemos el valor de los juegos
    resultado = juego.addPuntoLocal();
    //Si es true, entonces ha ganado el juego (40 puntos) y se le suma un juego
    if (resultado == true) {
      juegoLocal++;
      marcador['Juegos locales'] = juegoLocal;
      //Cuando se llegan a 6 juegos, se apunta un gameset
      //Y se reinicia el contador de acuerdo con los sets (3-5)
      if (juegoLocal == 6) {
        finalGameSet = true;
        juegoLocal = 0;
      } else {
        finalGameSet = false;
      }
    } else {
      resultado = false;
    }

    return finalGameSet;
  }

  bool? addPuntoVisita() {
    bool? resultado = false;
    resultado = juego.addPuntoVisita();

    if (resultado == true) {
      juegoVisita++;
      marcador['Juegos visitante'] = juegoVisita;
      if (juegoVisita == 6) {
        finalGameSet = true;
        juegoVisita = 0;
      } else {
        finalGameSet = false;
      }
    } else {
      resultado = false;
    }

    return finalGameSet;
  }

  void getGameSet() {
    print("\x1B[2J\x1B[0;0H");
    juego.getJuego();
    print("========GAMESET======");
    print("Juegos locales: ${marcador['Juegos locales']}");
    print("Juegos visitante: ${marcador['Juegos visitante']}");
    print("=====================");
  }
}
