import 'package:flutter/material.dart';

import 'model/my_item.dart';

class ExpansionPanelExample extends StatefulWidget {
  const ExpansionPanelExample({Key? key}) : super(key: key);

  @override
  State<ExpansionPanelExample> createState() => _ExpansionPanelExampleState();
}

class _ExpansionPanelExampleState extends State<ExpansionPanelExample> {
  List<MyItem> _items = <MyItem>[];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 10; i++) {
      _items.add(MyItem(
        false,
        'Item $i',
        Container(
          padding: const EdgeInsets.all(10.0),
          child: const Text('Hello World'),
        ),
      ));
    }
  }

  ExpansionPanel _createItem(MyItem item) {
    return ExpansionPanel(
        headerBuilder: (BuildContext context, bool isExpanded) {
          return Container(
            padding: const EdgeInsets.all(5.0),
            child: Text('Header ${item.header}'),
          );
        },
        body: item.body,
        isExpanded: item.isExpanded);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expansion Panel'),
      ),
      body: Container(
        padding: const EdgeInsets.all(32.0),
        child: ListView(
          children: [
            ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  _items[index].isExpanded = !_items[index].isExpanded;
                });
              },
              children: _items.map(_createItem).toList(),
            )
          ],
        ),
      ),
    );
  }
}
