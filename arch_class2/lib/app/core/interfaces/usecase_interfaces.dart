import 'package:result_dart/result_dart.dart';

import '../shared/exceptions/app_exception.dart';

abstract class IAsyncResultUsecase<Response extends Object, P> {
  AsyncResult<Response, AppException> call(P param);
}

class NoParams {
  const NoParams();
}
