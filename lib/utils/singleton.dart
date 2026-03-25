///Esta clase es un punto de acceso de global:
///Funciona como una especie de BD local que se elimina
///al borrar el cache o matando/cerrando la aplicación
class Singleton {
  //Crear una instancia de la misma clase pero al mimso tiempo
  //revisa si ya existe una instancia, si existe devuelve
  //la que encuentra y si no crea una.
  static final Singleton _singleton = Singleton._internal();
  factory Singleton() => _singleton;
  Singleton._internal();

  String nameUser = '';
  String lastNameUser = '';
  int wallet = 0;

  double latitud = 0.0;
  double longitud = 0.0;

  //saldo: es una bandera para indicar saldo a favor (1) o en contra (0)
  List<Map<String, dynamic>> movimientos = [
    {
      'id': 1,
      'monto': '200',
      'fecha': '22/02/2026',
      'hora': '10:30 AM',
      'lugar': 'Amazon',
      'asunto': 'Pago de membresia',
      'estatus': 0,
    },
    {
      'id': 2,
      'monto': '100',
      'fecha': '22/02/2026',
      'hora': '11:00 AM',
      'lugar': 'Starbucks',
      'asunto': 'Compra de cafe',
      'estatus': 0,
    },
    {
      'id': 3,
      'monto': '50',
      'fecha': '21/02/2026',
      'hora': '11:15 PM',
      'lugar': 'BBVA',
      'asunto': 'Transferencia',
      'estatus': 1,
    },
  ];

  void addMov(Map<String, dynamic> nuevo){
    movimientos.add(nuevo);
  }

  void deleteMov(/*Map<String, dynamic> nuevo*/int id){
    //movimientos.remove(nuevo);
    movimientos.removeAt(id);
  }
}