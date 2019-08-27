import 'package:flutter/material.dart';

/// 作者 mcy
/// 时间 2019/8/27 15:03
///
class BottomSheetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _BottomSheetPageState();
  }
}

class _BottomSheetPageState extends State<BottomSheetPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  VoidCallback _showBottomSheetCallback;

  @override
  void initState() {
    super.initState();
    _showBottomSheetCallback = _showBottomSheet;
  }

  void _showBottomSheet() {
    setState(() {
      _showBottomSheetCallback = null;
    });

    _scaffoldKey.currentState
        .showBottomSheet<void>((BuildContext context) {
          return Container(
            decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.black26))),
            height: 200.0,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("取消"),
                    ),
                    FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "确定",
                          style: TextStyle(color: Colors.blue),
                        )),
                  ],
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(32.0),
                    child: Text(
                        "This is a Material persistent bottom sheet. Drag downwards to dismiss it."),
                  ),
                ),
              ],
            ),
          );
        })
        .closed
        .whenComplete(() {
          if (mounted) {
            setState(() {
              _showBottomSheetCallback = _showBottomSheet;
            });
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("BottomSheet"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
        children: <Widget>[
          OutlineButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16.0),
                  )),
                  builder: (BuildContext context) {
                    return Container(
                      height: 200.0,
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("取消"),
                              ),
                              FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    "确定",
                                    style: TextStyle(color: Colors.blue),
                                  )),
                            ],
                          ),
                          Container(
                            child: Padding(
                              padding: EdgeInsets.all(32.0),
                              child: Text(
                                  "This is the modal bottom sheet. Slide down to dismiss."),
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            },
            child: Text("Modal"),
          ),
          OutlineButton(
            onPressed: _showBottomSheetCallback,
            child: Text("Persistent"),
          )
        ],
      ),
    );
  }
}
