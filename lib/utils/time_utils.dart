import 'package:intl/intl.dart';

class TimeUtils {
  static String formatToMyTime(DateTime dateTime) {
    final format = DateFormat.Hms().format(dateTime).toString();
    return format;
  }
}