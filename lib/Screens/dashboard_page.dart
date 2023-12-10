import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:figma/book_details_page.dart';

class Book {
  final String title;
  final String imagePath;

  Book({required this.title, required this.imagePath});
}

class DashboardPage extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  final List<Book> _books = [
    Book(title: 'Book 1', imagePath: 'assets/book1.jpg'),
    Book(title: 'Book 2', imagePath: 'assets/book2.jpg'),
    Book(title: 'Book 3', imagePath: 'assets/book3.jpg'),
    Book(title: 'Book 4', imagePath: 'assets/book4.jpg'),
    Book(title: 'Book 5', imagePath: 'assets/book5.jpg'),
    Book(title: 'Book 6', imagePath: 'assets/book6.jpg'),
    Book(title: 'Book 7', imagePath: 'assets/book7.jpg'),
    // Add more books with their respective image paths
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BOOKeRA'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_alt_rounded),
            onPressed: () {
              _showFilterOptions(context);
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 93, 188, 223),
              ),
              child: Text(
                'MENU...',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                Get.toNamed('/profile'); // Use Get.toNamed for named routes
              },
            ),
            ListTile(
              leading: Icon(Icons.my_library_books_rounded),
              title: Text('Library'),
              onTap: () {
                Navigator.pop(context);
                // You can navigate to the library page or perform any other action
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_bag_rounded),
              title: Text('Store'),
              onTap: () {
                Navigator.pop(context);
                // You can navigate to the store page or perform any other action
              },
            ),
            ListTile(
              leading: Icon(Icons.bookmark_add_outlined),
              title: Text('Bookmarks'),
              onTap: () {
                Navigator.pop(context);
                // You can navigate to the bookmarks page or perform any other action
              },
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('Payments'),
              onTap: () {
                Navigator.pop(context);
                // You can navigate to the payments page or perform any other action
              },
            ),
            ListTile(
              leading: Icon(Icons.settings_applications_sharp),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                // You can navigate to the settings page or perform any other action
              },
            ),
            ListTile(
              leading: Icon(Icons.help_sharp),
              title: Text('Contact Us'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.info_outlined),
              title: Text('Terms And Conditions'),
              onTap: () {
                Navigator.pop(context);
                Get.toNamed(
                    '/terms_and_conditions'); // Use Get.toNamed for named routes
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(0.0),
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 93, 188, 223),
              borderRadius: BorderRadius.circular(40.0),
            ),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search Books...',
                prefixIcon: Icon(Icons.menu_book_rounded),
                border: InputBorder.none,
                // suffixIcon: Icon(Icons.filter_alt_rounded),
              ),
            ),
          ),
          Expanded(
            child: _buildGridView(),
          ),
        ],
      ),
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 6.0,
        mainAxisSpacing: 6.0,
      ),
      itemCount: _books.length,
      itemBuilder: (context, index) {
        return _buildBookItem(_books[index]);
      },
    );
  }

  Widget _buildBookItem(Book book) {
    return Card(
      child: InkWell(
        onTap: () {
          // Use Get.to for navigation instead of Navigator.push
          Get.to(() => BookDetailsPage(bookTitle: book.title));
        },
        child: Column(
          children: [
            Image.asset(
              book.imagePath,
              height: 120,
              width: double.infinity,
              // fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(book.title),
            ),
          ],
        ),
      ),
    );
  }

  void _showFilterOptions(BuildContext context) {
    // Simple implementation for demonstration purposes
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Filter Options'),
          content: Text('Implement your filter options here.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
