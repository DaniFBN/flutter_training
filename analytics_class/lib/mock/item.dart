import 'package:flutter/material.dart';

class Item {
  final String title;
  final VoidCallback onTap;

  const Item({
    required this.title,
    required this.onTap,
  });
}
