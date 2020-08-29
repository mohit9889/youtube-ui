import 'package:flutter/material.dart';
import 'package:youtubeui/components/VideoList.dart';
import 'package:youtubeui/modal/data.dart';

class Subscription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 8.0),
          height: 80.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              _userAvatar(
                  youtubeData[0].channelAvatar, youtubeData[0].channelTitle),
              _userAvatar(
                  youtubeData[1].channelAvatar, youtubeData[1].channelTitle),
              _userAvatar(
                  youtubeData[2].channelAvatar, youtubeData[2].channelTitle),
            ],
          ),
        ),
        VideoList(listData: youtubeData)
      ],
    );
  }

  Widget _userAvatar(String imageURL, String userName) {
    return Container(
      margin: EdgeInsets.only(right: 20.0, left: 10.0),
      child: Column(
        children: <Widget>[
          CircleAvatar(backgroundImage: NetworkImage(imageURL)),
          SizedBox(height: 5.0),
          Container(
            child: Text(
              userName,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
