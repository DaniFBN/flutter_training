import 'package:flutter/material.dart';

class TableActionDropdownWidget extends StatelessWidget {
  const TableActionDropdownWidget({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      height: 40,
      color: Colors.grey.shade100,
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.black54,
          ),
          const SizedBox(width: 4),
          DropdownButton<int>(
            hint: Text(title),
            icon: const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.black54,
            ),
            underline: const SizedBox(),
            items: const [],
            onChanged: (int? value) {},
          ),
        ],
      ),
    );
  }
}
