import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code/qr_result.dart';
import 'package:rive/rive.dart';

class QRScanPage extends StatefulWidget {
  const QRScanPage({super.key});

  @override
  State<QRScanPage> createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  int screenNo = 0;
  final _picker = ImagePicker();
  String? url;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const RiveAnimation.asset(
        'assets/toggle.riv',
        fit: BoxFit.cover,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 120,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.camera),
                  label: const SizedBox(
                    height: 50,
                    child: Center(child: Text("Open Camera")),
                  ),
                  onPressed: () async {
                    final XFile? pickedFile =
                        await _picker.pickImage(source: ImageSource.camera);
                    if (mounted && pickedFile != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QRresult(
                            imageFile: File(pickedFile.path),
                          ),
                        ),
                      );
                    }
                  },
                ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.photo_album_rounded),
                  label: const SizedBox(
                    height: 50,
                    child: Center(child: Text("Open Gallery")),
                  ),
                  style: const ButtonStyle(
                      elevation: MaterialStatePropertyAll(20)),
                  onPressed: () async {
                    try {
                      final XFile? pickedFile =
                          await _picker.pickImage(source: ImageSource.gallery);
                      if (mounted && pickedFile != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QRresult(
                              imageFile: File(pickedFile.path),
                            ),
                          ),
                        );
                      }
                    } catch (e) {
                      Navigator.pop(context, null);
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    ]);
  }

  @override
  void initState() {
    _barcodeScan;
    super.initState();
  }

  Future<void> _barcodeScan() async {
    if (await _pickImage() == false) {
      return;
    }
  }

  Future<bool> _pickImage() async {
    // setState(() => this.imageFile = null);
    final File? imageFile = await showDialog<File>(
      context: context,
      builder: (ctx) => SimpleDialog(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Take picture'),
            onTap: () async {
              final XFile? pickedFile =
                  await _picker.pickImage(source: ImageSource.camera);
              if (mounted && pickedFile != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QRresult(
                      imageFile: File(pickedFile.path),
                    ),
                  ),
                );
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.image),
            title: const Text('Pick from gallery'),
            onTap: () async {
              try {
                final XFile? pickedFile =
                    await _picker.pickImage(source: ImageSource.gallery);
                if (mounted && pickedFile != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QRresult(
                        imageFile: File(pickedFile.path),
                      ),
                    ),
                  );
                }
              } catch (e) {
                Navigator.pop(ctx, null);
              }
            },
          ),
        ],
      ),
    );
    if (mounted && imageFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please pick one image first.')),
      );
      return false;
    }
    return true;
  }
}
