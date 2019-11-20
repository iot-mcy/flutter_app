import 'package:flutter/material.dart';
import 'package:flutter_app/components/list_refresh.dart' as listComp;
import 'package:flutter_app/components/pagination.dart';
import 'package:flutter_app/utils/net_utils.dart';

import 'attention_page_item.dart';
import 'attention_page_item_data.dart';

class AttentionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AttentionPageState();
  }
}

class _AttentionPageState extends State<AttentionPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: listComp.ListRefresh(
          getIndexListData, getItemWidget, null, true),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

Future<Map> getIndexListData([Map<String, dynamic> params]) async {
  //todo 在这里做网络请求
  const juejin_flutter =
      'https://timeline-merger-ms.juejin.im/v1/get_tag_entry?src=web&tagId=5a96291f6fb9a0535b535438';
  var pageIndex = (params is Map) ? params['pageIndex'] : 1;
  final _param = {'page': pageIndex, 'pageSize': 20, 'sort': 'rankIndex'};
  var responseList = [];
  var pageTotal = 0;

  try {
    var response = await NetUtils.get(juejin_flutter, _param);
    responseList = response['d']['entrylist'];
    pageTotal = response['d']['total'];
    if (!(pageTotal is int) || pageTotal <= 0) {
      pageTotal = 0;
    }
  } catch (e) {}
  pageIndex += 1;
  List resultList = new List();
  for (int i = 0; i < responseList.length; i++) {
    try {
      AttentionPageItemData cellData =
          new AttentionPageItemData.fromJson(responseList[i]);
      resultList.add(cellData);
    } catch (e) {
      // No specified type, handles all
    }
  }

  Map<String, dynamic> result = {
    "list": resultList,
    'total': pageTotal,
    'pageIndex': pageIndex
  };
  return result;
}

Widget getItemWidget(index, item) {
  return AttentionPageItem(item);
}

Widget headerView() {
  return Column(
    children: <Widget>[
      Stack(
        children: <Widget>[
          Pagination(),
        ],
      )
    ],
  );
}

Widget headerView1() {
  return Container(
    height: 100.0,
    color: Colors.blue,
    alignment: Alignment.center,
    child: Text("HeaderView"),
  );
}
