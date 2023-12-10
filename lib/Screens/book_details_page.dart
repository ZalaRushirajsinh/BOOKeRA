import 'package:flutter/material.dart';

class BookDetailsPage extends StatelessWidget {
  final String bookTitle;

  BookDetailsPage({required this.bookTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Details for: $bookTitle',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Image.asset(
              'assets/book1.jpg', // Assuming you have images named after book titles in the assets folder
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              'Author: John Doe', // Replace with actual author information
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Genre: Fiction', // Replace with actual genre information
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Length: 540 pages', // Replace with actual genre information
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Language: English', // Replace with actual genre information
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Description:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
              'Pellentesque euismod tortor ac quam interdum, vitae laoreet neque lacinia.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Implement "Read it" action
                    // You can navigate to a reading page or perform any other action
                  },
                  child: Text('Read it'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Implement "Download it" action
                    // You can trigger a download or perform any other action
                  },
                  child: Text('Download it'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
