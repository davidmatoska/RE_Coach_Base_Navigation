import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:projettest/pages/page1.dart';
import 'package:projettest/pages/page2.dart';
import 'package:projettest/pages/page3.dart';
import 'package:projettest/pages/page4.dart';

void main() => runApp(MaterialApp(home: BottomNavBar()));

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  int pageIndex = 0;

  // Create all the pages
  final Page1 _page1 = new Page1 ();
  final Page2 _page2 = new Page2 ();
  final Page3 _page3 = new Page3 ();
  final Page4 _page4 = new Page4 ();


  Widget _showPage = new Page1();

  Widget _pageChooser (int page) {
    switch (page) {
      case 0:
        return _page1;
        break;
      case 1:
        return _page2;
        break;
      case 2:
        return _page3;
        break;
      case 3:
        return _page4;
        break;
      default:
        return new Container(
          child: new Center(
            child: new Text (
              'no page found',
              style: new TextStyle(fontSize:30),
            ),
          ),
        );
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          initialIndex: pageIndex,
          items: <Widget>[
            Icon(Icons.add, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.compare_arrows, size: 30),
            Icon(Icons.call_split, size: 30),

          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.blueAccent,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (int tappedIndex) {
            setState(() {
              _showPage = _pageChooser(tappedIndex);
            });
          },
        ),
        body: Container(
          color: Colors.blueAccent,
          child: Center(
           // child: Text(_page.toString(), textScaleFactor: 10.0),
            child: _showPage,
          ),
        )
    );
  }
}
