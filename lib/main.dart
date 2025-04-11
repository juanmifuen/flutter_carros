import 'package:flutter/material.dart';
import 'screens/login.page.dart';
import 'screens/car_list_page.dart';
import 'screens/car_detail_page.dart';
import 'screens/qr_scanner_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Carros Eléctricos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => CarListPage(),
        '/car_detail': (context) => CarDetailPage(),
        '/qr': (context) => QRScannerPage(),
      },
    );
  }
}


