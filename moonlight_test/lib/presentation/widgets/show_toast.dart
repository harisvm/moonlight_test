import 'package:fluttertoast/fluttertoast.dart';

showToast({msg}) {
  Fluttertoast.showToast(
    msg: msg ?? '',
    toastLength: Toast.LENGTH_LONG,
  );
}
