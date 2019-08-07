import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
/// 作者 mcy
/// 时间 2019/8/7 15:18
/// WebView
class WebViewPage extends StatefulWidget {
  final String url;
  final String title;

  WebViewPage(this.url, this.title);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _WebViewPageState();
  }
}

class _WebViewPageState extends State<WebViewPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: WebviewScaffold(url: widget.url),
    );
  }
}
