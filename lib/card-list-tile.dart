import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CardListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String urlPath;

  CardListTile({this.title, this.subtitle, this.urlPath});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      color: Color.fromRGBO(64, 75, 96, .9),
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 10.0,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 5.0,
        ),
        leading: Container(
          padding: EdgeInsets.only(right: 12.0),
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(
                width: 1.0,
                color: Colors.white24,
              ),
            ),
          ),
          child: IconButton(
            icon: Icon(
              Icons.play_circle_outline,
              color: Colors.white,
            ),
            onPressed: () => _launchURL(urlPath),
          ),
        ),
        title: Text(
          title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          children: [
            Icon(
              Icons.linear_scale,
              color: Colors.yellow,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              subtitle,
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.white,
          size: 30.0,
        ),
      ),
    );
  }
}

void _launchURL(String urlPath) async {
  if (await canLaunch(urlPath)) {
    await launch(urlPath);
  } else {
    throw 'Could not launch $urlPath';
  }
}
