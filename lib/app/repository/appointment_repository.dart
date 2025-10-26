import 'package:dataflows_assessment/app/assets/model/appointment_model.dart';
import 'package:dataflows_assessment/app/assets/exporter/importer_app_structural_component.dart';

class AppointmentRepository {
  Future<AppointmentModel> getNextAppointment() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return AppointmentModel(
      date: "14 Oct 2020",
      time: "12:30 PM",
      location: "123 Plant Street, GreenCity",
      imagePath: "assets/images/doctor_image.png",
      credit: "RM100.00",
      points: "10",
      package: "1",
    );
  }
}
