import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:youtubeui/components/VideoList.dart';
import 'package:youtubeui/modal/data.dart';

class YoutubeHome extends StatefulWidget {
  @override
  _YoutubeHomeState createState() => _YoutubeHomeState();
}

class _YoutubeHomeState extends State<YoutubeHome> {
  List<YoutubeModel> youtubeData = [];

  @override
  void initState() {
    loadData();
    super.initState();
  }

  loadData() async {
    var db = Firestore.instance;
    var videoData = await db.collection("videoData").getDocuments();
    var videoList = videoData.documents;
    for (var video in videoList) {
      youtubeData.add(YoutubeModel(
        channelAvatar: video.data['channelAvatar'],
        channelTitle:video.data['channelTitle'],
        thumbNail: video.data['thumbNail'],
        title: video.data['title'],
        description: video.data['description'],
        dislikeCount: video.data['dislikeCount'].toString(),
        likeCount: video.data['likeCount'].toString(),
        viewCount: video.data['viewCount'],
        publishedTime: video.data['publishTime'],
        subscriber: video.data['subscriber'],
        URL: video.data['URL']
      ));
    }
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return VideoList(listData: youtubeData);
  }
}
