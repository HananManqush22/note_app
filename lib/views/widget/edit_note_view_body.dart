import 'package:flutter/material.dart';
import 'package:not_hive_app/cubit/notes_cubit/notes_cubit.dart';
import 'package:not_hive_app/models/note_model.dart';
import 'package:not_hive_app/views/widget/custom_text_filed.dart';
import 'package:not_hive_app/views/widget/custome_appbar.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, supTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          CustomAppBar(
            title: 'Edit Note',
            icon: Icons.check,
            onPresse: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subTitle = supTitle ?? widget.note.title;
              widget.note.save();
              Navigator.pop(context);
              NotesCubit.get(context).fechAllData();
            },
          ),
          const SizedBox(
            height: 50,
          ),
          CustomTextFiled(
            hint: widget.note.title,
            onChanged: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextFiled(
            hint: widget.note.title,
            onChanged: (value) {
              supTitle = supTitle;
            },
            maxLine: 5,
          )
        ],
      ),
    );
  }
}
