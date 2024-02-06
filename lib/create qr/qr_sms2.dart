import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRSMS extends StatelessWidget {
  final TextEditingController controller;
  final TextEditingController body;

  const QRSMS(this.controller, this.body, {super.key});

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
            data: 'sms:${controller.value.text}?body=${body.text} ',
            size: 200,
          ),
        ],
      ),
    );
  }
}
