import 'package:flutter/cupertino.dart';
import 'colors.dart';

class ColorNotifier with ChangeNotifier {
  bool isDark = false;

  set setIsDark(v) {
    isDark = v;
    notifyListeners();
  }


  get getIsDark => isDark;

  get getwihitecolor => isDark ? darkwihitecolor : wihitecolor;

  get getbluecolor => isDark ? blue : darkblue;

  get getgrey => isDark ? grey : darkgrey;

  get getblck => isDark ? blck : darkblck;

  get getpinauth => isDark ? pinauth : darkpinauth;

  get getInvestmentbluecolor => isDark ? Investmentcolor : darkInvestmentcolor;

  get getconcirmstockbuycolor =>
      isDark ? darkconcirmstockbuycolor : concirmstockbuycolor;

  get getprefixicon => isDark ? prefixicon : darkprefixicon;
}
