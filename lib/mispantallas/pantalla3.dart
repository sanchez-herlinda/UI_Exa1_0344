import 'package:flutter/material.dart';

class Pantalla3 extends StatelessWidget {
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
              // El botón de 3 líneas siempre lleva a la pantalla 2
              onPressed: () => Navigator.pushNamed(context, '/pantalla2'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Encuentra a nuestros expertos", style: TextStyle(fontSize: 12, color: Colors.grey[600])),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: "Buscar expertos...",
                  prefixIcon: Icon(Icons.search, color: Colors.brown[600]),
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey[300]!)),
                ),
              ),
              SizedBox(height: 15),
              Text("3 resultados", style: TextStyle(fontSize: 13, color: Colors.brown[400], fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              _buildResultCard("Chef Geraldine Chaplin", "Especialista en Pastas", 'https://raw.githubusercontent.com/sanchez-herlinda/Imagenes_para_Flutter_6J-11-Feb-2026/refs/heads/main/empleado3.png'),
              _buildResultCard("Bellatrix Lestrange", "Sommelier / Experta en Vinos", 'https://raw.githubusercontent.com/sanchez-herlinda/Imagenes_para_Flutter_6J-11-Feb-2026/refs/heads/main/empleado2.png'),
              _buildResultCard("Bela Lugosi", "Maestra Pizzero", 'https://raw.githubusercontent.com/sanchez-herlinda/Imagenes_para_Flutter_6J-11-Feb-2026/refs/heads/main/empleado1.png'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.brown[50],
        selectedItemColor: Colors.brown[900],
        unselectedItemColor: Colors.brown[400],
        currentIndex: 2,
        onTap: (index) {
          if (index == 0) {
            // El botón Home lleva a la pantalla de inicio y limpia la pila
            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
          } else if (index == 1) {
            // El botón de Menú siempre lleva a la pantalla 3 (en este caso, no hace nada)
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

  Widget _buildResultCard(String nombre, String especialidad, String imageUrl) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5, offset: Offset(0, 2))],
      ),
      child: Row(
        children: [
          CircleAvatar(radius: 30, backgroundImage: NetworkImage(imageUrl), backgroundColor: Colors.brown[100]),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(nombre, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.brown[900])),
              Text(especialidad, style: TextStyle(fontSize: 13, color: Colors.grey[600])),
            ],
          ),
        ],
      ),
    );
  }
}