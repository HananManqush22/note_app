import 'package:flutter/material.dart';
import 'package:not_hive_app/cubit/notes_cubit/notes_cubit.dart';
import 'package:not_hive_app/models/note_model.dart';
import 'package:not_hive_app/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EditNoteView(
            note: note,
          );
        }));
      },
      child: Container(
        padding: const EdgeInsets.only(top: 16, bottom: 16, left: 16),
        decoration: BoxDecoration(
            color: Color(note.color), borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                note.title,
                style: const TextStyle(color: Colors.black, fontSize: 24),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(note.subTitle,
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.4), fontSize: 16)),
              ),
              trailing: IconButton(
                onPressed: () {
                  note.delete();
                  NotesCubit.get(context).fechAllData();
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.black,
                  size: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16, top: 16),
              child: Text(note.date,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.4),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
