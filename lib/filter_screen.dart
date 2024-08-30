import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String selectedProfile = '';
  String selectedCity = '';
  String selectedDuration = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField(
              decoration: InputDecoration(labelText: 'Profile'),
              items: ['Developer', 'Designer', 'Marketing'].map((String category) {
                return DropdownMenuItem(value: category, child: Text(category));
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedProfile = newValue!;
                });
              },
            ),
            DropdownButtonFormField(
              decoration: InputDecoration(labelText: 'City'),
              items: ['Delhi', 'Mumbai', 'Bangalore'].map((String city) {
                return DropdownMenuItem(value: city, child: Text(city));
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedCity = newValue!;
                });
              },
            ),
            DropdownButtonFormField(
              decoration: InputDecoration(labelText: 'Duration'),
              items: ['1 month', '3 months', '6 months'].map((String duration) {
                return DropdownMenuItem(value: duration, child: Text(duration));
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedDuration = newValue!;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Apply Filters
                Navigator.pop(context);
              },
              child: Text('Apply Filters'),
            ),
          ],
        ),
      ),
    );
  }
}
