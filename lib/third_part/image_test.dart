///  https://pub.flutter-io.cn/packages/image

import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;

class ImageTest extends StatefulWidget {
  const ImageTest({Key? key}) : super(key: key);

  @override
  _ImageTestState createState() => _ImageTestState();
}

class _ImageTestState extends State<ImageTest> {
  img.Image? image;

  @override
  void initState() {
    super.initState();
    loadImageFromAssets('assets/image/avatar.jpeg').then((value) {
      setState(() {
        image = value;
      });
    });
  }

  //读取 assets 中的图片
  Future<img.Image?> loadImageFromAssets(String path) async {
    ByteData data = await rootBundle.load(path);
    // List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    Uint8List bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    return img.decodeImage(bytes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image"),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (image != null) {
      return NXMLayout(
        n: image!.width,
        m: image!.height,
        image: image!,
      );
    }
    return const SizedBox.shrink();
  }
}

class NXMLayout extends StatelessWidget {
  img.Image image;

  // 行数
  final int n;

  // 列数
  final int m;

  NXMLayout({Key? key, this.n = 3, this.m = 3, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    for (int i = 0; i < n; i++) {
      List<Widget> columnChildren = [];
      for (int j = 0; j < m; j++) {
        columnChildren.add(
          Expanded(
            child: buildZone(j, i),
          ),
        );
      }
      children.add(Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: columnChildren,
      )));
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children,
    );
  }

  Widget buildZone(int x, int y) {
    final img.Pixel pixel = image.getPixel(x, y);
    // Color color = Color(image.getPixel(y, x));
    Color color = Color.fromARGB(
      pixel.a as int,
      pixel.b as int,
      pixel.g as int,
      pixel.r as int,
    );
    if (x * y % 2 == 0) {
      return ColoredBox(color: color);
    } else {
      return ColoredBox(color: Colors.transparent);
    }
  }
}
