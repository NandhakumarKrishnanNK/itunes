import 'package:fluttertoast/fluttertoast.dart';
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
}
