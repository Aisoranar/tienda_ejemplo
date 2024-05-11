import 'package:flutter/material.dart';

class HeartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos Favoritos'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          _buildFavoriteProductItem(
            image: 'assets/images/moon.png',
            name: 'MOON',
            price: '\$35,000',
          ),
          _buildFavoriteProductItem(
            image: 'assets/images/basicas.png',
            name: 'Basica',
            price: '\$27,000',
          ),
          _buildFavoriteProductItem(
            image: 'assets/images/versace.png',
            name: 'Versace',
            price: '\$35,000',
          ),
          _buildFavoriteProductItem(
            image: 'assets/images/glam.png',
            name: 'Glam',
            price: '\$35,000',
          ),
          _buildFavoriteProductItem(
            image: 'assets/images/chic.png',
            name: 'Blanca Chic',
            price: '\$27,000',
          ),
        ],
      ),
    );
  }

  Widget _buildFavoriteProductItem({
    required String image,
    required String name,
    required String price,
  }) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        leading: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          price,
          style: TextStyle(fontSize: 16),
        ),
        trailing: IconButton(
          icon: Icon(Icons.favorite),
          onPressed: () {
            // Acción al presionar el ícono de favorito
          },
        ),
      ),
    );
  }
}
