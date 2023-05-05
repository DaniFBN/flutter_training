import 'package:bloc_test/bloc_test.dart';
import 'package:clean_arch_flutterando/app/modules/todo/domain/entities/entities.dart';
import 'package:clean_arch_flutterando/app/modules/todo/domain/failures/failures.dart';
import 'package:clean_arch_flutterando/app/modules/todo/submodules/cubit/presenter/cubits/states/todo_cubit_state.dart';
import 'package:clean_arch_flutterando/app/modules/todo/submodules/cubit/presenter/cubits/todo_cubit.dart';
import 'package:clean_arch_flutterando/app/modules/todo/submodules/cubit/presenter/pages/home_cubit_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class TodoCubitMock extends MockCubit<TodoCubitState> implements TodoCubit {}

class TodoFailureMock extends Mock implements TodoFailure {
  @override
  String get message => 'MOCK';
}

void main() {
  late TodoCubit cubitMock;

  setUp(() {
    cubitMock = TodoCubitMock();
  });

  testWidgets(
    'home cubit page ...',
    (tester) async {
      // final dataState = DataTodoBlocState({
      //   TodoEntity(
      //     createdAt: DateTime.now(),
      //     description: '',
      //     id: '',
      //     name: 'Task 1',
      //     userID: '',
      //   ),
      //   TodoEntity(
      //     createdAt: DateTime.now(),
      //     description: '',
      //     id: '',
      //     name: 'Task 2',
      //     userID: '',
      //   ),
      // });
      whenListen(
        cubitMock,
        Stream.fromIterable([const LoadingTodoCubitState()]),
        initialState: const LoadingTodoCubitState(),
      );
      when(() => cubitMock.getTodos('abc')).thenAnswer((_) async => {});

      // Build a tela/widget
      await tester.pumpWidget(
        MaterialApp(home: HomeCubitPage(todoCubit: cubitMock)),
      );

      final appBarTextFinder = find.text('HomeCubitPage');
      // final semanticsFinder = find.bySemanticsLabel(dataState.todos.first.name);

      final textAndSemanticsFinder = find.byWidgetPredicate((widget) {
        return widget is Text &&
            widget.data == 'HomeCubitPage' &&
            widget.semanticsLabel == 'Acessibilidade';
      });

      expect(appBarTextFinder, findsNWidgets(2));
      expect(textAndSemanticsFinder, findsOneWidget);
      // expect(semanticsFinder, findsOneWidget);
    },
  );

  testWidgets(
    'Should find a CircularProgressIndicator when TodoCubit is LoadingTodoCubitState',
    (tester) async {
      whenListen(
        cubitMock,
        Stream.fromIterable([const LoadingTodoCubitState()]),
        initialState: const LoadingTodoCubitState(),
      );
      when(() => cubitMock.getTodos('abc')).thenAnswer((_) async => {});

      // Build a tela/widget
      await tester.pumpWidget(
        MaterialApp(home: HomeCubitPage(todoCubit: cubitMock)),
      );

      final circularProgressFinder = find.byType(CircularProgressIndicator);
      expect(circularProgressFinder, findsOneWidget);
    },
  );

  testWidgets(
    'Should find a Text with Failure message when TodoCubit is ErrorTodoCubitState',
    (tester) async {
      whenListen(
        cubitMock,
        Stream.fromIterable([ErrorTodoCubitState(TodoFailureMock())]),
        initialState: const LoadingTodoCubitState(),
      );
      when(() => cubitMock.getTodos('abc')).thenAnswer((_) async => {});

      // Build a tela/widget
      await tester.pumpWidget(
        MaterialApp(home: HomeCubitPage(todoCubit: cubitMock)),
      );

      await tester.pumpAndSettle();

      final errorTextFinder = find.byWidgetPredicate((widget) {
        return widget is Text && widget.data == 'MOCK';
      });
      expect(errorTextFinder, findsOneWidget);
    },
  );

  testWidgets(
    'Should find a Text with EmptyMessage when TodoCubit is DataTodoCubitState and todos are empty',
    (tester) async {
      whenListen(
        cubitMock,
        Stream.fromIterable([const DataTodoCubitState({})]),
        initialState: const LoadingTodoCubitState(),
      );
      when(() => cubitMock.getTodos('abc')).thenAnswer((_) async => {});

      // Build a tela/widget
      await tester.pumpWidget(
        MaterialApp(home: HomeCubitPage(todoCubit: cubitMock)),
      );

      await tester.pumpAndSettle();

      final emptyTextFinder = find.byWidgetPredicate((widget) {
        return widget is Text && widget.data == 'Insira sua tarefa';
      });
      expect(emptyTextFinder, findsOneWidget);
    },
  );

  testWidgets(
    'Should find a Scrollable when TodoCubit is DataTodoCubitState and todos are not empty',
    (tester) async {
      whenListen(
        cubitMock,
        Stream.fromIterable([
          DataTodoCubitState({
            TodoEntity(
              createdAt: DateTime.now(),
              description: '',
              id: '',
              name: 'Task 1',
              userID: '',
            ),
          })
        ]),
        initialState: const LoadingTodoCubitState(),
      );
      when(() => cubitMock.getTodos('abc')).thenAnswer((_) async => {});

      // Build a tela/widget
      await tester.pumpWidget(
        MaterialApp(home: HomeCubitPage(todoCubit: cubitMock)),
      );

      await tester.pumpAndSettle();

      final scrollableFinder = find.byType(Scrollable);
      expect(scrollableFinder, findsOneWidget);

      final itemTextFinder = find.byWidgetPredicate((widget) {
        return widget is Text &&
            widget.data == 'Task 1' &&
            widget.semanticsLabel == 'Task 1';
      });
      expect(itemTextFinder, findsOneWidget);
    },
  );
}
