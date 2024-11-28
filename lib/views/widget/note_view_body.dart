import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_hive_app/cubit/notes_cubit/notes_cubit.dart';
import 'package:not_hive_app/views/search_note_view.dart';
import 'package:not_hive_app/views/widget/custome_appbar.dart';
import 'package:not_hive_app/views/widget/note_list_view.dart';

class NoteViewBody extends StatefulWidget {
  const NoteViewBody({super.key});

  @override
  State<NoteViewBody> createState() => _NoteViewBodyState();
}

class _NoteViewBodyState extends State<NoteViewBody> {
  @override
  void initState() {
    NotesCubit.get(context).fechAllData();
    super.initState();
  }

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
            title: 'Note',
            icon: Icons.search,
            onPresse: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const SearchNoteView();
              }));
            },
          ),
          Expanded(child: BlocBuilder<NotesCubit, NotesState>(
            builder: (context, state) {
              return NoteListView(
                notes: BlocProvider.of<NotesCubit>(context).nots!,
              );
            },
          )),
        ],
      ),
    );
  }
}
