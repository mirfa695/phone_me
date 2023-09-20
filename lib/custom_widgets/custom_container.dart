import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone/utilities/constants.dart';

class CustomContainer extends StatelessWidget {
   CustomContainer({required this.img,required this.logo,required this.name,this.width,this.height,
    Key? key}) : super(key: key);
 final String img;
 final String logo;
  final String name;
  double? height;
  double? width;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        color: Colors.white.withOpacity(.2),borderRadius: BorderRadius.circular(20)),
        child: Row(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(height: 120,width: 85,
              decoration:BoxDecoration(image: DecorationImage(image: AssetImage(img),fit: BoxFit.fill)),),
            Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Container(height: height?? 50,width: width??90,
                 decoration: BoxDecoration(image: DecorationImage(image: AssetImage(logo),fit: BoxFit.fill)),),
                Text(name,style:TextStyle(color: Colors.white)),
              ],
            )
          ],
        ));
  }
}
