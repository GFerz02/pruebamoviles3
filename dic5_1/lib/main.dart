import 'package:flutter/material.dart';
import 'login_page.dart';
import 'dashboard_page.dart';
import 'product_details_page.dart';
import 'cart_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/dashboard': (context) => DashboardPage(),
        '/product-details': (context) => ProductDetailsPage(),
        '/cart': (context) => CartPage(),
      },
    );
  }
}
