import 'package:intl/intl.dart';

class MyFormatter {
  static String formatDate(DateTime? dateTime) {
    dateTime ??= DateTime.now();
    return DateFormat('dd-MM-yyyy').format(dateTime);
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'id', symbol: 'Rp').format(amount);
  }

  static String formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.length == 13) {
      return "${phoneNumber.substring(0, 4)} ${phoneNumber.substring(4, 8)} ${phoneNumber.substring(8)}";
    } else if (phoneNumber.length == 12) {
      return "${phoneNumber.substring(0, 4)} ${phoneNumber.substring(4, 8)} ${phoneNumber.substring(8)}";
    } else if (phoneNumber.length == 11) {
      return "${phoneNumber.substring(0, 4)} ${phoneNumber.substring(4, 8)} ${phoneNumber.substring(8)}";
    }

    return phoneNumber;
  }

  // Not fully tested.
  static String internationalFormatPhoneNumber(String phoneNumber) {
    // Remove any non-digit characters from the phone number
    var digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // Extract the country code from the digitsOnly
    String countryCode = '+${digitsOnly.substring(0, 2)}';
    digitsOnly = digitsOnly.substring(2);

    // Add the remaining digits with proper formatting
    final formattedNumber = StringBuffer();
    formattedNumber.write('($countryCode) ');

    int i = 0;
    while (i < digitsOnly.length) {
      int groupLength = 2;
      if (i == 0 && countryCode == '+62') {
        groupLength = 3;
      }

      int end = i + groupLength;
      formattedNumber.write(digitsOnly.substring(i, end));

      if (end < digitsOnly.length) {
        formattedNumber.write(' ');
      }
      i = end;
    }

    return formattedNumber.toString();
  }
}
