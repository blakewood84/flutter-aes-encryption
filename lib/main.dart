import 'dart:io';
import 'dart:convert';
import 'dart:developer';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<int> generateKey() {
    return utf8.encode('mn8ForLife!');
  }

  void sha256Hash() {
    var key = generateKey();

    Map<String, dynamic> data = {
      'time': '0.01',
      'token': 'fakeTokenHerefakeTokenHerefakeTokenHerefakeTokenHerefakeTokenHerefakeTokenHerefakeTokenHerefakeTokenHerefakeTokenHerefakeTokenHerefakeTokenHerefakeTokenHerefakeTokenHerefakeTokenHerefakeTokenHerefakeTokenHerefakeTokenHere',
      'proposal': 'emanateghost'
    };
    var stringData = data.toString();
    var bytes = utf8.encode(stringData);

    var hmacSha256 = Hmac(sha256, key);
    var digest = hmacSha256.convert(bytes);
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                sha256Hash();
              }, 
              child: Text('Get Btyes')
            )
          ],
        ),
      ),
    );
  }
}