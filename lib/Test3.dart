import 'package:flutter/material.dart';

class Test3 extends StatelessWidget {
  const Test3({Key key}) : super(key: key);
  static const String routeName = "/Test3";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new SampleAppPage();
  }
}

class SampleAppPage extends StatefulWidget {
  @override
  _SampleAppPageState createState() {
    // TODO: implement createState
    return new _SampleAppPageState();
  }
}

class _SampleAppPageState extends State<SampleAppPage> {
  bool toggle = true;

  @override
  void initState() {
    super.initState();
    print("initState");
  }

  void _toggle() {
    setState(() {
      toggle = !toggle;
    });
  }

  _getToggleChild() {
    if (toggle) {
      return new Text('Toggle One');
    } else {
      return new MaterialButton(
        onPressed: () {},
        child: new Text('Toggle Two'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Test3'),
      ),
      body: new Center(
        child: _getToggleChild(),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _toggle,
        child: new Icon(Icons.update),
      ),
    );
  }

  @override
  void didUpdateWidget(SampleAppPage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}
