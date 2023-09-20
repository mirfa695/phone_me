import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone/Services/api_service.dart';
import 'package:phone/model_class/class_products.dart';

import '../model_class/class_root.dart';

class ExternalLink extends StatefulWidget {
  const ExternalLink({Key? key}) : super(key: key);

  @override
  State<ExternalLink> createState() => _ExternalLinkState();
}
class _ExternalLinkState extends State<ExternalLink> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<Root>(future: ApiServices().fetchData(),
          builder: (BuildContext context,snapshot) {
          print(snapshot.data);
          if(snapshot.hasData){
            return ListTile(title: Text(snapshot.data!.title!));
          }else{return Text('cjkjc');}
          },),
    );
  }
}
