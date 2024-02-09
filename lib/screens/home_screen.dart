import 'dart:convert';

import 'package:api_assgin/models/productModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<ProductModel>> getFromApi() async {

    List<ProductModel> products = [];
    String url = 'https://jsonplaceholder.typicode.com/photos';
      http.Response response  =  await http.get(Uri.parse(url));
      if(response.statusCode == 200){
        var jsonResponse = jsonDecode(response.body);
        for(var jsonProduct in jsonResponse){
          ProductModel productModel = ProductModel.fromJson(jsonProduct);
          products.add(productModel);
        }
        return products;
      }else{
        throw Exception('Something wrong');
      }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
