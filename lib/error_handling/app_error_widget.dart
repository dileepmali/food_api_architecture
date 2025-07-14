import 'package:flutter/material.dart';

class AppErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const AppErrorWidget({required this.message, required this.onRetry, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.wifi_off, size: 60, color: Colors.redAccent),
            const SizedBox(height: 10),
            Text(message, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 15),
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text("Retry"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange),
            ),
          ],
        ),
      ),
    );
  }
}
