import 'package:intl/intl.dart';

extension DateExtensions on DateTime {
  String format(String formatStyle) => DateFormat(formatStyle).format(this);
  String commonDateFormat() => DateFormat('yyyy/MM/dd').format(this);
}
