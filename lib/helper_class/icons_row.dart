import 'package:flutter/material.dart';

class IconRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const IconRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey[600]),
          const SizedBox(width: 8),
          Expanded(flex: 2,
              child: Text("$label:", style: const TextStyle(fontWeight: FontWeight.w600))),
          Expanded(flex: 3,
              child: Text(value)),
        ],
      ),
    );
  }
}
