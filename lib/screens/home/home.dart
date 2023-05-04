import 'package:flutter_note/controllers/authController.dart';
import 'package:flutter_note/controllers/noteController.dart';
import 'package:flutter_note/screens/home/add_note.dart';
import 'package:flutter_note/screens/home/show_note.dart';
import 'package:flutter_note/screens/settings/setting.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';
import 'package:waveui/waveui.dart';

class HomePage extends GetWidget<AuthController> {
  final AuthController authController = Get.find<AuthController>();
  final NoteController noteController = Get.find<NoteController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WaveAppBar(
        title: "Notes",
        leading: IconButton(
          onPressed: () {
            authController.axisCount.value =
                authController.axisCount.value == 2 ? 4 : 2;
          },
          icon: Obx(
            () => Icon(
              authController.axisCount.value == 2
                  ? FluentIcons.list_28_regular
                  : FluentIcons.grid_28_regular,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => Setting());
            },
            icon: Icon(FluentIcons.settings_28_regular),
          )
        ],
      ),
      body: SafeArea(
        child: Obx(
          () => noteController.noteList.isNotEmpty
              ? Expanded(
                  child: StaggeredGridView.countBuilder(
                    itemCount: noteController.noteList.length,
                    staggeredTileBuilder: (index) =>
                        StaggeredTile.fit(authController.axisCount.value),
                    crossAxisCount: 4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 16,
                    ),
                    itemBuilder: (context, index) {
                      var formattedDate = DateFormat.yMMMd().format(
                          noteController.noteList[index].creationDate!
                              .toDate());
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => ShowNote(
                              index: index,
                              noteData: noteController.noteList[index]));
                        },
                        child: WaveCard(
                          child: Container(
                            padding: EdgeInsets.only(
                              bottom: 10,
                              left: 10,
                              right: 10,
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  contentPadding: EdgeInsets.only(
                                    top: 5,
                                    right: 8,
                                    left: 8,
                                    bottom: 0,
                                  ),
                                  title: Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 8,
                                    ),
                                    child: Text(
                                      noteController.noteList[index].title ??
                                          '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  subtitle: Text(
                                    noteController.noteList[index].body ?? '',
                                    maxLines: 10,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      formattedDate,
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              : Text("No notes, create some "),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Add Note",
        onPressed: () {
          Get.to(() => AddNotePage());
        },
        child: Icon(FluentIcons.add_28_regular),
      ),
    );
  }
}
