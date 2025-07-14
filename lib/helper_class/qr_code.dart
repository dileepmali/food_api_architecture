import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class PrettyQRCodeBox extends StatelessWidget {
  final String data;
  final double size;

  const PrettyQRCodeBox({super.key, required this.data, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PrettyQr(
        data: data.isNotEmpty ? data : "No Data",
        roundEdges: true,
        elementColor: Colors.black,
        size: size,
        errorCorrectLevel: QrErrorCorrectLevel.Q,
        typeNumber: null,
      ),
    );
  }
}
