import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone/Services/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  Future<dynamic> getData()async{
    try{
      var data = await ApiServices().getData();

      return data;

    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.indigo[900],
      appBar: AppBar(title: Text('Phones'),centerTitle:true,backgroundColor: Colors.black.withOpacity(.1),),
      floatingActionButton: FloatingActionButton(onPressed: (){

      },child: Text('Show'),),
body: Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/img_4.png'),fit: BoxFit.cover)),
  child:   FutureBuilder(
      future: getData(),
      builder: (context,snapshot){
        if(snapshot.connectionState==ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator(color: Colors.white,),);
        }
          if (snapshot.hasData) {
            return ListView.builder(itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(title: Text(snapshot
                        .data![index]['title'],),
                      subtitle: Column(
                        children: [
                          Text(snapshot.data![index]['description']),
                          Text(snapshot.data![index]['price']
                              .toString())
  
                        ],
                      ),),
                  );
                });
          } else if(snapshot.hasError) {
            
            return Text('smothing went wrong');
          }else{
            return Text('Error');
          }
         }),
),
    );
  }
}
