import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:io';

class ErrorHandler {
  /// Show an error snackbar with user-friendly message
  static void showError(String message) {
    final userMessage = _getFriendlyMessage(message);

    Get.snackbar(
      "Error",
      userMessage,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.redAccent,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
    );
  }

  /// Show a warning/info snackbar
  static void showWarning(String message) {
    Get.snackbar(
      "Warning",
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.orangeAccent,
      colorText: Colors.black,
      duration: const Duration(seconds: 3),
    );
  }

  /// Show a success snackbar
  static void showSuccess(String message) {
    Get.snackbar(
      "Success",
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
    );
  }

  /// Check for internet connectivity.
  /// Shows an error if the device is offline.
  static Future<bool> checkInternet() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      showError("No internet connection. Please check your network settings.");
      return false;
    }
    return true;
  }

  /// Optional: catch all Flutter errors and show a snackbar
  /// Call this in main.dart inside main() before runApp()
  static void initGlobalErrorHandler() {
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      showError("An unexpected error occurred: ${details.exceptionAsString()}");
    };
  }

  static String _getFriendlyMessage(String message) {
    if (message.contains('SocketException')) {
      return "Network error: Please check your internet connection.";
    } else if (message.contains('TimeoutException')) {
      return "Request timed out. Please try again.";
    } else if (message.contains('Failed host lookup')) {
      return "Server not reachable. Please check your internet or try again later.";
    }
    return message; // fallback to original message
  }
}
