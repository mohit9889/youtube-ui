import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtubeui/components/VideoList.dart';
import 'package:youtubeui/modal/data.dart';

class VideoDetailPage extends StatefulWidget {
  final YoutubeModel detail;

  const VideoDetailPage({@required this.detail});

  @override
  _VideoDetailPageState createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> _layout = [
      _videoInfo(),
      _channelInfo(),
      _moreInfo(),
      VideoList(
        listData: youtubeData,
        videoDetailsList: true,
      )
    ];

    return Scaffold(
      body: Column(
        children: <Widget>[
          _videoPlayer(),
          Expanded(
            child: ListView(
              children: _layout,
            ),
          ),
        ],
      ),
    );
  }

  Widget _videoPlayer() {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      width: MediaQuery.of(context).size.width,
      height: 200.0,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(widget.detail.thumbNail), fit: BoxFit.cover)),
    );
  }

  Widget _videoInfo() {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(widget.detail.title),
          subtitle: Text(widget.detail.viewCount),
          trailing: Icon(Icons.arrow_drop_down),
        ),
        Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buttonColumn(Icons.thumb_up, widget.detail.likeCount),
              _buttonColumn(Icons.thumb_down, widget.detail.dislikeCount),
              _buttonColumn(Icons.share, "Share"),
              _buttonColumn(Icons.cloud_download, "Download"),
              _buttonColumn(Icons.playlist_add, "Save"),
            ],
          ),
        )
      ],
    );
  }

  Widget _buttonColumn(IconData icon, String title) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Icon(
            icon,
            color: Colors.grey[700],
          ),
        ),
        Text(
          title,
          style: TextStyle(color: Colors.grey[700]),
        )
      ],
    );
  }

  Widget _channelInfo() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey, width: 0.5),
          bottom: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(widget.detail.channelAvatar),
              ),
              title: Text(
                widget.detail.channelTitle,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(widget.detail.subscriber),
            ),
          ),
          FlatButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.play_circle_filled,
                color: Colors.red,
              ),
              label: Text(
                "SUBSCRIBE",
                style: TextStyle(color: Colors.red),
              ))
        ],
      ),
    );
  }

  Widget _moreInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(child: Text("Up next")),
          Text("Autoplay"),
          Switch(
            onChanged: (c) {},
            value: true,
          )
        ],
      ),
    );
  }
}
