import 'package:dataflows_assessment/app/assets/exporter/importer_app_general.dart';

class MallPage extends StatefulWidget {
  const MallPage({super.key});

  @override
  State<MallPage> createState() => _MallPageState();
}

class _MallPageState extends State<MallPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home'), centerTitle: true),
      body: Center(
        child: Text(
          'Mall',
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
