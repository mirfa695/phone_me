import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone/Services/api_service.dart';
import 'package:phone/model_class/class_products.dart';

class AccessoriesPage extends StatefulWidget {
  const AccessoriesPage({Key? key}) : super(key: key);

  @override
  State<AccessoriesPage> createState() => _AccessoriesPageState();
}

class _AccessoriesPageState extends State<AccessoriesPage> {
 late List<Product>productList=[];
  // List<String> mobiles = ['iphone','samsung','nokia'];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    print('init state');

  }
  Future getData()async{
   try{
     print('getdata');

     List<Product> getClass=await ApiServices().getDataModel();

     print('getdata111');

      print(productList);
      setState(() {
        productList=getClass;
      });

   }catch(e){

     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
   }
  }
  @override
  Widget build(BuildContext context) {

    print('build');
    // List<Widget> a = mobiles.map((e) => Text(e)).toList();

    return Scaffold(
      body:ListView.builder(itemCount: productList.length,
          itemBuilder: (BuildContext context,int index){
        return Card(child: ListTile(
          title: Text(productList[index].title.toString()),
        ));
      })
    );
  }
}
