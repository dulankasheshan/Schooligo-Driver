import 'package:flutter/material.dart';
import 'package:schooligo_driver/screens/components/emaergency_tile.dart';

class EmergencyScreen extends StatefulWidget {
  const EmergencyScreen({Key? key}) : super(key: key);

  @override
  State<EmergencyScreen> createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<EmergencyService> emergencyServices = [
    EmergencyService('Ambulance', '1990', Icons.local_hospital_rounded),
    EmergencyService('Emergency Information Service', '118', Icons.local_police_sharp),
    EmergencyService('Ambulance / Fire & Rescue', '	110', Icons.local_hospital_rounded),
    EmergencyService('Accident Service-General Hospital-Colombo', '0112691111', Icons.local_hospital_rounded),
    EmergencyService('Police Emergency', '0112433333', Icons.local_police_sharp),
    EmergencyService('Government Information Center', '1919', Icons.other_houses),
    EmergencyService('Report Crimes', '0112691500', Icons.local_police_sharp),
    EmergencyService('Emergency Police Mobile Squad', '0115717171', Icons.local_police_sharp),
    // Add more emergency services here
  ];

  List<EmergencyService> filteredServices = [];

  @override
  void initState() {
    super.initState();
    // Initialize the filtered list with all services initially
    filteredServices = List.from(emergencyServices);
  }

  void filterServices(String query) {
    setState(() {
      // Filter the services based on the query
      filteredServices = emergencyServices
          .where((service) => service.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        // Add container properties here
        color: Colors.blue, // Example background color
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            title: const Text('Emergency'),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(56.0),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 16.0),
                child: TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Search...',
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: filterServices,
                ),
              ),
            ),
          ),
          body: ListView.builder(
            itemCount: filteredServices.length,
            itemBuilder: (context, index) {
              final service = filteredServices[index];
              return EmergencyTile(
                icon: Icon(service.icon, color: Colors.white, size: 30),
                name: service.name,
                number: service.number,
              );
            },
          ),
        ),
      ),
    );
  }
}

class EmergencyService {
  final String name;
  final String number;
  final IconData icon;

  EmergencyService(this.name, this.number, this.icon);
}
