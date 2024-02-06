import 'package:flutter/material.dart';
import 'package:qr_code/create%20qr/qr_sms2.dart';

class GenerateQRCodeSMS extends StatefulWidget {
  const GenerateQRCodeSMS({super.key});

  @override
  GenerateQRCodeSMSState createState() => GenerateQRCodeSMSState();
}

class GenerateQRCodeSMSState extends State<GenerateQRCodeSMS> {
  TextEditingController controller = TextEditingController();
  TextEditingController body = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SMS '),
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
                  border: OutlineInputBorder(), labelText: 'Enter your sms'),
              keyboardType: TextInputType.number,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: TextField(
              controller: body,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your message'),
            ),
          ),
          //This button when pressed navigates to QR code generation
          ElevatedButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) {
                      return QRSMS(controller, body);
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
