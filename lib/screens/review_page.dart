import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone/Services/api_service.dart';
import 'package:phone/custom_widgets/custom_text_field.dart';

import '../model_class/class_root.dart';

class ReviewPage extends StatefulWidget {
   ReviewPage({Key? key}) : super(key: key);

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final textEditingController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.transparent,resizeToAvoidBottomInset: false,
      body: Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/img4.jpg'),fit: BoxFit.cover)),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0,left: 10),
            child: CustomTextField(text: 'Review', con: textEditingController, choice: false),
          ),
          ElevatedButton(onPressed: (){
            ApiServices().createData(textEditingController.text);
              }
          , child: Text('Submit')),
          Container(height: 400,
            child: FutureBuilder(future: ApiServices().createData(textEditingController.text), builder: (context,snapshot){
              if(snapshot.hasData)
              {
                print(snapshot.data);
                print(snapshot.data!.title);
                return ListView.builder(itemCount: 1,
                    itemBuilder: (BuildContext context,int index){
                  return ListTile(leading: Text(snapshot.data!["title"]),);
                });}
             else{return Text('Error');}
            }),
          )
        ],
      ),),

    );
  }
}
