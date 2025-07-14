import 'package:intl/intl.dart';

class DateFormatter {
  static String formatDate(DateTime date) {
    return DateFormat('dd MMM yyyy • hh:mm a').format(date.toLocal());
  }

  static String shortDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date.toLocal());
  }

  static String onlyTime(DateTime date) {
    return DateFormat('hh:mm a').format(date.toLocal());
  }
}
