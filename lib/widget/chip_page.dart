import 'package:flutter/material.dart';

/// 作者 mcy
/// 时间 2019/8/27 17:57
///
class ChipPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ChipPageState();
  }
}

class _ChipPageState extends State<ChipPage> {
  final List<Actor> _cast = <Actor>[
    const Actor('Java', 'J'),
    const Actor('C', 'C'),
    const Actor('C++', 'C'),
    const Actor('Dart', 'D'),
  ];

  Iterable<Widget> get actorWidgets sync* {
    for (Actor actor in _cast) {
      yield Padding(
        padding: const EdgeInsets.all(4.0),
        child: Chip(
          avatar: CircleAvatar(child: Text(actor.initials)),
          label: Text(actor.name),
          onDeleted: () {
            setState(() {
              _cast.removeWhere((Actor entry) {
                return entry.name == actor.name;
              });
            });
          },
        ),
      );
    }
  }

  String name = "Dart";

  Iterable<Widget> get actorWidgets2 sync* {
    for (Actor actor in _cast) {
      yield Padding(
        padding: const EdgeInsets.all(4.0),
        child: ChoiceChip(
          label: Text(actor.name),
          selected: name == actor.name,
          onSelected: (bool selected) {
            setState(() {
              name = selected ? actor.name : "";
            });
          },
        ),
      );
    }
  }

  List<String> _filters = <String>[];

  Iterable<Widget> get actorWidgets3 sync* {
    for (Actor actor in _cast) {
      yield Padding(
        padding: const EdgeInsets.all(4.0),
        child: FilterChip(
          avatar: CircleAvatar(child: Text(actor.initials)),
          label: Text(actor.name),
          selected: _filters.contains(actor.name),
          onSelected: (bool value) {
            setState(() {
              if (value) {
                _filters.add(actor.name);
              } else {
                _filters.removeWhere((String name) {
                  return name == actor.name;
                });
              }
            });
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Chips"),
        ),
        body: ListView(
          children: <Widget>[
            Wrap(
              children: actorWidgets.toList(),
            ),
            Wrap(
              children: actorWidgets2.toList(),
            ),
            Wrap(
              children: actorWidgets3.toList(),
            ),
          ],
        ));
  }
}

class Actor {
  const Actor(this.name, this.initials);

  final String name;
  final String initials;
}
