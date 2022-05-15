import 'package:flutter/material.dart';
import 'package:flutter_keep/database/local_storage.dart';
import 'package:flutter_keep/models/note.dart';
import 'package:flutter_keep/pages/edit_note_page.dart';
import 'package:flutter_keep/provider/note_view_model.dart';
import 'package:flutter_keep/provider/theme_provider.dart';
import 'package:flutter_keep/widgets/drawer.dart';
import 'package:flutter_keep/widgets/note_container.dart';
import 'package:flutter_keep/widgets/sliver_app_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class ArchivedNotes extends StatelessWidget {
  ArchivedNotes({Key? key}) : super(key: key);
  final HiveLocalStorage hiveLocalStorage = HiveLocalStorage();
  @override
  Widget build(BuildContext context) {
     Provider.of<NoteViewModel>(context);
     Provider.of<ThemeProvider>(context);
    return Scaffold(
      drawer:  const Drawerr(),
      body: SafeArea(
        child: NestedScrollView(headerSliverBuilder: (context, innerBoxIsScrolled) {
          return<Widget> [
             const SliverAppBarr(title: 'Archive'),
          ];
        }, body:MasonryGridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                     final noteList = hiveLocalStorage.noteBox.values.toList();
                    List<Note>noteListReversed = noteList.reversed.toList();
                    final noteIndex2 = noteListReversed[index];
                      return noteIndex2.isArchived ==true ? NoteContainer(
                        color: Color(noteIndex2.color),
                        onPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditNotePage(
                                        index: index,
                                        editNote:noteIndex2,
                                      )));
                        },
                        title: noteIndex2.title,
                        note: noteIndex2.note,
                        createdAt: noteIndex2.createdAt,
                      ):Container();
                    },
                    itemCount: hiveLocalStorage.noteBox.length), ),
      ),
    );
  }
}

