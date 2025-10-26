import 'package:dataflows_assessment/app/assets/exporter/importer_app_general.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Discover'), centerTitle: true),
      body: Center(
        child: Text(
          'Discover Page',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: GeneralConstant.greenColor,
          ),
        ),
      ),
    );
  }
}
