import 'package:flutter/material.dart';
import 'dart:typed_data';

class ProjectsPage extends StatelessWidget {
  final String name;
  final Uint8List? imageBytes;
  final List<String> projects;

  const ProjectsPage({
    super.key,
    required this.name,
    required this.imageBytes,
    required this.projects,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 65,
              backgroundColor: const Color.fromARGB(255, 180, 180, 180),
              backgroundImage:
                  imageBytes != null ? MemoryImage(imageBytes!) : null,
              child: imageBytes == null
                  ? Text(
                      name[0].toUpperCase(),
                      style: const TextStyle(fontSize: 50),
                    )
                  : null,
            ),
            const SizedBox(height: 20),
            Text(
              "$name's Projects",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.folder, color: Colors.blue),
                    title: Text(
                      projects[index],
                      style: const TextStyle(fontSize: 18),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExperiencePage extends StatelessWidget {
  final String name;
  final Uint8List? imageBytes;
  final List<String> experience;

  const ExperiencePage({
    super.key,
    required this.name,
    required this.imageBytes,
    required this.experience,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 65,
              backgroundColor: const Color.fromARGB(255, 180, 180, 180),
              backgroundImage:
                  imageBytes != null ? MemoryImage(imageBytes!) : null,
              child: imageBytes == null
                  ? Text(
                      name[0].toUpperCase(),
                      style: const TextStyle(fontSize: 50),
                    )
                  : null,
            ),
            const SizedBox(height: 20),
            Text(
              "$name's Experience",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: experience.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.work, color: Colors.orange),
                    title: Text(
                      experience[index],
                      style: const TextStyle(fontSize: 18),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SkillsPage extends StatelessWidget {
  final String name;
  final Uint8List? imageBytes;
  final List<String> skills;

  const SkillsPage({
    super.key,
    required this.name,
    required this.imageBytes,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 65,
              backgroundColor: const Color.fromARGB(255, 180, 180, 180),
              backgroundImage:
                  imageBytes != null ? MemoryImage(imageBytes!) : null,
              child: imageBytes == null
                  ? Text(
                      name[0].toUpperCase(),
                      style: const TextStyle(fontSize: 50),
                    )
                  : null,
            ),
            const SizedBox(height: 20),
            Text(
              "$name's Skills",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: skills.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading:
                        const Icon(Icons.check_circle, color: Colors.green),
                    title: Text(
                      skills[index],
                      style: const TextStyle(fontSize: 18),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EducationPage extends StatelessWidget {
  final String name;
  final Uint8List? imageBytes;
  final Map<String, String> education;

  const EducationPage({
    super.key,
    required this.name,
    required this.imageBytes,
    required this.education,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 65,
              backgroundColor: Colors.grey,
              backgroundImage:
                  imageBytes != null ? MemoryImage(imageBytes!) : null,
              child: imageBytes == null
                  ? Text(
                      name[0].toUpperCase(),
                      style: const TextStyle(
                        fontSize: 50,
                        color: Color.fromARGB(255, 65, 65, 65),
                      ),
                    )
                  : null,
            ),
            const SizedBox(height: 20),
            Text(
              "$name's Education",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.school, color: Colors.blue),
                    title: Text(
                      "Elementary: ${education['elementary']}",
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.school, color: Colors.green),
                    title: Text(
                      "High School: ${education['highschool']}",
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.school, color: Colors.orange),
                    title: Text(
                      "Senior High: ${education['seniorHigh']}",
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.school, color: Colors.purple),
                    title: Text(
                      "College: ${education['college']}",
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  const Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
