import 'dart:typed_data';
import 'package:flutter/material.dart';

class EducationPage extends StatelessWidget {
  final String name;
  final Uint8List? imageBytes;
  final Map<String, String> education; // Accept education details

  const EducationPage({
    super.key,
    required this.name,
    required this.imageBytes,
    required this.education,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 65,
              backgroundColor: Colors.grey,
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
              "${name}'s Education",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text("Elementary: ${education['elementary']}",
                style: const TextStyle(fontSize: 18)),
            Text("High School: ${education['highschool']}",
                style: const TextStyle(fontSize: 18)),
            Text("Senior High: ${education['seniorHigh']}",
                style: const TextStyle(fontSize: 18)),
            Text("College: ${education['college']}",
                style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
