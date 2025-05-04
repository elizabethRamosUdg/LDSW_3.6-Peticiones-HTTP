import 'package:flutter/material.dart';

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
        titulo: '3.5. Home screen',
        textoBienvenida: 'Bienvenido!!',
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
            ],
          ),
        ),
      ),
    );
  }
}
