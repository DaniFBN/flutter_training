abstract class ProductsState{
  const ProductsState();
}

class InitialProductsState extends ProductsState{
  const InitialProductsState();
}

class LoadingProductsState extends ProductsState{
  const LoadingProductsState();
}

class ErrorProductsState extends ProductsState{
  const ErrorProductsState();
}

class SuccessProductsState extends ProductsState{
  const SuccessProductsState();
}