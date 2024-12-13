import "dart:convert";

import "package:http/http.dart" as http;
import "package:recipe_reach/models/product_model.dart";

class ApiService {
  final String baseurl = 'https://fakestoreapi.com';

  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(Uri.parse("$baseurl/products"));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((item) => ProductModel.fromJson(item)).toList();
    } else {
      throw Exception("Failed to load products");
    }
  }
}
