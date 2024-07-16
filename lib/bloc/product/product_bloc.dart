import 'package:bloc/bloc.dart';
import '../../data/models/product.dart';
import '../../data/repositories/product_repository.dart';
import 'package:equatable/equatable.dart';
part 'product_event.dart';
part 'product_state.dart';


class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  ProductBloc({required this.productRepository}) : super(ProductInitial()) {
    on<LoadProducts>(_onLoadProducts);
  }

  void _onLoadProducts(LoadProducts event, Emitter<ProductState> emit) async {
    try {
      emit(ProductLoading());
      final products = await productRepository.fetchProducts();
      emit(ProductLoaded(products: products));
    } catch (e) {
      emit(ProductError("Failed to fetch products: ${e.toString()}"));
    }
  }

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is LoadProducts) {
      yield* _mapLoadProductsToState(event);
    }
  }

  Stream<ProductState> _mapLoadProductsToState(LoadProducts event) async* {
    yield ProductLoading();
    try {
      final products = await productRepository.fetchProducts();
      yield ProductLoaded(products: products);
    } catch (e) {
      yield ProductError("Failed to fetch products: ${e.toString()}");
    }
  }
}