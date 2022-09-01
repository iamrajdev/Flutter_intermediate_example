import 'package:flutter/material.dart';

class PopupMenuButtonExample extends StatefulWidget {
  const PopupMenuButtonExample({Key? key}) : super(key: key);

  @override
  State<PopupMenuButtonExample> createState() => _PopupMenuButtonExampleState();
}

enum Animals { Cat, Dog, Bird, Fish, Cow }

class _PopupMenuButtonExampleState extends State<PopupMenuButtonExample> {
  Animals _selected = Animals.Bird;
  String _value = "Make a Selection";
  List<PopupMenuItem<Animals>> _items = <PopupMenuItem<Animals>>[];

  @override
  void initState() {
    super.initState();
    for (Animals animal in Animals.values) {
      _items.add(
        PopupMenuItem(
          value: animal,
          child: Text(_getDisplay(animal)),
        ),
      );
    }
  }

  void _onSelected(Animals animal) {
    setState(() {
      _selected = animal;
      _value = "You selected ${animal.name}";
    });
  }

  String _getDisplay(Animals animal) {
    int index = animal.toString().indexOf('.');
    index++;
    return animal.toString().substring(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Popup Menu Button"),
      ),
      body: Container(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(15.0),
                child: Text(_value),
              ),
              PopupMenuButton<Animals>(
                onSelected: _onSelected,
                initialValue: Animals.Cat,
                itemBuilder: (BuildContext context) {
                  return _items;
                },
                child: const Icon(Icons.input_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
