import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('FOOD')
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _handleClickButton();
          },
          child: Text('TEST API'),
        ),
      ),
    );
  }
  _handleClickButton()async{
    Uri url=Uri.parse('https://cpsu-test-api.herokuapp.com/foods');
    var result= await http.get(url);
    print(result.body);

    var json = jsonDecode(result.body);
    print(json['status']);
    String status = json['status'];
    String message = json['message'];
    List<Map<String,dynamic>> data = json['data'];
  }
}
