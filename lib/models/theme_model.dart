import 'package:hive/hive.dart';
part 'theme_model.g.dart';

@HiveType(typeId: 2)
class ThemeModel extends HiveObject{
  @HiveField(0)
  FonttStyle fonttStyle;
  @HiveField(1)
  bool lightMode;
  ThemeModel({required this.fonttStyle,required this.lightMode});

  @override
String toString() {
  return 'FontStyle : $fonttStyle, lightMode :$lightMode ';
}
}

@HiveType(typeId: 3)
enum FonttStyle{
  @HiveField(0)
  opensans,
  @HiveField(1)
  lato,
  @HiveField(2)
  felipa,
  @HiveField(3)
  josefin
}


