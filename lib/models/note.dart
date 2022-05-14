import 'package:hive/hive.dart';
part 'note.g.dart';

@HiveType(typeId: 1)
class Note extends HiveObject{
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String note;
  @HiveField(3)
  bool isArchived;
  @HiveField(4)
  String createdAt;
  @HiveField(5)
  int color;
  
  Note({
    required this.id,
    required this.title,
    required this.note,
    required this.createdAt,
    required this.color,
    required this.isArchived,
  });

  @override
  String toString() {
    return  'İd : $id, Title : $title, Note: $note, IsArchived: $isArchived, CreatedAt : $createdAt';
  }
}
