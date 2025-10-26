import 'package:dataflows_assessment/app/assets/exporter/importer_app_general.dart';
import 'package:dataflows_assessment/app/assets/exporter/importer_app_structural_component.dart';

class ProductViewModel extends ChangeNotifier {
  final _repository = ProductRepository();

  List<ProductModel> _products = [];
  List<ProductModel> get products => _products;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> loadProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      _products = await _repository.fetchProducts();
    } catch (e) {
      debugPrint('Error loading products: $e');
      _products = [];
    }

    _isLoading = false;
    notifyListeners();
  }
}
