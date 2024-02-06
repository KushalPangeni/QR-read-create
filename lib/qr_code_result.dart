// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:transparent_image/transparent_image.dart';

// class QRResult extends StatelessWidget {
//   final File filePath;
//   final String mlResult;

//   const QRResult({super.key, required this.filePath, required this.mlResult});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(children: [
//         FadeInImage(
//           placeholder: MemoryImage(kTransparentImage),
//           image: FileImage(filePath),
//         ),
//         SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Text(mlResult,
//               style: const TextStyle(fontSize: 14, color: Colors.white)
//               // GoogleFonts.notoSansMono(),
//               ),
//         ),
        
//       ]),
//     );
//   }
// }
