import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(
        titulo: '3.6. HTTP Peticion',
        textoBienvenida:
            'A continuacion se mostrara el resultado de una peticion HTTP',
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  // Constructor
  const HomePage({
    super.key,
    required this.textoBienvenida,
    required this.titulo,
  });
  // Variables
  final String textoBienvenida;
  final String titulo;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _responseText = "";
  String url = "https://pokeapi.co/api/v2/pokemon";

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      // Extraer los tipos correctamente
      final List<String> results =
          data['results'].map<String>((r) => r['name'].toString()).toList();

      // Convertir la lista en un String
      final String typesAsString = results.join(',\n');

      setState(() {
        _responseText = typesAsString.toString();
      });
    } else {
      setState(() {
        _responseText = "Error en la petición: ${response.statusCode}";
      });
    }
  }

  void cleanText() {
    setState(() {
      _responseText = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/wp.jpg'), // Ruta de la imagen
            fit: BoxFit.cover, // Ajustar imagen para cubrir toda la pantalla
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centrar los text
            children: [
              Text(
                widget.titulo,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 43, // Tamaño
                  fontWeight: FontWeight.bold, // Para hacerlo más grueso
                ),
              ),
              Text(
                widget.textoBienvenida,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30, // Tamaño
                  fontWeight: FontWeight.bold, // Para hacerlo más grueso
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: fetchData,
                    child: Text('Hacer petición'),
                  ),
                  ElevatedButton(
                    onPressed: cleanText,
                    child: Text('Limpiar datos'),
                  ),
                ],
              ),
              Text(
                _responseText,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15, // Tamaño
                  fontWeight: FontWeight.bold, // Para hacerlo más grueso
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
