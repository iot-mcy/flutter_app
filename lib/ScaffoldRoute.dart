import 'package:flutter/material.dart';

class ScaffoldRoute extends StatefulWidget {
  const ScaffoldRoute({Key key}) : super(key: key);
  static const String routeName = "/ScaffoldRoute";

  @override
  _ScaffoldRouteState createState() {
    // TODO: implement createState
    return new _ScaffoldRouteState();
  }
}

class _ScaffoldRouteState extends State<ScaffoldRoute>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 1;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  TabController _tabController;
  List tabs = ["新闻", "历史", "图片"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("App Name"),
        leading: Builder(builder: (context) {
          return IconButton(
              icon: Icon(
                Icons.dashboard,
                color: Colors.white,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              });
        }),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share), onPressed: () {})
        ],
        bottom: TabBar(
            //生成Tab菜单
            controller: _tabController,
            tabs: tabs.map((e) {
              return Tab(text: e);
            }).toList()),
      ),
      drawer: Drawer(
          child: MediaQuery.removePadding(
        context: context,
        removeTop: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Meng"),
              accountEmail: Text("123456@qq.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/image02.png"),
              ),
            ),
            Text("设置"),
//            Expanded(
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("主页"),
                  subtitle: Text("home"),
                ),
                ListTile(
                  leading: Icon(Icons.business),
                  title: Text("业务"),
                  subtitle: Text("business"),
                )
              ],
            )
//      )
          ],
        ),
      )),

//      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      body: TabBarView(
          controller: _tabController,
          children: tabs.map((e) {
            return Container(
              alignment: Alignment.center,
              child: Text(
                e,
                textScaleFactor: 5,
              ),
            );
          }).toList()),
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text("Home"),
                activeIcon: Icon(Icons.map)),
            BottomNavigationBarItem(
                icon: Icon(Icons.business), title: Text("Business")),
            BottomNavigationBarItem(
                icon: Icon(Icons.school), title: Text("School")),
          ],
          currentIndex: _selectedIndex,
          fixedColor: Colors.white,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.red,
          unselectedItemColor: Colors.white54),
//      bottomNavigationBar: BottomAppBar(
//        color: Colors.white,
//        shape: CircularNotchedRectangle(),
//        child: Row(
//          mainAxisAlignment: MainAxisAlignment.spaceAround,
//          children: <Widget>[
//            IconButton(icon: Icon(Icons.home), onPressed: () {}),
//            SizedBox(),
//            IconButton(icon: Icon(Icons.business), onPressed: () {})
//          ],
//        ),
//      ),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
