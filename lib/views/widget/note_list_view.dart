import 'package:flutter/material.dart';
import 'package:not_hive_app/models/note_model.dart';
import 'package:not_hive_app/views/widget/custom_note_item.dart';

class NoteListView extends StatelessWidget {
  const NoteListView({
    super.key,
    required this.notes,
  });
  final List<NoteModel> notes;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: notes.length,
          itemBuilder: (context, indext) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: NoteItem(
                  note: notes[indext],
                ),
              )),
    );
  }
}
