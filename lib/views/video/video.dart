import 'package:flutter/material.dart';
import 'package:flutter_app/components/search_input.dart';

class Video extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: builderSearchInput(context),
      ),
      body: Container(
        child: Text("视频"),
      ),
    );
  }
}

Widget builderSearchInput(BuildContext context) {
  return new SearchInput(
    voidCallback: onVoidCallback,
  );
}

void onVoidCallback() {
  print("调转到搜索界面");
}
