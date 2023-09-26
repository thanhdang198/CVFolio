import 'package:intl/intl.dart';

extension NumberExtension on int? {
  convertToCurrency() {
    final currency =
        NumberFormat.currency(locale: "en_US", symbol: "", decimalDigits: 0);
    return currency.format(this);
  }
}
