// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';

class QRCode extends StatefulWidget {
  const QRCode({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  ScreenshotController screenshotController = ScreenshotController();

  final double? width;
  final double? height;

  @override
  _QRCodeState createState() => _QRCodeState();

  SaveTOGallery() {}
}

class _QRCodeState extends State<QRCode> {
  @override
  Widget build(BuildContext context) {
    return Screenshot(
        controller: screenshotController,
        child: QrImageView(
            data: '1234567890', version: QrVersions.auto, size: 200.0));
  }
}
