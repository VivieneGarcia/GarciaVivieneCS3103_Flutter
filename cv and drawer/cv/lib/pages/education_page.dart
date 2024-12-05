import 'dart:typed_data';
import 'package:flutter/material.dart';

class EducationPage extends StatelessWidget {
  final String name;
  final Uint8List? imageBytes;

  const EducationPage({
    super.key,
    required this.name,
    required this.imageBytes,
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
              "${name}'s Education",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
