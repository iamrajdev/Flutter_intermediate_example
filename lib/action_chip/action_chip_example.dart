import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ActionChipExample extends StatefulWidget {
  const ActionChipExample({Key? key}) : super(key: key);

  @override
  State<ActionChipExample> createState() => _ActionChipExampleState();
}

class _ActionChipExampleState extends State<ActionChipExample> {
  int counter = 0;
  final List<Widget> _list = <Widget>[];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 5; i++) {
      Widget child = _newItem(i);
      _list.add(child);
    }
  }

  void _onClicked() {
    Widget child = _newItem(counter);
    setState(() => _list.add(child));
  }

  Widget _newItem(int i) {
    Key key = Key('item_$i');
    Container child = Container(
      key: key,
      padding: const EdgeInsets.all(10.0),
      child: Chip(
        label: Text('$i name here'),
        deleteIconColor: Colors.red,
        deleteButtonTooltipMessage: 'Delete',
        onDeleted: () => _removeItem(key),
        avatar: CircleAvatar(
          backgroundColor: Colors.grey.shade800,
          child: Text(i.toString()),
        ),
      ),
    );
    counter++;
    return child;
  }

  void _removeItem(Key key) {
    for (int i = 0; i < _list.length; i++) {
      Widget child = _list.elementAt(i);
      if (child.key == key) {
        setState(() => _list.removeAt(i));
        if (kDebugMode) {
          print('Removing ${key.toString()}');
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chip - Key & Children"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onClicked,
        child: const Icon(Icons.add),
      ),
      body: Container(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: _list,
          ),
        ),
      ),
    );
  }
}
