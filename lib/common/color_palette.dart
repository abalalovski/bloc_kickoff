import 'package:flutter/widgets.dart';

class ColorPalette extends InheritedWidget {
  const ColorPalette({
    @required Widget child,
    this.data = const ColorPaletteData(),
    Key key,
  })  : assert(child != null),
        assert(data != null),
        super(key: key, child: child);

  final ColorPaletteData data;

  static ColorPaletteData of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ColorPalette>()?.data ??
      const ColorPaletteData();

  @override
  bool updateShouldNotify(ColorPalette oldWidget) => oldWidget.data != data;
}

@immutable
class ColorPaletteData {
  const ColorPaletteData({
    this.orange = const Color.fromRGBO(255, 165, 0, 1),
    this.black = const Color.fromRGBO(0, 0, 0, 1),
    this.lightGray = const Color.fromRGBO(250, 255, 243, 1),
    this.softGreen = const Color.fromRGBO(152, 251, 152, 1),
    this.darkGreen = const Color.fromRGBO(0, 100, 0, 1),
  });

  final Color orange;
  final Color black;
  final Color lightGray;
  final Color softGreen;
  final Color darkGreen;
}
