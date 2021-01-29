import 'package:flutter/material.dart';

class Polsat extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<Polsat> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('Telemagazyn')),
          body: ListView(
            padding: EdgeInsets.all(16),
            children: [
              buildImageInteractionTVP1(),
              Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16).copyWith(bottom: 0),
                      child: Text('Telewizja Polska to panstwowa telewizja utworzona w 2009',
                          style: TextStyle(fontSize: 16), textAlign: TextAlign.left),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: FlatButton(
                        child: Text("Czytaj wiecej...", textAlign: TextAlign.left,
                        ),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget buildImageInteractionTVP1() => Card(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    child: Column(
      children: [
        Stack(
          children: [
            Image.asset('assets/tvp1.jpg', fit: BoxFit.cover, height: 240)
          ],
        ),
        Padding(
          padding: EdgeInsets.all(16).copyWith(right: 160),
          child: Text('Telewizja Polska kanal 1',
              style: TextStyle(fontSize: 16), textAlign: TextAlign.left),
        ),
      ],
    ),
  );
}