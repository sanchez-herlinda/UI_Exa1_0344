import 'package:flutter/material.dart';

class Pantalla2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              // El botón de 3 líneas siempre lleva a la pantalla 2 (en este caso, no hace nada)
              onPressed: () => Navigator.pushNamed(context, '/pantalla2'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Buscar platillos...",
                  prefixIcon: Icon(Icons.search, color: Colors.brown[600]),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text("Nuestras Especialidades", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.brown[800])),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildCircularImageStep('https://raw.githubusercontent.com/sanchez-herlinda/Imagenes_para_Flutter_6J-11-Feb-2026/refs/heads/main/pasta.png', "Tradición"),
                      _buildCircularImageStep('https://raw.githubusercontent.com/sanchez-herlinda/Imagenes_para_Flutter_6J-11-Feb-2026/refs/heads/main/lasagna.png', "Calidad"),
                      _buildCircularImageStep('https://raw.githubusercontent.com/sanchez-herlinda/Imagenes_para_Flutter_6J-11-Feb-2026/refs/heads/main/pizza1.png', "Sabor"),
                    ],
                  ),
                  SizedBox(height: 40),
                  Column(
                    children: [
                      Text("¡No te pierdas nada!", textAlign: TextAlign.center, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.brown[900])),
                      Text("Suscríbete para recibir ofertas de Pizza y Pasta", textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                    ],
                  ),
                  SizedBox(height: 25),
                  TextField(decoration: InputDecoration(labelText: "Nombre completo", labelStyle: TextStyle(color: Colors.brown), focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.brown)))),
                  SizedBox(height: 15),
                  TextField(decoration: InputDecoration(labelText: "Correo electrónico", labelStyle: TextStyle(color: Colors.brown), focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.brown)))),
                  SizedBox(height: 20),
                  CheckboxListTile(title: Text("Acepto los términos y condiciones", style: TextStyle(fontSize: 14)), value: true, onChanged: (val) {}, activeColor: Colors.brown, contentPadding: EdgeInsets.zero, controlAffinity: ListTileControlAffinity.leading),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.brown[900], minimumSize: Size(double.infinity, 50), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                    onPressed: () => Navigator.pushNamed(context, '/pantalla3'),
                    child: Text("Suscribirse ahora", style: TextStyle(color: Colors.white, fontSize: 16)),
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
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            // El botón Home lleva a la pantalla de inicio
            Navigator.pushNamed(context, '/');
          } else if (index == 1) {
            // El botón de Menú siempre lleva a la pantalla 3
            Navigator.pushNamed(context, '/pantalla3');
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
        CircleAvatar(radius: 35, backgroundImage: NetworkImage(imageUrl), backgroundColor: Colors.brown[100]),
        SizedBox(height: 8),
        Text(label, style: TextStyle(color: Colors.brown[700], fontSize: 12, fontWeight: FontWeight.bold)),
      ],
    );
  }
}