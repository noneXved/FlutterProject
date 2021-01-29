import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/parseJson.dart';
import 'dart:async';
import 'tvp1.dart';
import 'polsat.dart';
import 'tvp2.dart';
import 'tvn.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'dart:convert';
import 'parseJson.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

Future<List<TVJsonData>> _getTVdata() async {
  var file = await DefaultCacheManager().getSingleFile('https://nonexved.github.io/FlutterProject/tele.json');
  List<TVJsonData> tvData;
  if (file != null && await file.exists()) {
    var res = await file.readAsString();
    tvData = (json.decode(res) as List)
        .map((i) => TVJsonData.fromJson(i))
        .toList();
    return tvData;
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Telemagazyn',
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {
  Future<List<TVJsonData>> futureTV;
  @override
  void initState() {
    super.initState();
    futureTV = _getTVdata();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('Telemagazyn')),
          body: Container(
            child: FutureBuilder(
              future: _getTVdata(),
              builder: (BuildContext context, AsyncSnapshot snapshot){
                print(snapshot.data);
                if(snapshot.data == null){
                  return Container(
                      child: Center(
                          child: Text("Loading...")
                      )
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Image(image: CachedNetworkImageProvider(snapshot.data[index].imageUrl), fit: BoxFit.cover, height: 240)
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.all(16).copyWith(bottom: 0, right: 160),
                              child: Text(snapshot.data[index].name,
                                  style: TextStyle(fontSize: 16), textAlign: TextAlign.left),
                            ),
                            ButtonBar(
                              alignment: MainAxisAlignment.start,
                              children: [
                                FlatButton(
                                  child: Text('Sprawdz program'),
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => DetailPage(snapshot.data[index])));
                                  },
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
          // buildImageInteractionTVP1(),
          // buildImageInteractionPolsat(),
          // buildImageInteractionTVP2(),
          // buildImageInteractionTVN(),

      ),
    );
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
              padding: EdgeInsets.all(16).copyWith(bottom: 0, right: 160),
              child: Text('Telewizja Polska kanal 1',
                  style: TextStyle(fontSize: 16), textAlign: TextAlign.left),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                FlatButton(
                  child: Text('Sprawdz program'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TVP1()));
                  },
                )
              ],
            )
          ],
        ),
      );

  Widget buildImageInteractionTVP2() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset('assets/tvp2a.jpg', fit: BoxFit.cover, height: 240)
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0, right: 160),
              child: Text('Telewizja Polska kanal 2',
                  style: TextStyle(fontSize: 16), textAlign: TextAlign.left),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                FlatButton(
                  child: Text('Sprawdz program'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TVP2()));
                  },
                ),
              ],
            )
          ],
        ),
      );

  Widget buildImageInteractionPolsat() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset('assets/polsat.jpg', fit: BoxFit.cover, height: 240)
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0, right: 280),
              child: Text('Polsat',
                  style: TextStyle(fontSize: 16), textAlign: TextAlign.left),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                FlatButton(
                  child: Text('Sprawdz program'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Polsat()));
                  },
                ),
              ],
            )
          ],
        ),
      );

  Widget buildImageInteractionTVN() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset('assets/tvn.png', fit: BoxFit.cover, height: 240)
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0, right: 300),
              child: Text('TVN',
                  style: TextStyle(fontSize: 16), textAlign: TextAlign.left),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                FlatButton(
                  child: Text('Sprawdz program'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TVN()));
                  },
                ),
              ],
            )
          ],
        ),
      );
}

class DetailPage extends StatelessWidget {

  final TVJsonData tvJsonData;

  DetailPage(this.tvJsonData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(tvJsonData.name),
        )
    );
  }
}