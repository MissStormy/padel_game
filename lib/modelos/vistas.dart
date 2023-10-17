import 'dart:io';
import 'package:padel_game/modelos/partido.dart';

class Vistas {
  //Instancias
  Partido partido = new Partido();

  //Variables
  String? MGopc; //Menu general
  String? MCopc; //Menu opciones
  String? MPopc; //Menu partido
  String? jugador1;
  String? jugador2;
  int numSets = 0;
  bool? setPartidoLocal = false;
  bool? setPartidoVisita = false;
  int contLocal = 0;
  int contVisita = 0;
  String? ganador;

  //Constructor
  Vistas() {}

  //Metodos
  void printMenuGeneral() {
    limpiaPantalla();
    print("============ CLUB DE PADEL R'LYEH ===========");
    print("| Bienvenido, elige lo que quieres hacer... |");
    print("| 1. Configurar un partido de padel         |");
    print("| 2. Empezar un partido de padel            |");
    print("| 3. Salir                                  |");
    print("=============================================");
  }

  void menuGeneral(String? MGopc) {
    switch (MGopc) {
      case "1":
        printMenuConfig();
        while (MCopc != "3") {
          MCopc = (stdin.readLineSync() ?? "0");
          menuConfig(MCopc);
        }
      case "2":
        if (jugador1 != null && jugador2 != null && numSets != null) {
          printMenuPartido();
          while (MPopc != "3") {
            MPopc = stdin.readLineSync();
            menuPartido(MPopc);
          }
        } else {
          print("Che, relaja, y configura primero el partido");
        }
      case "3":
        print("Bye bye");
        break;
      default:
        print("Alquien se ha saltado una clase de barrio sesamo...");
    }
  }

  void printMenuConfig() {
    limpiaPantalla();
    print("========|★| CLUB DE PADEL R'LYEH ===========");
    print("|      Menu de configuración de partido     |");
    print("| 1. Nombrar a los jugadores                |");
    print("| 2. Seleccionar numero de sets             |");
    print("| 3. Volver                                 |");
    print("=============================================");
  }

  void menuConfig(String? MCopc) {
    switch (MCopc) {
      case "1":
        print("=============== JUGADORES ================");
        print("Introduce el nombre de tu primer jugador: ");
        jugador1 = stdin.readLineSync();
        print("Introduce el nombre de tu segundo jugador: ");
        jugador2 = stdin.readLineSync();
        print("==========================================");

        printMenuConfig();
        while (MCopc != "3") {
          MCopc = (stdin.readLineSync() ?? "0");
          menuConfig(MCopc);
        }
      case "2":
        print("Introduce numero de sets (3-5): ");
        String CharNumSets = (stdin.readLineSync() ?? "0");
        numSets = int.parse(CharNumSets);

        printMenuConfig();
        while (MCopc != "3") {
          MCopc = (stdin.readLineSync() ?? "0");
          menuConfig(MCopc);
        }

      case "3":
        printMenuGeneral();
        while (MGopc != "3") {
          MGopc = stdin.readLineSync();
          menuGeneral(MGopc);
        }
    }
  }

  void printMenuPartido() {
    limpiaPantalla();
    print("=========|★| CLUB DE PADEL R'LYEH ===========");
    print("|              Partido en curso             |");
    print("| 1. Anotar punto para local                |");
    print("| 2. Anotar punto para visitante            |");
    print("| 3. Terminar partido                       |");
    print("=============================================");
  }

  void menuPartido(String? MPopc) {
    
    switch (MPopc) {
      case "1":
        setPartidoLocal = partido.addPuntoLocal();
        partido.printPartido();
        //printMenuPartido();
        if (setPartidoLocal == true) {
          contLocal++;
          setPartidoLocal = false;
        }
        if(contLocal == numSets){
          //print("Final de partido!! Ha ganado $jugador1");
          ganador = jugador1;
          printMarcador();
          exit(1);
        }
      case "2":
        setPartidoVisita = partido.addPuntoVisita();
        partido.printPartido();
        //printMenuPartido();
        if (setPartidoVisita == true) {
          contVisita++;
          setPartidoVisita = false;
        }
        if(contVisita == numSets){
          //print("Final de partido!! Ha ganado $jugador2");
          ganador = jugador2;
          printMarcador();
          exit(1);
        }
      case "3":
        print("¿Seguro que quieres terminarlo? S/N");
        String? opc = stdin.readLineSync();

        if (opc == "S") {
          print("Bola de fuego!! +20d10 de daño!!");
          exit(1);
        } else {
          print("Que prosiga el partido!!");
          printMenuPartido();
          while (MPopc != "3") {
            MPopc = stdin.readLineSync();
            menuPartido(MPopc);
          }
        }
      default:
        print("AÑSDLKFJASLKFJASLKFJALKSJF");
    }
  }

  void printMarcador() {
    print("**************************************");
    print("*       |★| CLUB PADEL R'LYEH        *");
    print("*                                    *");
    print("*  Jugadores               Vencedor  *");
    print("* $jugador1                          *");
    print("*                          $ganador  *");
    print("* $jugador2                          *");
    print("**************************************");
  }

  void limpiaPantalla() {
    print("\x1B[2J\x1B[0;0H");
  }
}
