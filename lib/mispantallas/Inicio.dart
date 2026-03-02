import 'package:flutter/material.dart';

class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text("La ROMA", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.brown[900])),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
              icon: Icon(Icons.menu, color: Colors.brown[900], size: 30),
              // El botón de 3 líneas siempre lleva a la pantalla 2
              onPressed: () => Navigator.pushNamed(context, '/pantalla2'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Buscar platillos...     Herlinda Sanchez",
                  prefixIcon: Icon(Icons.search, color: Colors.brown[600]),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
                ),
              ),
            ),
            Container(
              height: screenHeight * 0.4,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage('https://raw.githubusercontent.com/sanchez-herlinda/Imagenes_para_Flutter_6J-11-Feb-2026/refs/heads/main/pizza.png'), fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Explora entre nuestros nuevos servicios...", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.brown[800])),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildCircularImageStep('https://raw.githubusercontent.com/sanchez-herlinda/Imagenes_para_Flutter_6J-11-Feb-2026/refs/heads/main/set.png', "Saludable y rico"),
                      _buildCircularImageStep('https://raw.githubusercontent.com/sanchez-herlinda/Imagenes_para_Flutter_6J-11-Feb-2026/refs/heads/main/set2.png', "Simple y elegante"),
                      _buildCircularImageStep('https://raw.githubusercontent.com/sanchez-herlinda/Imagenes_para_Flutter_6J-11-Feb-2026/refs/heads/main/set3.png', "Nuevo y listo"),
                    ],
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                        textStyle: TextStyle(fontSize: 16),
                      ),
                      onPressed: () => Navigator.pushNamed(context, '/pantalla2'),
                      child: Text("Ver Newsletter"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.brown[50],
        selectedItemColor: Colors.brown[900],
        unselectedItemColor: Colors.brown[400],
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            // El botón de Menú siempre lleva a la pantalla 3
            Navigator.pushNamed(context, '/pantalla3');
          } else if (index == 2) {
            // Placeholder para el tercer botón
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.restaurant_menu), label: 'Expertos'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Ordenar'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Cuenta'),
        ],
      ),
    );
  }

  Widget _buildCircularImageStep(String imageUrl, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(imageUrl),
          backgroundColor: Colors.brown[100],
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(color: Colors.brown[700], fontWeight: FontWeight.w500)),
      ],
    );
  }
}