import 'package:flutter/material.dart';
import 'package:internshala/filter_screen.dart';
import 'package:internshala/internship_provider.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Internship Search'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FilterScreen()),
              );
            },
          ),
        ],
      ),
      body: Consumer<InternshipProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: provider.internships.length,
            itemBuilder: (context, index) {
              var internship = provider.internships[index];
              return Card(
                child: ListTile(
                  title: Text(internship['profile']),
                  subtitle: Text('${internship['city']} - ${internship['duration']}'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
