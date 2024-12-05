import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'login_page.dart';
import 'immutable_widget.dart';
import 'pages/education_page.dart';

class BasicScreen extends StatefulWidget {
  final String name;
  final String email;
  final String number;

  const BasicScreen({
    super.key,
    required this.name,
    required this.email,
    required this.number,
  });

  @override
  _BasicScreenState createState() => _BasicScreenState();
}

class _BasicScreenState extends State<BasicScreen> {
  late String name;
  late String email;
  late String number;
  Uint8List? imageBytes; // Profile picture state
  String currentPage = 'Profile'; // Track the current page

  @override
  void initState() {
    super.initState();
    name = widget.name;
    email = widget.email;
    number = widget.number;
  }

  // Callback to update the profile picture
  void updateProfileImage(Uint8List? newImage) {
    setState(() {
      imageBytes = newImage;
    });
  }

  Widget _buildBody() {
    // Dynamically return the body based on the selected page
    switch (currentPage) {
      case 'Education':
        return EducationPage(
          name: name,
          imageBytes: imageBytes,
        );
      case 'Profile':
      default:
        return ImmutableWidget(
          name: name,
          email: email,
          number: number,
          imageBytes: imageBytes,
          onImageUpdate: updateProfileImage,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: const Text("My CV",
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              // Navigate back to LoginPage
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
      body: _buildBody(), // Call the function to get the current page's body
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Container(
          color: const Color.fromARGB(255, 249, 249, 249),
          child: ListView(
            children: [
              const DrawerHeader(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'CV Sections',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Profile", style: TextStyle(fontSize: 20)),
                onTap: () {
                  setState(() {
                    currentPage = 'Profile'; // Update the current page
                  });
                  Navigator.of(context).pop(); // Close the drawer
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.grade),
                title: const Text(
                  "Education",
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  setState(() {
                    currentPage = 'Education'; // Update the current page
                  });
                  Navigator.of(context).pop(); // Close the drawer
                },
              ),
              const Divider(),
              const ListTile(
                leading: Icon(Icons.ads_click_sharp),
                title: Text("Skills", style: TextStyle(fontSize: 20)),
              ),
              const Divider(),
              const ListTile(
                leading: Icon(Icons.brush),
                title: Text("Projects", style: TextStyle(fontSize: 20)),
              ),
              const Divider(),
              const ListTile(
                leading: Icon(Icons.accessibility_rounded),
                title: Text("Experience", style: TextStyle(fontSize: 20)),
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
