import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

String getDateTimeFormattedValue({DateTime? dateTime}) {
  String result = "";
  try {
    if (dateTime != null) {
      result = DateFormat('dd/MM/yy').format(dateTime);
    } else {
      result = "";
    }
  } catch (e) {}
  return result;
}

var uuid = const Uuid();

String get getUniqueUid => uuid.v4();
