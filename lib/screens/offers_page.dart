

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:phone/Services/api_service.dart';
import 'package:phone/custom_widgets/custom_button.dart';
import 'package:phone/custom_widgets/custom_container.dart';
import 'package:phone/screens/accessories_page.dart';
import 'package:phone/screens/external_link.dart';
import 'package:phone/screens/link_page.dart';
import 'package:phone/screens/review_page.dart';
import 'package:phone/utilities/constants.dart';

class OffersPage extends StatefulWidget {
  const OffersPage({Key? key}) : super(key: key);

  @override
  State<OffersPage> createState() => _OffersPageState();
}

class _OffersPageState extends State<OffersPage> {
  late List dataList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  Future fetchData() async {
    var data = await ApiServices().getData();
    setState(() {
      dataList = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/img4.jpg'), fit: BoxFit.fill)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                'New Arrivals',
                style: Constants.tstyle,
              ),
              const SizedBox(
                height: 5,
              ),
              CarouselSlider(
                  items: [
                    CustomContainer(
                        img: 'assets/images/phone2.gif',
                        logo: 'assets/images/logo2.png',
                        name: '''Galaxy M04'''),
                    CustomContainer(
                      img: 'assets/images/phone4.gif',
                      logo: 'assets/images/logo2.png',
                      name: '''Galaxy Z Flip5''',
                    ),
                    CustomContainer(
                      img: 'assets/images/phone6.gif',
                      logo: 'assets/images/logo4.png',
                      name: 'Redmi Note',
                      height: 25,
                      width: 40,
                    ),
                    CustomContainer(
                      img: 'assets/images/phone8.gif',
                      logo: 'assets/images/logo3.png',
                      name: '''iPhone 15''',
                      height: 50,
                      width: 50,
                    ),
                    CustomContainer(
                      img: 'assets/images/phone9.gif',
                      logo: 'assets/images/logo2.png',
                      name: '''Galaxy S23''',
                    )
                  ],
                  options: CarouselOptions(
                    height: 180.0,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    viewportFraction: 0.5,
                    aspectRatio: 16 / 9,
                  )),
              const SizedBox(
                height: 25,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Explore Brands',
                    style: Constants.tstyle,
                  )),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>AccessoriesPage()));},
                    child: CustomButton(
                        height: 50, width: 80, img: 'assets/images/logo2.png'),
                  ),
                  CustomButton(
                      height: 30, width: 30, img: 'assets/images/logo3.png'),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomButton(
                      height: 20, width: 30, img: 'assets/images/logo4.png'),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomButton(
                      height: 30, width: 50, img: 'assets/images/logo5.png'),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomButton(
                      height: 60, width: 60, img: 'assets/images/logo6.png'),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Trending Now',
                style: Constants.tstyle,
              ),
              Container(
                height: 300,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: dataList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Opacity(
                        opacity: .8,
                        child: Card(color: Colors.transparent,
                            elevation: 6,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            child: Container(
                              height: 300,
                              width: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                               color: Colors.white.withOpacity(.1)
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    dataList[index]["title"],
                                    style: Constants.tstyle,
                                  ),
                                  Container(
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                dataList[index]["image"]),
                                            fit: BoxFit.fill)),
                                  ),
                                  Text(
                                    dataList[index]["description"],
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    'Price: ₹${dataList[index]["price"]}',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                  RatingBar.builder(
                                    initialRating: dataList[index]["rating"],
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),

                                  // Container(decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(dataList[index]["image"]),fit: BoxFit.fill)),)
                                ],
                              ),
                            )),
                      );
                    }),
              ),
              SizedBox(height: 50,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ExternalLink()));

    },
                      child: Text('Know more',style: Constants.tstyle,)),
                  InkWell(onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LinkPage()));

                  },
                      child: Text('Details',style: Constants.tstyle,)),
                  InkWell(onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ReviewPage()));

                  },
                      child: Text('Review',style: Constants.tstyle,)),
                ],
              ),SizedBox(height: 100,)
            ],
          ),
        ),
      ),
    );
  }
}
