import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final TextEditingController itemController =
      TextEditingController(); // Controlador para el campo de texto
  List<String> cart = []; // Lista que almacena los productos del carrito

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Carrito de Compras (${cart.length})'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: itemController,
              decoration: const InputDecoration(
                labelText: 'Agregar producto',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            // Botón para agregar productos al carrito
            ElevatedButton(
              onPressed: () {
                if (itemController.text.isNotEmpty) {
                  setState(() {
                    cart.add(
                        itemController.text); // Agrega el producto a la lista
                    itemController.clear(); // Limpia el campo de texto
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Por favor, ingresa un producto válido')),
                  );
                }
              },
              child: Text('Agregar al carrito'),
            ),
            SizedBox(height: 10),

            // aqui vaciamos carrito
            ElevatedButton(
              onPressed: () {
                setState(() {
                  cart.clear(); // Limpia todos los productos del carrito
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Carrito vaciado exitosamente')),
                );
              },
              child: Text('Vaciar carrito'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
            const SizedBox(height: 20),

            // Lista de productos en el carrito
            Expanded(
              child: ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(cart[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          cart.removeAt(
                              index); // esto Elimina un producto específico
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
