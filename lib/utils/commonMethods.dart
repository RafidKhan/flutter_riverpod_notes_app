import 'package:intl/intl.dart';

String getDateTimeFormattedValue({DateTime? dateTime}) {
  String result = "";
  try {
    if (dateTime != null) {
      result = DateFormat('dd/MM/yyyy, kk:mm a').format(dateTime);
    } else {
      result = "";
    }
  } catch (e) {}
  return result;
}
