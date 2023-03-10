import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vs_app_test_v1/homeScreen.dart';

void main() {
  runApp(new MyApp());
}

// This test is about the use of image picker

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: ImagePickerTest(),
    );
  }
}

class ImagePickerTest extends StatefulWidget {
  const ImagePickerTest({super.key});

  @override
  State<ImagePickerTest> createState() => _ImagePickerTestState();
}

class _ImagePickerTestState extends State<ImagePickerTest> {
  final ImagePicker _picker = ImagePicker();
  File? image;
  Future<void> pickImage(ImageSource source) async {
    try {
      final image = await _picker.pickImage(source: source);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState((() => this.image = imageTemp));
    } on PlatformException catch (e) {
      // TODO
      print("Failed to pick an image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jesus is great"),
      ),
      body: Column(
        children: [
          OutlinedButton.icon(
              onPressed: (() => pickImage(ImageSource.gallery)),
              icon: Icon(
                Icons.browse_gallery,
              ),
              label: Text("Pick an image from the gallery")),
          TextButton(
            onPressed: (() => pickImage(ImageSource.camera)),
            child: Text(
              "Take a picture using camera",
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Flexible(
              child: image != null
                  ? Image.file(image!)
                  : Text('No image to load !'))
        ],
      ),
    );
  }
}
