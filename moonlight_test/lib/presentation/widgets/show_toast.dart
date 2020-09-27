import 'package:fluttertoast/fluttertoast.dart';

///toast with custom message
showToast({msg}) {
  Fluttertoast.showToast(
    msg: msg ?? '',
    toastLength: Toast.LENGTH_LONG,
  );
}
