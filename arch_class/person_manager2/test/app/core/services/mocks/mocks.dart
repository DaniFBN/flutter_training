import 'package:mocktail/mocktail.dart';
import 'package:person_manager2/app/core/services/local_storage/helpers/params.dart';
import 'package:person_manager2/app/core/services/local_storage/i_local_storage_service.dart';

class LocalStorageServiceMock extends Mock implements ILocalStorageService {}

class WriteLocalStorageParamFake extends Fake
    implements WriteLocalStorageParam {}
