import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:http/http.dart';

class Ducks extends StatefulWidget {
  const Ducks({super.key});

  @override
  State<Ducks> createState() => _Ducks();
}

class _Ducks extends State<Ducks> {
  String image = "r";
  bool isLoading = false;

  Future<void> buttonPressed() async {
    setState(() {
      isLoading = true;
    });
    var uri = Uri.https("random-d.uk", "/api/v2/quack");
    var ducks = await get(uri);
    var newDucks = jsonDecode(ducks.body);
    setState(() {
      image = newDucks['url'];
    });
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isLoading ? Text("fetching ducks....") : Image.network(image),
          TextButton(
            onPressed: buttonPressed,
            child: Text(
              "Press me",
            ),
          )
        ],
      )),
    );
  }
}
