import 'package:flutter/material.dart';
import 'package:not_hive_app/views/widget/add_note_bottom_sheet.dart';
import 'package:not_hive_app/const/colors.dart';
import 'package:not_hive_app/views/widget/note_view_body.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: primryColor,
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              context: context,
              builder: (context) => const AddNoteBottonSheet());
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: const NoteViewBody(),
    );
  }
}
