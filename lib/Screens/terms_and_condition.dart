import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms and Conditions'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Terms & Conditions',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
              'Praesent in velit nec odio imperdiet mollis eu sit amet nulla. '
              'Proin interdum accumsan ex, in tincidunt metus feugiat in. '
              'Integer vel ligula vel arcu consequat pellentesque ut ut tellus. '
              'Sed ullamcorper bibendum turpis, id scelerisque turpis. '
              'Fusce nec justo non turpis aliquam euismod.',
              style: TextStyle(fontSize: 16.0),
            ),
            // Add more paragraphs as needed
          ],
        ),
      ),
    );
  }
}
