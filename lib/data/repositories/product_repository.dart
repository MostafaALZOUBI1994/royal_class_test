import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/product.dart';


class ProductRepository {
  final String apiUrl = "https://api.escuelajs.co/api/v1/products";

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      final l = jsonResponse.map((product) => Product.fromJson(product)).toList();
      return l;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
