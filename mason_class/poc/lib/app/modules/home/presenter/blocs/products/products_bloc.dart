import 'package:flutter_bloc/flutter_bloc.dart';

import 'products_events.dart';
import 'products_states.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(const InitialProductsState()) {
    on<LoadProductsEvent>(_load);
  }

  Future<void> _load(LoadProductsEvent event, Emitter<ProductsState> emit) async{
    emit(const LoadingProductsState());

    await Future.delayed(const Duration(seconds: 2));

    emit(const SuccessProductsState());
  }
}