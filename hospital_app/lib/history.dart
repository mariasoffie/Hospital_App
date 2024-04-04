import 'package:flutter/material.dart';

void main() {
  runApp(HospitalApp());
}

class HospitalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hospital App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HistoryPage(),
    );
  }
}

class HistoryPage extends StatelessWidget {
  final List<Map<String, String>> consultations = [
    {
      'type': 'Offline',
      'doctor': 'Dr. Smith',
      'specialist': 'Cardiologist',
      'date': '2023-04-01',
    },
    {
      'type': 'Online',
      'doctor': 'Dr. Johnson',
      'specialist': 'Neurologist',
      'date': '2023-04-03',
    },
    {
      'type': 'Offline',
      'doctor': 'Dr. Williams',
      'specialist': 'Dermatologist',
      'date': '2023-04-05',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consultation History'),
      ),
      body: ListView.builder(
        itemCount: consultations.length,
        itemBuilder: (context, index) {
          final consultation = consultations[index];
          return ListTile(
            leading: Text(consultation['type']!),
            title: Text('Doctor: ${consultation['doctor']}'),
            subtitle: Text('Specialist: ${consultation['specialist']}'),
            trailing: Text('Date: ${consultation['date']}'),
          );
        },
      ),
    );
  }
}
