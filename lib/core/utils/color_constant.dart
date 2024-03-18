import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {

static Color purple100 = fromHex('#efabff');

  static Color blueGray400 = fromHex('#817495');

  static Color deepPurple500 = fromHex('#6f37d1');

  static Color indigoA100 = fromHex('#809bf7');

  static Color purple10000 = fromHex('#00efabff');

  static Color lightBlue400 = fromHex('#2fbfff');

  static Color blueGray20066 = fromHex('#66b1b5d0');

  static Color purple5066 = fromHex('#66fee9ff');

  static Color yellow900 = fromHex('#f28d31');

  static Color purple5001 = fromHex('#fee9ff');

  static Color blueGray800 = fromHex('#4b3e5f');

  static Color deepPurpleA100 = fromHex('#b18ef8');

  static Color whiteA700 = fromHex('#ffffff');

  static Color purple50 = fromHex('#feebff');

  static Color pink200 = fromHex('#ff8cc3');

  static Color purple20066 = fromHex('#66c892c9');
  
  static Color indigoA101 = fromHex('#84a1ff');


  static Color red500 = fromHex('#ef3b3b');

  static Color gray50 = fromHex('#f9f9f9');

  static Color black900 = fromHex('#0f0f0f');

  static Color black902 = fromHex('#000000');

  static Color black901 = fromHex('#000000');

  static Color deepOrangeA700 = fromHex('#ed1414');

  static Color indigo90019 = fromHex('#19002397');

  static Color gray600 = fromHex('#757575');

  static Color gray501 = fromHex('#a0a0a0');

  static Color gray700 = fromHex('#616161');

  static Color gray400 = fromHex('#bdbdbd');

  static Color gray500 = fromHex('#9e9e9e');

  static Color indigo906 = fromHex('#001455');

  static Color indigo907 = fromHex('#001352');

  static Color blue5066 = fromHex('#66e9f7ff');

  static Color gray800 = fromHex('#424242');

  static Color redA200 = fromHex('#f75555');

  static Color indigo904 = fromHex('#001457');

  static Color gray900 = fromHex('#212121');

  static Color gray801 = fromHex('#35383f');

  static Color indigo905 = fromHex('#002395');

  static Color lightBlue50 = fromHex('#ebfdff');

  static Color gray200 = fromHex('#eeeeee');

  static Color gray101 = fromHex('#f5f5f5');

  static Color black9000c = fromHex('#0c04060f');

  static Color gray100 = fromHex('#f3f3f3');

  static Color lightBlue40066 = fromHex('#662fbfff');

  static Color bluegray401 = fromHex('#888888');

  static Color bluegray400 = fromHex('#878787');

  static Color indigo902 = fromHex('#002399');

  static Color indigo903 = fromHex('#002397');

  static Color indigo900 = fromHex('#002294');

  static Color cyan50 = fromHex('#e9fff9');

  static Color indigo901 = fromHex('#001351');


  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
