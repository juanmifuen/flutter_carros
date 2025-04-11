import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String _error = '';

  void _login() {
    final user = _usernameController.text.trim();
    final pass = _passwordController.text.trim();
    if (user == 'admin' && pass == 'admin') {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      setState(() {
        _error = 'Usuario o contraseña incorrectos';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Iniciar Sesión')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Usuario'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Contraseña'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Ingresar'),
            ),
            if (_error.isNotEmpty) ...[
              SizedBox(height: 10),
              Text(_error, style: TextStyle(color: Colors.red)),
            ]
          ],
        ),
      ),
    );
  }
}
