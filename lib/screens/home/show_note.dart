import 'package:flutter_note/controllers/authController.dart';
import 'package:flutter_note/models/noteModel.dart';
import 'package:flutter_note/services/database.dart';
import 'package:intl/intl.dart';
import 'package:waveui/waveui.dart';

class ShowNote extends StatelessWidget {
  final NoteModel noteData;
  final int index;
  ShowNote({required this.noteData, required this.index});
  final AuthController authController = Get.find<AuthController>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text = noteData.title ?? '';
    bodyController.text = noteData.body ?? '';
    var formattedDate = DateFormat.yMMMd()
        .format(noteData.creationDate?.toDate() ?? DateTime.now());
    var time = DateFormat.jm()
        .format(noteData.creationDate?.toDate() ?? DateTime.now());
    return Scaffold(
        appBar: WaveAppBar(
          actions: [
            IconButton(
              onPressed: () {
                showDeleteDialog(context, noteData);
              },
              icon: Icon(FluentIcons.delete_28_regular),
            )
          ],
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(
              16.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text("$formattedDate at $time"),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: titleController,
                          maxLines: null,
                          decoration: InputDecoration.collapsed(
                            hintText: "Title",
                          ),
                          style: TextStyle(
                            fontSize: 26.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          autofocus: true,
                          controller: bodyController,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: InputDecoration.collapsed(
                            hintText: "Type something...",
                          ),
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            if (titleController.text != noteData.title ||
                bodyController.text != noteData.body) {
              Database().updateNote(authController.user!.uid,
                  titleController.text, bodyController.text, noteData.id ?? '');
              Get.back();
              titleController.clear();
              bodyController.clear();
            } else {
              showSameContentDialog(context);
            }
          },
          label: Text("Save"),
          icon: Icon(Icons.save),
        ));
  }
}

void showDeleteDialog(BuildContext context, noteData) {
  final AuthController authController = Get.find<AuthController>();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Delete Note?"),
        content: Text("Are you sure you want to delete this note?"),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text("No"),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              Database().delete(authController.user!.uid, noteData.id);
              Get.back(closeOverlays: true);
            },
            child: Text("Yes"),
          ),
        ],
      );
    },
  );
}

void showSameContentDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        title: Text(
          "No change in content!",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        content: Text("There is no change in content.",
            style: Theme.of(context).textTheme.titleMedium),
        actions: <Widget>[
          TextButton(
            child: Text(
              "Okay",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      );
    },
  );
}
