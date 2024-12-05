import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  final List<Map<String, String>> products = [
    {
      'name': 'llavero a eleccion',
      'description':
          'llaveros en forma de corazon o diamente o si gustas personalizar tu llavero con la foto y forma que tu gustes'
    },
    {
      'name': 'cuadro personalizado',
      'description':
          'cuadro estandar de hamma beads con la tematica o personaje que tu gustes '
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Productos')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index]['name']!),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/product-details',
                arguments: products[index],
              );
            },
          );
        },
      ),
    );
  }
}
