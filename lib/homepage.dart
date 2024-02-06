import 'package:flutter/material.dart';
import 'package:qr_code/screens.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int screenNo = 0;
  // final _picker = ImagePicker();
  // String? url;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          elevation: 0,
          title: const Text(
            "Fast QR",
            style: TextStyle(color: Colors.white),
          ),
        ),
        // backgroundColor: Colors.black,
        body: screens[screenNo],
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.amber,
            onTap: (value) {
              setState(() {
                screenNo = value;
              });
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.barcode_reader), label: "Qr Scan"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.barcode_reader), label: "Qr Create")
            ]),
      ),
    );
  }
}
