import 'package:flutter/material.dart';
import 'package:youtubeui/components/VideoList.dart';
import 'package:youtubeui/modal/data.dart';

class Libarary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _recent(),
        _menuList(context),
        _playList(context),
      ],
    );
  }

  BoxDecoration _bottomBorder() => BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0, color: Colors.grey),
        ),
      );

  Widget _recent() {
    return Container(
      height: 205.0,
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(width: 0.3),
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10.0, left: 10.0),
            child: Text("Recent"),
          ),
          Expanded(
              child: VideoList(listData: youtubeData, recentVideoList: true)),
        ],
      ),
    );
  }

  Widget _menuList(BuildContext context) {
    List<Map> items = [
      {"name": "History", "icon": Icon(Icons.history)},
      {
        "name": "Downloads",
        "icon": Icon(Icons.cloud_download),
        "extra": "26 reccommendations"
      },
      {"name": "Your Videos", "icon": Icon(Icons.video_library)},
      {"name": "Purchases", "icon": Icon(Icons.class_)},
      {
        "name": "Watch Later",
        "icon": Icon(Icons.watch_later),
        "extra": "46 unwatched videos"
      },
    ];

    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: _bottomBorder(),
      child: Column(
        children: items
            .map((i) => ListTile(
                  leading: i["icon"],
                  title: i["extra"] == null
                      ? Text(i["name"])
                      : Row(
                          children: <Widget>[
                            Text(i["name"]),
                            Container(
                              margin: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                i["extra"],
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ),
                          ],
                        ),
                ))
            .toList(),
      ),
    );
  }

  Widget _playList(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Playlist"),
              DropdownButton(
                style: Theme.of(context).textTheme.body1,
                value: "Recently added",
                items: [
                  DropdownMenuItem(
                    child: Text("A - Z"),
                    value: "A - Z",
                  ),
                  DropdownMenuItem(
                    child: Text("Recently added"),
                    value: "Recently added",
                  ),
                ],
                onChanged: (vl) {},
              ),
            ],
          ),
          ListTile(
            leading: Icon(Icons.thumb_up),
            title: Text("Liked videos"),
            subtitle: Text("80 videos"),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text("Algorithms"),
            subtitle: Text("Abdul Bari . 84 videos"),
          ),
        ],
      ),
    );
  }
}
