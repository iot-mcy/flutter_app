import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/routers/application.dart';
import 'package:flutter_app/routers/routes.dart';

class AppPage extends StatelessWidget {
  AppPage() {
    Router router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        backgroundColor: Colors.grey[100],
        accentColor: Colors.grey[600],
        primaryColor: Colors.red,
      ),
      onGenerateRoute: Application.router.generator,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    if (mounted) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: builderSearchInput(context),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
          BottomNavigationBarItem(
              icon: Icon(Icons.ondemand_video), title: Text("西瓜视频")),
          BottomNavigationBarItem(
              icon: Icon(Icons.videocam), title: Text("小视频")),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), title: Text("我的")),
        ],
        backgroundColor: Colors.grey[200],
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black45,
        onTap: _onItemTapped,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        elevation: 0.0,
      ),
    );
  }
}

Widget builderSearchInput(BuildContext context) {
  return new SearchInput();
}

class SearchInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
            flex: 1,
            child: Container(
              height: 40.0,
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Icon(
                Icons.search,
                color: Theme.of(context).accentColor,
              ),
            )),
        FlatButton.icon(
            onPressed: null,
            icon: Icon(
              Icons.camera_alt,
              color: Colors.white,
            ),
            label: Text(
              "发布",
              style: TextStyle(color: Colors.white),
            )),
      ],
    );
  }
}
