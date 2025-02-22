// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:getx/models/categories_model.dart';
import 'package:getx/models/product_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  String baseUrl = "https://fakestoreapi.com";

  Future<List<ProductModel>> getProducts() async {
    final Uri url = Uri.parse("$baseUrl/products");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        print(response.statusCode);
        var responseData = jsonDecode(response.body) as List;

        return responseData.map((json) => ProductModel.fromJson(json)).toList();
      } else {
        print(response.statusCode);
        return [];
      }
    } catch (e) {
      print("exception => $e ");
      return [];
    }
  }

  Future<List<CategoriesModel>> getCategories() async {
    final Uri url = Uri.parse("$baseUrl/products/categories");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        print(response.statusCode);

        var responseData = jsonDecode(response.body) as List;

        return responseData
            .map((json) => CategoriesModel.fromJson(json.toString()))
            .toList();
      } else {
        print(response.statusCode);
        return [];
      }
    } catch (e) {
      print("Exception $e");
      return [];
    }
  }
}
