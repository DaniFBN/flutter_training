abstract class UserState{
  const UserState();
}

class InitialUserState extends UserState{
  const InitialUserState();
}

class LoadingUserState extends UserState{
  const LoadingUserState();
}

class ErrorUserState extends UserState{
  const ErrorUserState();
}

class SuccessUserState extends UserState{
  const SuccessUserState();
}