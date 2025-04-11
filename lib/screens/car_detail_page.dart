import 'package:flutter/material.dart';

class CarDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final car = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(title: Text('Detalle del Carro')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Placa: ${car['placa']}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Conductor: ${car['conductor']}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Marca: ${car['marca'] ?? 'Desconocida'}', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
