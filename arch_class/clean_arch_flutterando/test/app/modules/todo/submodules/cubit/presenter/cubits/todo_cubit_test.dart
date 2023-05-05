// import 'package:bloc_test/bloc_test.dart';
// import 'package:clean_arch_flutterando/app/modules/todo/domain/entities/entities.dart';
// import 'package:clean_arch_flutterando/app/modules/todo/domain/params/get_all_by_user_id_param.dart';
// import 'package:clean_arch_flutterando/app/modules/todo/domain/usecases/usecases.dart';
// import 'package:clean_arch_flutterando/app/modules/todo/submodules/cubit/presenter/cubits/states/todo_cubit_state.dart';
// import 'package:clean_arch_flutterando/app/modules/todo/submodules/cubit/presenter/cubits/todo_cubit.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:fpdart/fpdart.dart';
// import 'package:mocktail/mocktail.dart';

// import '../../../../mocks/mocks.dart';

// class UsecaseMock extends Mock implements GetAllByUserIDUsecase {}

// class ParamFake extends Fake implements GetAllByUserIDParam {}

// void main() {
//   late GetAllByUserIDUsecase usecase;

//   setUp(() {
//     usecase = UsecaseMock();

//     registerFallbackValue(ParamFake());
//   });

//   blocTest<TodoCubit, TodoCubitState>(
//     'Should be Loading > State when the usecase returns Right',
//     build: () {
//       final cubit = TodoCubit(usecase);

//       when(() => usecase(any()))
//           .thenAnswer((_) async => const Right(<TodoEntity>{}));

//       return cubit;
//     },
//     act: (cubit) => cubit.getTodos('2'),
//     expect: () => [
//       const LoadingTodoCubitState(),
//       isA<DataTodoCubitState>(),
//     ],
//   );

//   blocTest<TodoCubit, TodoCubitState>(
//     'Should be Loading > Error when the usecase returns Left',
//     build: () {
//       final cubit = TodoCubit(usecase);

//       when(() => usecase(any()))
//           .thenAnswer((_) async => Left(TodoFailureMock()));

//       return cubit;
//     },
//     act: (cubit) => cubit.getTodos('2'),
//     expect: () => [
//       const LoadingTodoCubitState(),
//       isA<ErrorTodoCubitState>(),
//     ],
//   );

//   test(
//     'Should be Loading > Error when the usecase returns Left - emitsInOrder',
//     () async* {
//       final cubit = TodoCubit(usecase);

//       when(() => usecase(any()))
//           .thenAnswer((_) async => Left(TodoFailureMock()));

//       await cubit.getTodos('2');

//       await expectLater(
//         cubit.stream,
//         emitsInOrder([
//           const LoadingTodoCubitState(),
//           isA<ErrorTodoCubitState>(),
//         ]),
//       );
//     },
//     timeout: const Timeout(Duration(seconds: 5)),
//   );
// }

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
      const userID = '1';
      when(() => usecase(any()))
          .thenAnswer((_) async => Left(TodoFailureMock()));

      expect(
        sut.stream,
        emitsInOrder([
          isA<LoadingTodoCubitState>(),
          isA<ErrorTodoCubitState>(),
        ]),
      );

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
