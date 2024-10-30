import 'package:intl/intl.dart';

class DateConverterHelper {
  static String formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);

    return DateFormat('dd MMM').format(dateTime);
  }
}
