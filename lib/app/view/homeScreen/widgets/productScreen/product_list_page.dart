import 'package:dataflows_assessment/app/assets/exporter/importer_app_general.dart';
import 'package:dataflows_assessment/app/assets/exporter/importer_routing.dart';
import 'package:dataflows_assessment/app/assets/router/app_router.dart';
import 'package:dataflows_assessment/app/viewmodel/product_viewmodel.dart';
import 'package:dataflows_assessment/app/assets/exporter/importer_app_structural_component.dart';


class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    const double imageHeightRatio = 2 / 3.5;

    return Consumer<ProductViewModel>(
      builder: (context, viewModel, _) {
        final products = viewModel.products;

        if (products.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'NEW SERVICES',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      TouchableOpacity(
                        onPressed: () => context.pushNamed(RouterName.productPage),
                        child: Text(
                          "View All",
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Recommended based on your preference',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.34,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  separatorBuilder: (_, _) => const SizedBox(width: 16),
                  itemBuilder: (context, index) {
                    final product = products[index];

                    return TouchableOpacity(
                      onPressed: () => context.pushNamed(
                        RouterName.productDetailsPage,
                        extra: {PathParameters.product: product},
                      ),

                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,
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
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                              child: Image.asset(
                                product.imagePath ?? '',
                                height:
                                    MediaQuery.of(context).size.height * 0.34 * imageHeightRatio,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 10,left: 6),
                              child: Text(
                                product.title ?? '',
                                style: Theme.of(
                                  context,
                                ).textTheme.titleLarge?.copyWith(color: Colors.grey, fontSize: 12),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4, left: 6),
                              child: Text(
                                product.description ?? '',
                                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 12, left: 6),
                              child: Text(
                                product.price ?? '',
                                style: Theme.of(
                                  context,
                                ).textTheme.titleLarge?.copyWith(color: Colors.green, fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
