import 'package:dataflows_assessment/app/assets/exporter/importer_app_general.dart';

class AppointmentDetailsPage extends StatelessWidget {
  final String date;
  final String time;
  final String location;

  const AppointmentDetailsPage({
    super.key,
    required this.date,
    required this.time,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Appointment Details"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "NEXT APPOINTMENT",
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade800,
              ),
            ),
            const SizedBox(height: 16),
            detailRowView(label: "Date", value: date),
            const SizedBox(height: 8),
            detailRowView(label: "Time", value: time),
            const SizedBox(height: 8),
            detailRowView(label: "Location", value: location),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

Widget detailRowView({String? label, String? value}) {
  return Row(
    children: [
      Text("$label:", style: const TextStyle(fontWeight: FontWeight.bold)),

      Expanded(child: Text(value ?? '', overflow: TextOverflow.ellipsis)),
    ],
  );
}
