import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRPhone extends StatelessWidget {
  final TextEditingController controller;

  const QRPhone(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone'),
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          QrImageView(
            data: 'tel:${controller.value.text}',
            size: 200,
          ),
        ],
      ),
    );
  }
}
