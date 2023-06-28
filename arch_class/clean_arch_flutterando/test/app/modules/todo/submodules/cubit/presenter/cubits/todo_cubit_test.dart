import 'package:bloc_test/bloc_test.dart';
import 'package:clean_arch_flutterando/app/modules/todo/domain/entities/entities.dart';
import 'package:clean_arch_flutterando/app/modules/todo/domain/failures/failures.dart';
import 'package:clean_arch_flutterando/app/modules/todo/domain/params/params.dart';
import 'package:clean_arch_flutterando/app/modules/todo/domain/usecases/usecases.dart';
import 'package:clean_arch_flutterando/app/modules/todo/submodules/cubit/presenter/cubits/states/todo_cubit_state.dart';
import 'package:clean_arch_flutterando/app/modules/todo/submodules/cubit/presenter/cubits/todo_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class GetAllByUserIDUsecaseMock extends Mock implements GetAllByUserIDUsecase {}

class TodoFailureMock extends Mock implements TodoFailure {}

class ParamFake extends Fake implements GetAllByUserIDParam {}

void main() {
  late GetAllByUserIDUsecase usecase;
  late TodoCubit sut;

  setUp(() {
    usecase = GetAllByUserIDUsecaseMock();
    sut = TodoCubit(usecase);
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
          isA<LoadingTodoCubitState>(),
          isA<ErrorTodoCubitState>(),
        ]),
      );

      // Act
      sut.getTodos(userID);
    },
  );

  test(
    'Should Emits in order (Loading > Data) when usecase returns Right',
    () {
      const userID = '1';
      when(() => usecase(any())).thenAnswer((_) async => const Right({}));

      expect(
        sut.stream,
        emitsInOrder(
          [
            isA<LoadingTodoCubitState>(),
            isA<DataTodoCubitState>(),
          ],
        ),
      );

      sut.getTodos(userID);
    },
  );

  blocTest<TodoCubit, TodoCubitState>(
    'Should be Loading > State when the usecase returns Right',
    build: () {
      final cubit = TodoCubit(usecase);

      when(() => usecase(any()))
          .thenAnswer((_) async => const Right(<TodoEntity>{}));

      return cubit;
    },
    act: (cubit) => cubit.getTodos('2'),
    expect: () => [
      const LoadingTodoCubitState(),
      isA<DataTodoCubitState>(),
    ],
  );

  blocTest<TodoCubit, TodoCubitState>(
    'Should be Loading > Error when the usecase returns Left',
    build: () {
      final cubit = TodoCubit(usecase);

      when(() => usecase(any()))
          .thenAnswer((_) async => Left(TodoFailureMock()));

      return cubit;
    },
    act: (cubit) => cubit.getTodos('2'),
    expect: () => [
      const LoadingTodoCubitState(),
      isA<ErrorTodoCubitState>(),
    ],
  );
}
