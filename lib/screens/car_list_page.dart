import 'package:flutter/material.dart';
import '../services/car_service.dart';
import '../widgets/car_item.dart';

class CarListPage extends StatefulWidget {
  final String token;

  CarListPage({required this.token});

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
    final fetchedCars = await CarService.getCars(widget.token);
    setState(() {
      cars = fetchedCars;
      _isLoading = false;
    });
  }

  void _logout() {
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mis Carros'),
        actions: [
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
