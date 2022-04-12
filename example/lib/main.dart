import 'dart:typed_data';

import 'package:base64_resizer/base64_resizer.dart';
import 'package:base64_resizer_example/image_data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _imageBase64Resizer = ImageBase64Resizer();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Image Base64 Rsizeer'),
        ),
        body: Row(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) => _buildItem(index),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(int index) {
    final result = _imageBase64Resizer.rustGreeting();
    print('result: $result');
    final Uint8List bytes =
        _imageBase64Resizer.resizeWithPercent(ImageData.base64, 50);
    print('bytes: $bytes');
    return Column(
      children: [
        Image.memory(bytes),
        Text('Text: $index'),
      ],
    );
  }
}
