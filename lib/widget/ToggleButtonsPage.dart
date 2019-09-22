import 'package:flutter/material.dart';

/// 作者 mcy
/// 日期 2019/9/21 17:25
/// ToggleButtons
class ToggleButtonsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ToggleButtonsPageState();
  }
}

class ToggleButtonsPageState extends State<ToggleButtonsPage> {
  var isSelected1 = [false, false, true];
  var isSelected2 = [false, false, true];
  var isSelected3 = [false, false, true];

  var m = BlendMode.dst;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("ToggleButtons"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.symmetric(vertical: 16.0)),
              Text('multi-select', textScaleFactor: 2),
              ToggleButtons(
                  children: [
                    Icon(Icons.ac_unit),
                    Icon(Icons.call),
                    Icon(Icons.cake)
                  ],
                  isSelected: isSelected1,
                  onPressed: (int index) {
                    setState(() {
                      isSelected1[index] = !isSelected1[index];
                    });
                  }),
              Padding(padding: EdgeInsets.symmetric(vertical: 16.0)),
              Text('single-select', textScaleFactor: 2),
              ToggleButtons(
                  children: [
                    Icon(Icons.ac_unit),
                    Icon(Icons.call),
                    Icon(Icons.cake)
                  ],
                  isSelected: isSelected2,
                  onPressed: (int index) {
                    setState(() {
                      for (int i = 0; i < isSelected2.length; i++) {
                        if (i == index) {
                          isSelected2[i] = true;
                        } else {
                          isSelected2[i] = false;
                        }
                      }
                    });
                  }),
              Padding(padding: EdgeInsets.symmetric(vertical: 16.0)),
              Text('custom-select', textScaleFactor: 2),
              ToggleButtons(
                  children: [
                    Icon(Icons.ac_unit),
                    Icon(Icons.call),
                    Icon(Icons.cake)
                  ],
                  borderRadius: BorderRadius.circular(30),
                  isSelected: isSelected3,
                  onPressed: (int index) {
                    setState(() {
                      for (int i = 0; i < isSelected3.length; i++) {
                        if (i == index) {
                          isSelected3[i] = true;
//                          switch(index){
//                            case 0:
//                              m = BlendMode.src;
//                              break;
//                            case 1:
//                              m = BlendMode.darken;
//                              break;
//                            case 2:
//                              m = BlendMode.difference;
//                              break;
//                          }
                        } else {
                          isSelected3[i] = false;
                        }
                      }
                    });
                  }),
//              ColorFiltered(
//                colorFilter: ColorFilter.mode(Colors.red, m),
//                child: Text("ColorFiltered"),
//              ),
            ],
          ),
        ));
  }
}
