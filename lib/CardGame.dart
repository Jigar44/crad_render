import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:cradrender/Card.dart';
import 'package:cradrender/CardState.dart';
import 'package:dio/dio.dart';

class CardGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card App',
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Card(),
          ),
        ),
      ),
    );
  }
}

class Card extends StatefulWidget {
  var user;
  var count;
  @override
  CardState createState() => CardState();
}

class CardState extends State<Card> {
  var user;
  var count;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        onPressed: () async {
          var dio = Dio();
          Response response = await dio
              .get("https://extendsclass.com/api/json-storage/bin/eadbede");
          setState(() {
            user = jsonDecode(response.data);
            print(user['suit']);
            print(user['value'].runtimeType);
            count = user['value'];
          });
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CardLayout(card: CardProp(
                    suit: user['suit'],
                    value: user['value'],
                  ))));
        },
        color: Colors.blue,
        padding: EdgeInsets.all(15),
        child: Text(
          "Tap Here",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
    );
  }
}
