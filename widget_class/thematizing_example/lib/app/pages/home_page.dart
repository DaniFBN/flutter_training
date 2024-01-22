import 'package:flutter/material.dart';

import '../stores/theme_store.dart';
import '../widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.themeStore});

  final ThemeStore themeStore;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ThematizingExample'),
        actions: [
          ValueListenableBuilder(
            valueListenable: themeStore,
            builder: (_, state, __) {
              return IconButton(
                onPressed: themeStore.toggle,
                icon: Icon(
                  themeStore.isLight ? Icons.light_mode : Icons.dark_mode,
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Checkbox(value: true, onChanged: (_) {}),
            const SizedBox(height: 12),
            Radio(value: 1, groupValue: 1, onChanged: (_) {}),
            const SizedBox(height: 12),
            Switch.adaptive(value: true, onChanged: (_) {}),
            const SizedBox(height: 12),
            Slider.adaptive(value: 0.7, onChanged: (_) {}),
            const SizedBox(height: 12),
            const Chip(label: Text('Whatever')),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: () {}, child: const Text('Whatever')),
            const SizedBox(height: 12),
            OutlinedButton(onPressed: () {}, child: const Text('Whatever')),
            const SizedBox(height: 12),
            const CircularProgressIndicator.adaptive(),
            const SizedBox(height: 12),
            const LinearProgressIndicator(),
            const SizedBox(height: 12),
            const ListTile(title: Text('Whatever'), subtitle: Text('Whatever')),
            const SizedBox(height: 12),
            const Divider(),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Whatever'),
                  ),
                );
              },
              child: const Text('Show SnackBar'),
            ),
            const SizedBox(height: 12),
            const CustomCard(),
          ],
        ),
      ),
      floatingActionButton: const FloatingActionButton.extended(
        onPressed: null,
        label: Text('Whatever'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
