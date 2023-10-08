import 'package:flutter/material.dart';

class TimeConfigScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Configurações do Tempo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Ajuste o tempo do Pomodoro:',
              style: TextStyle(fontSize: 20),
            ),
            Slider(
              value: 25, // valor inicial, altere conforme necessário
              onChanged: (double value) {
                // atualizar o valor do tempo
              },
              min: 5,
              max: 60,
              divisions: 55,
              label: '25', // valor inicial, altere conforme necessário
            ),
            SizedBox(height: 20),
            Text(
              'Ajuste o tempo de descanso:',
              style: TextStyle(fontSize: 20),
            ),
            Slider(
              value: 5, // valor inicial, altere conforme necessário
              onChanged: (double value) {
                // atualizar o valor do tempo de descanso
              },
              min: 1,
              max: 15,
              divisions: 14,
              label: '5', // valor inicial, altere conforme necessário
            ),
            // Adicione outros elementos de configuração conforme necessário
          ],
        ),
      ),
    );
  }
}

