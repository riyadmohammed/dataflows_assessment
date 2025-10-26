import 'package:dataflows_assessment/app/assets/exporter/importer_app_general.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({super.key});

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inbox'), centerTitle: true),
      body: Center(
        child: Text(
          'Inbox Page',
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
