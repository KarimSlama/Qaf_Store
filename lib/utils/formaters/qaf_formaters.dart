import 'package:intl/intl.dart';

class QafFormaters {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MMM:yyyy').format(date);
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amount);
  }

  static String formatPhoneNumber(String phone) {
    if (phone.length == 10) {
      return '(${phone.substring(0, 3)}) ${phone.substring(3, 6)} ${phone.substring(6)}';
    } else if (phone.length == 11) {
      return '(${phone.substring(0, 4)}) ${phone.substring(4, 7)} ${phone.substring(7)}';
    }
    return phone;
  }
}
