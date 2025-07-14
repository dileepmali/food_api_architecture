import 'dart:ui';

class ErrorStateManager {
  String message = '';
  VoidCallback? retryCallback;

  void set(String msg, VoidCallback retry) {
    message = msg;
    retryCallback = retry;
  }

  void clear() {
    message = '';
    retryCallback = null;
  }

  bool get hasError => message.isNotEmpty;
}
