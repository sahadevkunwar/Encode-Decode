import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_enocde_decode/model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  UserModel userObject = UserModel(
      id: '100',
      fullname: 'sahadev kunwar',
      email: 'sahadevkunwar@outlook.com');
  String userJson =
      '{"id":"100","fullname":"sahadev kunwar","email":"sahadevkunwar@outlook.com"}';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('jsonEncode & jsonDecode'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      //Object to JSON or Encode or Serialization
                      Map<String, dynamic> userMap = userObject.toMap();
                      String json = jsonEncode(userMap).toString();
                      print(userMap);
                      print(json);
                    },
                    child: const Text('Encode')),
                const SizedBox(width: 20),
                ElevatedButton(
                    onPressed: () {
                      //JSON to Object or Decode or De-serialization
                      Map<String, dynamic> decode = jsonDecode(userJson);

                      UserModel object = UserModel.fromMap(decode);

                      print(decode);
                      print(object.email.toString());
                    },
                    child: const Text('Decode'))
              ],
            ),
          ),
        )

        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
