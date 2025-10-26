import 'package:dataflows_assessment/app/assets/exporter/importer_app_general.dart';
import 'package:dataflows_assessment/app/assets/exporter/importer_routing.dart';
import 'package:dataflows_assessment/app/assets/exporter/importer_app_screens.dart';

class RouterName {
  static String splashScreen = 'splashScreen';
  static const home = 'home';
  static const mall = 'mall';
  static const discover = 'discover';
  static const inbox = 'inbox';
  static const account = 'account';
  static const shopPage = 'shopPage';
  static const servicePage = 'servicePage';
  static const postsPage = 'postsPage';
  static const productDetailsPage = 'productDetailsPage';
  static const productPage = 'productPage';
}

class RouterPath {
  static String splashScreen = '/';
  static const home = '/home';
  static const mall = '/mall';
  static const discover = '/discover';
  static const inbox = '/inbox';
  static const account = '/account';
  static const shopPage = 'shopPage';
  static const servicePage = 'servicePage';
  static const postsPage = 'postsPage';
  static const productDetailsPage = 'productDetailsPage';
  static const productPage = 'productPage';
}

class RouterNavigatorKeys {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static final homeNavigatorKey = GlobalKey<NavigatorState>();
  static final mallNavigatorKey = GlobalKey<NavigatorState>();
  static final discoverNavigatorKey = GlobalKey<NavigatorState>();
  static final inboxNavigatorKey = GlobalKey<NavigatorState>();
  static final accountNavigatorKey = GlobalKey<NavigatorState>();
}

final GoRouter router = GoRouter(
  navigatorKey: RouterNavigatorKeys.rootNavigatorKey,
  initialLocation: RouterPath.splashScreen,
  routes: [
    StatefulShellRoute.indexedStack(
      parentNavigatorKey: RouterNavigatorKeys.rootNavigatorKey,
      builder: (context, state, navigationShell) =>
          BottomNavigationPage(navigationShell: navigationShell),
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          navigatorKey: RouterNavigatorKeys.homeNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: RouterPath.home,
              name: RouterName.home,
              builder: (context, state) => const HomePage(),
              routes: [
                GoRoute(
                  path: RouterPath.shopPage,
                  name: RouterName.shopPage,
                  parentNavigatorKey: RouterNavigatorKeys.rootNavigatorKey,

                  builder: (context, state) => const ShopPage(),
                ),
                GoRoute(
                  path: RouterPath.servicePage,
                  name: RouterName.servicePage,
                  parentNavigatorKey: RouterNavigatorKeys.rootNavigatorKey,

                  builder: (context, state) => const ServicePage(),
                ),
                GoRoute(
                  path: RouterPath.postsPage,
                  name: RouterName.postsPage,
                  parentNavigatorKey: RouterNavigatorKeys.rootNavigatorKey,

                  builder: (context, state) => const PostsPage(),
                ),
                GoRoute(
                  path: RouterPath.productDetailsPage,
                  name: RouterName.productDetailsPage,
                  parentNavigatorKey: RouterNavigatorKeys.rootNavigatorKey,
                  builder: (context, state) {
                    final extra = state.extra;
                    if (extra is Map<String, dynamic> &&
                        extra.containsKey(PathParameters.product)) {
                      final product = extra[PathParameters.product];
                      return ProductDetailsPage(product: product);
                    }

                    return ProductDetailsPage(product: ProductModel());
                  },
                ),
                GoRoute(
                  path: RouterPath.productPage,
                  name: RouterName.productPage,
                  parentNavigatorKey: RouterNavigatorKeys.rootNavigatorKey,

                  builder: (context, state) => const ProductPage(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: RouterNavigatorKeys.mallNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: RouterPath.mall,
              name: RouterName.mall,
              builder: (context, state) => const MallPage(),
              routes: [],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: RouterNavigatorKeys.discoverNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: RouterPath.discover,
              name: RouterName.discover,
              builder: (context, state) => const DiscoverPage(),
              routes: [],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: RouterNavigatorKeys.inboxNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: RouterPath.inbox,
              name: RouterName.inbox,
              builder: (context, state) => const InboxPage(),
              routes: [],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: RouterNavigatorKeys.accountNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: RouterPath.account,
              name: RouterName.account,
              builder: (context, state) => const AccountPage(),
              routes: [],
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: RouterPath.splashScreen,
      name: RouterName.splashScreen,
      builder: (context, state) => const SplashScreen(),
    ),
  ],
);
