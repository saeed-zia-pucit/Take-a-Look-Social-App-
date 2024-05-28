
import 'package:intl/intl.dart';

extension StringExtension on String {
  String get getDateTimeFormatted {
    DateTime parsedDateTime = DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').parse(this);
    String day = DateFormat('d').format(parsedDateTime);
    String month = DateFormat('MMMM').format(parsedDateTime);
    String time = DateFormat('h:mm a').format(parsedDateTime);
    return '$day $month | $time';
  }
}