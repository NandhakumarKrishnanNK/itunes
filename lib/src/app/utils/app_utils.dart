import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:itunes/src/app/utils/color_resources.dart';

class AppUtils {
  static showSuccessToast({required String message}) {
    return Fluttertoast.showToast(
      msg: message,
      backgroundColor: ColorResource.colorSuccess,
    );
  }

  static showErrorToast({required String message}) {
    return Fluttertoast.showToast(
      msg: message,
      backgroundColor: ColorResource.colorError,
    );
  }

  static String capitalizeFirstWord(String text) {
    if (text.isEmpty) {
      return text;
    }

    List<String> words = text.split(' ');
    if (words.isNotEmpty) {
      words[0] = words[0][0].toUpperCase() + words[0].substring(1);
    }
    return words.join(' ');
  }

  static String formatUtcDate(String? utcDate) {
    if (utcDate != null && utcDate.isNotEmpty) {
      try {
        final DateTime parsedDate = DateTime.parse(utcDate).toLocal();
        final DateFormat formatter = DateFormat('yMMMMd');
        return formatter.format(parsedDate);
      } catch (e) {
        // print('Error formatting date: $e');
      }
    }
    return '';
  }
}
