import 'package:flutter/material.dart';
import 'dart:typed_data';

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
