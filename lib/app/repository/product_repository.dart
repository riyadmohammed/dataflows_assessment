import 'package:dataflows_assessment/app/assets/exporter/importer_app_general.dart';
import 'package:dataflows_assessment/app/assets/model/product_model.dart';



class ProductRepository {
  Future<List<ProductModel>> fetchProducts() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      ProductModel(
        title: 'Aloe Vera',
        description: 'Lorem ipsum dolor sit amet consectetur adipiscing elit',
        imagePath: Assets.homeBanner.path,
        price: 'RM30.00',
        oldPrice: 'RM60.00',
        discount: 50,
      ),
      ProductModel(
        title: 'Snake Plant',
        description: 'Perfect air purifier',
        imagePath: Assets.homeBanner.path,
        price: 'RM 39.00',
      ),  ProductModel(
        title: 'Fiddle Leaf Fig',
        description: 'Lorem ipsum dolor sit amet consectetur adipiscing elit',
        imagePath: Assets.homeBanner.path,
        price: 'RM 120.00',
        oldPrice: 'RM200.00',
        discount: 39,
      ),
      ProductModel(
        title: 'Peace Lily',
        description: 'Lorem ipsum dolor sit amet consectetur adipiscing elit',
        imagePath: Assets.homeBanner.path,
        price: 'RM 45.00',
        oldPrice: 'RM75.00',
        discount: 40,
      ),
      ProductModel(
        title: 'Spider Plant',
        description: 'Lorem ipsum dolor sit amet consectetur adipiscing elit',
        imagePath: Assets.homeBanner.path,
        price: 'RM 25.00',
      ),
      ProductModel(
        title: 'Fiddle Leaf Fig',
        description: 'Lorem ipsum dolor sit amet consectetur adipiscing elit',
        imagePath: Assets.homeBanner.path,
        price: 'RM 120.00',
        oldPrice: 'RM200.00',
        discount: 39,
      ),    ProductModel(
        title: 'Spider Plant',
        description: 'Lorem ipsum dolor sit amet consectetur adipiscing elit',
        imagePath: Assets.homeBanner.path,
        price: 'RM 25.00',
      ),
    ];
  }
}

