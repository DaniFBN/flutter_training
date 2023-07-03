import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_example/app/widgets/attach_field.dart';
import 'package:form_example/app/widgets/dropdown_field.dart';
import 'package:form_example/app/widgets/password_field.dart';

import '../widgets/custom_field.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/date_field.dart';
import '../widgets/time_field.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final focus = [FocusNode(), FocusNode()];
  final emailFocus = FocusNode();

  final passwordController = TextEditingController();
  final passwordFocus = FocusNode();

  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final attachController = TextEditingController();

  int radioValue = 1;

  final dropdownValues = ['Flutter', 'React', 'Swift', 'Kotlin'];
  final dropdownValues2 = ['Flutter', 'React', 'Swift', 'Kotlin', 'Django'];
  String? dropdownValue = 'kotlin';

  bool switchValue = false;

  static bool isKeyDown(Set<LogicalKeyboardKey> keys) {
    return keys.intersection(RawKeyboard.instance.keysPressed).isNotEmpty;
  }

  @override
  void initState() {
    super.initState();

    RawKeyboard.instance.addListener((value) {
      if (value is RawKeyDownEvent) {
        final doTab = isKeyDown({
          LogicalKeyboardKey.tab,
        });

        if (doTab) {
          focus.last.requestFocus();
        }
      }
    });
  }

  void toggleSwitch(bool value) {
    setState(() {
      switchValue = value;
    });
  }

  void changeDropdownValue(String value) {
    final handledValue = value.toLowerCase();
    if (handledValue == dropdownValue) return;

    setState(() {
      dropdownValue = handledValue;
    });
  }

  void changeRadio(int? value) {
    if (value == null) return;

    setState(() {
      radioValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Page')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomField(
                        label: 'Email',
                        field: CustomTextField(
                          focusNode: focus.first,
                          maxLength: 99,
                          autofill: const [AutofillHints.email],
                          hintText: 'Digite seu email',
                          controller: emailController,
                          required: false,
                          validator: (value) {
                            if (!value!.contains('@')) {
                              return 'Email inválido';
                            }

                            return null;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: CustomField(
                        label: 'Email',
                        field: CustomTextField(
                          focusNode: emailFocus,
                          maxLength: 99,
                          autofill: const [AutofillHints.email],
                          hintText: 'Digite seu email',
                          controller: emailController,
                          required: false,
                          validator: (value) {
                            if (!value!.contains('@')) {
                              return 'Email inválido';
                            }

                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                PasswordField(
                  focusNode: focus.last,
                  controller: passwordController,
                ),
                const SizedBox(height: 8),
                const SizedBox(height: 8),
                ValueListenableBuilder(
                  valueListenable: notifier,
                  builder: (context, state, child) {
                    return Column(
                      children: [
                        DropdownField(
                          value: notifier.value,
                          onChanged: (value) {
                            notifier.changeValue(value);
                            changeDropdownValue(value);
                          },
                        ),
                        const SizedBox(height: 8),
                        Visibility(
                          visible: notifier.value == 'swift',
                          child: DropdownButtonFormField(
                            onChanged: (value) => changeDropdownValue(value!),
                            value: 'flutter', // initialValue
                            validator: (value) {
                              if (value == null) return 'Campo obrigatório';
                              return null;
                            },
                            items: notifier.value == 'react'
                                ? dropdownValues.map((e) {
                                    return DropdownMenuItem(
                                      value: e.toLowerCase(),
                                      child: Text(e),
                                    );
                                  }).toList()
                                : dropdownValues2.map((e) {
                                    return DropdownMenuItem(
                                      value: e.toLowerCase(),
                                      child: Text(e),
                                    );
                                  }).toList(),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Expanded(child: CheckboxGroup(itemCount: 2)),
                    const SizedBox(width: 20),
                    Column(
                      children: [
                        Checkbox.adaptive(value: true, onChanged: (_) {}),
                        Checkbox(value: false, onChanged: (_) {}),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Column(
                      children: [
                        Switch.adaptive(
                          value: switchValue,
                          onChanged:
                              dropdownValue == 'kotlin' ? toggleSwitch : null,
                        ),
                        Switch(value: switchValue, onChanged: toggleSwitch),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                DateField(controller: dateController),
                const SizedBox(height: 8),
                TimeField(controller: timeController),
                const SizedBox(height: 8),
                AttachField(controller: attachController),
                const SizedBox(height: 8),
                RadioListTile.adaptive(
                  title: const Text('Option 1'),
                  value: 1,
                  groupValue: radioValue,
                  onChanged: changeRadio,
                ),
                RadioListTile(
                  title: const Text('Option 2'),
                  value: 2,
                  groupValue: radioValue,
                  onChanged: changeRadio,
                ),
                const SizedBox(height: 8),
                Autocomplete<String>(
                  onSelected: changeDropdownValue,
                  optionsBuilder: (value) {
                    // if (value.text.length < 3) return [];
                    final handledText = value.text.toLowerCase();

                    return dropdownValues.where((element) {
                      return element.toLowerCase().contains(handledText);
                    });
                  },
                  // optionsMaxHeight: 75,
                  // optionsViewBuilder: (context, onSelected, options) {
                  //   return ListView.builder(
                  //     itemCount: options.length,
                  //     itemBuilder: (context, index) {
                  //       final item = options.elementAt(index);
                  //       return Row(
                  //         children: [
                  //           const Icon(Icons.add),
                  //           Text(item),
                  //         ],
                  //       );
                  //     },
                  //   );
                  // },
                ),
                const SizedBox(height: 8),
                const ElevatedButton(
                  onPressed: null,
                  child: Text('Disabled Button'),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () => FocusScope.of(context).nextFocus(),
                  child: const Text('NextFocus'),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () =>
                      FocusScope.of(context).requestFocus(emailFocus),
                  child: const Text('Email Focus'),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () => FocusScope.of(context).requestFocus(),
                  child: const Text('Clear Focus'),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return Dialog(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text('Title'),
                                const SizedBox(height: 40),
                                const Text('Body'),
                                ElevatedButton(
                                  onPressed: Navigator.of(context).pop,
                                  child: const Text('Sair'),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: const Text('Show Dialog'),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    print(emailController.text);
                    print(passwordController.text);
                    print(dropdownValue);
                  },
                  child: const Text('Print Values'),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    formKey.currentState!.validate();
                  },
                  child: const Text('Validate Form'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Jeitos de atualizar a tela
// Stateful - setState
// ValueNotifier
// BLoC
// MobX
// Triple

// Column
//   Widget1 - mexer aqui e atualizar o 2
//   Widget2

final notifier = ValueNotifier2();

class ValueNotifier2 extends ValueNotifier<String> {
  ValueNotifier2() : super('flutter');

  void changeValue(String newValue) {
    value = newValue;
  }
}

class CheckboxGroup extends StatefulWidget {
  const CheckboxGroup({
    Key? key,
    required this.itemCount,
  }) : super(key: key);

  final int itemCount;

  @override
  State<CheckboxGroup> createState() => _CheckboxGroupState();
}

class _CheckboxGroupState extends State<CheckboxGroup> {
  int selectedIndex = 0;

  void changeSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        widget.itemCount,
        (index) => CheckboxListTile.adaptive(
          value: index == selectedIndex,
          onChanged: (value) => changeSelected(index),
          title: Text('Item $index'),
        ),
      ),
    );
  }
}
