import 'package:flutter/material.dart';
import 'package:tdah_organize/Splash Screen/splash_screen.dart'; // Importação da tela de inicialização
import 'package:tdah_organize/home_screen/pomodoro_screen.dart'; // Importação da tela Pomodoro
import 'package:tdah_organize/home_screen/time_config.dart'; // Importação da tela de configuração do tempo

void main() {
  runApp(const MyApp()); // Inicia o aplicativo
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gerenciador de Tarefas', // Título do aplicativo
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), // Tema principal
        useMaterial3: true,
      ),
      initialRoute: '/', // Rota inicial
      routes: {
        '/': (context) => SplashScreen(), // Definindo SplashScreen como a página inicial
        '/pomodoro': (context) => PomodoroScreen(), // Rota para a tela do Pomodoro
        '/time_config': (context) => TimeConfigScreen(), // Rota para a tela de configuração do tempo
      },
    );
  }
}

