import 'package:flutter/material.dart';
import 'utils/sqlite/db_api.dart';
import 'utils/apis_tarea.dart';
import 'utils/sqlite/usuario.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestión de Usuarios API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UsuariosScreen(),
    );
  }
}

class UsuariosScreen extends StatefulWidget {
  const UsuariosScreen({Key? key}) : super(key: key);

  @override
  State<UsuariosScreen> createState() => _UsuariosScreenState();
}

class _UsuariosScreenState extends State<UsuariosScreen> {
  final DBHelper dbHelper = DBHelper();
  final ApiService apiService = ApiService();
  List<Usuario> usuarios = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadUsuarios();
  }

  Future<void> _loadUsuarios() async {
    final list = await dbHelper.getUsuarios();
    setState(() {
      usuarios = list;
    });
  }

  Future<void> _llamarApi() async {
    setState(() => isLoading = true);
    try {
      // Solicitado: enviar nombre y apellido a la API al hacer la llamada
      final listApi = await apiService.fetchUsuarios("Carlos", "Lopez");
      await dbHelper.clearTable(); // Opcional: limpiar antes de cargar nuevos
      for (var u in listApi) {
        await dbHelper.insertUsuario(u);
      }
      await _loadUsuarios();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Datos obtenidos y guardados correctamente')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } finally {
      setState(() => isLoading = false);
    }
  }

  Future<void> _eliminarUsuario(Usuario usuario) async {
    if (usuario.bandera == 1) {
      await dbHelper.deleteUsuario(usuario.id!);
      _loadUsuarios();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuario eliminado')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No se puede eliminar: la bandera no es 1')),
      );
    }
  }

  Future<void> _editarUsuario(Usuario usuario) async {
    usuario.nombre = "${usuario.nombre} (Editado)";
    await dbHelper.updateUsuario(usuario);
    _loadUsuarios();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Usuario editado (simulación)')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuarios CRUD'),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Total: ${usuarios.length}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: _llamarApi,
              icon: const Icon(Icons.cloud_download),
              label: const Text('Llamar API'),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: usuarios.length,
              itemBuilder: (context, index) {
                final u = usuarios[index];
                return ListTile(
                  title: Text('${u.nombre} ${u.apPaterno}'),
                  subtitle: Text('Edad: ${u.edad} | Bandera: ${u.bandera}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () => _editarUsuario(u),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: u.bandera == 1 ? Colors.red : Colors.grey,
                        ),
                        onPressed: () => _eliminarUsuario(u),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}