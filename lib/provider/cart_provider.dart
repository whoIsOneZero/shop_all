import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/product.dart';

part 'cart_provider.g.dart';

@riverpod
class CartNotifier extends _$CartNotifier {
  // initial value
  @override
  Set<Product> build() {
    return const {};
  }

  // methods to update state
  void addProduct(Product product) {
    if (!state.contains(product)) {
      state = {...state, product};
    }
  }

  void removeProduct(Product product) {
    if (state.contains(product)) {
      // keep products whose IDs do not match
      state = state.where((p) => p.id != product.id).toSet();
    }
  }
}
