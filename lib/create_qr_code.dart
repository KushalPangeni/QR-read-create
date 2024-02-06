import 'package:flutter/material.dart';
import 'package:qr_code/create%20qr/contact.dart';
import 'package:qr_code/create%20qr/create_qr.dart';
import 'package:qr_code/create%20qr/qr_phone_number.dart';
import 'package:qr_code/create%20qr/qr_sms.dart';

import 'create qr/qr_mail.dart';

class CreateQR extends StatelessWidget {
  const CreateQR({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              elevation: 5,
              child: ListTile(
                title: const Text("Generate Text QR Code"),
                leading: const Icon(Icons.text_format),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GenerateQRCode()));
                },
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: const Icon(Icons.phone),
                title: const Text(
                  "Generate Phone number QR Code",
                  maxLines: 2,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GenerateQRCodePhone()));
                },
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: const Icon(Icons.mail),
                title: const Text("Generate Mail QR Code"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GenerateQRCodeMail()));
                },
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: const Icon(Icons.sms),
                title: const Text("Generate SMS QR Code"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GenerateQRCodeSMS()));
                },
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: const Icon(Icons.contact_page),
                title: const Text("Generate Contact QR Code"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GenerateQRCodeContact()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
