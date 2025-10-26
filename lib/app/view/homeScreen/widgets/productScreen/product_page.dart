import 'package:dataflows_assessment/app/assets/exporter/importer_app_general.dart';
import 'package:dataflows_assessment/app/assets/exporter/importer_routing.dart';
import 'package:dataflows_assessment/app/assets/router/app_router.dart';
import 'package:dataflows_assessment/app/assets/exporter/importer_app_structural_component.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          "All Products",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        backgroundColor: GeneralConstant.greenColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Consumer<ProductViewModel>(
        builder: (context, viewModel, _) {
          final products = viewModel.products;

          if (products.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.builder(
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.6,
              ),
              itemBuilder: (context, index) {
                final product = products[index];

                return GestureDetector(
                  onTap: () => context.pushNamed(
                    RouterName.productDetailsPage,
                    extra: {PathParameters.product: product},
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 6,
                          offset: const Offset(2, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 🖼️ Image with optional discount badge
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                              child: Image.asset(
                                product.imagePath ?? '',
                                height: 160,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            if (product.discount != null)
                              Positioned(
                                top: 8,
                                right: 8,
                                child: Container(
                                  width: 38,
                                  height: 38,
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: GeneralConstant.greenColor,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 4,
                                        offset: Offset(1, 2),
                                      ),
                                    ],
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${product.discount}%',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),

                        // 🏷️ Product Title
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 8, 10, 2),
                          child: Text(
                            product.title ?? '',
                            style: const TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ),

                        // 📄 Product Description
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            product.description ?? '',
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                        const Spacer(),

                        Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 10),
                          child: Column(
                            children: [
                              if (product.oldPrice != null) ...[
                                const SizedBox(width: 6),
                                Text(
                                  product.oldPrice!,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                              Text(
                                product.price ?? '',
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
