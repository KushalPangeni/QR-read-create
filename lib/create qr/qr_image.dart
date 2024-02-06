import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRImage extends StatelessWidget {
  final TextEditingController controller;

  const QRImage(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter + QR code'),
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          QrImageView(
            data: controller.value.text,
            size: 200,
            embeddedImage: const AssetImage('assets/Lord.jpg'),
          ),
        ],
      ),
    );
  }
}
