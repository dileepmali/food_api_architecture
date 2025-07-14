import 'package:flutter/material.dart';

class DetailRow extends StatelessWidget {
  final String title;
  final String value;

  const DetailRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 2,
              child: Text("$title:", style: const TextStyle(fontWeight: FontWeight.w600))),
          Expanded(flex: 3,
              child: Text(value)),
        ],
      ),
    );
  }
}
