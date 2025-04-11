import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class QRScannerPage extends StatefulWidget {
  @override
  _QRScannerPageState createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool scanned = false;

  void _onQRViewCreated(QRViewController ctrl) {
    this.controller = ctrl;
    controller!.scannedDataStream.listen((scanData) async {
      if (!scanned) {
        scanned = true;
        final id = scanData.code;
        final url = 'https://67f7d1812466325443eadd17.mockapi.io/carros/$id';
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          final car = json.decode(response.body);
          Navigator.pushNamed(context, '/car_detail', arguments: car);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Carro no encontrado')),
          );
          Navigator.pop(context);
        }
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Escanear QR')),
      body: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
      ),
    );
  }
}
