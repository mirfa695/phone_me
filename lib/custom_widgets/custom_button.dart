import 'package:flutter/cupertino.dart';

class CustomButton extends StatelessWidget {
   CustomButton({required this.height,required this.width,required this.img,
    Key? key}) : super(key: key);
  double height;
  double width;
  String img;
  @override
  Widget build(BuildContext context) {
    return Container(height: height,width: width,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage(img),fit: BoxFit.fill)));
  }
}
