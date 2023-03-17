abstract class {{name.pascalCase()}}State{
  const {{name.pascalCase()}}State();
}

class Initial{{name.pascalCase()}}State extends {{name.pascalCase()}}State{
  const Initial{{name.pascalCase()}}State();
}

class Loading{{name.pascalCase()}}State extends {{name.pascalCase()}}State{
  const Loading{{name.pascalCase()}}State();
}

class Error{{name.pascalCase()}}State extends {{name.pascalCase()}}State{
  const Error{{name.pascalCase()}}State();
}

class Success{{name.pascalCase()}}State extends {{name.pascalCase()}}State{
  const Success{{name.pascalCase()}}State();
}