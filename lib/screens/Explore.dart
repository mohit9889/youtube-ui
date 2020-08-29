import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtubeui/components/VideoList.dart';
import 'package:youtubeui/modal/data.dart';
import 'package:youtubeui/screens/Trending.dart';

class Explore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> iconsImageUrl = [
      "https://images.unsplash.com/photo-1519500099198-fd81846b8f03?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
      "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
      "https://images.unsplash.com/photo-1552820728-8b83bb6b773f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
      "https://images.unsplash.com/photo-1504711434969-e33886168f5c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
      "https://images.unsplash.com/photo-1542204637-e67bc7d41e48?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=975&q=80",
      "https://images.unsplash.com/photo-1472851294608-062f824d29cc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
      "https://images.unsplash.com/photo-1503676260728-1c00da094a0b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1009&q=80",
      "https://images.unsplash.com/photo-1530202741-e752bdc9d582?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"
    ];

    return ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(16.0),
          height: 230,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _imageButton(Icons.whatshot, iconsImageUrl[0], "Trending",
                      () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Trending()));
                  }, context),
                  _imageButton(Icons.videogame_asset, iconsImageUrl[2],
                      "Gaming", () {}, context),
                  _imageButton(Icons.ondemand_video, iconsImageUrl[4], "Films",
                      () {}, context),
                  _imageButton(Icons.lightbulb_outline, iconsImageUrl[6],
                      "Learning", () {}, context),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _imageButton(Icons.music_video, iconsImageUrl[1], "Music",
                      () {}, context),
                  _imageButton(
                      Icons.class_, iconsImageUrl[3], "News", () {}, context),
                  _imageButton(Icons.shopping_basket, iconsImageUrl[5],
                      "Fashion", () {}, context),
                  _imageButton(
                      Icons.cast, iconsImageUrl[7], "Live", () {}, context),
                ],
              )
            ],
          ),
        ),
        VideoList(listData: youtubeData),
      ],
    );
  }

  Widget _imageButton(IconData icon, String url, String title,
      Function navigate, BuildContext context) {
    return GestureDetector(
      onTap: navigate,
      child: Stack(
        children: <Widget>[
          Container(
            height: 40.0,
            width: (MediaQuery.of(context).size.width / 2) - 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                url,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 4.0, left: 8.0),
            child: Row(
              children: <Widget>[
                Icon(
                  icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
