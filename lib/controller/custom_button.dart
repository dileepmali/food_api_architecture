import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isFilled;  // true = filled button, false = outlined
  final IconData? icon;
  final double? width; // nullable double for width

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isFilled = true,
    this.icon,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final Color orange = Colors.orange;

    final buttonChild = icon != null
        ? Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 20, color: isFilled ? Colors.white : orange),
        const SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(
            color: isFilled ? Colors.white : orange,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    )
        : Text(
      label,
      style: TextStyle(
        color: isFilled ? Colors.white : orange,
        fontWeight: FontWeight.w600,
      ),
    );

    Widget button = isFilled
        ? ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: orange,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: buttonChild,
    )
        : OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: orange),
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: buttonChild,
    );

    // Wrap with SizedBox if width is given
    if (width != null) {
      return SizedBox(width: width, child: button);
    }

    return button;
  }
}
