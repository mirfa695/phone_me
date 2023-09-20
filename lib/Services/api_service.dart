import 'dart:convert';


import 'package:flutter/services.dart' as root_bundle;
import 'package:phone/model_class/class_products.dart';
import 'package:phone/utilities/network_failure.dart';
import 'package:http/http.dart' as http;

import '../model_class/class_root.dart';
class ApiServices{
Future<dynamic> getData()async{

    final jsonData = await root_bundle.rootBundle.loadString('assets/api_data.json');
    var data = jsonDecode(jsonData);
    if(data['statusCode']==200) {
      var list = await data['products'];
      return list;
    }else{
      throw NetworkFailures.errorHandling(data['statusCode']);
    }


}
Future<List<Product>> getDataModel()async{
  final jsonData = await root_bundle.rootBundle.loadString('assets/api_data.json');

  var data = jsonDecode(jsonData);

  List listData = data["products"];

  if(data["statusCode"]==200){

   List<Product> products =  listData.map((e) {
     return Product.fromJson(e);
  }).toList();
   print(products);
   return products;
  }
  else{
    throw NetworkFailures.errorHandling(data['statusCode']);
  }
}
Future<Root>fetchData()async{
  final response= await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  print(response);
  if(response.statusCode==200){
    print(response.body);
    return Root.fromJson(jsonDecode(response.body));
  }else{
    throw NetworkFailures.errorHandling(response.statusCode);
  }
}
Future getApi()async{
  final response= await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  if(response.statusCode==200){
    var data=jsonDecode(response.body);
    print(data);
    return data;
  }else{throw 'Error';}
}
Future createData(String title)async{
  try{final http.Response response=await http.post(Uri.parse('https://jsonplaceholder.typicode.com/albums'),
  body: jsonEncode(
      {'title':title}));
  print(response.body);
  if(response.statusCode==200){
     var data =json.decode(response.body);
     return data;
  }else{
    throw NetworkFailures.errorHandling(response.statusCode);}}catch(e){return null;}
}
}