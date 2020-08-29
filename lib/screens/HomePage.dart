import 'package:flutter/material.dart';
import 'package:youtubeui/screens/Explore.dart';
import 'package:youtubeui/screens/Libarary.dart';
import 'package:youtubeui/screens/Subscription.dart';
import 'package:youtubeui/screens/YoutubeHome.dart';
import 'package:youtubeui/screens/Notification.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current_index = 0;

  _onTap(int index) {
    setState(() {
      _current_index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      YoutubeHome(),
      Explore(),
      Subscription(),
      NotificationPage(),
      Libarary(),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
        title: Image.asset(
          "images/youtube_logo.png",
          width: 98.0,
          height: 22.0,
        ),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {},
          ),
        ],
      ),
      body: screens[_current_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _current_index,
        onTap: _onTap,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(title: Text("Home"), icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              title: Text("Explore"), icon: Icon(Icons.explore)),
          BottomNavigationBarItem(
              title: Text("Subscription"), icon: Icon(Icons.subscriptions)),
          BottomNavigationBarItem(
              title: Text("Notification"), icon: Icon(Icons.notifications)),
          BottomNavigationBarItem(
              title: Text("Libarary"), icon: Icon(Icons.video_library)),
        ],
      ),
    );
  }
}
