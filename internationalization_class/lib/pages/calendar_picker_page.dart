import 'package:default_design/default_design.dart';
import 'package:flutter/material.dart';

class CalendarPickerPage extends StatelessWidget {
  const CalendarPickerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: runtimeType.toString(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Localizations.override(
              context: context,
              locale: const Locale('es'),
              child: Builder(
                builder: (context) {
                  return CalendarDatePicker(
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                    onDateChanged: (value) {},
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
