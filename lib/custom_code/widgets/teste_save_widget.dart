// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:path_provider/path_provider.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({Key? key}) : super(key: key);

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  final _screenshotController = ScreenshotController();
  Image? image;
  var doesTheImageExist = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (image == null)
            TextButton(
              child: Text("Save QR Code"),
              onPressed: () async {
                await _captureAndSaveQRCode();

                setState(() {
                  doesTheImageExist = true;
                  image = image;
                });
              },
            )
          else
            image!,
          Row(children: [
            Text('hi'),
            Text("Is the QR Code saved to your device? ${doesTheImageExist}")
          ]),
          if (image == null)
            Screenshot(
                controller: _screenshotController,
                child: _buildQRImage('_authProvider.user!.uid')),
        ],
      ),
    );
  }

  Widget _buildQRImage(String data) {
    return QrImageView(
      data: data,
      size: 250.0,
      gapless: false,
    );
  }

  Future<String> get imagePath async {
    final directory = (await getApplicationDocumentsDirectory()).path;
    return '$directory/qr.png';
  }

  // Future<Image> _loadImage() async {
  //   return imagePath.then((imagePath) => Image.asset(imagePath));
  // }

  Future<void> _captureAndSaveQRCode() async {
    final path = await imagePath;
    await _screenshotController.captureAndSave(path);
    // It always returns false, although I'm saving the file using `captureAndSave` .
    doesTheImageExist = File(path).existsSync();
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
