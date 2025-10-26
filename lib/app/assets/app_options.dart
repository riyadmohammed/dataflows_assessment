import 'package:dataflows_assessment/app/assets/exporter/importer_app_general.dart';
import 'package:dataflows_assessment/app/assets/exporter/importer_app_structural_component.dart';

/// Declaring all the ViewModel that to be use in Provider + ChangeNotifier
/// All registered providers here will be set into [MultiProvider] in [app.dart]
/// All registered providers are configured at the deepest layer of inheritance widget
/// ensuring any screen in this app will be able to access to the providers
List<SingleChildWidget> providerAssets() => [
  ChangeNotifierProvider(create: (_) => ProductViewModel()..loadProducts()),
  ChangeNotifierProvider(create: (_) => AppointmentViewModel()..loadAppointment()),
];
