import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_class_test/bloc/product/product_bloc.dart';
import 'package:royal_class_test/screens/home/home_screen.dart';

import 'data/repositories/product_repository.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize your dependencies if needed (e.g., Firebase)
  // await Firebase.initializeApp();
  runApp(
    BlocProvider(
      create: (context) => ProductBloc(productRepository: ProductRepository()), // Create your ProductBloc instance
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Color(0xFF242C3B)
      ),
      home: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          return HomeScreen();
        },
      ),
    );
  }
}
