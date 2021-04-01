import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'top_menu.dart';

class MenuDrawer {
  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Contact'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('E-mail : ccomekdj@gmail.com.'),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                    onTap: () {
                      _makePhoneCall("tel://01064709685");
                    },
                    child: Text(
                      '전화걸기',
                      style: TextStyle(color: Colors.blue),
                    )),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('닫기'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _launchURL() async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Drawer menuDrawer = Drawer(
      child: ListView.builder(
    padding: const EdgeInsets.all(8),
    itemCount: 3,
    itemBuilder: (BuildContext context, int index) {
      if (index == 0) {
        return ListTile(
          title: Text("github"),
          onTap: () {
            MenuDrawer()._launchURL();
          },
        );
      } else if (index == 1) {
        return ListTile(
          onTap: () {
            MenuDrawer()._showMyDialog(context);
          },
          title: Text("contact"),
        );
      } else {
        return ListTile(
          onTap: () {},
          title: Text("board"),
        );
      }
    },
  ));
}
