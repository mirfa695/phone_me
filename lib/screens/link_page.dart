import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Services/api_service.dart';

class LinkPage extends StatefulWidget {
  const LinkPage({Key? key}) : super(key: key);

  @override
  State<LinkPage> createState() => _LinkPageState();
}

class _LinkPageState extends State<LinkPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: ApiServices().getApi(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              return ListTile(title: Text(snapshot.data!["title"]));
            } else {
              return const Text('Error');
            }
          }),
    );
  }
}
