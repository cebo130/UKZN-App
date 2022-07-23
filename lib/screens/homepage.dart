//import 'package:all_video_downloader/screens/paste_link_page.dart';
import 'package:flutter/material.dart';
import 'package:ukzn_app/screens/paste_link_page.dart';

import 'browser_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(25.0), // here the desired height
          child: AppBar(
            backgroundColor: Colors.orange,
            title: Text('All Video Downloader'),
            centerTitle: true,
          )
      ),
      body: page[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orange,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        items: items,
        onTap: (value){
          setState(() {
            _currentIndex = value;
          });
        }
      ),
    );
  }
  List<Widget> page = [
    PasteLinkPage(),
    BrowserPage(),
  ];
  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.paste), label:'Paste Link'),
    BottomNavigationBarItem(icon: Icon(Icons.youtube_searched_for), label:'Youtube'),
  ];
}

