import 'package:flutter/material.dart';
import 'package:brocoscan/home_page.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página de Bienvenida'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hola, soy BrocoScan',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Image.asset('assets/images/welcome.png'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text('Siguiente'),
            ),
          ],
        ),
      ),
    );
  }
}
