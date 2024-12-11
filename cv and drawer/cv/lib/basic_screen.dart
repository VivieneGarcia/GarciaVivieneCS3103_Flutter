import 'package:cv/pages/pages.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'login_page.dart';
import 'immutable_widget.dart';

class BasicScreen extends StatefulWidget {
  final String name;
  final String email;
  final String number;
  final String motto;
  final Map<String, String> education;
  final List<String> skills;
  final List<String> projects;
  final List<String> experience;

  const BasicScreen({
    super.key,
    required this.name,
    required this.email,
    required this.number,
    required this.motto,
    required this.education,
    required this.skills,
    required this.projects,
    required this.experience,
  });

  @override
  _BasicScreenState createState() => _BasicScreenState();
}

class _BasicScreenState extends State<BasicScreen> {
  late String name;
  late String email;
  late String number;
  late String motto;
  late Map<String, String> education;
  late List<String> skills;
  late List<String> projects;
  late List<String> experience;
  Uint8List? imageBytes;
  String currentPage = 'Profile';

  @override
  void initState() {
    super.initState();
    name = widget.name;
    email = widget.email;
    number = widget.number;
    motto = widget.motto;
    education = widget.education;
    skills = widget.skills;
    projects = widget.projects;
    experience = widget.experience;
  }

  void updateProfileImage(Uint8List? newImage) {
    setState(() {
      imageBytes = newImage;
    });
  }

  Widget _buildBody() {
    switch (currentPage) {
      case 'Education':
        return EducationPage(
          name: name,
          education: education,
          imageBytes: imageBytes,
        );
      case 'Skills':
        return SkillsPage(
          name: name,
          imageBytes: imageBytes,
          skills: skills,
        );
      case 'Projects':
        return ProjectsPage(
          name: name,
          imageBytes: imageBytes,
          projects: projects,
        );
      case 'Experience':
        return ExperiencePage(
          name: name,
          imageBytes: imageBytes,
          experience: experience,
        );
      case 'Profile':
      default:
        return ImmutableWidget(
          name: name,
          email: email,
          number: number,
          motto: motto,
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
        title: const Text(
          "My CV",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
      body: _buildBody(),
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
                    currentPage = 'Profile';
                  });
                  Navigator.of(context).pop();
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.grade),
                title: const Text("Education", style: TextStyle(fontSize: 20)),
                onTap: () {
                  setState(() {
                    currentPage = 'Education';
                  });
                  Navigator.of(context).pop();
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.ads_click_sharp),
                title: const Text("Skills", style: TextStyle(fontSize: 20)),
                onTap: () {
                  setState(() {
                    currentPage = 'Skills';
                  });
                  Navigator.of(context).pop();
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.brush),
                title: const Text("Projects", style: TextStyle(fontSize: 20)),
                onTap: () {
                  setState(() {
                    currentPage = 'Projects';
                  });
                  Navigator.of(context).pop();
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.accessibility_rounded),
                title: const Text("Experience", style: TextStyle(fontSize: 20)),
                onTap: () {
                  setState(() {
                    currentPage = 'Experience';
                  });
                  Navigator.of(context).pop();
                },
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
