import 'package:flutter/material.dart';
import 'package:flutter_app/custom_view/CustomListItemTwo.dart';

class ListViewRoute extends StatefulWidget {
  const ListViewRoute({Key key}) : super(key: key);
  static const String routeName = "/ListViewRoute";

  @override
  _ListViewRoute createState() {
    // TODO: implement createState
    return new _ListViewRoute();
  }
}

class _ListViewRoute extends State<ListViewRoute> {
  Widget dividerBlue = Divider(color: Colors.blue);
  Widget dividerGreen = Divider(color: Colors.green);

  ScrollController _scrollController = ScrollController();
  int _pageNumber = 1;
  bool isLoading = false;

  List list = new List();

  static const loadingTag = "##loading##";
  var _words = <String>[loadingTag];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print("滑动到了最底部");
        _getMoreData();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['A', 'B', 'C'];
    final List<int> colorCodes = <int>[600, 500, 100];

    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
      ),

//      body: ListView(
//        shrinkWrap: true,
//        padding: const EdgeInsets.all(16.0),
//        children: <Widget>[
//          Container(
//            height: 50,
//            color: Colors.amber[600],
//            child: const Center(child: Text('Entry A')),
//          ),
//          Container(
//            height: 50,
//            color: Colors.amber[500],
//            child: const Center(child: Text('Entry B')),
//          ),
//          Container(
//            height: 50,
//            color: Colors.amber[100],
//            child: const Center(child: Text('Entry C')),
//          ),
//        ],
//      ),

//      body: ListView(
//        children: <Widget>[
//          Card(
//            child: InkWell(
//              splashColor: Colors.red.withAlpha(30),
//              onTap: () {
//                print("Card tapde");
//              },
//              child: Container(
//                width: 400,
//                height: 100,
//                child: Text("一加7Pro"),
//              ),
//            ),
//          ),
//          Card(
//            elevation: 4.0,
//            margin: EdgeInsets.all(8.0),
//            child: InkWell(
////              onTap: (){},
//              child: ListTile(
//                leading: FlutterLogo(),
//                title: Text("荣耀V10"),
//                subtitle: Text("麒麟970处理器"),
//                trailing: Icon(Icons.school),
////                selected: true,
////                enabled: false,
//                onLongPress: () {
//                  print("onLongPress");
//                },
//                onTap: () {
//                  print("onTap");
//                },
//              ),
//            ),
//          ),
//          ListTile(
//            leading: GestureDetector(
//              behavior: HitTestBehavior.translucent,
//              onTap: () {
//                print("leading onTap");
//              },
//              child: Container(
//                width: 48,
//                height: 48,
//                padding: EdgeInsets.symmetric(vertical: 4.0),
//                alignment: Alignment.center,
//                child: CircleAvatar(),
//              ),
//            ),
//            onTap: () {
//              print("item 1");
//            },
//            title: Text('title'),
//            dense: false,
//          ),
//          CustomListItem(
//            user :'一加7Pro',
//            view
//          )
//        ],
//      ),

//      body: ListView(
//        padding: EdgeInsets.all(8.0),
//        itemExtent: 108.0,
//        children: <CustomListItem>[
//          CustomListItem(
//              thumbnail: Container(
//                decoration: BoxDecoration(color: Colors.blue),
//              ),
//              title: 'Flutter',
//              user: 'Flutter1',
//              viewCount: 999)
//        ],
//      ),

//      body: ListView(
//        padding: EdgeInsets.all(16.0),
//        children: <Widget>[
//          CustomListItemTwo(
//            thumbnail: Container(
//              decoration: BoxDecoration(color: Colors.pink),
//            ),
//            title: 'Flutter 1.0 Launch',
//            subtitle: 'Flutter continues to improve and expand its horizons.'
//                'This text should max out at two lines and chlip',
//            author: 'Dash',
//            publishDate: 'Dec 28',
//            readDuration: '5 mins',
//          ),
//          CustomListItemTwo(
//            thumbnail: Container(
//              decoration: BoxDecoration(color: Colors.green),
//            ),
//            title: 'Flutter 1.2 Release - Continual updates to the framework',
//            subtitle: 'Flutter once again improves and makes updates.',
//            author: 'Flutter',
//            publishDate: 'Feb 26',
//            readDuration: '12 mins',
//          )
//        ],
//      ),

      body: RefreshIndicator(
          child: ListView.builder(
            itemCount: list.length + 1,
            itemBuilder: _item,
            controller: _scrollController,
          ),
          onRefresh: _onRefresh),

//      body: ListView.builder(
//          padding: EdgeInsets.all(8.0),
//          itemCount: entries.length,
//          itemBuilder: (BuildContext context, int index) {
//            return Container(
//              height: 56.0,
//              color: Colors.amber[colorCodes[index]],
//              child: Center(
//                child: Text(entries[index]),
//              ),
//            );
//          }),

//      body: ListView.separated(
//          itemCount: entries.length,
//          separatorBuilder: (BuildContext context, int index) {
//            return index % 2 == 0 ? dividerBlue : dividerGreen;
//          },
//          itemBuilder: (BuildContext context, int index) {
//            return ListTile(title: Text(entries[index]+"$index"));
//          }),
    );
  }

  Widget _item(BuildContext context, int index) {
    if (index < list.length) {
      ItemData itemData = list[index];
      return CustomListItemTwo(
        thumbnail: Container(
          decoration: BoxDecoration(color: Colors.green),
        ),
        title: itemData.title,
        subtitle: itemData.subtitle,
        author: itemData.author,
        publishDate: itemData.publishDate,
        readDuration: itemData.readDuration,
      );
    }
    return _getMoreWidget();
  }

  Future getData() async {
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        for (int index = 0; index < 7; index++) {
          ItemData itemData = new ItemData("", 'subtitle $index',
              'author $index', 'publishDate $index', 'readDuration $index');
          list.add(itemData);
        }
      });
    });
  }

  Future _onRefresh() async {
    await Future.delayed(Duration(seconds: 3), () {
      setState(() {
        list.clear();
        for (int index = 0; index < 12; index++) {
          ItemData itemData = new ItemData("", 'subtitle $index',
              'author $index', 'publishDate $index', 'readDuration $index');
          list.add(itemData);
        }
      });
    });
  }

  Future _getMoreData() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });

      await Future.delayed(Duration(seconds: 3), () {
        print("加载更多");
        setState(() {
          int size = list.length;
          for (int index = size; index < size + 5; index++) {
            ItemData itemData = new ItemData("", 'subtitle $index',
                'author $index', 'publishDate $index', 'readDuration $index');
            list.add(itemData);
          }

          _pageNumber++;
          isLoading = false;
        });
      });
    }
  }

  Widget _getMoreWidget() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "加载中···",
            style: TextStyle(fontSize: 16.0),
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 16.0)),
          CircularProgressIndicator()
        ],
      ),
    );
  }
}

class ItemData {
  String title;
  String subtitle;
  String author;
  String publishDate;
  String readDuration;

  ItemData(this.title, this.subtitle, this.author, this.publishDate,
      this.readDuration);
}
