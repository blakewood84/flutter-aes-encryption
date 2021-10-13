import 'dart:io';
import 'dart:convert';
import 'dart:developer';
import 'package:bytes_api/encryption.dart';
import 'package:encrypt/encrypt_io.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:pointycastle/asymmetric/api.dart';


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

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<int> generateKey() {
    return utf8.encode('mn8ForLife!');
  }

  void sha256Hash() async {

    Map<String, dynamic> data = {
      'time': '0.01',
      'token': 'fakeTokenHerefakeTokenHerefakeTokenHerefakeTokenHerefakeTokenHerefakeTokenHerefakeTokenHerefakeTokenHerefakeTokenHerefakeTokenHerefakeTokenHerefakeTokenHerefakeTokenHerefakeTokenHerefakeTokenHerefakeTokenHerefakeTokenHere',
      'proposal': 'emanateghost'
    };

    var test = encryptAESCryptoJS(data.toString(), '931776028f4b4e0a7fb974226387134c');

    print(test);

    final url = Uri.parse('http://localhost:8081/decrypt');

    Map<String, String> headers = <String, String>{
      'Content-Type': 'application/json',
    };
    
    String body = jsonEncode( <String, dynamic>{
      'data': test,
    });

    var res = await http.post(url,headers: headers, body: body);

    if(res.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(res.body);
      print(body);
    }

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