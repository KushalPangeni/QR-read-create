import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRContact extends StatelessWidget {
  final TextEditingController fullname;
  final TextEditingController organization;
  final TextEditingController address;
  final TextEditingController phone;
  final TextEditingController email;
  final TextEditingController notes;

  const QRContact(this.fullname, this.organization, this.address, this.phone,
      this.email, this.notes,
      {super.key});

  @override
  Widget build(BuildContext context) {
    final contactContent = 'BEGIN:VCARD\n'
        'VERSION:3.0\n'
        'FN:$fullname\n'
        'ADR:$address\n'
        'ORG:$organization\n'
        'EMAIL:$email\n'
        'NOTE:$notes\n'
        'TEL:$phone\n'
        'END:VCARD';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mail'),
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          QrImageView(
            data: contactContent,
            size: 200,
          ),
        ],
      ),
    );
  }
}
