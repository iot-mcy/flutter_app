import 'package:flutter/material.dart';

class ItemVideo extends StatelessWidget {
  String title;
  int playCount;
  int likeCount;
  String titleImg;

  ItemVideo(this.title, this.playCount, this.likeCount, this.titleImg);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {
        //todo
        print(title);
      },
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        fit: StackFit.loose,
        children: <Widget>[
          ClipRRect(
            child: Image.network(
              titleImg,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          Container(
            color: Colors.black26,
            padding: EdgeInsets.all(8),
            height: 64,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 16.0,
                    ),
                    Text(
                      "$playCount次播放",
                      style: TextStyle(fontSize: 12.0, color: Colors.white),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
