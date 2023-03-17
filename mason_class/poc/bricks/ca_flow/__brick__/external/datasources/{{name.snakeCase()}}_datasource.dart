import '../../infra/datasources/i_{{name.snakeCase()}}_datasource.dart';

class {{name.pascalCase()}}Datasource implements I{{name.pascalCase()}}Datasource {
  const {{name.pascalCase()}}Datasource();

  @override
  Future<void> {{name.camelCase()}}() async {}
}
