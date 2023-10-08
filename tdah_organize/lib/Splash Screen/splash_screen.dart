import 'package:flutter/material.dart';
import 'package:tdah_organize/home_screen/bottom_navigation.dart';


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('lib/image/splash_image.jpg'), // Carregando a imagem
            SizedBox(height: 20),
            Text(
              'Meu Gerenciador de Tarefas',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Texto de boas-vindas
            ),
            SizedBox(height: 20), // Espaço extra antes do botão
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8, // Definindo a largura do botão como 80% da largura da tela
              height: 50, // Definindo a altura do botão
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainScreen()), // Navegação para a HomeScreen
                  );
                },
                child: Text('Entrar'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple, // Cor do botão
                  onPrimary: Colors.white, // Cor do texto
                  elevation: 5, // Elevação do botão
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
