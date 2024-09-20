import 'package:easy_localization/easy_localization.dart';

String formatDate(String dateString) {
  final dateTime = DateTime.parse(dateString);
  final formatter = DateFormat('MMM dd, yyyy - hh:mm a');
  return formatter.format(dateTime);
}