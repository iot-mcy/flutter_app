import 'package:flutter/material.dart';

class CustomListItem extends StatelessWidget {
  final Widget thumbnail;
  final String title;
  final String user;
  final int viewCount;

  const CustomListItem({this.thumbnail, this.title, this.user, this.viewCount});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(flex: 2, child: thumbnail),
          Expanded(
              flex: 3,
              child: _VideoDescription(
                  title: title, user: user, viewCount: viewCount)),
          const Icon(
            Icons.more_vert,
            size: 16.0,
          ),
        ],
      ),
    );
  }
}

class _VideoDescription extends StatelessWidget {
  final String title;
  final String user;
  final int viewCount;

  const _VideoDescription({this.title, this.user, this.viewCount});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(
            user,
            style: TextStyle(fontSize: 14.0),
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text(
            '$viewCount views',
            style: TextStyle(fontSize: 10.0),
          )
        ],
      ),
    );
  }
}
