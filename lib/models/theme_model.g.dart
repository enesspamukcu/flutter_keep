part of 'theme_model.dart';

class ThemeModelAdapter extends TypeAdapter<ThemeModel> {
  @override
  final int typeId = 2;

  @override
  ThemeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ThemeModel(
      fonttStyle: fields[0] as FonttStyle,
      lightMode: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ThemeModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.fonttStyle)
      ..writeByte(1)
      ..write(obj.lightMode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FonttStyleAdapter extends TypeAdapter<FonttStyle> {
  @override
  final int typeId = 3;

  @override
  FonttStyle read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return FonttStyle.opensans;
      case 1:
        return FonttStyle.lato;
      case 2:
        return FonttStyle.felipa;
      case 3:
        return FonttStyle.josefin;
      default:
        return FonttStyle.opensans;
    }
  }

  @override
  void write(BinaryWriter writer, FonttStyle obj) {
    switch (obj) {
      case FonttStyle.opensans:
        writer.writeByte(0);
        break;
      case FonttStyle.lato:
        writer.writeByte(1);
        break;
      case FonttStyle.felipa:
        writer.writeByte(2);
        break;
      case FonttStyle.josefin:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FonttStyleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
