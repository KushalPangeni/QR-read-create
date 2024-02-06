import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher.dart';

class QRresult extends StatefulWidget {
  final File? imageFile;
  const QRresult({super.key, required this.imageFile});

  @override
  State<QRresult> createState() => _QRresultState();
}

class _QRresultState extends State<QRresult> {
  String mlResult = "Can't Detect anything";
  String rawUrl = 'www.google.com';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Scan")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            if (widget.imageFile == null)
              Placeholder(
                color: Colors.teal.shade100,
                fallbackHeight: 200.0,
              )
            else
              FadeInImage(
                height: 350,
                placeholder: MemoryImage(kTransparentImage),
                image: FileImage(widget.imageFile!),
              ),
            SelectableText("$mlResult "),
            ElevatedButton(
              child: const Text("Open"),
              onPressed: () async {
                final Uri uri = Uri.parse(rawUrl);
                log(rawUrl);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(
                    uri,
                  );
                } else {
                  throw {
                    showSnackBar()
                    // log('cannot launch')
                  };
                }
              },
            ),
            ElevatedButton(
                child: const Text("Copy"),
                onPressed: () {
                  checkQR();
                })
          ],
        ),
      ),
    );
  }

  void checkQR() {
    Clipboard.setData(ClipboardData(text: rawUrl));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("$rawUrl copied"),
      duration: const Duration(milliseconds: 700),
    ));
  }

  String extractPasswordFromQRCode(String qrCodeString) {
    final regex = RegExp(r'P:([^;]+)');
    final match = regex.firstMatch(qrCodeString);

    if (match != null && match.groupCount >= 1) {
      return match.group(1)!;
    }
    return '';
  }

  @override
  void initState() {
    super.initState();
    solveQR();
  }

  void showSnackBar() {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("This cannot be launch")));
  }

  void solveQR() async {
    String result = '';
    String rawUrl2 = '';
    final InputImage inputImage = InputImage.fromFile(widget.imageFile!);
    final BarcodeScanner barcodeScanner = GoogleMlKit.vision.barcodeScanner();
    final List<Barcode> barcodes =
        await barcodeScanner.processImage(inputImage);
    // result += 'Detected ${barcodes.length} barcodes.\n';ooo
    for (final Barcode barcode in barcodes) {
      // final Rect boundingBox = barcode.boundingBox!;
      final String rawValue = barcode.rawValue!;
      final valueType = barcode.type;
      // log(barcode.rawValue.toString());
      log(rawValue.characters.toString());
      if (valueType == BarcodeType.product) {
        setState(() {
          rawUrl2 = "https://barcodelive.org/barcode/$rawValue";
        });
      } else if (valueType == BarcodeType.wifi) {
        var password = extractPasswordFromQRCode(rawValue);
        log(password);
        setState(() {
          rawUrl2 = password;
        });
      } else {
        rawUrl2 = rawValue;
      }

      result += '\n Barcode:\n\n '
          '$rawValue\n\n'
          'type: $valueType';
    }
    // log(raw);
    if (result.isNotEmpty) {
      setState(() {
        mlResult = result;
        rawUrl = rawUrl2;
      });
    }
  }
}
