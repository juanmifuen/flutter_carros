import 'package:flutter/material.dart';
import '../services/car_service.dart';
import '../widgets/car_item.dart';
import 'qr_scanner_page.dart';

class CarListPage extends StatefulWidget {
  @override
  _CarListPageState createState() => _CarListPageState();
}

class _CarListPageState extends State<CarListPage> {
  List cars = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchCars();
  }

  Future<void> _fetchCars() async {
    final fetchedCars = await CarService.getCars();
    setState(() {
      cars = fetchedCars;
      _isLoading = false;
    });
  }

  void _logout() {
    Navigator.pushReplacementNamed(context, '/');
  }

  void _scanQR() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QRScannerPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mis Carros'),
        actions: [
          IconButton(
            icon: Icon(Icons.qr_code_scanner),
            onPressed: _scanQR,
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: _logout,
          )
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: cars.length,
              itemBuilder: (context, index) {
                return CarItem(
                  placa: cars[index]['placa'],
                  conductor: cars[index]['conductor'],
                );
              },
            ),
    );
  }
}
