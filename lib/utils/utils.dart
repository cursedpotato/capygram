import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();

  XFile? _file = await _imagePicker.pickImage(source: source);

  if (_file != null) {
    return await _file.readAsBytes();
  }
  debugPrint("No image selected ");
}

showSnackbar(BuildContext context) {
  const snackBar = SnackBar(
    content: Text('Yay! A SnackBar!'),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
