import 'package:flutter/material.dart';

class MyItem {
  bool isExpanded;
  final String header;
  final Widget body;

  MyItem(this.isExpanded, this.header, this.body);
}
