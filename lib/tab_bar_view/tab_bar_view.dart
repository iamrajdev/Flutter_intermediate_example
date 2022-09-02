import 'package:flutter/material.dart';

import 'model/tab_view_model.dart';

class TabBarViewExample extends StatefulWidget {
  const TabBarViewExample({Key? key}) : super(key: key);

  @override
  State<TabBarViewExample> createState() => _TabBarViewExampleState();
}

class _TabBarViewExampleState extends State<TabBarViewExample>
    with SingleTickerProviderStateMixin {
  TabController? _controller;
  final List<Choice> _items = <Choice>[
    Choice(title: 'CAR', icon: Icons.directions_car),
    Choice(title: 'BICYCLE', icon: Icons.directions_bike),
    Choice(title: 'BOAT', icon: Icons.directions_boat),
    Choice(title: 'BUS', icon: Icons.directions_bus),
    Choice(title: 'TRAIN', icon: Icons.directions_railway),
    Choice(title: 'WALK', icon: Icons.directions_walk),
  ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: _items.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tab Bar view'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Theme(
            data: Theme.of(context).copyWith(
                colorScheme:
                    ColorScheme.fromSwatch().copyWith(secondary: Colors.white)),
            child: Container(
              height: 48.0,
              alignment: Alignment.center,
              child: TabPageSelector(controller: _controller),
            ),
          ),
        ),
      ),
      body: TabBarView(
          controller: _controller,
          children: _items.map((Choice item) {
            return Container(
              padding: const EdgeInsets.all(32.0),
              child: Center(
                child: Column(
                  children: [
                    Text(item.title),
                    Icon(item.icon, size: 120.0),
                  ],
                ),
              ),
            );
          }).toList()),
    );
  }
}
