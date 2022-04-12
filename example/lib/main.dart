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
        body: FutureBuilder<List<Uint8List>>(
          future: _getImageList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data!;
              return ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  final item = data[index];
                  return _buildItem(item, index);
                },
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Widget _buildItem(Uint8List bytes, int index) {
    return Card(
      child: Column(
        children: [
          Image.memory(bytes),
          Text('Text: $index'),
        ],
      ),
    );
  }

  Future<List<Uint8List>> _getImageList() async {
    // final result = await _imageBase64Resizer.rustGreeting();
    // print(result);

    final Uint8List bytes1 =
        await _imageBase64Resizer.resizeWithPercent(ImageData.base64, 50);
    print('bytes: $bytes1');

    return [
      bytes1,
    ];
  }
}
