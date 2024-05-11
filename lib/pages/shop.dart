import 'package:flutter/material.dart';

class ShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito de Compras'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20),
              children: [
                // Producto 1
                ListTile(
                  leading: Image.asset(
                    'assets/images/moon.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text('MOON'),
                  subtitle: Text('\$35,000'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      // Acción para eliminar el producto del carrito
                    },
                  ),
                ),
                // Producto 2
                ListTile(
                  leading: Image.asset(
                    'assets/images/basicas.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text('Basica'),
                  subtitle: Text('\$27,000'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      // Acción para eliminar el producto del carrito
                    },
                  ),
                ),
                // Producto 3
                ListTile(
                  leading: Image.asset(
                    'assets/images/versace.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text('Versace'),
                  subtitle: Text('\$35,000'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      // Acción para eliminar el producto del carrito
                    },
                  ),
                ),
                // Producto 4
                ListTile(
                  leading: Image.asset(
                    'assets/images/glam.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text('Glam'),
                  subtitle: Text('\$35,000'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      // Acción para eliminar el producto del carrito
                    },
                  ),
                ),
                // Producto 5
                ListTile(
                  leading: Image.asset(
                    'assets/images/chic.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text('Blanca Chic'),
                  subtitle: Text('\$27,000'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      // Acción para eliminar el producto del carrito
                    },
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Subtotal:'),
                    Text('\$159,000'), // Cambiar por el subtotal real del carrito
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total:'),
                    Text('\$159,000'), // Cambiar por el total real del carrito
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Acción para finalizar la compra
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.black,
                  ),
                  child: Text('Finalizar Compra'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
