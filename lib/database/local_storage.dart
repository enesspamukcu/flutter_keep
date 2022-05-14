import 'package:flutter_keep/models/theme_model.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import '../models/note.dart';

abstract class LocalStorage extends HiveObject{
  Future<void>addNote({required Note note});
  Future<void>copyNote({required Note note});
  Future<void>getNote({required String id});
  Future<void>deleteNote({required Note note});
  Future<void>updateNote({required Note note,required int index});
  Future<void>updateNoteSearchPage({required Note note,required String not,required String titlee});
  Future<void>addThemeModel({required ThemeModel fontStyleModel});
  Future<void>putThemeModel({required ThemeModel fontStyleModel});
  Future<void>deleteThemeModel({required ThemeModel fontStyleModel,});
}

class HiveLocalStorage extends LocalStorage{
   late Box <Note> noteBox ;
   late Box <ThemeModel> fontStyleBox;
   
   HiveLocalStorage(){
     noteBox = Hive.box<Note>('notx');
     fontStyleBox = Hive.box<ThemeModel>('fonty');
   }

  @override
  Future<void> addNote({required Note note}) async{
    noteBox.add(note);
  }

  @override
  Future<void> copyNote({required Note note}) async{
    noteBox.add(note);
  }

  @override
  Future<void> deleteNote({required Note note})async {
    noteBox.delete(note);
  }

  @override
  Future<void> getNote({required String id}) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateNote({required int index, required Note note}) async{
    await noteBox.putAt(index, note);
  }

  @override
  Future<void> updateNoteSearchPage({required Note ?note,required String not,required String titlee})async {
   note!.note=not;
   note.title=titlee;
   note.createdAt=DateFormat.yMMMMd('en_US').format(DateTime.now());
   note.color=note.color;
   note.id=note.id;
   note.isArchived=note.isArchived;
   note.save();
  }

  @override
  Future<void> addThemeModel({required ThemeModel fontStyleModel}) async{
    await fontStyleBox.add(fontStyleModel);
  }

  @override
  Future<void> deleteThemeModel({required ThemeModel fontStyleModel}) async{
    await fontStyleBox.delete(key);
  }

  @override
  Future<void> putThemeModel({required ThemeModel fontStyleModel}) async{
    await fontStyleBox.putAt(0, fontStyleModel);
    fontStyleModel.save();
  }
  

}