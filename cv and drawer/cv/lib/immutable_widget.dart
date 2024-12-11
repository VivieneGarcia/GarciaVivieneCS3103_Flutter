import 'dart:typed_data';
import 'package:flutter/material.dart';

import 'image_picker_stub.dart'
    if (dart.library.html) 'image_picker_web.dart'
    if (dart.library.io) 'image_picker_mobile.dart';

class ImmutableWidget extends StatelessWidget {
  final String name;
  final String email;
  final String number;
  final String motto;
  final Uint8List? imageBytes;
  final Function(Uint8List?) onImageUpdate;

  const ImmutableWidget({
    super.key,
    required this.name,
    required this.email,
    required this.number,
    required this.motto,
    required this.imageBytes,
    required this.onImageUpdate,
  });

  Future<void> _pickImage(BuildContext context) async {
    try {
      final Uint8List? pickedImage = await pickImage();
      if (pickedImage != null) {
        onImageUpdate(pickedImage);
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 30, 0, 20),
                height: 130,
                width: 130,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color.fromARGB(255, 180, 180, 180),
                  border: Border.all(
                    color: const Color.fromARGB(147, 44, 44, 44),
                    width: 4,
                  ),
                ),
                child: imageBytes == null
                    ? Center(
                        child: Text(
                          name.isNotEmpty ? name[0].toUpperCase() : '',
                          style: const TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 65, 65, 65),
                          ),
                        ),
                      )
                    : ClipOval(
                        child: Image.memory(
                          imageBytes!,
                          fit: BoxFit.cover,
                          width: 130,
                          height: 130,
                        ),
                      ),
              ),
              Positioned(
                right: 2,
                top: 30,
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 71, 71, 71),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () => _pickImage(context),
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    iconSize: 25,
                    padding: const EdgeInsets.all(2),
                  ),
                ),
              ),
            ],
          ),
          Text(
            name,
            style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
          ),
          Text(number, style: const TextStyle(fontSize: 16)),
          Text(email, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 10),
          Container(
              width: 350,
              height: 200,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 239, 239, 239),
                border: Border.all(
                  color: const Color.fromARGB(255, 143, 143, 143),
                  width: 2,
                ),
              ),
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text(motto,
                    style: TextStyle(
                      fontSize: 15,
                    )),
              ))
        ],
      ),
    );
  }
}
