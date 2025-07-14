import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

class BarcodeBox extends StatelessWidget {
  final String data;

  const BarcodeBox({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: data.isNotEmpty
          ? BarcodeWidget(
        data: data,
        barcode: Barcode.code128(),
        width: 200,
        height: 80,
        drawText: true,
      )
          : const Text("No Barcode Data"),
    );
  }
}
