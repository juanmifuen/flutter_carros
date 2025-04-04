import 'package:flutter/material.dart';

class CarItem extends StatelessWidget {
  final String placa;
  final String conductor;

  CarItem({required this.placa, required this.conductor});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Placa: $placa", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Conductor: $conductor"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
