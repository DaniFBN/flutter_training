import 'package:arch_class/presenter/pages/home_page_bloc.dart';
import 'package:arch_class/presenter/pages/home_page_notifier.dart';
import 'package:arch_class/presenter/reatividade/triple/user_triple.dart';
import 'package:flutter/material.dart';

import '../../domain/usecases/create_user_result_usecase.dart';
import '../../domain/usecases/create_user_usecase.dart';
import '../../external/create_user_datasource.dart';
import '../../infra/repositories/create_user_repository.dart';
import '../../infra/repositories/create_user_result_repository.dart';
import '../reatividade/blocs/user_bloc.dart';
import '../reatividade/notifier/user_notifier.dart';
import 'home_page_triple.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final datasource = CreateUserDatasourceImpl();
    final repository = CreateUserRepositoryImpl(datasource);
    final usecase = CreateUserUsecaseImpl(repository);

    final repositoryResult = CreateUserResultRepositoryImpl(datasource);
    final usecaseResult = CreateUserResultUsecaseImpl(repositoryResult);
    final bloc = UserBloc(
      createUserUsecase: usecase,
      createUserResultUsecase: usecaseResult,
    );

    final store = UserNotifier(
      createUserUsecase: usecase,
    );
    
    final triple = UserTriple(
      createUserUsecase: usecase,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Arch Class')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(200, 50),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) {
                        return HomePageBloc(userBloc: bloc);
                      },
                    ),
                  );
                },
                child: const Text('Bloc'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(200, 50),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) {
                        return HomePageTriple(userTriple: triple);
                      },
                    ),
                  );
                },
                child: const Text('Triple'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(200, 50),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) {
                        return HomePageNotifier(userStore: store);
                      },
                    ),
                  );
                },
                child: const Text('Notifier'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
