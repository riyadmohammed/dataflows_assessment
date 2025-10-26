import 'package:dataflows_assessment/app/assets/exporter/importer_app_general.dart';

class LocationSectionView extends StatelessWidget {
  const LocationSectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "LOCATIONS",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF244B3A)),
            ),

            const SizedBox(height: 20),

            _locationItemView(
              name: "Sunway Pyramid",
              address: "10th Floor, Lorem Ipsum Mall, Jalan SS23, Selangor",
              time: "10am - 10pm",
            ),
            const SizedBox(height: 16),
            _locationItemView(
              name: "The Gardens Mall",
              address: "2nd Floor, Lorem Ipsum Mall, Jalan SS23, Kuala Lumpur",
              time: "10am - 10pm",
            ),
          ],
        ),
      ),
    );
  }

  Widget _locationItemView({required String name, required String address, required String time}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 6,
            offset: const Offset(2, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.green.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.store_mall_directory, color: Colors.green, size: 30),
          ),
          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                const SizedBox(height: 4),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.location_on, color: Colors.green, size: 16),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        address,
                        style: const TextStyle(color: Colors.black87, fontSize: 13, height: 1.3),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.access_time, color: Colors.green, size: 16),
                    const SizedBox(width: 4),
                    Text(time, style: const TextStyle(color: Colors.black54, fontSize: 13)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
