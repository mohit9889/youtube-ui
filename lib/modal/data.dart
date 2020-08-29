import 'package:cloud_firestore/cloud_firestore.dart';

class YoutubeModel {
  final String title;
  final String description;
  final String thumbNail;
  final String publishedTime;
  final String channelTitle;
  final String channelAvatar;
  final String viewCount;
  final String likeCount;
  final String dislikeCount;
  final String subscriber;
  final String URL;

  YoutubeModel(
      {this.title,
      this.description,
      this.thumbNail,
      this.publishedTime,
      this.channelTitle,
      this.channelAvatar,
      this.viewCount,
      this.likeCount,
      this.subscriber,
      this.dislikeCount,
      this.URL});
}

class NotificationModel {
  final String name;
  final String messageType;
  final String message;
  final String timeStamp;
  final String avatarUrl;

  NotificationModel(
      {this.name,
      this.messageType,
      this.message,
      this.timeStamp,
      this.avatarUrl});
}

List<YoutubeModel> youtubeData = [
  YoutubeModel(
    title: "🔴 Build a Facebook Clone with REACT JS for Beginners!",
    description:
        "In this FREE LIVE training, Qazi and Sonny will build a Facebook Clone LIVE with REACT JS and firebase!🚀🔥 ",
    thumbNail: "https://img.youtube.com/vi/B-kxUMHBxNo/0.jpg",
    publishedTime: "2 weeks ago",
    channelTitle: "Clever Programmer",
    subscriber: "768k subscribers",
    channelAvatar:
        "https://yt3.ggpht.com/a/AATXAJydjgDHqK3vz4iHkrPZjHSsjwh1aPsqOwxHCZ_ISA=s100-c-k-c0xffffffff-no-rj-mo",
    viewCount: "1000 views",
    likeCount: "800",
    dislikeCount: "30",
  ),
  YoutubeModel(
    title: "Coding Challenge #3: The Snake Game",
    description:
        "In this coding challenge, I attempt to code a p5.js version of the Snake Game.",
    thumbNail: "https://img.youtube.com/vi/AaGK-fj-BAM/0.jpg",
    publishedTime: "Apr 21, 2016",
    channelTitle: "The Coding Train",
    subscriber: "4M subscribers",
    channelAvatar:
        "https://yt3.ggpht.com/a/AATXAJzsuBQEVwEvfj3ti2gZQCVWpFc4e38IfMsPgYGCxw=s100-c-k-c0xffffffff-no-rj-mo",
    viewCount: "3M views",
    likeCount: "54k",
    dislikeCount: "2k",
  ),
  YoutubeModel(
    title: "I bought every Galaxy Note ever.",
    description:
        "With Samsung Galaxy note 20 and Note 20 Ultra upon us, and Samsung Galaxy S21 coming next year",
    thumbNail: "https://img.youtube.com/vi/EL-UCUAt8DQ/0.jpg",
    publishedTime: "Aug 27, 2020",
    channelTitle: " Mrwhosetheboss",
    subscriber: "5.01M subscribers",
    channelAvatar:
        "https://yt3.ggpht.com/a/AATXAJwYhycx5uJ2EqtuiZSVWm40XyK5jYplTdixNpTzAw=s100-c-k-c0xffffffff-no-rj-mo",
    viewCount: "7M views",
    likeCount: "100k",
    dislikeCount: "20k",
  ),
];

List<NotificationModel> notificationData = [
  NotificationModel(
    name: "Sir Liu",
    avatarUrl:
        "https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80",
    messageType: "comment",
    message: "Nice one bro. Keep up the good work.",
    timeStamp: "1 hour ago",
  ),
  NotificationModel(
    name: "Jane Cloud",
    avatarUrl:
        "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
    messageType: "subscribe",
    timeStamp: "4 hours ago",
  ),
  NotificationModel(
    name: "Toyin Tomato",
    avatarUrl:
        "https://images.unsplash.com/photo-1457449940276-e8deed18bfff?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
    messageType: "subscribe",
    timeStamp: "22 hours ago",
  ),
  NotificationModel(
    name: "Jude Law",
    avatarUrl:
        "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    messageType: "subscribe",
    timeStamp: "1 day ago",
  ),
  NotificationModel(
    name: "Eric Jonas",
    avatarUrl:
        "https://images.unsplash.com/photo-1520155707862-5b32817388d6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    messageType: "comment",
    message: "Your tutorial sucks!! Eewww.",
    timeStamp: "1 day ago",
  ),
  NotificationModel(
    name: "Nelson Okoro",
    avatarUrl:
        "https://images.unsplash.com/photo-1532074205216-d0e1f4b87368?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=681&q=80",
    messageType: "subscribe",
    timeStamp: "2 days ago",
  ),
  NotificationModel(
    name: "Matt King",
    avatarUrl:
        "https://images.unsplash.com/photo-1459245330819-1b6d75fbaa35?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
    messageType: "comment",
    message: "Can you please show how to add videos in flutter? Thanks.",
    timeStamp: "3 days ago",
  ),
];

//fetching data

//storing data to database firestore
class Test {
  final _firestore = Firestore.instance;
  var youtubeData = [
    {
      "name": "Sir Liu",
      "avatarUrl":
          "https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80",
      "messageType": "comment",
      "message": "Nice one bro. Keep up the good work.",
      "timeStamp": "1 hour ago",
    },
    {
      "name": "Jane Cloud",
      "avatarUrl":
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
      "messageType": "subscribe",
      "timeStamp": "4 hours ago",
    },
    {
      "name": "Toyin Tomato",
      "avatarUrl":
          "https://images.unsplash.com/photo-1457449940276-e8deed18bfff?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
      "messageType": "subscribe",
      "timeStamp": "22 hours ago",
    },
    {
      "name": "Jude Law",
      "avatarUrl":
          "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
      "messageType": "subscribe",
      "timeStamp": "1 day ago",
    },
    {
      "name": "Eric Jonas",
      "avatarUrl":
          "https://images.unsplash.com/photo-1520155707862-5b32817388d6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
      "messageType": "comment",
      "message": "Your tutorial sucks!! Eewww.",
      "timeStamp": "1 day ago",
    },
    {
      "name": "Nelson Okoro",
      "avatarUrl":
          "https://images.unsplash.com/photo-1532074205216-d0e1f4b87368?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=681&q=80",
      "messageType": "subscribe",
      "timeStamp": "2 days ago",
    },
    {
      "name": "Matt King",
      "avatarUrl":
          "https://images.unsplash.com/photo-1459245330819-1b6d75fbaa35?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
      "messageType": "comment",
      "message": "Can you please show how to add videos in flutter? Thanks.",
      "timeStamp": "3 days ago",
    },
  ];

  void storeData() {
    try {
      print("Video data added");
      for (int i = 0; i < youtubeData.length; i++) {
        _firestore.collection("notificationData").add(youtubeData[i]);
      }
    } catch (e) {
      print(e);
    }
  }
}
