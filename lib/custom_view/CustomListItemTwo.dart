import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';

class CustomListItemTwo extends StatelessWidget {
  final Widget thumbnail;
  final String title;
  final String subtitle;
  final String author;
  final String publishDate;
  final String readDuration;

  const CustomListItemTwo(
      {Key key,
      this.thumbnail,
      this.title,
      this.subtitle,
      this.author,
      this.publishDate,
      this.readDuration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: SizedBox(
          height: 100.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1.0,
                child: thumbnail,
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '$title',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 2.0)),
                            Text(
                              '$subtitle',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.black54),
                            )
                          ],
                        )),
                    Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              '$author',
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.black87),
                            ),
                            Text(
                              '$publishDate ▪ $readDuration ★',
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.black54),
                            )
                          ],
                        ))
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
      onTap: () {
        onItemClick(title);
      },
    );
  }

  void onItemClick(String title) {
    // todo 做跳转动作
    print(title);
//    Fluttertoast.showToast(
//        msg: "This is Center Short Toast",
//        toastLength: Toast.LENGTH_SHORT,
//        gravity: ToastGravity.CENTER,
//        timeInSecForIos: 1,
//        backgroundColor: Colors.red,
//        textColor: Colors.white,
//        fontSize: 16.0
//    );
  }
}

class _ArticleDescription extends StatelessWidget {
  final String title;
  final String subtitle;
  final String author;
  final String publishDate;
  final String readDuration;

  _ArticleDescription(
      {Key key,
      this.title,
      this.subtitle,
      this.author,
      this.publishDate,
      this.readDuration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '$title',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Padding(padding: EdgeInsets.only(bottom: 2.0)),
                Text(
                  '$subtitle',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12.0, color: Colors.black54),
                )
              ],
            )),
        Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  '$author',
                  style: TextStyle(fontSize: 12.0, color: Colors.black87),
                ),
                Text(
                  '$publishDate ▪ $readDuration ★',
                  style: TextStyle(fontSize: 12.0, color: Colors.black54),
                )
              ],
            ))
      ],
    ));
  }
}
