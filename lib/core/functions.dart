import 'package:intl/intl.dart';

String convertToDateTime(String dateString) {
  DateTime? date = DateTime.tryParse(dateString);
  if (date != null) {
    String formattedDateTime = DateFormat('HH:mm:ss dd/MM/yyyy').format(date);
    Duration difference = DateTime.now().difference(date);
    int daysAgo = difference.inDays;
    return "$formattedDateTime ($daysAgo ngày trước)";
  } else {
    return "-------";
  }
}

String convertToDate(String dateString) {
  DateTime? date = DateTime.tryParse(dateString);
  if (date != null) {
    String formattedDateTime = DateFormat('dd/MM/yyyy').format(date);
    Duration difference = DateTime.now().difference(date);
    int daysAgo = difference.inDays;
    return "$formattedDateTime ($daysAgo ngày trước)";
  } else {
    return "-------";
  }
}
