import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/event/event_bus.dart';
import 'package:flutter_app/event/event_model.dart';

/// 作者 mcy
/// 时间 2019/11/21 10:44
/// EventBus的使用
class EventBusPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new EventBusPageState();
  }
}

class EventBusPageState extends State<EventBusPage> {
  String widgetName = "name";

  @override
  void initState() {
    super.initState();
    eventBus.on<DemoEvent>().listen((event) {
      //todo
      print(event.widgetName);
      setState(() {
        widgetName = event.widgetName;
      });
    });
  }


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("EventBus"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(widgetName),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
            OutlineButton(
              onPressed: () {
//                Navigator.push(context,
//                    new MaterialPageRoute(builder: (context) {
//                  return EventBusPage2();
//                }));
                eventBus.fire(new DemoEvent("mcy"));
              },
              child: Text("更改"),
            ),
          ],
        ),
      ),
    );
  }
}

class EventBusPage2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new EventBusPage2State();
  }
}

class EventBusPage2State extends State<EventBusPage2> {
  String widgetName = "";

  @override
  void initState() {
    super.initState();
    eventBus.on<DemoEvent>().listen((event) {
      setState(() {
        widgetName = event.widgetName;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("EventBusPage2State"),
      ),
      body: Center(
        child: Text(widgetName),
      ),
    );
  }
}
