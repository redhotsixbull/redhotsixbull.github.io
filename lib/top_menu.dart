import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TopMenu extends StatefulWidget {
  TopMenu({Key key, this.scrollController, this.scaffoldKey}) : super(key: key);

  final ScrollController scrollController;
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  _TopMenuState createState() => _TopMenuState();
}

const url = 'https://github.com/redhotsixbull';

class _TopMenuState extends State<TopMenu> {
  Future<void> _showMyDialog() async {
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

  @override
  Widget build(BuildContext context) {
    double heightV = MediaQuery.of(context).size.height;
    double widthV = MediaQuery.of(context).size.width;

    if (widthV < 600) {
      return Container(
        width: double.infinity,
        height: 56,
        color: Colors.black.withOpacity(0.8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/imgs/50819258.png',
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  widget.scaffoldKey.currentState.openDrawer();
                },
                child: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      );
    } else {
      return Container(
        height: 56,
        width: double.infinity,
        color: Colors.black.withOpacity(0.8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/imgs/50819258.png',
                  ),
                ),
              ],
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    widget.scrollController.jumpTo(
                        widget.scrollController.position.minScrollExtent);
                  },
                  child: Container(
                    width: 100,
                    child: Center(
                      child: Text(
                        "Top",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    widget.scrollController.jumpTo(
                        (widget.scrollController.position.maxScrollExtent +
                                160) /
                            3);
                  },
                  child: Container(
                    width: 100,
                    child: Center(
                      child: Text(
                        "About me",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _launchURL();
                  },
                  child: Container(
                    width: 100,
                    child: Center(
                      child: Text(
                        "gtihub",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _showMyDialog();
                  },
                  child: Container(
                    width: 100,
                    child: Center(
                      child: Text(
                        "contact",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    print("게시판");
                  },
                  child: Container(
                    width: 100,
                    child: Center(
                      child: Text(
                        "board",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                )
              ],
            )
          ],
        ),
      );
    }
  }
}
