import 'package:flutter/material.dart';

class PrincipleCardWidget extends StatelessWidget {
  const PrincipleCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);

    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Olá Daniel!'),
            const Text('Bem vindo!'),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.purple.shade900,
                    Colors.purple,
                  ],
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text.rich(
                  TextSpan(children: [
                    TextSpan(text: 'Assine o nível 6 a partir de '),
                    TextSpan(
                      text: r'R$ 17,99',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ]),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: 13,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 40,
                  childAspectRatio: 1.2,
                ),
                itemBuilder: (_, index) {
                  return Card(
                    color: theme.primaryColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          size: 56,
                          color: theme.primaryIconTheme.color,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Topic $index'.toUpperCase(),
                          style: theme.primaryTextTheme.headlineSmall,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
