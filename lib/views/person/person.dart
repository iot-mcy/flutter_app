import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 作者 mcy
/// 时间 2019/8/13 10:01
/// “我的”tab页面
class Person extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: SingleChildScrollView(
        child: Material(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  print("个人信息详情界面");
                },
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 16, right: 16, top: 56, bottom: 24),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 40.0,
                        backgroundColor: Colors.yellow[700],
                        backgroundImage:
                            AssetImage("assets/images/image02.png"),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "梦里的奥特曼",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                            Container(
                              padding: EdgeInsets.only(left: 8, right: 8),
                              decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                              child: Text(
                                "申请认证",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black54,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Column(
                      children: <Widget>[
                        Text(
                          "12",
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.black87,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "头条",
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        )
                      ],
                    )),
                    Expanded(
                        child: Column(
                      children: <Widget>[
                        Text(
                          "37",
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.black87,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "关注",
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        )
                      ],
                    )),
                    Expanded(
                        child: Column(
                      children: <Widget>[
                        Text(
                          "29",
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.black87,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "粉丝",
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        )
                      ],
                    )),
                    Expanded(
                        child: Column(
                      children: <Widget>[
                        Text(
                          "305",
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.black87,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "获赞",
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        )
                      ],
                    )),
                  ],
                ),
              ),
              Container(
                height: 8,
                color: Colors.grey[200],
              ),
              Padding(
                padding: EdgeInsets.only(top: 16, bottom: 16),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.grade,
                          size: 32,
                          color: Colors.yellow[700],
                        ),
                        Text(
                          "我的收藏",
                          style: TextStyle(color: Colors.black54, fontSize: 16),
                        )
                      ],
                    )),
                    Expanded(
                        child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.mode_comment,
                          size: 32,
                          color: Colors.blue[500],
                        ),
                        Text(
                          "我的评论",
                          style: TextStyle(color: Colors.black54, fontSize: 16),
                        )
                      ],
                    )),
                    Expanded(
                        child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.favorite,
                          size: 32,
                          color: Colors.yellow[900],
                        ),
                        Text(
                          "我的点赞",
                          style: TextStyle(color: Colors.black54, fontSize: 16),
                        )
                      ],
                    )),
                    Expanded(
                        child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.access_time,
                          size: 32,
                          color: Colors.teal[700],
                        ),
                        Text(
                          "浏览历史",
                          style: TextStyle(color: Colors.black54, fontSize: 16),
                        )
                      ],
                    )),
                  ],
                ),
              ),
              Container(
                height: 8,
                color: Colors.grey[200],
              ),
              Container(
                height: 52,
                child: InkWell(
                  onTap: () async {},
                  child: Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                      Expanded(
                          child: Text(
                        "我的钱包",
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      )),
                      Text("话费优惠，速充值！",
                          style:
                              TextStyle(fontSize: 16, color: Colors.black38)),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black26,
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 16),
                child: Divider(
                  color: Colors.grey[300],
                  height: 1.0,
                ),
              ),
              Container(
                height: 52,
                child: InkWell(
                  onTap: () async {},
                  child: Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                      Expanded(
                          child: Text(
                        "消息通知",
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      )),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black26,
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 16),
                child: Divider(
                  color: Colors.grey[300],
                  height: 1.0,
                ),
              ),
              Container(
                height: 52,
                child: InkWell(
                  onTap: () async {},
                  child: Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                      Expanded(
                          child: Text(
                        "小程序",
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      )),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black26,
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                    ],
                  ),
                ),
              ),
              Container(
                height: 8,
                color: Colors.grey[200],
              ),
              Container(
                height: 52,
                child: InkWell(
                  onTap: () async {},
                  child: Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                      Expanded(
                          child: Text(
                        "作品管理",
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      )),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black26,
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 16),
                child: Divider(
                  color: Colors.grey[300],
                  height: 1.0,
                ),
              ),
              Container(
                height: 52,
                child: InkWell(
                  onTap: () async {},
                  child: Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                      Expanded(
                          child: Text(
                        "我的书架",
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      )),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black26,
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 16),
                child: Divider(
                  color: Colors.grey[300],
                  height: 1.0,
                ),
              ),
              Container(
                height: 52,
                child: InkWell(
                  onTap: () {
//          pr("");
                  },
                  child: Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                      Expanded(
                          child: Text(
                        "扫一扫",
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      )),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black26,
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 16),
                child: Divider(
                  color: Colors.grey[300],
                  height: 1.0,
                ),
              ),
              Container(
                height: 52,
                child: InkWell(
                  onTap: () {
//          pr("");
                  },
                  child: Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                      Expanded(
                          child: Text(
                        "免流量服务",
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      )),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black26,
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 16),
                child: Divider(
                  color: Colors.grey[300],
                  height: 1.0,
                ),
              ),
              Container(
                height: 52,
                child: InkWell(
                  onTap: () {
//          pr("");
                  },
                  child: Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                      Expanded(
                          child: Text(
                        "公益精灵",
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      )),
                      Text("养精灵做公益，免费捐书",
                          style:
                              TextStyle(fontSize: 16, color: Colors.black38)),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black26,
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 16),
                child: Divider(
                  color: Colors.grey[300],
                  height: 1.0,
                ),
              ),
              Container(
                height: 52,
                child: InkWell(
                  onTap: () {
//          pr("");
                  },
                  child: Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                      Expanded(
                          child: Text(
                        "阅读公益",
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      )),
                      Text("迁移到圆梦精灵",
                          style:
                              TextStyle(fontSize: 16, color: Colors.black38)),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black26,
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 16),
                child: Divider(
                  color: Colors.grey[300],
                  height: 1.0,
                ),
              ),
              Container(
                height: 52,
                child: InkWell(
                  onTap: () {
//          pr("");
                  },
                  child: Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                      Expanded(
                          child: Text(
                        "广告推广",
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      )),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black26,
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                    ],
                  ),
                ),
              ),
              Container(
                height: 8,
                color: Colors.grey[200],
              ),
              Container(
                height: 52,
                child: InkWell(
                  onTap: () {
//          pr("");
                  },
                  child: Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                      Expanded(
                          child: Text(
                        "用户反馈",
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      )),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black26,
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 16),
                child: Divider(
                  color: Colors.grey[300],
                  height: 1.0,
                ),
              ),
              Container(
                height: 52,
                child: InkWell(
                  onTap: () {
//          pr("");
                  },
                  child: Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                      Expanded(
                          child: Text(
                        "系统设置",
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      )),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black26,
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
