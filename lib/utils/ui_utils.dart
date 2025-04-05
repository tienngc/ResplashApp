import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UiUtils {
  UiUtils._();

  static void updateSystemUi(BuildContext context) {
    // Getting current theme brightness
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    Color overlayColor = isDark ? Colors.black : Colors.white;
    Brightness overlayBrightness = isDark ? Brightness.light : Brightness.dark;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: overlayColor,
        statusBarIconBrightness: overlayBrightness,
        systemNavigationBarColor: overlayColor,
        systemNavigationBarIconBrightness: overlayBrightness,
      ),
    );
  }

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
