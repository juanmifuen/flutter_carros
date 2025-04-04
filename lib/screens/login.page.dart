import 'package:flutter/material.dart';
import '../widgets/login_form.dart';
import '../services/auth_service.dart';
import 'car_list_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: LoginForm(
            onLogin: (username, password) async {
              String? token = await AuthService.login(username, password);
              if (token != null) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => CarListPage(token: token)),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Credenciales incorrectas")),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
