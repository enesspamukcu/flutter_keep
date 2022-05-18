import 'package:flutter/material.dart';
import 'package:flutter_keep/constants.dart';
import 'package:flutter_keep/provider/theme_provider.dart';
import 'package:flutter_keep/widgets/color_choose_circle.dart';
import 'package:flutter_keep/widgets/text_field.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../models/note.dart';
import '../provider/note_view_model.dart';

class EditNotePage extends StatefulWidget {
  const EditNotePage({Key? key, required this.editNote, required this.index}):super(key: key);
  final Note editNote;
  final int index;

  @override
  State<EditNotePage> createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controllerNote = TextEditingController();

  @override
  void initState() {
    super.initState();
    controllerNote.text = widget.editNote.note;
    controllerTitle.text = widget.editNote.title;
  }

  @override
  Widget build(BuildContext context) {
    final noteViewModel = Provider.of<NoteViewModel>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final lightMode =
        themeProvider.hiveLocalStorage.fontStyleBox.getAt(0)!.lightMode;
    return Scaffold(
        backgroundColor: Color(widget.editNote.color == Colors.transparent.value
            ? lightMode == false
                ? Constants.darkModeBackgrounColor.value
                : Colors.white.value
            : widget.editNote.color),
        appBar: AppBar(
          backgroundColor:
              Color(widget.editNote.color == Colors.transparent.value
                  ? lightMode == false
                      ? Constants.darkModeBackgrounColor.value
                      : Colors.white.value
                  : widget.editNote.color),
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                noteViewModel.updateSearchDelegate(
                    widget.editNote, controllerNote.text, controllerTitle.text);
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFieldd(
                    controller: controllerTitle,
                    hintText: 'Title',
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
                const SizedBox(height: 8),
                TextFieldd(
                    controller: controllerNote,
                    hintText: 'Type Something..',
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
              ],
            ),
          ),
        ),
        bottomSheet: Container(
          color: Color(widget.editNote.color == Colors.transparent.value
              ? lightMode == false
                  ? Constants.darkModeBackgrounColor.value
                  : Colors.white.value
              : widget.editNote.color),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                            height: 60,
                            color: Constants.darkModeBackgrounColor,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        widget.editNote.color =
                                            Colors.transparent.value;
                                      });
                                    },
                                    child: Container(
                                      child: const Icon(Icons.block),
                                      width: 45,
                                      height: 45,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          border: Border.all(
                                            style: BorderStyle.solid,
                                            color: Colors.black,
                                          )),
                                    )),
                                ColorChooseCircle(
                                    color:
                                        const Color.fromARGB(255, 204, 54, 43),
                                    onPress: () async {
                                      setState(() {
                                        widget.editNote.color =
                                            const Color.fromARGB(
                                                    255, 209, 71, 71)
                                                .value;
                                      });
                                    }),
                                ColorChooseCircle(
                                    color:
                                        const Color.fromARGB(255, 36, 163, 152),
                                    onPress: () {
                                      setState(() {
                                        widget.editNote.color =
                                            Colors.teal.value;
                                      });
                                    }),
                                ColorChooseCircle(
                                    color:
                                        const Color.fromARGB(255, 14, 111, 177),
                                    onPress: () async {
                                      setState(() {
                                        widget.editNote.color =
                                            const Color.fromARGB(
                                                    255, 14, 111, 177)
                                                .value;
                                      });
                                    }),
                                ColorChooseCircle(
                                    color: const Color.fromARGB(
                                        255, 130, 128, 117),
                                    onPress: () {
                                      setState(() {
                                        widget.editNote.color =
                                            const Color.fromARGB(
                                                    255, 130, 128, 117)
                                                .value;
                                      });
                                    }),
                                ColorChooseCircle(
                                    color: const Color.fromARGB(
                                        255, 146, 104, 133),
                                    onPress: () async {
                                      setState(() {
                                        widget.editNote.color =
                                            const Color.fromARGB(
                                                    255, 146, 104, 133)
                                                .value;
                                      });
                                    }),
                                ColorChooseCircle(
                                    color:
                                        const Color.fromARGB(255, 108, 88, 235),
                                    onPress: () {
                                      setState(() {
                                        widget.editNote.color =
                                            const Color.fromARGB(
                                                    255, 108, 88, 235)
                                                .value;
                                      });
                                    }),
                              ],
                            ));
                      });
                },
                icon: const Icon(Icons.color_lens)),
            Text(
              widget.editNote.createdAt,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: lightMode == false ? Colors.white : Colors.black),
            ),
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          color: Color(widget.editNote.color),
                          height: 180,
                          child: Column(
                            children: [
                              ListTile(
                                onTap: () async {
                                  Navigator.pop(context);
                                  Navigator.of(context).pop();
                                  Future.delayed(
                                      const Duration(milliseconds: 1300), () {
                                    noteViewModel.deleteNote(widget.editNote);
                                  });
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: const Text('Note Deleted'),
                                    action: SnackBarAction(
                                        label: '', onPressed: () {}),
                                  ));
                                },
                                leading: const Icon(Icons.delete),
                                title: Text('Delete Note',
                                    style: themeProvider.themeControl(
                                        16, FontWeight.normal)),
                              ),
                              ListTile(
                                onTap: () {
                                  noteViewModel.addNote(Note(
                                      id: UniqueKey().hashCode,
                                      title: controllerTitle.text,
                                      note: controllerNote.text,
                                      createdAt: DateFormat.yMMMMd('en_US')
                                          .format(DateTime.now()),
                                      color: widget.editNote.color,
                                      isArchived: false));

                                  Navigator.pop(context);
                                  Navigator.of(context).pop();
                                },
                                leading: const Icon(Icons.copy),
                                title: Text('Make a Copy',
                                    style: themeProvider.themeControl(
                                        16, FontWeight.normal)),
                              ),
                              ListTile(
                                onTap: () {
                                    widget.editNote.isArchived == false
                                        ? moveToArchive(noteViewModel,
                                            controllerNote, controllerTitle)
                                        : unArchived(noteViewModel,
                                            controllerNote, controllerTitle);
                                  Navigator.pop(context);
                                  Navigator.of(context).pop();
                                },
                                leading: const Icon(Icons.archive),
                                title: widget.editNote.isArchived == false
                                    ? Text('Move to Archive',
                                        style: themeProvider.themeControl(
                                            16, FontWeight.normal))
                                    : Text('Note Unarchived',
                                        style: themeProvider.themeControl(
                                            16, FontWeight.normal)),
                              )
                            ],
                          ),
                        );
                      });
                },
                icon: const Icon(Icons.more_vert))
          ]),
        ));
  }

  void moveToArchive(
      NoteViewModel noteViewModel,
      TextEditingController controllerNote,
      TextEditingController controllerTitle) {
    widget.editNote.isArchived = true;
    noteViewModel.updateSearchDelegate(
        widget.editNote, controllerNote.text, controllerTitle.text);
  }

  void unArchived(
      NoteViewModel noteViewModel,
      TextEditingController controllerNote,
      TextEditingController controllerTitle) {
    widget.editNote.isArchived = false;
    noteViewModel.updateSearchDelegate(
        widget.editNote, controllerNote.text, controllerTitle.text);
  }
}
