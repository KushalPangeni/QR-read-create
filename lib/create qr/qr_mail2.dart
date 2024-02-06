import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRMail extends StatelessWidget {
  final TextEditingController controller;
  final TextEditingController subject;
  final TextEditingController body;

  const QRMail(this.controller, this.subject, this.body, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mail'),
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          QrImageView(
            data:
                'mailto:${controller.value.text}?subject=${subject.text}&body=${body.text}',
            size: 200,
          ),
        ],
      ),
    );
  }
}
