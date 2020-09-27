import 'package:flutter/cupertino.dart';


///called when navigating between pages (route is added to stack)
void pushNamed({@required BuildContext context, @required String routeName}) {
  Navigator.pushNamed(context, routeName);
}
