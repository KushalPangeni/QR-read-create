import 'package:flutter/material.dart';
import 'package:qr_code/create%20qr/qr_mail2.dart';

class GenerateQRCodeMail extends StatefulWidget {
  const GenerateQRCodeMail({super.key});

  @override
  GenerateQRCodeMailState createState() => GenerateQRCodeMailState();
}

class GenerateQRCodeMailState extends State<GenerateQRCodeMail> {
  TextEditingController controller = TextEditingController();
  TextEditingController subject = TextEditingController();
  TextEditingController body = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mail'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Mail address'),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: TextField(
              controller: subject,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Subject'),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: TextField(
              controller: body,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Body'),
            ),
          ),
          //This button when pressed navigates to QR code generation
          ElevatedButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) {
                      return QRMail(controller, subject, body);
                    }),
                  ),
                );
              },
              child: const Text('GENERATE QR CODE')),
        ],
      ),
    );
  }
}
