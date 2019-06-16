import 'package:flutter/material.dart';

class FlexLayoutTestRoute extends StatelessWidget {
  const FlexLayoutTestRoute({Key key}) : super(key: key);
  static const String routeName = "/FlexLayoutTestRoute";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("FlexLayoutTestRoute"),
      ),
      body: Column(
        children: <Widget>[
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  height: 56.0,
                  color: Colors.blue,
                  child: Text("1"),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    height: 56.0,
                    color: Colors.green,
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: SizedBox(
              height: 100.0,
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 32.0,
                      color: Colors.red,
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        height: 32.0,
                        color: Colors.green,
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
