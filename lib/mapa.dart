import 'package:ejercicio1/utils/apis.dart';
import 'package:ejercicio1/utils/singleton.dart';
import 'package:ejercicio1/widgets/snackBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapa extends StatefulWidget {
  const Mapa({super.key});
  @override
  State<Mapa> createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  Singleton sing = Singleton();

  late final CameraPosition _initialPosition = CameraPosition(
    target: LatLng(sing.latitud, sing.longitud),
    zoom: 14.0,
  );

  final List<LatLng> polyPoints= [];
  final Set<Polyline> polyLines = {};

  ///Inicializar o crear o hacer llamados antes de que se construya la vista
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //dentro de initstate no debe de haber funciones async

    getPolyline();
  }

  Future<void> getPolyline() async {
    //Llamado a la api
    OpenRouteServices ops = OpenRouteServices(
        startLat: sing.latitud, startLng: sing.longitud,
        endLat: 22.1489730, endLng: -100.992221
    );

    try {
      var datos; //Variable para manejar los datos
      datos = await ops.getData();
      //imprimimos los pasos para llegar a las coordenadas
      print("1 $datos");
      print("2 ${datos['features']}");
      print("3 ${datos['features'][0]['geometry']}");
      print("4 ${datos['features'][0]['geometry']['coordinates'][0]}");

      LineString ls = LineString(datos['features'][0]['geometry']['coordinates']);

      for(int i = 0; i < ls.lineString.length; i++) {
        //Crear una lista de puntos (LAT, LNG) -> punto
        polyPoints.add(LatLng(ls.lineString[i][1], ls.lineString[i][0]));
      }

      if(polyPoints.length == ls.lineString.length) {
        setPolyLines();  //Creamos la polyline
      }
    } catch(e) {
      print(e);
      ShowSnackBar(context, "Hubo un error al extraer los datos", 15);
    }
  }

  setPolyLines() {
    print("p1 ---------- p2 ----------- p3");
    Polyline polyline = Polyline(
        polylineId: const PolylineId('polyline'),
        color: Colors.red,
        width: 5,
        points: polyPoints
    );

    polyLines.add(polyline);
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _initialPosition,
          zoomControlsEnabled: true,
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          polylines: polyLines,
          onCameraMove: (CameraPosition position) {
            sing.latitud = position.target.latitude;
            sing.longitud = position.target.longitude;
          },
        ),
      ),
    );
  }
}

class LineString {
  LineString(this.lineString);
  List<dynamic> lineString;
}