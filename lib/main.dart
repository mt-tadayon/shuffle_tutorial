import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'card-list-tile.dart';
import 'constant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Dashboard(),
    );
  }
}

class CardDetail {
  String title;
  String subtitle;
  String urlPath;

  CardDetail({this.title, this.subtitle, this.urlPath});
}

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<CardDetail> cards = [
    CardDetail(
        title: 'Map Tutorial',
        subtitle: 'Basic',
        urlPath: 'https://www.youtube.com/watch?v=6xWVWDvmqeU'),
    CardDetail(
        title: 'Provider',
        subtitle: 'Intermediate',
        urlPath: 'https://youtu.be/hwv31bNdSt4'),
    CardDetail(
        title: 'Fold Tutorial',
        subtitle: 'Basic',
        urlPath: 'https://youtu.be/rzdmjnA_5xQ'),
  ];

  final List<CardDetail> newCards = [
    CardDetail(
      title: 'Spread Operator',
      subtitle: 'Beginners',
      urlPath: '',
    ),
    CardDetail(
        title: 'Unit Test',
        subtitle: 'Beginners',
        urlPath: 'https://youtu.be/C1kzJH8SiuE'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: appBar,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cards.length,
              itemBuilder: (context, index) => CardListTile(
                title: cards[index].title,
                subtitle: cards[index].subtitle,
                urlPath: cards[index].urlPath,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: RaisedButton(
              child: Text('Add Cards'),
              onPressed: () {
                //TODO: Add newCards to cards.
                cards = [...cards, ...newCards];
                setState(() {});
              },
            ),
          )
        ],
      ),
    );
  }
}
