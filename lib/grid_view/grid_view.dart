import 'dart:math';

import 'package:flutter/material.dart';

import 'model/area_model.dart';

class GridViewExample extends StatefulWidget {
  const GridViewExample({Key? key}) : super(key: key);

  @override
  State<GridViewExample> createState() => _GridViewExampleState();
}

class _GridViewExampleState extends State<GridViewExample> {
  late int _location;
  final List<Area> _areas = <Area>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for (int i = 0; i < 16; i++) {
      _areas.add(Area(index: i, name: "Area $i"));
    }

    var rnd = Random();
    _location = rnd.nextInt(_areas.length);
  }

  Widget _generate(int index) {
    return GridTile(
      child: Container(
        padding: const EdgeInsets.all(5.0),
        child: ElevatedButton(
          onPressed: () => _onPressed(index),
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(_areas[index].color)),
          child: Text(
            _areas[index].name,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  void _onPressed(int index) {
    setState(() {
      index == _location
          ? _areas[index].color = Colors.green
          : _areas[index].color.red;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grid View"),
      ),
      body: GridTile(
        child: Container(
          padding: const EdgeInsets.all(5.0),
          child: Center(
            child: GridView.count(
              crossAxisCount: 4,
              children: List<Widget>.generate(16, _generate),
            ),
          ),
        ),
      ),
    );
  }
}
