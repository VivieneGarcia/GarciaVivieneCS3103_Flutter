import 'dart:typed_data';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:async';

Future<Uint8List?> pickImage() async {
  final html.FileUploadInputElement uploadInput = html.FileUploadInputElement()
    ..accept = 'image/*'
    ..click();

  final completer = Completer<Uint8List?>();

  uploadInput.onChange.listen((event) {
    final files = uploadInput.files;
    if (files!.isNotEmpty) {
      final reader = html.FileReader();
      reader.readAsArrayBuffer(files[0]);
      reader.onLoadEnd.listen((event) {
        completer.complete(reader.result as Uint8List?);
      });
    } else {
      completer.complete(null);
    }
  });

  return completer.future;
}
