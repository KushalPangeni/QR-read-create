import 'package:flutter/material.dart';
import 'package:qr_code/create%20qr/qr_phone2.dart';

class GenerateQRCodePhone extends StatefulWidget {
  const GenerateQRCodePhone({super.key});

  @override
  GenerateQRCodePhoneState createState() => GenerateQRCodePhoneState();
}

class GenerateQRCodePhoneState extends State<GenerateQRCodePhone> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone number'),
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
                  border: OutlineInputBorder(),
                  labelText: 'Enter your phone number'),
              keyboardType: TextInputType.number,
            ),
          ),
          //This button when pressed navigates to QR code generation
          ElevatedButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) {
                      return QRPhone(controller);
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
