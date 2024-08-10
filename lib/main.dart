import 'package:flutter/material.dart';
import 'package:trackizer/common/color_extension.dart';
import 'package:trackizer/view/login/welcome_view.dart';
import 'package:trackizer/view/main_tab/main_tab_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Managed',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Inter",
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightBlue, // Azul claro como color principal.
          background: Colors.grey.shade100, // Gris claro para el fondo.
          primary: Colors.lightBlue, // Color principal azul claro.
          primaryContainer: Colors.blue.shade700, // Contenedor principal en un tono de azul más oscuro.
          secondary: Colors.tealAccent.shade200, // Verde menta para el color secundario.
        ),
        useMaterial3: false,
      ),
      home: const MainTabView(),
    );
  }
}
