import 'package:intl/intl.dart';

class DateTimeFormat {
  static String getFormattedDate(DateTime dateTime) {
    return DateFormat('EEE | d MMMM', 'en_US').format(dateTime);
  }
// static String getFormattedDate(DateTime dateTime) {
//   return new DateFormat('EEE, MMM d, y,', 'en_US').add_jm().format(dateTime);
// }
}

