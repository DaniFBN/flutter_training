
import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'themes/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeState>(
      valueListenable: theme,
      builder: (context, state, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.theme,
          darkTheme: ThemeData.dark(),
          themeMode: state.isLightTheme ? ThemeMode.light : ThemeMode.dark,
          home: const HomePage(),
        );
      },
    );
  }
}

final theme = ThemeStore(ThemeState(true));

class ThemeStore extends ValueNotifier<ThemeState> {
  ThemeStore(super.value);

  void toggleTheme() {
    value = value.copyWith(isLightTheme: !value.isLightTheme);
  }
}

class ThemeState {
  final bool isLightTheme;

  ThemeState(this.isLightTheme);

  ThemeState copyWith({
    bool? isLightTheme,
  }) {
    return ThemeState(
      isLightTheme ?? this.isLightTheme,
    );
  }
}

// ValueNotifier/ChangeNotifier
// BLoC 
//   Cubit
// MobX
// Triple

