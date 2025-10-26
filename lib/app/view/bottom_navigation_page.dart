import 'package:dataflows_assessment/app/assets/exporter/importer_app_general.dart';
import 'package:dataflows_assessment/app/assets/exporter/importer_routing.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: DefaultTabController(
        length: TabBarEnum.values.length,
        initialIndex: widget.navigationShell.currentIndex,
        child: Container(
          padding: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey.shade300)),
            color: Colors.white,
          ),
          child: Theme(
            data: Theme.of(
              context,
            ).copyWith(splashColor: Colors.transparent, highlightColor: Colors.transparent),
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              currentIndex: widget.navigationShell.currentIndex,
              onTap: onTapItem,
              selectedLabelStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: GeneralConstant.greenColor,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
              unselectedLabelStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.grey.shade400,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
              showSelectedLabels: true,
              showUnselectedLabels: true,
              elevation: 0,
              useLegacyColorScheme: false,
              items: TabBarEnum.values
                  .map(
                    (ele) => BottomNavigationBarItem(
                      label: ele.tapName,
                      icon: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Image.asset(
                          widget.navigationShell.currentIndex == ele.index
                              ? ele.activeIcon
                              : ele.icon,
                          height: 24,
                          width: 24,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  void onTapItem(int selectedIndex) {
    context.go(TabBarEnum.values[selectedIndex].path, extra: GoRouterState.of(context).extra);
  }
}
