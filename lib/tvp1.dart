import 'package:flutter/material.dart';
import 'parseJson.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

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


class TVP1 extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<TVP1> {
  Future<List<TVJsonData>> futureTV;
  @override
  void initState() {
    super.initState();
    futureTV = _getTVdata();
  }

  Future _showAlert(BuildContext context, String message) async {
    return showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text(message),
          actions: <Widget>[
            new FlatButton(onPressed: () => Navigator.pop(context), child: new Text('Ok'))
          ],
        )

    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu Bar',
      theme: ThemeData(
        primaryColor: Colors.brown[300],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'FastFood Menu',
            style: TextStyle(fontFamily: 'Lobster', fontSize: 37.0),
          ),
        ),
        body: Center(
          child: FutureBuilder(
              future: _getTVdata(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                print(snapshot.data);
                if (snapshot.data == null) {
                  return Container(child: Center(child: Text("Loading...")));
                } else {
                  return ListView.separated(
                      separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                            leading: CircleAvatar(
                            radius: 35.0,
                            backgroundImage: new CachedNetworkImageProvider(
                            snapshot.data[index].imageUrl),
                        ),
                        title: Text(
                           snapshot.data[index].name + ': ' + snapshot.data[index].name.toString() +
                        'PLN',
                        style: TextStyle(fontSize: 20.0, letterSpacing: 0.5,
                        color: Colors.orangeAccent, fontFamily: 'Lobster')),
                        subtitle: Text(
                        snapshot.data[index].info.shortInfo,
                        style: TextStyle(fontFamily: 'Lobster'),
                        ));
                      });
                }

              }),
        ),
      ),
    );
  }
}

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //       home: Scaffold(
  //     appBar: AppBar(title: Text('Telemagazyn')),
  //     body: ListView(
  //       padding: EdgeInsets.all(16),
  //       children: [
  //         buildImageInteractionTVP1(),
  //         Card(
  //           clipBehavior: Clip.antiAlias,
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(24),
  //           ),
  //           child: Column(
  //             children: [
  //               Padding(
  //                 padding: EdgeInsets.all(16).copyWith(bottom: 0),
  //                 child: Text('Telewizja Polska to panstwowa telewizja utworzona w 2009',
  //                     style: TextStyle(fontSize: 16), textAlign: TextAlign.left),
  //               ),
  //               Align(
  //                 alignment: Alignment.bottomLeft,
  //                child: FlatButton(
  //                 child: Text("Czytaj wiecej...", textAlign: TextAlign.left,
  //                 ),
  //                 onPressed: () => _showAlert(context, 'No i sie rozwijala i rozwijala i rozwijala')
  //               ),
  //               )
  //             ],
  //           ),
  //         )
  //       ],
  //     ),
  //   ));
  // }
  //
  // Widget buildImageInteractionTVP1() => Card(
  //       clipBehavior: Clip.antiAlias,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(24),
  //       ),
  //       child: Column(
  //         children: [
  //           Stack(
  //             children: [
  //               Image.asset('assets/tvp1.jpg', fit: BoxFit.cover, height: 240)
  //             ],
  //           ),
  //           Padding(
  //             padding: EdgeInsets.all(16).copyWith(right: 160),
  //             child: Text('Telewizja Polska kanal 1',
  //                 style: TextStyle(fontSize: 16), textAlign: TextAlign.left),
  //           ),
  //         ],
  //       ),
  //     );

