import 'package:flutter/material.dart';
import 'package:qr_code/create%20qr/contact2.dart';

class GenerateQRCodeContact extends StatefulWidget {
  const GenerateQRCodeContact({super.key});

  @override
  GenerateQRCodeContactState createState() => GenerateQRCodeContactState();
}

class GenerateQRCodeContactState extends State<GenerateQRCodeContact> {
  TextEditingController fullName = TextEditingController();
  TextEditingController organization = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController notes = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(8),
              child: TextField(
                controller: fullName,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Full Name'),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              child: TextField(
                controller: organization,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Organization'),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              child: TextField(
                controller: address,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Address'),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              child: TextField(
                controller: phone,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Phone'),
                keyboardType: TextInputType.number,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              child: TextField(
                controller: email,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Email'),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              child: TextField(
                controller: notes,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Notes'),
              ),
            ),
            //This button when pressed navigates to QR code generation
            ElevatedButton(
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) {
                        return QRContact(fullName, organization, address, phone,
                            email, notes);
                      }),
                    ),
                  );
                },
                child: const Text('GENERATE QR CODE')),
          ],
        ),
      ),
    );
  }
}
