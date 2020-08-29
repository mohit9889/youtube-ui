import 'package:flutter/material.dart';
import 'package:youtubeui/modal/data.dart';
import 'package:youtubeui/screens/VideoDetailPage.dart';

class VideoList extends StatelessWidget {
  final List<YoutubeModel> listData;
  final bool videoDetailsList;
  final bool recentVideoList;

  const VideoList(
      {this.listData,
      this.videoDetailsList = false,
      this.recentVideoList = false});

  @override
  Widget build(BuildContext context) {
    if (videoDetailsList) {
      return ListView.separated(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => VideoDetailPage(
                    detail: listData[index],
                  ),
                ),
              );
            },
            child: _videoDetailList(context, index),
          );
        },
        separatorBuilder: (context, index) => Divider(
          height: 1.0,
          color: Colors.grey,
        ),
        itemCount: listData.length,
      );
    }
    if (recentVideoList) {
      return ListView.builder(
        padding: const EdgeInsets.all(8.0),
        scrollDirection: Axis.horizontal,
        itemCount: listData.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => VideoDetailPage(
                  detail: listData[index],
                ),
              ));
            },
            child: _recentVideoList(context, index),
          );
        },
      );
    }
    return ListView.separated(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => VideoDetailPage(
                  detail: listData[index],
                ),
              ),
            );
          },
          child: _buildVideoList(context, index),
        );
      },
      separatorBuilder: (context, index) => Divider(
        height: 1.0,
        color: Colors.grey,
      ),
      itemCount: listData.length,
    );
  }

  Widget _buildVideoList(BuildContext context, int index) {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(listData[index].thumbNail),
                fit: BoxFit.fill),
          ),
        ),
        ListTile(
          contentPadding: EdgeInsets.all(8.0),
          dense: true,
          leading: CircleAvatar(
            backgroundImage: NetworkImage(listData[index].channelAvatar),
          ),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(listData[index].title),
          ),
          subtitle: Text(
              "${listData[index].channelTitle} . ${listData[index].viewCount} . ${listData[index].publishedTime}"),
          trailing: Container(
            child: Icon(Icons.more_vert),
            margin: EdgeInsets.only(bottom: 8.0),
          ),
        ),
      ],
    );
  }

  Widget _videoDetailList(BuildContext context, int index) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width / 2,
            height: 100.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(listData[index].thumbNail),
                  fit: BoxFit.cover),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  contentPadding: const EdgeInsets.all(8.0),
                  dense: true,
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text(listData[index].title),
                  ),
                  subtitle: Text(
                      "${listData[index].channelTitle} . ${listData[index].viewCount}"),
                  trailing: Container(
                      margin: const EdgeInsets.only(bottom: 30.0),
                      child: Icon(Icons.more_vert)),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: SizedBox(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _recentVideoList(BuildContext context, int index) {
    return Container(
      width: 336.0 / 2.2,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 4.0),
            width: 336.0 / 2.2,
            height: 188 / 2.2,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(listData[index].thumbNail),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Text(
                        listData[index].title,
                        style: TextStyle(fontSize: 12.0),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      listData[index].channelTitle,
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.more_vert,
                size: 16.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
