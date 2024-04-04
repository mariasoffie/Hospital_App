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
      home: ConsultationPage(),
    );
  }
}

class ConsultationPage extends StatefulWidget {
  @override
  _ConsultationPageState createState() => _ConsultationPageState();
}

class _ConsultationPageState extends State<ConsultationPage> {
  String selectedDoctor = '';
  DateTime? selectedDate;
  String selectedSpecialist = '';
  String consultationType = '';

  final List<String> doctors = ['Dr. Smith', 'Dr. Johnson', 'Dr. Williams'];
  final List<String> specialists = [
    'Cardiologist',
    'Neurologist',
    'Dermatologist'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consultation'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: 'Select Doctor'),
              value: selectedDoctor,
              onChanged: (newValue) {
                setState(() {
                  selectedDoctor = newValue!;
                });
              },
              items: doctors.map((doctor) {
                return DropdownMenuItem(
                  value: doctor,
                  child: Text(doctor),
                );
              }).toList(),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2101),
                );
                if (picked != null && picked != selectedDate) {
                  setState(() {
                    selectedDate = picked;
                  });
                }
              },
              child: Text(selectedDate == null
                  ? 'Select Consultation Date'
                  : 'Consultation Date: ${selectedDate.toString().split(' ')[0]}'),
            ),
            SizedBox(height: 20.0),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: 'Select Specialist'),
              value: selectedSpecialist,
              onChanged: (newValue) {
                setState(() {
                  selectedSpecialist = newValue!;
                });
              },
              items: specialists.map((specialist) {
                return DropdownMenuItem(
                  value: specialist,
                  child: Text(specialist),
                );
              }).toList(),
            ),
            SizedBox(height: 20.0),
            ListTile(
              title: Text('Consultation Type'),
              subtitle: Row(
                children: [
                  Radio(
                    value: 'Online',
                    groupValue: consultationType,
                    onChanged: (value) {
                      setState(() {
                        consultationType = value.toString();
                      });
                    },
                  ),
                  Text('Online'),
                  SizedBox(width: 20.0),
                  Radio(
                    value: 'Offline',
                    groupValue: consultationType,
                    onChanged: (value) {
                      setState(() {
                        consultationType = value.toString();
                      });
                    },
                  ),
                  Text('Offline'),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Add logic to confirm consultation
              },
              child: Text('Confirm Consultation'),
            ),
          ],
        ),
      ),
    );
  }
}
