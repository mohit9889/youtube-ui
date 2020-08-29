import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:youtubeui/modal/data.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<NotificationModel> data =  [];

  @override
  void initState() {
    loadData();
    super.initState();
  }

  void loadData()async{
    var db = Firestore.instance;
    var notificationData = await db.collection('notificationData').getDocuments();
    var list = notificationData.documents;
    for(var not_ in list){
      data.add(NotificationModel(
        avatarUrl: not_.data['avatarUrl'],
        message: not_.data['message'],
        messageType: not_.data['message'],
        name: not_.data['name'],
        timeStamp: not_.data['timeStamp'],
      ));
    }
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ListTile(
            dense: true,
            leading: CircleAvatar(
              backgroundImage: NetworkImage(data[index].avatarUrl),
              radius: 16.0,
            ),
            title: data[index].messageType == "comment"
                ? Text(
                    "${data[index].name} commented: \"${data[index].message}\"")
                : Text("New subscriber ${data[index].name}"),
            subtitle: Text(data[index].timeStamp),
            trailing: IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
          );
        });
  }
}
