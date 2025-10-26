import 'package:dataflows_assessment/app/assets/exporter/importer_app_general.dart';
import 'package:dataflows_assessment/app/assets/exporter/importer_app_structural_component.dart';

class AppointmentViewModel extends ChangeNotifier {
  final _repository = AppointmentRepository();
  AppointmentModel? _appointment;
  bool _isLoading = true;

  AppointmentModel? get appointment => _appointment;
  bool get isLoading => _isLoading;

  Future<void> loadAppointment() async {
    _isLoading = true;
    notifyListeners();

    _appointment = await _repository.getNextAppointment();

    _isLoading = false;
    notifyListeners();
  }
}
