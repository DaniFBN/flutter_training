import 'package:flutter/material.dart';
import 'package:form_example/app/widgets/attach_field.dart';
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
  final emailFocus = FocusNode();

  final passwordController = TextEditingController();
  final passwordFocus = FocusNode();

  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final attachController = TextEditingController();

  int radioValue = 1;

  final dropdownValues = ['Flutter', 'React', 'Swift', 'Kotlin'];
  String? dropdownValue;

  bool switchValue = false;

  void toggleSwitch(bool value) {
    setState(() {
      switchValue = value;
    });
  }

  void changeDropdownValue(String? value) {
    if (value?.toLowerCase() == dropdownValue) return;

    setState(() {
      dropdownValue = value?.toLowerCase();
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
                CustomField(
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
                const SizedBox(height: 8),
                PasswordField(
                  focusNode: passwordFocus,
                  controller: passwordController,
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField(
                  onChanged: changeDropdownValue,
                  value: dropdownValue,
                  validator: (value) {
                    if (value == null) return 'Campo obrigatório';
                    return null;
                  },
                  items: dropdownValues.map((e) {
                    return DropdownMenuItem(
                      value: e.toLowerCase(),
                      child: Text(e),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 8),
                Switch.adaptive(
                  value: switchValue,
                  onChanged: toggleSwitch,
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
                Autocomplete(
                  onSelected: changeDropdownValue,
                  optionsBuilder: (value) {
                    return dropdownValues.where((element) {
                      return element
                          .toLowerCase()
                          .contains(value.text.toLowerCase());
                    });
                  },
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
