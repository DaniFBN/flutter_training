import 'package:flutter/material.dart';

import '../mock/data.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: DataMock.items.length,
          itemBuilder: (context, index) {
            final item = DataMock.items.elementAt(index);

            return ElevatedButton(
              onPressed: item.onTap,
              child: Text(item.title),
            );
          },
        ),
      ),
    );
  }
}
