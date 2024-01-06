import 'package:flutter/material.dart';
import 'package:person_manager3/app/core/services/shared_preferences_local_storage.dart';
import 'package:person_manager3/app/data/datasources/person_datasource.dart';
import 'package:person_manager3/app/data/repositories/person_repository.dart';
import 'package:person_manager3/app/domain/usecases/create_person_usecase.dart';
import 'package:person_manager3/app/presenter/cubit/add_person_cubit.dart';
import 'package:person_manager3/app/presenter/pages/add_person_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }

          final sharedPreferences = snapshot.data!;

          final localStorage = SharedPreferencesLocalStorage(sharedPreferences);
          final datasource = PersonDatasource(localStorage);
          final repo = PersonRepository(datasource);
          final usecase = CreatePersonUsecase(repo);
          final cubit = AddPersonCubit(usecase);

          return AddPersonPage(cubit: cubit);
        },
      ),
    );
  }
}
