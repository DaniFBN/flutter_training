import 'dart:developer';

import 'package:bloc_test/bloc_test.dart';
import 'package:clean_arch_flutterando/app/modules/todo/domain/entities/entities.dart';
import 'package:clean_arch_flutterando/app/modules/todo/domain/failures/failures.dart';
import 'package:clean_arch_flutterando/app/modules/todo/domain/params/params.dart';
import 'package:clean_arch_flutterando/app/modules/todo/domain/usecases/usecases.dart';
import 'package:clean_arch_flutterando/app/modules/todo/submodules/bloc/presenter/blocs/events/todo_bloc_event.dart';
import 'package:clean_arch_flutterando/app/modules/todo/submodules/bloc/presenter/blocs/states/todo_bloc_state.dart';
import 'package:clean_arch_flutterando/app/modules/todo/submodules/bloc/presenter/blocs/todo_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class GetAllByUserIDUsecaseMock extends Mock implements GetAllByUserIDUsecase {}

class TodoFailureMock extends Mock implements TodoFailure {}

class ParamFake extends Fake implements GetAllByUserIDParam {}

void main() {
  late GetAllByUserIDUsecase usecase;
  late TodoBloc sut;

  setUp(() {
    usecase = GetAllByUserIDUsecaseMock();
    sut = TodoBloc(usecase);
  });

  setUpAll(() {
    registerFallbackValue(ParamFake());
  });

  test(
    'Should Emits in order (Loading > Error) when usecase returns Left',
    () {
      // Arrange
      const userID = '1';
      when(() => usecase(any()))
          .thenAnswer((_) async => Left(TodoFailureMock()));

      // Assert
      expect(
        sut.stream,
        emitsInOrder([
          isA<LoadingTodoBlocState>(),
          isA<ErrorTodoBlocState>(),
        ]),
      );

      // Act
      sut.add(const GetAllTodoBlocEvent(userID));
    },
  );

  test(
    'Should Emits in order (Loading > Data) when usecase returns Right',
    () {
      const userID = '1';
      when(() => usecase(any())).thenAnswer((_) async => const Right({}));

      expect(
        sut.stream,
        emitsInOrder([
          isA<LoadingTodoBlocState>(),
          isA<DataTodoBlocState>(),
        ]),
      );

      sut.add(const GetAllTodoBlocEvent(userID));
    },
  );

  blocTest<TodoBloc, TodoBlocState>(
    'Should be Loading > State when the usecase returns Right',
    build: () {
      final bloc = TodoBloc(usecase);

      when(() => usecase(any()))
          .thenAnswer((_) async => const Right(<TodoEntity>{}));

      return bloc;
    },
    wait: const Duration(seconds: 2),
    act: (bloc) => bloc.add(const GetAllTodoBlocEvent('2')),
    expect: () => [
      isA<LoadingTodoBlocState>(),
      isA<DataTodoBlocState>(),
    ],
  );

  // blocTest<TodoBloc, TodoBlocState>(
  //   'Should be Loading > Error when the usecase returns Left',
  //   build: () {
  //     final Bloc = TodoBloc(usecase);

  //     when(() => usecase(any()))
  //         .thenAnswer((_) async => Left(TodoFailureMock()));

  //     return Bloc;
  //   },
  //   act: (Bloc) => Bloc.getTodos('2'),
  //   expect: () => [
  //     const LoadingTodoBlocState(),
  //     isA<ErrorTodoBlocState>(),
  //   ],
  // );
}


Widget
Bloc
Service

Bloc
Service

Widget
MockBloc

External -> Datasource -> Consumo de API, Bluetooth
Infra -> Repository -> Tratamento de erro/Mapper
Domain -> Usecase -> Regra de Negócio/Entities(Model)
Presenter ->  Bloc 
              Controller/Facade
              Page