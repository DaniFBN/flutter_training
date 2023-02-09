// DIP - Dependency Inversion Principle

abstract class IHttpClient {
  void get();
}

class DioHttpClient implements IHttpClient {
  @override
  void get() {
    // TODO: implement get
  }
}

class UnoHttpClient implements IHttpClient {
  @override
  void get() {
    // TODO: implement get
  }
}


class ProductBloc {
  final IHttpClient _httpClient;

  ProductBloc(this._httpClient);
}

void main() {
  ProductBloc(DioHttpClient());
  ProductBloc(UnoHttpClient());
}

