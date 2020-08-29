import 'package:flutter/material.dart';
import 'package:youtubeui/components/VideoList.dart';
import 'package:youtubeui/modal/data.dart';

class Trending extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
        title: Text(
          "Trending",
          style: TextStyle(color: Colors.grey),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: DefaultTabController(
        length: 5,
        child: Column(
          children: <Widget>[
            TabBar(
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: <Widget>[
                Tab(text: "NOW"),
                Tab(text: "MUSIC"),
                Tab(text: "GAMING"),
                Tab(text: "NEWS"),
                Tab(text: "FILMS"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  VideoList(listData: youtubeData),
                  Center(child: Text("MUSIC")),
                  Center(child: Text("GAMING")),
                  Center(child: Text("NEWS")),
                  Center(child: Text("FILMS")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
