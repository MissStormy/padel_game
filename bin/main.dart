import 'dart:io';
import 'package:padel_game/modelos/vistas.dart';
import 'package:padel_game/modelos/juego.dart';
import 'package:padel_game/modelos/gameset.dart';
import 'package:padel_game/modelos/partido.dart';

void main(List<String> arguments) {
  /*Test de Clase Juego
  Juego juego = new Juego();

  juego.addPuntoLocal();
  juego.addPuntoLocal();
  juego.addPuntoVisita();
  juego.addPuntoVisita();
  juego.getJuego();*/

  /*Test de Clase GameSet
  GameSet gameSet = new GameSet();

  gameSet.addPuntoLocal();
  gameSet.addPuntoLocal();
  gameSet.addPuntoLocal();
  gameSet.addPuntoVisita();
  gameSet.getGameSet();*/

  /*Test de Clase Partido
  Partido partido = new Partido();

  partido.addPuntoLocal();
  partido.addPuntoLocal();
  partido.addPuntoLocal();
  partido.addPuntoLocal();
  partido.addPuntoVisita();
  partido.printPartido();*/

  String? MGopc; //Menu general
  String? MCopc; //Menu opciones
  String? MPopc; //Menu partido

  Vistas vista = new Vistas();

  vista.limpiaPantalla();

  vista.printMenuGeneral();
  while (MGopc != "3") {
    MGopc = stdin.readLineSync();
    vista.menuGeneral(MGopc);
  }
}
