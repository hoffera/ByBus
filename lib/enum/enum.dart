import 'dart:ui';

class AppColors {
  /// #F1AB65 ![](https://dummyimage.com/24/F1AB65.png&text=+)
  static const primary = Color.fromRGBO(241, 171, 101, 1);

  /// #021032 ![](https://dummyimage.com/24/021032.png&text=+)
  static const secondary = Color.fromRGBO(2, 16, 50, 1);

  /// #2E8B57 ![](https://dummyimage.com/24/2E8B57.png&text=+)
  static const primaryDeuteranopi = Color.fromRGBO(46, 139, 87, 1);

  /// #87CEEB ![](https://dummyimage.com/24/87CEEB.png&text=+)
  static const secondaryDeuteranopi = Color.fromRGBO(135, 206, 235, 1);

  /// #FA8072 ![](https://dummyimage.com/24/FA8072.png&text=+)
  static const primaryProtanopia = Color.fromRGBO(250, 128, 114, 1);

  /// #1E90FF ![](https://dummyimage.com/24/1E90FF.png&text=+)
  static const secondaryProtanopia = Color.fromRGBO(30, 144, 255, 1);

  /// #D2691E ![](https://dummyimage.com/24/D2691E.png&text=+)
  static const primaryTritanopia = Color.fromRGBO(210, 105, 30, 1);

  /// #556B2F ![](https://dummyimage.com/24/556B2F.png&text=+)
  static const secondaryTritanopia = Color.fromRGBO(85, 107, 47, 1);
}

enum TypographyVariant {
  /// font-size: 28
  h1,

  /// font-size: 24
  h2,

  /// font-size: 18
  h3,

  /// font-size: 16
  h4,

  /// font-size: 14
  h5,

  /// font-size: 12
  h6,

  /// font-size: 10
  h7,
}
