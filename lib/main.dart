import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<String> _products = ['Food Tester'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('Easylist')),
            body:  Column(children: [
              Container(
                child:
                    RaisedButton(onPressed: () {
                      setState(() {
                        _products.add('Advanced Food Tester');

                      });
                    }, child: Text('AddProduct')),
              ),
              Column(
                children: _products
                    .map((element) => Card(
                          child: Column(
                            children: <Widget>[
                              Image.asset('assets/food.jpg'),
                              Text(element)
                            ],
                          ),
                        ))
                    .toList(),
              ),
              Column(
                children: _products
                    .map((element) => Card(
                  child: Column(
                    children: <Widget>[
                      Image.asset('assets/food.jpg'),
                      Text(element)
                    ],
                  ),
                ))
                    .toList(),
              ),
              Column(
                children: _products
                    .map((element) => Card(
                  child: Column(
                    children: <Widget>[
                      Image.asset('assets/food.jpg'),
                      Text(element)
                    ],
                  ),
                ))
                    .toList(),
              )

            ])));
  }
}
