import 'dart_class.dart';

void dartClass2(){
  final getterSetter = GetterSetter('Daniel', 23);
  print(getterSetter.name);
  // print(getterSetter._name);
  print(getterSetter.age);

  getterSetter.name = 'Daniel Fernandes';
  getterSetter.age = 24;

  print(getterSetter.name);
  print(getterSetter.age);
}