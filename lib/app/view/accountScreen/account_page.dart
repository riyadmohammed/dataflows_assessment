import 'package:dataflows_assessment/app/assets/exporter/importer_app_general.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Account'), centerTitle: true),
      body: Center(
        child: Text(
          'Account Page',
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
