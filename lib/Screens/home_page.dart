import 'package:flutter/material.dart';
import 'book_details_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Home Page'),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      BookDetailsPage(bookTitle: 'Sample Book'),
                ),
              );
            },
            child: Text('View Book Details'),
          ),
        ],
      ),
    );
  }
}
