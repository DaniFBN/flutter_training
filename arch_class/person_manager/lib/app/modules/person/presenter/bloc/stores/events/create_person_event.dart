import '../../../../domain/params/create_person_param.dart';

class CreatePersonEvent {
  const CreatePersonEvent();
}

class SubmitCreatePersonEvent extends CreatePersonEvent {
  final CreatePersonParam param;

  const SubmitCreatePersonEvent(this.param);
}
