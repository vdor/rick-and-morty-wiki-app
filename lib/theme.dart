import 'package:flutter/widgets.dart';

class AppColors {
  const AppColors._();
  static Color grey3 = Color(0xFF828282);
  static Color grey4 = Color(0xFFBDBDBD);
  static Color gray5 = Color(0xFF0B1E2D);
  static Color gray6 = Color(0xFFF2F2F2);
  static Color grey7 = Color(0xFF5B6975);
  // Additional text
  static Color grey8 = Color(0xFF6E798C);
  static Color primaryColorLight = Color(0xFF152A3A);
  static Color grey = Color(0xFF5B6975);
  static Color white = Color(0xFFFFFFFF);
  static Color black = Color(0xFF000000);

  static Color green = Color(0xFF43D049);
  static Color red = Color(0xFFEB5757);

  static Color blue = Color(0xFF22A2BD);
}

class TextStyles {
  const TextStyles._();

  static TextStyle bodyText1 = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 16,
    letterSpacing: 0.44,
  );

  static TextStyle bodyText2 = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 13,
    letterSpacing: 0.5,
  );

  static TextStyle overline = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    fontSize: 10,
    letterSpacing: 1.5,
    color: AppColors.green,
  );

  static TextStyle subtitle1 = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    fontSize: 16,
    letterSpacing: 0.5,
    height: 1.9,
  );

  static TextStyle caption = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 12,
    letterSpacing: 0.5,
    height: 1.8,
  );

  static TextStyle headline5 = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 34,
    letterSpacing: 0.25,
  );

  static TextStyle headline6 = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontSize: 20,
    letterSpacing: 0.15,
  );
}

// бек и мидлвер система. интегромат. систему логика в блоках. zappier
// программируемая система.
// n8n - опенсорс
// уже есть бек. и миддл. заходишь и регистрируешьс -> создается инстанс n8n
// миддл на ноде. создает инстанс и меняет планы
// API смена пароля и т.д.
//
// хочет взять чела на питон и кубик.
// коооок
