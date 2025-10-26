import 'package:dataflows_assessment/app/assets/exporter/importer_app_general.dart';
import 'package:dataflows_assessment/app/assets/exporter/importer_routing.dart';
import 'package:dataflows_assessment/app/assets/router/app_router.dart';
import 'package:dataflows_assessment/app/view/homeScreen/discoveries_section_view.dart';
import 'package:dataflows_assessment/app/view/homeScreen/home_banner_view.dart';
import 'package:dataflows_assessment/app/view/homeScreen/location_section_view.dart';
import 'package:dataflows_assessment/app/view/homeScreen/widgets/home_header_view.dart';

import 'widgets/productScreen/product_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFF4F4F4),
        child: CustomScrollView(
          slivers: [
            HomeHeaderView(),
            SliverToBoxAdapter(
              child: Padding(padding: const EdgeInsets.all(16), child: const HomeBannerView()),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _featureCardView(
                      title: "SHOP",
                      icon: Icons.storefront,
                      onTap: () {
                        context.goNamed(RouterName.shopPage);
                      },
                    ),
                    _featureCardView(
                      title: "SERVICE",
                      icon: Icons.design_services,
                      onTap: () {
                        context.goNamed(RouterName.servicePage);
                      },
                    ),
                    _featureCardView(
                      title: "POSTS",
                      icon: Icons.article,
                      onTap: () {
                        context.goNamed(RouterName.postsPage);
                      },
                    ),
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(child: ProductListPage()),

            // --- Discoveries Section ---
            const DiscoveriesSectionView(),

            // --- Location Section ---
            const LocationSectionView(),
          ],
        ),
      ),
    );
  }

  Widget _featureCardView({String? title, IconData? icon, VoidCallback? onTap}) {
    return Expanded(
      child: TouchableOpacity(
        onPressed: onTap,

        child: Container(
          width: 1000,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF244B3A), const Color(0xFF66BB6A)],
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 10,
                offset: const Offset(2, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.white, size: 28),
              const SizedBox(height: 10),
              Text(
                title?.toUpperCase() ?? '',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
